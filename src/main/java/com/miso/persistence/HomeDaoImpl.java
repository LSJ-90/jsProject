package com.miso.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import com.miso.web.vo.EmpVo;
import com.miso.web.vo.SearchEmpInfosForm;

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
	
	@Override
	public String selectPhoneByName(String inputName) {
		// System.out.println(inputName);
		String phone = sqlSession.selectOne("selectPhoneByName", inputName);
		
		return phone;
	}
	
	@Override
	public List<EmpVo> selectEmpInfos(@RequestBody SearchEmpInfosForm form) {
		
		List<EmpVo> empInfos = new ArrayList<>();
		
		if (form.getSearchKey().equals("name")) {
			empInfos = sqlSession.selectList("selectEmpInfos", form.getSearchValue());			
		}
		
		return empInfos;
	}


}
