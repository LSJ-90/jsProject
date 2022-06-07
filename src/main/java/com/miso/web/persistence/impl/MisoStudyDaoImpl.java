package com.miso.web.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miso.web.persistence.MisoStudyDao;
import com.miso.web.util.Criteria;
import com.miso.web.vo.MisoStudyBoardVo;
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
}
