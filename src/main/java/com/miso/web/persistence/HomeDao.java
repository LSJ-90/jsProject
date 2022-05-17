package com.miso.web.persistence;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import com.miso.web.vo.EmpVo;
import com.miso.web.vo.SearchEmpInfosForm;

public interface HomeDao {
	
	public EmpVo selectEmpInfo();

	public List<EmpVo> selectAllEmpInfo();

	public String selectPhoneByName(String inputName);

	public List<EmpVo> selectEmpInfos(@RequestBody SearchEmpInfosForm form);
}
