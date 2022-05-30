package com.miso.web.controller;

import javax.servlet.http.HttpServletRequest;
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
import com.miso.web.vo.MisoStudyUserVo;

/**
 * Home Init Controller
 */
@Controller
public class MisoStudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MisoStudyController.class);
	
	@Autowired
	private MisoStudyService misoStudyService;
	
	@RequestMapping(value = "/projects/misostudy/signUpForm", method = RequestMethod.GET)
	public String signUpFormInit(Model model) {
		
		return "/projects/misostudy/signUpForm";
	}
	
	@RequestMapping(value = "/projects/misostudy/signUpForm", method = RequestMethod.POST)
	public void signUp(MisoStudyUserVo newUser) {
		logger.info(newUser.toString());
		
		misoStudyService.signUp(newUser);
	}
	
	@RequestMapping(value = "/projects/misostudy/signIn", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String signIn(@RequestParam String id, @RequestParam String pwd, HttpSession session, Model model) {
		System.out.println(id + " " + pwd);
		String authPwd = DigestUtils.sha512Hex(pwd);
		
		String signInResult = "";
		
		if (id.equals("") || pwd.equals("")) {
			signInResult = "로그인 정보를 모두 입력해주세요..";
		} else {
			MisoStudyUserVo savedUser = misoStudyService.signIn(id, authPwd);
			System.out.println(savedUser);
			if (savedUser == null) {
				signInResult = "회원정보가 존재하지 않습니다."; //"4";
			} else {
				
				if ("Y".equals(savedUser.getIsWithdrawal())) {
					signInResult = "휴면 상태입니다."; // "3";
				} else if (!id.equals(savedUser.getId())) {
					signInResult = "아이디를 확인해주세요."; // "1";
				} else if (!authPwd.equals(savedUser.getPwd())) {
					signInResult = "비밀번호를 확인해주세요."; // "2";
				} else {
					session.setAttribute("LOGIN_USER", savedUser);
					signInResult = "0"; //"로그인 성공:) " + savedUser.getName() + "님 환영합니다.";
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
}


