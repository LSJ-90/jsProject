package com.miso.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miso.web.persistence.MybatisDao;
import com.miso.web.vo.EmpVoOfMybatis;
import com.miso.web.vo.SearchValueOfMybatis;

@Controller
public class MybatisController {
	
	private static final Logger logger = LoggerFactory.getLogger(MybatisController.class);
	
	@Autowired
	private MybatisDao mybatisDao;
	
	/**
	 * mybatis Controller
	 * @return url
	 */
	@RequestMapping(value = "/mybatis/mybatisTest", method = RequestMethod.GET)
	public String mybatisTestInti(Model model) {
		
		List<EmpVoOfMybatis> empInfos1 = mybatisDao.selectAllEmpInfos();
		List<EmpVoOfMybatis> empInfos2 = mybatisDao.selectAllEmpInfos();
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos1", empInfos1);
		model.addAttribute("empInfos2", empInfos2);
		model.addAttribute("empInfos3", empInfos3);

		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		
//		for (EmpVoOfMybatis empInfo : empInfos) {
//			System.out.println(empInfo.toString());
//		}
//		for (Integer deptNo : deptNos) {
//			System.out.println(deptNo.toString());
//		}
//		for (String job : jobs) {
//			System.out.println(job.toString());
//		}
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/searchEmpByDeptNo", method = RequestMethod.GET)
	public String searchEmpByDeptNo(@RequestParam(value="deptNo1") String deptNo, Model model) {
		// System.out.println(deptNo);
		
		// TODO: 형변환 필요할까??
		List<Integer> parseIntDeptNo = new ArrayList<Integer>();
		
		if (deptNo.contains(",")) {
			String[] splitBydeptNoArray = deptNo.split(",");
			List<String> splitBydeptNoArrayToList = Arrays.asList(splitBydeptNoArray);
			// System.out.println(splitBydeptNoArrayToList.get(0) + "//" + splitBydeptNoArrayToList.get(1));
			for (String splitBydeptNo : splitBydeptNoArrayToList) {
				parseIntDeptNo.add(Integer.valueOf(splitBydeptNo));
			}
		} else {
			parseIntDeptNo.add(Integer.valueOf(deptNo));
		}
		// System.out.println(parseIntDeptNo.get(0) + "//" + parseIntDeptNo.get(1));
		
		List<EmpVoOfMybatis> empInfos1 = mybatisDao.selectEmpsByDeptNo(parseIntDeptNo);
		List<EmpVoOfMybatis> empInfos2 = mybatisDao.selectAllEmpInfos();
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos1", empInfos1);
		model.addAttribute("empInfos2", empInfos2);
		model.addAttribute("empInfos3", empInfos3);

		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/searchEmpByJob", method = RequestMethod.GET)
	public String searchEmpByJob(@RequestParam(value="job1") String job, Model model) {
		
		List<EmpVoOfMybatis> empInfos1 = mybatisDao.selectEmpsByJob(job);
		List<EmpVoOfMybatis> empInfos2 = mybatisDao.selectAllEmpInfos();
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos1", empInfos1);
		model.addAttribute("empInfos2", empInfos2);
		model.addAttribute("empInfos3", empInfos3);
		
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/searchEmpByValue", method = RequestMethod.GET)
	public String searchEmpByValue(SearchValueOfMybatis value, Model model) {
		// System.out.println(value.getDeptNo2());
		// System.out.println(value.getJob2());
		List<EmpVoOfMybatis> empInfos1 = mybatisDao.selectAllEmpInfos();
		List<EmpVoOfMybatis> empInfos2 = mybatisDao.searchEmpByValue(value);
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos1", empInfos1);
		model.addAttribute("empInfos2", empInfos2);
		model.addAttribute("empInfos3", empInfos3);
		
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/searchEmpByAjax", method = RequestMethod.POST)
	public @ResponseBody List<EmpVoOfMybatis> searchEmpByAjax(@RequestBody SearchValueOfMybatis value) {
		System.out.println(value.getDeptNo2());
		System.out.println(value.getJob2());
		
		List<EmpVoOfMybatis> empInfos = mybatisDao.searchEmpByValue(value);
		
		return empInfos;
	}
	
	@RequestMapping(value = "/mybatis/insertEmpInfo", method = RequestMethod.GET)
	public String insertEmpInfo(EmpVoOfMybatis emp) {
		System.out.println(emp.toString());
		mybatisDao.insertEmpInfo(emp);
		
		return "redirect:/mybatis/mybatisTest";
	}
}