package com.miso.web.persistence;

import java.util.List;

import com.miso.web.vo.EmpVoOfMybatis;
import com.miso.web.vo.SearchValueOfMybatis;

public interface MybatisDao {
	
	public List<EmpVoOfMybatis> selectAllEmpInfos();
	
	public List<Integer> selectDeptNosByDistinct();
	
	public List<String> selectJobsByDistinct();

	List<EmpVoOfMybatis> selectEmpsByDeptNo(int deptNo);
	
	List<EmpVoOfMybatis> selectEmpsByJob(String job);
}
