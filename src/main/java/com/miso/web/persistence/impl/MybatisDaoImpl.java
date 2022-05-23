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
	public List<Integer> selectMgrNosByDistinct() {
		return sqlSession.selectList("selectMgrNosByDistinct");
	}
	
	@Override
	public List<EmpVoOfMybatis> selectEmpsByEmpNo(List<Integer> empNos) {
		return sqlSession.selectList("selectEmpsByEmpNo", empNos);
	}

	@Override
	public List<EmpVoOfMybatis> selectEmpsByDeptNo(List<Integer> deptNos) {
		return sqlSession.selectList("selectEmpsByDeptNo", deptNos);
	}
	
	@Override
	public List<EmpVoOfMybatis> selectEmpsByJob(String job) {
		return sqlSession.selectList("selectEmpsByJob", job);
	}

	@Override
	public List<EmpVoOfMybatis> selectEmpByValue(SearchValueOfMybatis value) {
		return sqlSession.selectList("selectEmpByValue", value);
	}

	@Override
	public void insertEmpInfo(EmpVoOfMybatis emp) {
		sqlSession.insert("insertEmpInfo", emp);
	}

	@Override
	public void updateEmpInfo(List<EmpVoOfMybatis> empInfos) {
		sqlSession.update("updateEmpInfo", empInfos);
	}
}
