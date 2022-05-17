package com.miso.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		List<EmpVoOfMybatis> empInfos = mybatisDao.selectAllEmpInfos();
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		
//		for (EmpVoOfMybatis empInfo : empInfos) {
//			System.out.println(empInfo.toString());
//		}
//		for (Integer deptNo : deptNos) {
//			System.out.println(deptNo.toString());
//		}
//		for (String job : jobs) {
//			System.out.println(job.toString());
//		}
		
		model.addAttribute("empInfos", empInfos);
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/searchEmpByDeptNo", method = RequestMethod.GET)
	public String searchEmpByDeptNo(@RequestParam int deptNo, Model model) {
		
		List<EmpVoOfMybatis> empInfos = mybatisDao.selectEmpsByDeptNo(deptNo);
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		
		model.addAttribute("empInfos", empInfos);
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/searchEmpByJob", method = RequestMethod.GET)
	public String searchEmpByJob(@RequestParam String job, Model model) {
		
		List<EmpVoOfMybatis> empInfos = mybatisDao.selectEmpsByJob(job);
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		
		model.addAttribute("empInfos", empInfos);
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		
		return "/mybatis/mybatisTest";
	}
}


