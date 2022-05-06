package com.miso.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.miso.web.vo.EmpVo;

@Repository
public class HomeDaoImpl implements HomeDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public EmpVo selectEmpInfo() {
		
		EmpVo empInfo = sqlSession.selectOne("selectEmpInfo");
		
		// System.out.println(empInfo.toString());
		
		return empInfo;
	}

	@Override
	public List<EmpVo> selectAllEmpInfo() {
		
		List<EmpVo> empInfos = sqlSession.selectList("selectAllEmpInfo");
		
//		for (EmpVo empInfo : empInfos) {
//			System.out.println(empInfo.toString());
//		}
		
		return empInfos;
	}

}
