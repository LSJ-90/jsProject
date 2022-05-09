package com.miso.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.miso.persistence.HomeDao;
import com.miso.web.vo.EmpVo;
import com.miso.web.vo.SearchEmpInfosForm;

@RestController
public class AjaxTestController {
	
	@Autowired
	private HomeDao homeDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxTestController.class);
	
	@RequestMapping(value = "/javascript/practice/searchPhoneByName", method = RequestMethod.GET)
	public Map<String,String> searchPhone(@RequestParam String inputName) {
		
		String phone = homeDao.selectPhoneByName(inputName);
		logger.info("searchPhoneByname: " + inputName + "/" + phone);
		
		Map<String,String> returnMap = new HashMap<>();
		returnMap.put("name", inputName);
		returnMap.put("phone", phone );
			
		return returnMap;
	}
	
	@RequestMapping(value = "/javascript/practice/searchEmpInfos", method = RequestMethod.POST)
	public List<EmpVo> selectEmpInfos(@RequestBody SearchEmpInfosForm form) {
		
		logger.info("SearchEmpInfosForm: " + form.getSearchKey() + " " + form.getSearchValue());
		
		List<EmpVo> empInfos = homeDao.selectEmpInfos(form);
		logger.info("empInfos: " + empInfos);
			
		return empInfos;
	}
}


