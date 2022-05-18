package com.miso.web.persistence;

import java.util.List;

import com.miso.web.vo.EmpVoOfMybatis;
import com.miso.web.vo.SearchValueOfMybatis;

public interface MybatisDao {
	
	public List<EmpVoOfMybatis> selectAllEmpInfos();
	
	public List<Integer> selectDeptNosByDistinct();
	
	public List<String> selectJobsByDistinct();

	public List<EmpVoOfMybatis> selectEmpsByDeptNo(List<Integer> deptNos);
	
	public List<EmpVoOfMybatis> selectEmpsByJob(String job);

	public List<EmpVoOfMybatis> searchEmpByValue(SearchValueOfMybatis value);

	public void insertEmpInfo(EmpVoOfMybatis emp);
}
