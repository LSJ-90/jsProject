package com.miso.web.persistence;

import java.util.List;

import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyUserVo;

public interface MisoStudyDao {
	
	
	// UserAuth Dao
	void signUp(MisoStudyUserVo newUser);
	
	int countUserInfoById(String id);

	int countUserInfoByEmail(String email);

	MisoStudyUserVo selectUserInfoById(String id);
	
	
	// Board Dao
	List<MisoStudyBoardVo> selectAllBoards();

	MisoStudyBoardVo selectBoardByBoardNo(int boardNo);

	List<MisoStudyBoardVo> selectCommentsByBoardNo(int parseIntBoardNo);

	void insertBoard(MisoStudyBoardVo newBoard);
	
}