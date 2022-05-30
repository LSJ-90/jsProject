package com.miso.web.service;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miso.web.controller.MisoStudyController;
import com.miso.web.persistence.MisoStudyDao;
import com.miso.web.vo.MisoStudyUserVo;

@Service
public class MisoStudyService {
	
	private static final Logger logger = LoggerFactory.getLogger(MisoStudyService.class);
	
	@Autowired
	private MisoStudyDao misoStudyDao;

	public void signUp(MisoStudyUserVo newUser) {
		String authPwd = DigestUtils.sha512Hex(newUser.getPwd());
		newUser.setPwd(authPwd);
		misoStudyDao.signUp(newUser);
	}

	public MisoStudyUserVo signIn(String id, String authPwd) {
		
		MisoStudyUserVo savedUser = misoStudyDao.selectUserInfoById(id);
		
		return savedUser;
	}

	public MisoStudyUserVo selectUserInfoById(String id) {
		return misoStudyDao.selectUserInfoById(id);
	}
	
	
}
