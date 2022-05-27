package com.miso.web.persistence.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miso.web.persistence.MisoStudyDao;
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
	public int checkUserInfoById(String id) {
		return sqlSession.selectOne("checkUserInfoById", id);
	}

	@Override
	public MisoStudyUserVo selectUserInfoById(String id) {
		return sqlSession.selectOne("selectUserInfoById", id);
	}
	
	
}
