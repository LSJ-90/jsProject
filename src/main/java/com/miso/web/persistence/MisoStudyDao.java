package com.miso.web.persistence;

import com.miso.web.vo.MisoStudyUserVo;

public interface MisoStudyDao {
	
	void signUp(MisoStudyUserVo newUser);

	int checkUserInfoById(String id);
	
	MisoStudyUserVo selectUserInfoById(String id);
	
}