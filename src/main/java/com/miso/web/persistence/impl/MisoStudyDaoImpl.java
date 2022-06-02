package com.miso.web.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miso.web.persistence.MisoStudyDao;
import com.miso.web.vo.MisoStudyBoardVo;
import com.miso.web.vo.MisoStudyUserVo;

@Repository
public class MisoStudyDaoImpl implements MisoStudyDao {

	@Autowired
	private SqlSession sqlSession;

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
	public List<MisoStudyBoardVo> selectAllBoards() {
		return sqlSession.selectList("selectAllBoards");
	}

	@Override
	public MisoStudyBoardVo selectBoardByBoardNo(String boardNo) {
		return sqlSession.selectOne("selectBoardByBoardNo", boardNo);
	}
}
