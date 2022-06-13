package com.miso.web.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.miso.web.service.MisoStudyService;
import com.miso.web.util.Criteria;
import com.miso.web.util.Pagination;
import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyChartDataVo;
import com.miso.web.vo.MisoStudyUploadFileVo;
import com.miso.web.vo.MisoStudyUserVo;

// TODO: 컨트롤러 서비스 분리해보기
@Controller
public class MisoStudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MisoStudyController.class);
	
	@Autowired
	private MisoStudyService misoStudyService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/projects/misostudy/home", method = RequestMethod.GET)
	public String misoStudyInit(HttpSession session, Model model) {
		
		MisoStudyUserVo loginedUser = (MisoStudyUserVo) session.getAttribute("LOGIN_USER");
		model.addAttribute("LOGIN_USER", loginedUser);
		
		// TODO: 리팩토링 고민해보기
		List<MisoStudyChartDataVo> chartDataForDay = misoStudyService.selectChartsDataByDay();
		List<String> createdDates = new ArrayList<String>();
		List<Integer> createdDateCntInfos = new ArrayList<Integer>();
		DateFormat format = new SimpleDateFormat("\"yyyy-MM-dd\"");
		for (MisoStudyChartDataVo chartInfo : chartDataForDay) {
			String formattedDate = format.format(chartInfo.getCreatedDate());
			createdDates.add(formattedDate);
			createdDateCntInfos.add(chartInfo.getCnt());
		}
		model.addAttribute("createdDates", createdDates);
		model.addAttribute("createdDateCntInfos", createdDateCntInfos);
		
		// TODO: 리팩토링 고민해보기
		List<MisoStudyChartDataVo> chartDataForMonth = misoStudyService.selectChartsDataByMonth();
		List<String> createdDates2 = new ArrayList<String>();
		List<Integer> createdDateCntInfos2 = new ArrayList<Integer>();
		DateFormat format2 = new SimpleDateFormat("\"yyyy-MM\"");
		for (MisoStudyChartDataVo chartInfo : chartDataForMonth) {
			String formattedDate = format2.format(chartInfo.getCreatedDate());
			createdDates2.add(formattedDate);
			createdDateCntInfos2.add(chartInfo.getCnt());
		}
		model.addAttribute("createdDates2", createdDates2);
		model.addAttribute("createdDateCntInfos2", createdDateCntInfos2);

		return "/projects/misostudy/home";
	}
	
	@RequestMapping(value = "/projects/misostudy/signUpForm", method = RequestMethod.POST)
	public @ResponseBody String signUp(MisoStudyUserVo newUser, HttpSession session) {
		logger.info(newUser.toString());
		String signUpResult = "fail";
		if (newUser != null) {
			misoStudyService.signUp(newUser);
			session.setAttribute("LOGIN_USER", newUser);
			signUpResult = "success";
		}
		return signUpResult;
	}
	
	@RequestMapping(value = "/projects/misostudy/signUpForm/checkId", method = RequestMethod.POST)
	public @ResponseBody int checkId(@RequestParam String id) {
		int resultValue = misoStudyService.checkId(id);
		return resultValue;
	}
	
	@RequestMapping(value = "/projects/misostudy/signUpForm/checkEmail", method = RequestMethod.POST)
	public @ResponseBody int checkEmail(@RequestParam String email) {
		int resultValue = misoStudyService.checkEmail(email);
		return resultValue;
	}
	
	@RequestMapping(value = "/projects/misostudy/signIn", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String signIn(@RequestParam String id, @RequestParam String pwd, HttpSession session, Model model) {
		System.out.println(id + " " + pwd);
		String authPwd = DigestUtils.sha512Hex(pwd);
		
		String signInResult = "";
		
		if (id.equals("") || pwd.equals("")) {
			signInResult = "로그인 정보를 모두 입력해주세요..";
		} else {
			MisoStudyUserVo savedUser = misoStudyService.signIn(id);
			System.out.println(savedUser);
			if (savedUser == null) {
				signInResult = "회원정보가 존재하지 않습니다."; 
			} else {
				
				if ("Y".equals(savedUser.getIsWithdrawal())) {
					signInResult = "휴면 상태입니다."; 
				} else if (!id.equals(savedUser.getId())) {
					signInResult = "아이디를 확인해주세요."; 
				} else if (!authPwd.equals(savedUser.getPwd())) {
					signInResult = "비밀번호를 확인해주세요."; 
				} else {
					session.setAttribute("LOGIN_USER", savedUser);
					signInResult = "success"; 
				}
			}
		}
		return signInResult;
	}
	
	@RequestMapping(value = "/projects/misostudy/findMyInfo", method = RequestMethod.GET)
	public String findMyInfoInit() {
		
		return "/projects/misostudy/findMyInfo";
	}
	
	@RequestMapping(value = "/projects/misostudy/findMyId", method = RequestMethod.POST)
	public @ResponseBody String findMyId(String email, Model model) {
		String returnValue = "";
		MisoStudyUserVo savedUserInfo = misoStudyService.selectUserInfoByEmail(email);
		if (savedUserInfo == null) {
			returnValue = "fail";
		} else {
			String savedUserId = savedUserInfo.getId();
			returnValue = savedUserId;
		}
		
		return returnValue;
	}
	
	@RequestMapping(value = "/projects/misostudy/findMyPwd", method = RequestMethod.POST)
	public @ResponseBody String findMyPwd(String email, String id, Model model) {
		String returnValue = "";
		MisoStudyUserVo savedUserInfo = misoStudyService.selectUserInfoByEmail(email);
		
		if (savedUserInfo == null) {
			returnValue = "fail";
		} else {
			if (!savedUserInfo.getId().equals(id)) {
				returnValue = "fail";
			} else {
				String tempPwd = misoStudyService.getTempPassword();
				savedUserInfo.setPwd(DigestUtils.sha512Hex(tempPwd));
				misoStudyService.updateUserInfo(savedUserInfo);
				
				returnValue = tempPwd;
			}
		}
		return returnValue;
	}
	
	@RequestMapping(value = "/projects/misostudy/signOut", method = RequestMethod.GET)
	public String signOut(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}
	
	/**
	 * Board Controller
	 */
	@RequestMapping(value = "/projects/misostudy/boardList", method = RequestMethod.GET)
	public String boardListInit(@RequestParam(required = false, defaultValue = "1") String page, Criteria criteria, HttpSession session, Model model) {
		
		int totalRecords = misoStudyService.selectBoardsTotalRowsCnt();
		
		Pagination pagination = new Pagination(page, totalRecords);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<MisoStudyBoardVo> boardList = misoStudyService.selectSearchBoards(criteria);
		for (MisoStudyBoardVo board : boardList) {
			int boardNo = board.getBoardNo();
			int uploadCnt = misoStudyService.countUploadFileByBoardNo(boardNo);
			board.setUploadCnt(uploadCnt);
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);
		
		MisoStudyUserVo loginedUser = (MisoStudyUserVo) session.getAttribute("LOGIN_USER");
		model.addAttribute("LOGIN_USER", loginedUser);

		return "/projects/misostudy/boardList";
	}
	
	@RequestMapping(value = "/projects/misostudy/boardListResult", method = RequestMethod.GET)
	public String boardListResult(@RequestParam(required = false, defaultValue = "1") String page, Criteria criteria, HttpSession session, Model model) {
		int totalRecords = misoStudyService.selectBoardsTotalRowsCnt();
		
		Pagination pagination = new Pagination(page, totalRecords);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<MisoStudyBoardVo> boardList = misoStudyService.selectSearchBoards(criteria);
		
		for (MisoStudyBoardVo board : boardList) {
			int boardNo = board.getBoardNo();
			int uploadCnt = misoStudyService.countUploadFileByBoardNo(boardNo);
			board.setUploadCnt(uploadCnt);
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);
		
		MisoStudyUserVo loginedUser = (MisoStudyUserVo) session.getAttribute("LOGIN_USER");
		model.addAttribute("LOGIN_USER", loginedUser);

		return "/projects/misostudy/boardListResult";
	}
	
	@RequestMapping(value = "/projects/misostudy/boardDetail", method = RequestMethod.GET)
	public String detailBoard(@RequestParam String boardNo, Model model) {
		int parseIntBoardNo = Integer.parseInt(boardNo);
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(parseIntBoardNo);

		int viewCnt = board.getViewCount() + 1;
		board.setViewCount(viewCnt);
		
		misoStudyService.updateViewCntByBoardNo(board);
		model.addAttribute("board", board);
		
		List<MisoStudyBoardVo> comments = misoStudyService.selectCommentsByBoardNo(parseIntBoardNo);
		if (!comments.isEmpty()) {
			model.addAttribute("comments", comments);
		}
		
		List<MisoStudyUploadFileVo> uploadFileInfos = misoStudyService.selectFileByBoardNo(parseIntBoardNo);
		if (!uploadFileInfos.isEmpty()) {
			for (MisoStudyUploadFileVo uploadFileInfo : uploadFileInfos) {
				String substring = uploadFileInfo.getUploadName().substring(37);
				uploadFileInfo.setUploadName(substring);
			}
			
			model.addAttribute("uploadFileInfos", uploadFileInfos);
		}
		
		return "/projects/misostudy/boardDetailTable";
	}
	
	@RequestMapping(value = "/projects/misostudy/moveUpdateForm", method = RequestMethod.GET)
	public String updateBoard(@RequestParam String boardNo, Model model) {
		int parseIntBoardNo = Integer.parseInt(boardNo);
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(parseIntBoardNo); // logger.info(board.toString());
		model.addAttribute("board", board);
		
		List<MisoStudyUploadFileVo> uploadFileInfos = misoStudyService.selectFileByBoardNo(parseIntBoardNo);
		if (!uploadFileInfos.isEmpty()) {
			for (MisoStudyUploadFileVo uploadFileInfo : uploadFileInfos) {
				String substring = uploadFileInfo.getUploadName().substring(37);
				uploadFileInfo.setUploadName(substring);
				
			}
			model.addAttribute("uploadFileInfos", uploadFileInfos);
		}
		
		return "projects/misostudy/boardUpdate";
	}
	
	// TODO: 업로드 파일 삭제할 수 있는 기능 생성할 것
	@RequestMapping(value = "/projects/misostudy/boardUpdate", method = RequestMethod.POST)
	public String updateBoard(MisoStudyBoardVo updateBoard, Model model) throws IOException {
		logger.info(updateBoard.toString());
		List<MultipartFile> uploadFiles = updateBoard.getUploadName();
		
		System.out.println(uploadFiles.size());
		
		// uploadFiles이 비어서 서버로 요청되었는지? 
		if (uploadFiles.get(0).getSize() == 0) {
			misoStudyService.updateBoardByBoardNo(updateBoard);
		} else {
			
			// 원래 있던 첨부 파일 삭제
			List<MisoStudyUploadFileVo> uploadedFiles = misoStudyService.selectFileByBoardNo(updateBoard.getBoardNo());
			for (MisoStudyUploadFileVo uploadedFile : uploadedFiles) {
				File file = new File(uploadPath, uploadedFile.getUploadName());
				file.delete();
				misoStudyService.deleteUploadFileByUploadNo(uploadedFile.getUploadNo());
			}
			
			// 새로운 첨부파일 추가
			for (MultipartFile uploadFile : uploadFiles) {
				UUID uid = UUID.randomUUID();
				String savedFileName = uid.toString() + "_" + uploadFile.getOriginalFilename();
				File target = new File(uploadPath, savedFileName);
				FileCopyUtils.copy(uploadFile.getBytes(), target);
				
				MisoStudyUploadFileVo uploadFileInfo = new MisoStudyUploadFileVo();
				uploadFileInfo.setBoardNo(updateBoard.getBoardNo());
				uploadFileInfo.setUploadName(savedFileName);
				misoStudyService.insertFile(uploadFileInfo);
			}
			
			misoStudyService.updateBoardByBoardNo(updateBoard);
		}
		
		// 수정된 view 정보들
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(updateBoard.getBoardNo());
		model.addAttribute("board", board);
		
		List<MisoStudyUploadFileVo> uploadFileInfos = misoStudyService.selectFileByBoardNo(updateBoard.getBoardNo());
		if (!uploadFileInfos.isEmpty()) {
			for (MisoStudyUploadFileVo uploadFileInfo : uploadFileInfos) {
				String substring = uploadFileInfo.getUploadName().substring(37);
				uploadFileInfo.setUploadName(substring);
			}
			model.addAttribute("uploadFileInfos", uploadFileInfos);
		}
		
		logger.info("updatedBoard:" + board.toString());
		logger.info("updatedUploadFileInfos:" + uploadFileInfos.toString());
		
		return "/projects/misostudy/boardDetailTable";
	}
	
	@RequestMapping(value = "/projects/misostudy/insertBoard", method = RequestMethod.POST)
	public String insertBoard(MisoStudyBoardVo newBoard, Model model) throws IOException {
		misoStudyService.insertBoard(newBoard);
		
		List<MultipartFile> uploadFiles = newBoard.getUploadName();
		
		for (MultipartFile uploadFile : uploadFiles) {
			if (!uploadFile.isEmpty()) {
				UUID uid = UUID.randomUUID();
				String savedFileName = uid.toString() + "_" + uploadFile.getOriginalFilename();
				File target = new File(uploadPath, savedFileName);
				FileCopyUtils.copy(uploadFile.getBytes(), target);
				
				MisoStudyUploadFileVo uploadFileInfo = new MisoStudyUploadFileVo();
				uploadFileInfo.setBoardNo(newBoard.getBoardNo());
				uploadFileInfo.setUploadName(savedFileName);
				logger.info("uploadFileInfos: " + uploadFileInfo);
				misoStudyService.insertFile(uploadFileInfo);
			}
		}
		
		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/projects/misostudy/downloadFile", method = RequestMethod.POST)
	public void downloadFile(@RequestParam String uploadNo, HttpServletResponse res) throws IOException {
		int parseIntUploadNo = Integer.parseInt(uploadNo);
		String uploadFileName = misoStudyService.selectUploadFileByUploadNo(parseIntUploadNo);
		String substring = uploadFileName.substring(37);
		
		File file = new File(uploadPath, uploadFileName);
		
		res.setContentType("application/octet-stream");
		res.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(substring, "UTF-8")+"\";");
		res.setHeader("Content-Transfer-Encoding", "binary");
		
		byte[] fileByte = FileUtils.readFileToByteArray(file);
		res.getOutputStream().write(fileByte);
		res.getOutputStream().flush();
		res.getOutputStream().close();
	}
	
	@RequestMapping(value = "/projects/misostudy/deleteBoard", method = RequestMethod.POST)
	public @ResponseBody String deleteBoard(@RequestParam String boardNo, Model model) {
		int parseIntBoardNo = Integer.parseInt(boardNo);
		
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(parseIntBoardNo);
		board.setIsDeleted("Y");
		
		misoStudyService.deleteBoardByBoardNo(board);
		
		List<MisoStudyUploadFileVo> uploadedFiles = misoStudyService.selectFileByBoardNo(parseIntBoardNo);
		for (MisoStudyUploadFileVo uploadedFile: uploadedFiles) {
			File file = new File(uploadPath, uploadedFile.getUploadName());
			file.delete();
			misoStudyService.deleteUploadFileByUploadNo(uploadedFile.getUploadNo());
		}
		
		return "success";
	}
}