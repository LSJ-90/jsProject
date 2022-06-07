package com.miso.web.persistence;

import java.util.List;

import com.miso.web.util.Criteria;
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

	List<MisoStudyBoardVo> selectCommentsByBoardNo(int boardNo);

	void insertBoard(MisoStudyBoardVo newBoard);

	void updateBoardByBoardNo(MisoStudyBoardVo newBoard);

	int selectBoardsTotalRowsCnt();

	List<MisoStudyBoardVo> selectSearchBoards(Criteria criteria);

	void updateViewCntByBoardNo(MisoStudyBoardVo board);

	void deleteBoardByBoardNo(MisoStudyBoardVo board);
	
}