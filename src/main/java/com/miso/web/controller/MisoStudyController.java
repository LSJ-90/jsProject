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
	public String boardListInit(HttpSession session, Model model) {
		
		List<MisoStudyBoardVo> boardList = misoStudyService.selectAllBoards();
		model.addAttribute("boardList", boardList);
		
		MisoStudyUserVo loginedUser = (MisoStudyUserVo) session.getAttribute("LOGIN_USER");
		model.addAttribute("LOGIN_USER", loginedUser);

		return "/projects/misostudy/boardList";
	}
	
	@RequestMapping(value = "/projects/misostudy/detailBoard", method = RequestMethod.GET)
	public void detailBoard(@RequestParam String boardNo, Model model) {

		System.out.println(boardNo);
		MisoStudyBoardVo board = misoStudyService.selectBoardByBoardNo(boardNo);
		
		// return board;
	}
	
	@RequestMapping(value = "/projects/misostudy/insertBoard", method = RequestMethod.POST)
	public String insertBoard(MisoStudyBoardVo newBoard, Model model) {
		logger.info(newBoard.toString());
			
		return "redirect:boardList";
	}
}


