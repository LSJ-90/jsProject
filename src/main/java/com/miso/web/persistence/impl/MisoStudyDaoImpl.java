package com.miso.web.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.miso.web.persistence.MisoStudyDao;
import com.miso.web.util.Criteria;
import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyChartDataVo;
import com.miso.web.vo.MisoStudyUploadFileVo;
import com.miso.web.vo.MisoStudyUserVo;

@Repository
public class MisoStudyDaoImpl implements MisoStudyDao {

	@Autowired
	private SqlSession sqlSession;
	
	// UserAuth DaoImpl
	@Override
	public void signUp(MisoStudyUserVo newUser) {
		sqlSession.insert("signUp", newUser);
	}

	@Override
	public int countUserInfoById(String id) {
		return sqlSession.selectOne("countUserInfoById", id);
	}
	
	@Override
	public int countUserInfoByEmail(String email) {
		return sqlSession.selectOne("countUserInfoByEmail", email);
	}

	@Override
	public MisoStudyUserVo selectUserInfoById(String id) {
		return sqlSession.selectOne("selectUserInfoById", id);
	}
	
	@Override
	public MisoStudyUserVo selectUserInfoByEmail(String email) {
		return sqlSession.selectOne("selectUserInfoByEmail", email);
	}
	
	@Override
	public void updateUserInfo(MisoStudyUserVo savedUserInfo) {
		sqlSession.update("updateUserInfo", savedUserInfo);
	}
	
	// Board DaoImpl
	@Override
	public List<MisoStudyBoardVo> selectAllBoards() {
		return sqlSession.selectList("selectAllBoards");
	}

	@Override
	public MisoStudyBoardVo selectBoardByBoardNo(int boardNo) {
		return sqlSession.selectOne("selectBoardByBoardNo", boardNo);
	}

	@Override
	public List<MisoStudyBoardVo> selectCommentsByBoardNo(int parseIntBoardNo) {
		return sqlSession.selectList("selectCommentsByBoardNo", parseIntBoardNo);
	}

	@Override
	public void insertBoard(MisoStudyBoardVo newBoard) {
		sqlSession.insert("insertBoard", newBoard);
	}

	@Override
	public void updateBoardByBoardNo(MisoStudyBoardVo newBoard) {
		sqlSession.update("updateBoardByBoardNo", newBoard);
	}

	@Override
	public int selectBoardsTotalRowsCnt() {
		return sqlSession.selectOne("selectBoardsTotalRowsCnt");
	}

	@Override
	public List<MisoStudyBoardVo> selectSearchBoards(Criteria criteria) {
		return sqlSession.selectList("selectSearchBoards", criteria);
	}

	@Override
	public void updateViewCntByBoardNo(MisoStudyBoardVo board) {
		sqlSession.update("updateViewCntByBoardNo", board);
	}

	@Override
	public void deleteBoardByBoardNo(MisoStudyBoardVo board) {
		sqlSession.update("deleteBoardByBoardNo", board);
	}

	@Override
	public void insertFile(MisoStudyUploadFileVo uploadFileInfos) {
		sqlSession.insert("insertFile", uploadFileInfos);
	}

	@Override
	public List<MisoStudyUploadFileVo> selectFileByBoardNo(int boardNo) {
		return sqlSession.selectList("selectFileByBoardNo", boardNo);
	}

	@Override
	public String selectUploadFileByUploadNo(int uploadNo) {
		return sqlSession.selectOne("selectUploadFileByUploadNo", uploadNo);
	}

	@Override
	public int countUploadFileByBoardNo(int boardNo) {
		return sqlSession.selectOne("countUploadFileByBoardNo", boardNo);
	}

	@Override
	public void deleteUploadFileByUploadNo(int uploadNo) {
		sqlSession.delete("deleteUploadFileByUploadNo", uploadNo);
	}
	
	@Override
	public List<MisoStudyChartDataVo> selectChartsDataByDay() {
		return sqlSession.selectList("selectChartsDataByDay");
	}
	
	@Override
	public List<MisoStudyChartDataVo> selectChartsDataByMonth() {
		return sqlSession.selectList("selectChartsDataByMonth");
	}
}
