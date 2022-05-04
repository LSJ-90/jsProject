package com.miso.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.miso.web.vo.EmpVo;

@Repository
public class HomeDaoImpl implements HomeDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.miso.mapper.HomeMapper";
	
	@Override
	public EmpVo selectEmpInfo() {
		EmpVo empInfo = sqlSession.selectOne("selectEmpInfo");
		System.out.println(empInfo.toString());
		return empInfo;
	}

}
