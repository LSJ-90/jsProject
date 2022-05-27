package com.miso.web.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miso.web.persistence.MisoStudyDao;
import com.miso.web.vo.MisoStudyUserVo;

@Service
public class MisoStudyService {
	
	@Autowired
	private MisoStudyDao misoStudyDao;

	public void signUp(MisoStudyUserVo newUser) {
		String authPwd = DigestUtils.sha512Hex(newUser.getPwd());
		newUser.setPwd(authPwd);
		misoStudyDao.signUp(newUser);
	}

	public String signIn(String id, String pwd) {
		
		MisoStudyUserVo savedUser = misoStudyDao.selectUserInfoById(id);
		
		String resultUrl = "redirect:home";
		
		// 아이디 검사
		if (savedUser == null || "Y".equals(savedUser.getIsWithdrawal())) {
			resultUrl = "fail";
		}
		
		// 패스워드 검사
		String authPwd = DigestUtils.sha512Hex(pwd);
		if (!authPwd.equals(savedUser.getPwd())) {
			resultUrl = "fail";
		}
		
		return resultUrl;
	}
	
	
}
