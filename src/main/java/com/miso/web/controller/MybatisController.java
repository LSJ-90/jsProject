package com.miso.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos3", empInfos3);

		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		List<Integer> mgrNos = mybatisDao.selectMgrNosByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		model.addAttribute("mgrNos", mgrNos);
		
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
	
	@RequestMapping(value = "/mybatis/insertEmpInfo", method = RequestMethod.GET)
	public String insertEmpInfo(EmpVoOfMybatis emp) {
		System.out.println(emp.toString());
		mybatisDao.insertEmpInfo(emp);
		
		return "redirect:/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/selectEmpByDeptNo", method = RequestMethod.GET)
	public String selectEmpByDeptNo(@RequestParam(value="deptNo1") String deptNo, Model model) {
		// System.out.println(deptNo);
		
		// TODO: 형변환 필요할까??
		List<Integer> parseIntDeptNo = new ArrayList<Integer>();
		List<EmpVoOfMybatis> empInfos1 = new ArrayList<EmpVoOfMybatis>();
		
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
		
		if (parseIntDeptNo.contains(-1)) {
			empInfos1 = mybatisDao.selectAllEmpInfos();
		} else {
			empInfos1 = mybatisDao.selectEmpsByDeptNo(parseIntDeptNo);
		}

		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos1", empInfos1);
		model.addAttribute("empInfos3", empInfos3);
		
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		List<Integer> mgrNos = mybatisDao.selectMgrNosByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		model.addAttribute("mgrNos", mgrNos);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/selectEmpByJob", method = RequestMethod.GET)
	public String selectEmpByJob(@RequestParam(value="job1") String job, Model model) {
		
		List<EmpVoOfMybatis> empInfos1 = mybatisDao.selectEmpsByJob(job);
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos1", empInfos1);
		model.addAttribute("empInfos3", empInfos3);
		
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		List<Integer> mgrNos = mybatisDao.selectMgrNosByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		model.addAttribute("mgrNos", mgrNos);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/selectEmpByValue", method = RequestMethod.GET)
	public String selectEmpByValue(SearchValueOfMybatis value, Model model) {
		// System.out.println(value.getDeptNo2());
		// System.out.println(value.getJob2());
		List<EmpVoOfMybatis> empInfos2 = mybatisDao.selectEmpByValue(value);
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectAllEmpInfos();
		model.addAttribute("empInfos2", empInfos2);
		model.addAttribute("empInfos3", empInfos3);
		
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		List<Integer> mgrNos = mybatisDao.selectMgrNosByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		model.addAttribute("mgrNos", mgrNos);
		
		return "/mybatis/mybatisTest";
	}
	
	@RequestMapping(value = "/mybatis/selectEmpByAjax", method = RequestMethod.POST)
	public String selectEmpByAjax(@RequestBody SearchValueOfMybatis value, Model model) {
		// logger.info(value.toString());
		
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectEmpByValue(value);
		model.addAttribute("empInfos3", empInfos3);
		// logger.info(empInfos3.toString());
		
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		List<Integer> mgrNos = mybatisDao.selectMgrNosByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		model.addAttribute("mgrNos", mgrNos);
		
		return "mybatis/testAjaxView";
	}
	
	@RequestMapping(value = "/mybatis/updateEmpInfo", method = RequestMethod.POST)
	public String updateEmpInfo(@RequestBody List<EmpVoOfMybatis> empInfos, Model model) {
		// logger.info(empInfos.toString());
		
		mybatisDao.updateEmpInfo(empInfos);
		
		List<Integer> empNos = new ArrayList<Integer>();
		for (EmpVoOfMybatis empInfo : empInfos) {
			int empNo = empInfo.getEmpNo();
			empNos.add(empNo);
		}
		// logger.info(empNos.toString());
		
		List<EmpVoOfMybatis> empInfos3 = mybatisDao.selectEmpsByEmpNo(empNos);
		model.addAttribute("empInfos3", empInfos3);
		// logger.info(empInfos3.toString());
		
		List<Integer> deptNos = mybatisDao.selectDeptNosByDistinct();
		List<String> jobs = mybatisDao.selectJobsByDistinct();
		List<Integer> mgrNos = mybatisDao.selectMgrNosByDistinct();
		model.addAttribute("deptNos", deptNos);
		model.addAttribute("jobs", jobs);
		model.addAttribute("mgrNos", mgrNos);
		
		return "mybatis/testAjaxView";
	}
}