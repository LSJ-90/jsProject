package com.miso.web.persistence;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.miso.web.util.Criteria;
import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyChartDataVo;
import com.miso.web.vo.MisoStudyUploadFileVo;
import com.miso.web.vo.MisoStudyUserVo;

public interface MisoStudyDao {
	
	
	// UserAuth Dao
	void signUp(MisoStudyUserVo newUser);
	
	int countUserInfoById(String id);

	int countUserInfoByEmail(String email);

	MisoStudyUserVo selectUserInfoById(String id);
	
	MisoStudyUserVo selectUserInfoByEmail(String email);
	
	void updateUserInfo(MisoStudyUserVo savedUserInfo);
	
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

	List<MisoStudyChartDataVo> selectChartsDataByDay();

	void insertFile(MisoStudyUploadFileVo uploadFileInfo);

	List<MisoStudyUploadFileVo> selectFileByBoardNo(int boardNo);

	String selectUploadFileByUploadNo(int uploadNo);

	int countUploadFileByBoardNo(int boardNo);

	void deleteUploadFileByUploadNo(int uploadNo);

	List<MisoStudyChartDataVo> selectChartsDataByMonth();
}