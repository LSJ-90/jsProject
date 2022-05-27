package com.miso.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miso.web.service.MisoStudyService;
import com.miso.web.vo.MisoStudyUserVo;

/**
 * Home Init Controller
 */
@Controller
public class MisoStudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MisoStudyController.class);
	
	@Autowired
	private MisoStudyService misoStudyDao;
	
	@RequestMapping(value = "/projects/misostudy/signUpForm", method = RequestMethod.GET)
	public String signUpFormInit(Model model) {
		
		return "/projects/misostudy/signUpForm";
	}
	
	@RequestMapping(value = "/projects/misostudy/signUpForm", method = RequestMethod.POST)
	public void signUp(MisoStudyUserVo newUser) {
		logger.info(newUser.toString());
		
		misoStudyDao.signUp(newUser);
	}
	
	@RequestMapping(value = "/projects/misostudy/signIn", method = RequestMethod.POST)
	public String signIn(String id, String pwd, HttpSession session) {
		System.out.println(id + " " + pwd);
		
		String resultUrl = misoStudyDao.signIn(id, pwd);
		System.out.println(resultUrl);
		// session.setAttribute("id", id);
		
		return resultUrl;
	}
}


