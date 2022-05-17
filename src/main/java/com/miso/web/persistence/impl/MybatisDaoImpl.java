package com.miso.web.persistence.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.miso.web.persistence.MybatisDao;
import com.miso.web.vo.EmpVoOfMybatis;
import com.miso.web.vo.SearchValueOfMybatis;

@Repository
public class MybatisDaoImpl implements MybatisDao {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<EmpVoOfMybatis> selectAllEmpInfos() {
		return sqlSession.selectList("selectAllEmpInfos");
	}

	@Override
	public List<Integer> selectDeptNosByDistinct() {
		return sqlSession.selectList("selectDeptNosByDistinct");
	}

	@Override
	public List<String> selectJobsByDistinct() {
		return sqlSession.selectList("selectJobsByDistinct");
	}

	@Override
	public List<EmpVoOfMybatis> selectEmpsByDeptNo(int deptNo) {
		return sqlSession.selectList("selectEmpsByDeptNo", deptNo);
	}
	
	@Override
	public List<EmpVoOfMybatis> selectEmpsByJob(String job) {
		return sqlSession.selectList("selectEmpsByJob", job);
	}

	@Override
	public List<EmpVoOfMybatis> searchEmpByValue(SearchValueOfMybatis value) {
		return sqlSession.selectList("searchEmpByValue", value);
	}
}
