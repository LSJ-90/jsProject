package com.miso.persistence;

import java.util.List;

import com.miso.web.vo.EmpVo;

public interface HomeDao {
	
	public EmpVo selectEmpInfo();

	public List<EmpVo> selectAllEmpInfo();
}
