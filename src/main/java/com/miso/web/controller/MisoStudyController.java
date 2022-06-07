package com.miso.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miso.web.service.MisoStudyService;
import com.miso.web.util.Criteria;
import com.miso.web.util.Pagination;
import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyUserVo;

/**
 * Home Init Controller
 */
@Controller
public class MisoStudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MisoStudyController.class);
	
	@Autowired
	private MisoStudyService misoStudyService;
	
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
		// System.out.println(resultValue);
		return resultValue;
	}
	
	@RequestMapping(value = "/projects/misostudy/signUpForm/checkEmail", method = RequestMethod.POST)
	public @ResponseBody int checkEmail(@RequestParam String email) {
		int resultValue = misoStudyService.checkEmail(email);
		// System.out.println(resultValue);
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
		logger.info(pagination.toString());
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		logger.info(criteria.toString());
		List<MisoStudyBoardVo> boardList = misoStudyService.selectSearchBoards(criteria);
		logger.info(boardList.toString());
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);
		
		MisoStudyUserVo loginedUser = (MisoStudyUserVo) session.getAttribute("LOGIN_USER");
		model.addAttribute("LOGIN_USER", loginedUser);

		return "/projects/misostudy/boardListResult";
	}
	
	@RequestMapping(value = "/projects/misostudy/boardDetail", method = RequestMethod.GET)
	public String detailBoard(@RequestParam String boardNo, Model model) {
		int parseIntBoardNo = Integer.parseInt(boardNo);
		
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(parseIntBoardNo); // logger.info(board.toString());
		int viewCnt = board.getViewCount() + 1;
		board.setViewCount(viewCnt);
		misoStudyService.updateViewCntByBoardNo(board);
		model.addAttribute("board", board);
		
		List<MisoStudyBoardVo> comments = misoStudyService.selectCommentsByBoardNo(parseIntBoardNo);  // logger.info(comments.toString());
		model.addAttribute("comments", comments);
		
		return "/projects/misostudy/boardDetailTable";
	}
	
	@RequestMapping(value = "/projects/misostudy/moveUpdateForm", method = RequestMethod.GET)
	public String updateBoard(@RequestParam String boardNo, Model model) {
		int parseIntBoardNo = Integer.parseInt(boardNo);
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(parseIntBoardNo); // logger.info(board.toString());
		model.addAttribute("board", board);
		
		return "projects/misostudy/boardUpdate";
	}
	
	@RequestMapping(value = "/projects/misostudy/boardUpdate", method = RequestMethod.POST)
	public String updateBoard(MisoStudyBoardVo newBoard, Model model) {
		logger.info(newBoard.toString());
		misoStudyService.updateBoardByBoardNo(newBoard);
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(newBoard.getBoardNo());
		logger.info(board.toString());
		model.addAttribute("board", board);
		
		return "/projects/misostudy/boardDetailTable";
	}
	
	@RequestMapping(value = "/projects/misostudy/insertBoard", method = RequestMethod.POST)
	public String insertBoard(MisoStudyBoardVo newBoard, HttpSession session, Model model) {
		logger.info(newBoard.toString());
		misoStudyService.insertBoard(newBoard);
			
		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/projects/misostudy/deleteBoard", method = RequestMethod.POST)
	public @ResponseBody String deleteBoard(@RequestParam String boardNo, HttpSession session, Model model) {
		int parseIntBoardNo = Integer.parseInt(boardNo);
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(parseIntBoardNo);
		board.setIsDeleted("Y");
		misoStudyService.deleteBoardByBoardNo(board);
		
		return "success";
	}
}