package com.miso.web.persistence;

import java.util.List;

import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyUserVo;

public interface MisoStudyDao {
	
	void signUp(MisoStudyUserVo newUser);

	MisoStudyUserVo selectUserInfoById(String id);

	int countUserInfoById(String id);

	int countUserInfoByEmail(String email);

	List<MisoStudyBoardVo> selectAllBoards();

	MisoStudyBoardVo selectBoardByBoardNo(String boardNo);
	
}