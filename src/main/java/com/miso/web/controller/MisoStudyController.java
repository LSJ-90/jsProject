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
import com.miso.web.vo.ChartBarAndLineVo;
import com.miso.web.vo.ChartHorizontalBarVo;
import com.miso.web.vo.ChartLineMultifleVo;
import com.miso.web.vo.ChartScatterMultifleVo;
import com.miso.web.vo.ChartScatterSingleVo;
import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyChartDataVo;
import com.miso.web.vo.MisoStudyUploadFileVo;
import com.miso.web.vo.MisoStudyUserVo;
import com.miso.web.vo.YvalueVo;

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
	
	/**
	 * chartBoard Controller
	 */
	@RequestMapping(value = "/projects/misostudy/chartBoard", method = RequestMethod.GET)
	public String chartBoardInit(Model model) {
		
		return "/projects/misostudy/chartBoard";
	}
	
//	@RequestMapping(value = "/projects/misostudy/getChartData", method = RequestMethod.GET)
//	public @ResponseBody String getChartData(Model model) {
//		
//		String testData = "["
//		       		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"United States of America\", \"legendYvalues\" : [3217, 3806, 4369, 4474, 4481, 5037, 5104, 6139, 6441, 6139, 2375]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"Japan\", \"legendYvalues\" : [822, 865, 852, 964, 874, 952, 830, 923, 935, 823, 326]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"Korea, Republic\", \"legendYvalues\" : [418, 502, 595, 836, 922, 1071, 933, 990, 1105, 1027, 430]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"China\", \"legendYvalues\" : [101, 125, 179, 224, 254, 341, 329, 505, 479, 579, 335]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"Taiwan\", \"legendYvalues\" : [292, 301, 336, 328, 316, 328, 298, 319, 304, 291, 130]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"Germany\", \"legendYvalues\" : [170, 190, 232, 252, 214, 295, 320, 426, 420, 328, 121]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"United Kingdom\", \"legendYvalues\" : [56, 77, 103, 121, 138, 160, 180, 232, 228, 207, 85]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"France\", \"legendYvalues\" : [97, 124, 125, 156, 135, 165, 164, 193, 182, 157, 59]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"Netherlands\", \"legendYvalues\" : [110, 133, 151, 174, 158, 147, 149, 134, 144, 118, 58]}},"
//		    		+	"{\"xValues\" : [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022], \"yValue\" : {\"legendValue\" : \"Switzerland\", \"legendYvalues\" : [67, 107, 97, 105, 111, 137, 128, 143, 148, 133, 70]}}"
//		    		+ "]";
//		return testData;
//	}
	
	@RequestMapping(value = "/projects/misostudy/chartBarAndLine", method = RequestMethod.POST)
	public @ResponseBody List<List<ChartBarAndLineVo>> getChartDataBarAndLine() {
		List<List<ChartBarAndLineVo>> testDataList =  new ArrayList<List<ChartBarAndLineVo>>();
		
		List<ChartBarAndLineVo> testData1 = new ArrayList<ChartBarAndLineVo>();
		
		testData1.add(new ChartBarAndLineVo("2012", 5988, 418));
		testData1.add(new ChartBarAndLineVo("2013", 7022, 502));
		testData1.add(new ChartBarAndLineVo("2014", 7935, 595));
		testData1.add(new ChartBarAndLineVo("2015", 8643, 836));
		testData1.add(new ChartBarAndLineVo("2016", 8706, 922));
		testData1.add(new ChartBarAndLineVo("2017", 9814, 1071));
		testData1.add(new ChartBarAndLineVo("2018", 9796, 933));
		testData1.add(new ChartBarAndLineVo("2019", 11530, 990));
		testData1.add(new ChartBarAndLineVo("2020", 11984, 1105));
		testData1.add(new ChartBarAndLineVo("2021", 11563, 1027));
		testData1.add(new ChartBarAndLineVo("2022", 4728, 430));
		testDataList.add(testData1);
		
		
		return testDataList;
	}
	
	@RequestMapping(value = "/projects/misostudy/chartBarHorizontal", method = RequestMethod.POST)
	public @ResponseBody List<List<ChartHorizontalBarVo>> getChartDataHorizontal() {
		List<List<ChartHorizontalBarVo>> testDataList =  new ArrayList<List<ChartHorizontalBarVo>>();
		
		List<ChartHorizontalBarVo> testData1 = new ArrayList<ChartHorizontalBarVo>();
		List<ChartHorizontalBarVo> testData2 = new ArrayList<ChartHorizontalBarVo>();
		List<ChartHorizontalBarVo> testData3 = new ArrayList<ChartHorizontalBarVo>();
		List<ChartHorizontalBarVo> testData4 = new ArrayList<ChartHorizontalBarVo>();
		List<ChartHorizontalBarVo> testData5 = new ArrayList<ChartHorizontalBarVo>();
		List<ChartHorizontalBarVo> testData6 = new ArrayList<ChartHorizontalBarVo>();
		List<ChartHorizontalBarVo> testData7 = new ArrayList<ChartHorizontalBarVo>();
		List<ChartHorizontalBarVo> testData8 = new ArrayList<ChartHorizontalBarVo>();
		
		testData1.add(new ChartHorizontalBarVo(51582, "United States of America"));
		testData1.add(new ChartHorizontalBarVo(9166, "Japan"));
		testData1.add(new ChartHorizontalBarVo(8829, "Korea, Republic"));
		testData1.add(new ChartHorizontalBarVo(3451, "China"));
		testData1.add(new ChartHorizontalBarVo(3243, "Taiwan"));
		testData1.add(new ChartHorizontalBarVo(2968, "Germany"));
		testData1.add(new ChartHorizontalBarVo(1587, "United Kingdom"));
		testData1.add(new ChartHorizontalBarVo(1557, "France"));
		testData1.add(new ChartHorizontalBarVo(1476, "Netherlands"));
		testData1.add(new ChartHorizontalBarVo(1246, "Switzerland"));
		testDataList.add(testData1);
		
		testData2.add(new ChartHorizontalBarVo(1.495, "Korea, Republic"));
		testData2.add(new ChartHorizontalBarVo(1.259, "Netherlands"));
		testData2.add(new ChartHorizontalBarVo(1.165, "United States of America"));
		testData2.add(new ChartHorizontalBarVo(1.148, "United Kingdom"));
		testData2.add(new ChartHorizontalBarVo(0.983, "Switzerland"));
		testData2.add(new ChartHorizontalBarVo(0.977, "Taiwan"));
		testData2.add(new ChartHorizontalBarVo(0.918, "China"));
		testData2.add(new ChartHorizontalBarVo(0.849, "France"));
		testData2.add(new ChartHorizontalBarVo(0.648, "Germany"));
		testData2.add(new ChartHorizontalBarVo(0.598, "Japan"));
		testDataList.add(testData2);
		
		testData3.add(new ChartHorizontalBarVo(1.187, "United States of America"));
		testData3.add(new ChartHorizontalBarVo(0.838, "Netherlands"));
		testData3.add(new ChartHorizontalBarVo(0.831, "Taiwan"));
		testData3.add(new ChartHorizontalBarVo(0.802, "Korea, Republic"));
		testData3.add(new ChartHorizontalBarVo(0.722, "Switzerland"));
		testData3.add(new ChartHorizontalBarVo(0.67, "United Kingdom"));
		testData3.add(new ChartHorizontalBarVo(0.546, "France"));
		testData3.add(new ChartHorizontalBarVo(0.546, "Japan"));
		testData3.add(new ChartHorizontalBarVo(0.534, "Germany"));
		testData3.add(new ChartHorizontalBarVo(0.438, "China"));
		testDataList.add(testData3);
		
		testData4.add(new ChartHorizontalBarVo(1.479, "United States of America"));
		testData4.add(new ChartHorizontalBarVo(0.613, "Switzerland"));
		testData4.add(new ChartHorizontalBarVo(0.534, "Netherlands"));
		testData4.add(new ChartHorizontalBarVo(0.508, "Taiwan"));
		testData4.add(new ChartHorizontalBarVo(0.489, "United Kingdom"));
		testData4.add(new ChartHorizontalBarVo(0.485, "Germany"));
		testData4.add(new ChartHorizontalBarVo(0.411, "Japan"));
		testData4.add(new ChartHorizontalBarVo(0.339, "Korea, Republic"));
		testData4.add(new ChartHorizontalBarVo(0.321, "France"));
		testData4.add(new ChartHorizontalBarVo(0.203, "China"));
		testDataList.add(testData4);
		
		testData5.add(new ChartHorizontalBarVo(2774, "SAMSUNG ELECTRONICS CO LTD"));
		testData5.add(new ChartHorizontalBarVo(2043, "IBM"));
		testData5.add(new ChartHorizontalBarVo(1826, "AT & T IP I LP"));
		testData5.add(new ChartHorizontalBarVo(986, "INTEL CORP"));
		testData5.add(new ChartHorizontalBarVo(906, "SAMSUNG DISPLAY CO LTD"));
		testData5.add(new ChartHorizontalBarVo(866, "UNIV CALIFORNIA"));
		testData5.add(new ChartHorizontalBarVo(638, "GENENTECH INC"));
		testData5.add(new ChartHorizontalBarVo(603, "AT & T MOBILITY II LLC"));
		testData5.add(new ChartHorizontalBarVo(576, "MASSACHUSETTS INST TECHNOLOGY"));
		testData5.add(new ChartHorizontalBarVo(557, "TAIWAN SEMICONDUCTOR MFG"));
		testDataList.add(testData5);
		
		testData6.add(new ChartHorizontalBarVo(21.531, "GENENTECH INC"));
		testData6.add(new ChartHorizontalBarVo(9.882, "AT & T MOBILITY II LLC"));
		testData6.add(new ChartHorizontalBarVo(7.188, "UNIV CALIFORNIA"));
		testData6.add(new ChartHorizontalBarVo(6.766, "MASSACHUSETTS INST TECHNOLOGY"));
		testData6.add(new ChartHorizontalBarVo(6.452, "AT & T IP I LP"));
		testData6.add(new ChartHorizontalBarVo(2.649, "SAMSUNG DISPLAY CO LTD"));
		testData6.add(new ChartHorizontalBarVo(1.506, "SAMSUNG ELECTRONICS CO LTD"));
		testData6.add(new ChartHorizontalBarVo(1.454, "INTEL CORP"));
		testData6.add(new ChartHorizontalBarVo(1.043, "TAIWAN SEMICONDUCTOR MFG"));
		testData6.add(new ChartHorizontalBarVo(0.894, "IBM"));
		testDataList.add(testData6);
		
		testData7.add(new ChartHorizontalBarVo(26.009, "GENENTECH INC"));
		testData7.add(new ChartHorizontalBarVo(23.62, "AT & T IP I LP"));
		testData7.add(new ChartHorizontalBarVo(15.23, "AT & T MOBILITY II LLC"));
		testData7.add(new ChartHorizontalBarVo(9.838, "MASSACHUSETTS INST TECHNOLOGY"));
		testData7.add(new ChartHorizontalBarVo(7.64, "UNIV CALIFORNIA"));
		testData7.add(new ChartHorizontalBarVo(1.496, "SAMSUNG DISPLAY CO LTD"));
		testData7.add(new ChartHorizontalBarVo(1.033, "TAIWAN SEMICONDUCTOR MFG"));
		testData7.add(new ChartHorizontalBarVo(0.882, "SAMSUNG ELECTRONICS CO LTD"));
		testData7.add(new ChartHorizontalBarVo(0.85, "INTEL CORP"));
		testData7.add(new ChartHorizontalBarVo(0.849, "IBM"));
		testDataList.add(testData7);
		
		testData8.add(new ChartHorizontalBarVo(6.773, "AT & T IP I LP"));
		testData8.add(new ChartHorizontalBarVo(2.266, "MASSACHUSETTS INST TECHNOLOGY"));
		testData8.add(new ChartHorizontalBarVo(1.711, "AT & T MOBILITY II LLC"));
		testData8.add(new ChartHorizontalBarVo(1.018, "GENENTECH INC"));
		testData8.add(new ChartHorizontalBarVo(0.972, "TAIWAN SEMICONDUCTOR MFG"));
		testData8.add(new ChartHorizontalBarVo(0.861, "UNIV CALIFORNIA"));
		testData8.add(new ChartHorizontalBarVo(0.558, "IBM"));
		testData8.add(new ChartHorizontalBarVo(0.55, "SAMSUNG ELECTRONICS CO LTD"));
		testData8.add(new ChartHorizontalBarVo(0.313, "INTEL CORP"));
		testData8.add(new ChartHorizontalBarVo(0.187, "SAMSUNG DISPLAY CO LTD"));
		testDataList.add(testData8);

		return testDataList;
	}
	
	@RequestMapping(value = "/projects/misostudy/chartLineMultifle", method = RequestMethod.POST)
	public @ResponseBody List<List<ChartLineMultifleVo>> getChartDataLineMultifle() {
		List<List<ChartLineMultifleVo>> testDataList =  new ArrayList<List<ChartLineMultifleVo>>();
		
		List<ChartLineMultifleVo> testData1 = new ArrayList<ChartLineMultifleVo>();
		List<ChartLineMultifleVo> testData2 = new ArrayList<ChartLineMultifleVo>();
		
		String[] xValues = {"2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"};
		
		int[] legendYvalues1 = {3217, 3806, 4369, 4474, 4481, 5037, 5104, 6139, 6441, 6139, 2375};
		int[] legendYvalues2 = {822, 865, 852, 964, 874, 952, 830, 923, 935, 823, 326};
		int[] legendYvalues3 = {418, 502, 595, 836, 922, 1071, 933, 990, 1105, 1027, 430};
		int[] legendYvalues4 = {101, 125, 179, 224, 254, 341, 329, 505, 479, 579, 335};
		int[] legendYvalues5 = {292, 301, 336, 328, 316, 328, 298, 319, 304, 291, 130};
		int[] legendYvalues6 = {170, 190, 232, 252, 214, 295, 320, 426, 420, 328, 121};
		int[] legendYvalues7 = {56, 77, 103, 121, 138, 160, 180, 232, 228, 207, 85};
		int[] legendYvalues8 = {97, 124, 125, 156, 135, 165, 164, 193, 182, 157, 59};
		int[] legendYvalues9 = {110, 133, 151, 174, 158, 147, 149, 134, 144, 118, 58};
		int[] legendYvalues10 = {67, 107, 97, 105, 111, 137, 128, 143, 148, 133, 70};

		YvalueVo yValue1 = new YvalueVo("United States of America", legendYvalues1);
		YvalueVo yValue2 = new YvalueVo("Japan", legendYvalues2);
		YvalueVo yValue3 = new YvalueVo("Korea, Republic", legendYvalues3);
		YvalueVo yValue4 = new YvalueVo("China", legendYvalues4);
		YvalueVo yValue5 = new YvalueVo("Taiwan", legendYvalues5);
		YvalueVo yValue6 = new YvalueVo("Germany", legendYvalues6);
		YvalueVo yValue7 = new YvalueVo("United Kingdom", legendYvalues7);
		YvalueVo yValue8 = new YvalueVo("France", legendYvalues8);
		YvalueVo yValue9 = new YvalueVo("Netherlands", legendYvalues9);
		YvalueVo yValue10 = new YvalueVo("Switzerland", legendYvalues10);
		
		testData1.add(new ChartLineMultifleVo(xValues, yValue1));
		testData1.add(new ChartLineMultifleVo(xValues, yValue2));
		testData1.add(new ChartLineMultifleVo(xValues, yValue3));
		testData1.add(new ChartLineMultifleVo(xValues, yValue4));
		testData1.add(new ChartLineMultifleVo(xValues, yValue5));
		testData1.add(new ChartLineMultifleVo(xValues, yValue6));
		testData1.add(new ChartLineMultifleVo(xValues, yValue7));
		testData1.add(new ChartLineMultifleVo(xValues, yValue8));
		testData1.add(new ChartLineMultifleVo(xValues, yValue9));
		testData1.add(new ChartLineMultifleVo(xValues, yValue10));
		testDataList.add(testData1);
		
		int[] legendYvalues11 = {137, 168, 203, 287, 322, 338, 293, 263, 320, 320, 123};
		int[] legendYvalues12 = {88, 104, 140, 126, 102, 166, 203, 287, 388, 363, 76};
		int[] legendYvalues13 = {9, 21, 44, 47, 74, 143, 228, 358, 457, 338, 107};
		int[] legendYvalues14 = {24, 25, 20, 33, 52, 92, 83, 197, 173, 203, 84};
		int[] legendYvalues15 = {4, 24, 34, 52, 59, 103, 83, 108, 159, 199, 81};
		int[] legendYvalues16 = {63, 81, 98, 89, 68, 89, 70, 75, 104, 97, 32};
		int[] legendYvalues17 = {65, 77, 65, 46, 58, 62, 80, 50, 59, 61, 15};
		int[] legendYvalues18 = {29, 38, 70, 72, 67, 72, 71, 61, 65, 36, 22};
		int[] legendYvalues19 = {47, 54, 68, 51, 70, 47, 56, 60, 45, 62, 16};
		int[] legendYvalues20 = {9, 17, 16, 23, 41, 75, 70, 74, 79, 95, 58};
		
		YvalueVo yValue11 = new YvalueVo("United States of America", legendYvalues11);
		YvalueVo yValue12 = new YvalueVo("Japan", legendYvalues12);
		YvalueVo yValue13 = new YvalueVo("Korea, Republic", legendYvalues13);
		YvalueVo yValue14 = new YvalueVo("China", legendYvalues14);
		YvalueVo yValue15 = new YvalueVo("Taiwan", legendYvalues15);
		YvalueVo yValue16 = new YvalueVo("Germany", legendYvalues16);
		YvalueVo yValue17 = new YvalueVo("United Kingdom", legendYvalues17);
		YvalueVo yValue18 = new YvalueVo("France", legendYvalues18);
		YvalueVo yValue19 = new YvalueVo("Netherlands", legendYvalues19);
		YvalueVo yValue20 = new YvalueVo("Switzerland", legendYvalues20);
		
		testData2.add(new ChartLineMultifleVo(xValues, yValue11));
		testData2.add(new ChartLineMultifleVo(xValues, yValue12));
		testData2.add(new ChartLineMultifleVo(xValues, yValue13));
		testData2.add(new ChartLineMultifleVo(xValues, yValue14));
		testData2.add(new ChartLineMultifleVo(xValues, yValue15));
		testData2.add(new ChartLineMultifleVo(xValues, yValue16));
		testData2.add(new ChartLineMultifleVo(xValues, yValue17));
		testData2.add(new ChartLineMultifleVo(xValues, yValue18));
		testData2.add(new ChartLineMultifleVo(xValues, yValue19));
		testData2.add(new ChartLineMultifleVo(xValues, yValue20));
		testDataList.add(testData2);

		return testDataList;
	}
	
	@RequestMapping(value = "/projects/misostudy/chartScatterMultifle", method = RequestMethod.POST)
	public @ResponseBody List<List<ChartScatterMultifleVo>> getChartDataScatterMultifle() {
		List<List<ChartScatterMultifleVo>> testDataList =  new ArrayList<List<ChartScatterMultifleVo>>();
		
		List<ChartScatterMultifleVo> testData1 = new ArrayList<ChartScatterMultifleVo>();
		List<ChartScatterMultifleVo> testData2 = new ArrayList<ChartScatterMultifleVo>();
		List<ChartScatterMultifleVo> testData3 = new ArrayList<ChartScatterMultifleVo>();
		List<ChartScatterMultifleVo> testData4 = new ArrayList<ChartScatterMultifleVo>();

		testData1.add(new ChartScatterMultifleVo(51582, 1.479, "United States of America"));
		testData1.add(new ChartScatterMultifleVo(1246, 0.613, "Switzerland"));
		testData1.add(new ChartScatterMultifleVo(1476, 0.534, "Netherlands"));
		testData1.add(new ChartScatterMultifleVo(3243, 0.508, "Taiwan"));
		testData1.add(new ChartScatterMultifleVo(1587, 0.489, "United Kingdom"));
		testData1.add(new ChartScatterMultifleVo(2968, 0.485, "Germany"));
		testData1.add(new ChartScatterMultifleVo(9166, 0.411, "Japan"));
		testData1.add(new ChartScatterMultifleVo(8829, 0.339, "Korea, Republic"));
		testData1.add(new ChartScatterMultifleVo(1557, 0.321, "France"));
		testData1.add(new ChartScatterMultifleVo(3451, 0.203, "China"));
		testDataList.add(testData1);
		
		testData2.add(new ChartScatterMultifleVo(1246, 9.293, "Switzerland"));
		testData2.add(new ChartScatterMultifleVo(2968, 6.989, "Germany"));
		testData2.add(new ChartScatterMultifleVo(1587, 6.885, "United Kingdom"));
		testData2.add(new ChartScatterMultifleVo(1557, 5.781, "France"));
		testData2.add(new ChartScatterMultifleVo(1476, 5.249, "Netherlands"));
		testData2.add(new ChartScatterMultifleVo(9166, 4.26, "Japan"));
		testData2.add(new ChartScatterMultifleVo(51582, 3.555, "United States of America"));
		testData2.add(new ChartScatterMultifleVo(8829, 2.985, "Korea, Republic"));
		testData2.add(new ChartScatterMultifleVo(3451, 2.887, "China"));
		testData2.add(new ChartScatterMultifleVo(3243, 2.477, "Taiwan"));
		testDataList.add(testData2);
		
		testData3.add(new ChartScatterMultifleVo(1826, 6.773, "AT & T IP I LP"));
		testData3.add(new ChartScatterMultifleVo(576, 2.266, "MASSACHUSETTS INST TECHNOLOGY"));
		testData3.add(new ChartScatterMultifleVo(603, 1.711, "AT & T MOBILITY II LLC"));
		testData3.add(new ChartScatterMultifleVo(638, 1.018, "GENENTECH INC"));
		testData3.add(new ChartScatterMultifleVo(557, 0.972, "TAIWAN SEMICONDUCTOR MFG"));
		testData3.add(new ChartScatterMultifleVo(866, 0.861, "UNIV CALIFORNIA"));
		testData3.add(new ChartScatterMultifleVo(2043, 0.558, "IBM"));
		testData3.add(new ChartScatterMultifleVo(2774, 0.55, "SAMSUNG ELECTRONICS CO LTD"));
		testData3.add(new ChartScatterMultifleVo(986, 0.313, "INTEL CORP"));
		testData3.add(new ChartScatterMultifleVo(906, 0.187, "SAMSUNG DISPLAY CO LTD"));
		testDataList.add(testData3);
		
		testData4.add(new ChartScatterMultifleVo(638, 16.194, "GENENTECH INC"));
		testData4.add(new ChartScatterMultifleVo(576, 3.332, "MASSACHUSETTS INST TECHNOLOGY"));
		testData4.add(new ChartScatterMultifleVo(866, 3.3, "UNIV CALIFORNIA"));
		testData4.add(new ChartScatterMultifleVo(2774, 2.572, "SAMSUNG ELECTRONICS CO LTD"));
		testData4.add(new ChartScatterMultifleVo(986, 2.496, "INTEL CORP"));
		testData4.add(new ChartScatterMultifleVo(906, 2.446, "SAMSUNG DISPLAY CO LTD"));
		testData4.add(new ChartScatterMultifleVo(557, 2.341, "TAIWAN SEMICONDUCTOR MFG"));
		testData4.add(new ChartScatterMultifleVo(1826, 2.086, "AT & T IP I LP"));
		testData4.add(new ChartScatterMultifleVo(2043, 1.697, "IBM"));
		testData4.add(new ChartScatterMultifleVo(603, 1.381, "AT & T MOBILITY II LLC"));
		testDataList.add(testData4);
		
		return testDataList;
	}
	
	@RequestMapping(value = "/projects/misostudy/chartScatterSingle", method = RequestMethod.POST)
	public @ResponseBody List<List<ChartScatterSingleVo>> getChartDataScatterSingle() {
		List<List<ChartScatterSingleVo>> testDataList =  new ArrayList<List<ChartScatterSingleVo>>();
		
		List<ChartScatterSingleVo> testData1 = new ArrayList<ChartScatterSingleVo>();

		testData1.add(new ChartScatterSingleVo(1198, 1));
		testData1.add(new ChartScatterSingleVo(1054, 1));
		testData1.add(new ChartScatterSingleVo(1037, 1));
		testData1.add(new ChartScatterSingleVo(1015, 1));
		testData1.add(new ChartScatterSingleVo(952, 1));
		testData1.add(new ChartScatterSingleVo(941, 1));
		testData1.add(new ChartScatterSingleVo(938, 1));
		testData1.add(new ChartScatterSingleVo(902, 1));
		testData1.add(new ChartScatterSingleVo(857, 1));
		testData1.add(new ChartScatterSingleVo(856, 1));
		testData1.add(new ChartScatterSingleVo(846, 1));
		testData1.add(new ChartScatterSingleVo(840, 1));
		testData1.add(new ChartScatterSingleVo(763, 1));
		testData1.add(new ChartScatterSingleVo(753, 1));
		testData1.add(new ChartScatterSingleVo(746, 1));
		testData1.add(new ChartScatterSingleVo(744, 1));
		testData1.add(new ChartScatterSingleVo(744, 1));
		testData1.add(new ChartScatterSingleVo(729, 1));
		testData1.add(new ChartScatterSingleVo(726, 1));
		testData1.add(new ChartScatterSingleVo(724, 1));
		testData1.add(new ChartScatterSingleVo(721, 1));
		testData1.add(new ChartScatterSingleVo(719, 1));
		testData1.add(new ChartScatterSingleVo(713, 1));
		testData1.add(new ChartScatterSingleVo(705, 1));
		testData1.add(new ChartScatterSingleVo(684, 2));
		testData1.add(new ChartScatterSingleVo(667, 1));
		testData1.add(new ChartScatterSingleVo(659, 1));
		testData1.add(new ChartScatterSingleVo(639, 1));
		testData1.add(new ChartScatterSingleVo(605, 1));
		testData1.add(new ChartScatterSingleVo(5, 2104));
		testData1.add(new ChartScatterSingleVo(2, 7025));
		testData1.add(new ChartScatterSingleVo(42, 49));
		testData1.add(new ChartScatterSingleVo(1, 14206));
		testDataList.add(testData1);
		
		return testDataList;
	}
	
	@RequestMapping(value = "/projects/misostudy/chartBoard2", method = RequestMethod.GET)
	public String chartBoard2Init(Model model) {
		return "/projects/misostudy/chartBoard2";
	}
}