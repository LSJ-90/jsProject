package com.miso.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miso.web.persistence.HomeDao;
import com.miso.web.vo.EmpVo;
import com.miso.web.vo.MisoStudyUserVo;
import com.miso.web.vo.SearchEmpInfosForm;

/**
 * Home Init Controller
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeDao homeDao;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	/**
	 * html Init Controller
	 * @return url
	 */
	@RequestMapping(value = "/html/formattingTag", method = RequestMethod.GET)
	public String formattingTagInit() {
		return "html/formattingTag";
	}
	
	@RequestMapping(value = "/html/formTag", method = RequestMethod.GET)
	public String formTagInit() {
		return "html/formTag";
	}
	
	@RequestMapping(value = "/html/input", method = RequestMethod.GET)
	public String inputInit() {
		return "html/input";
	}
	
	@RequestMapping(value = "/html/metaTag", method = RequestMethod.GET)
	public String metaTagInit() {
		return "html/metaTag";
	}
	
	@RequestMapping(value = "/html/selectBox", method = RequestMethod.GET)
	public String selectBoxInit() {
		return "html/selectBox";
	}
	
	@RequestMapping(value = "/html/tableTag", method = RequestMethod.GET)
	public String tableTagInit() {
		return "html/tableTag";
	}
	
	/**
	 * css Init Controller
	 * @return url
	 */
	@RequestMapping(value = "/css/before-after", method = RequestMethod.GET)
	public String beforeAfterInit() {
		return "css/before-after";
	}
	
	@RequestMapping(value = "/css/block-inline", method = RequestMethod.GET)
	public String blockInlineInit() {
		return "css/block-inline";
	}
	
	@RequestMapping(value = "/css/ID&CLASS&NAME", method = RequestMethod.GET)
	public String IdClassNameInit() {
		return "css/ID&CLASS&NAME";
	}
	
	@RequestMapping(value = "/css/position", method = RequestMethod.GET)
	public String positionInit() {
		return "css/position";
	}
	
	/**
	 * javascript Init Controller
	 * @return url
	 */
	@RequestMapping(value = "/javascript/practice", method = RequestMethod.GET)
	public String practiceInit(Model model) {
		
		EmpVo empInfo = homeDao.selectEmpInfo();
		model.addAttribute("empInfo", empInfo );
		
		List<EmpVo> empInfos = homeDao.selectAllEmpInfo();
		// System.out.println(empInfos.toString());
		model.addAttribute("empInfos", empInfos );
		
		return "javascript/practice";
	}
	
	// TODO: get버튼 기능 수정
	@RequestMapping(value = "/javascript/practice/searchEmpInfos", method = RequestMethod.GET) 
	public String selectEmpInfosGet(SearchEmpInfosForm form, Model model) {
		
	  // logger.info("SearchEmpInfosForm: " + form.getSearchKey() + " " + form.getSearchValue());
	  
	  List<EmpVo> empInfos = homeDao.selectEmpInfos(form); 
	  model.addAttribute("empInfos", empInfos);
	  
	  // logger.info("empInfos: " + empInfos);
	  
	  return "javascript/practice"; 
	}
	 
	
	@RequestMapping(value = "/javascript/hoisting", method = RequestMethod.GET)
	public String hoistingInit() {
		
		return "javascript/hoisting";
	}
	
	/**
	 * etc Init Controller
	 * @return url
	 */
	@RequestMapping(value = "/etc/coding-notion", method = RequestMethod.GET)
	public String codingNotionInit() {
		return "etc/coding-notion";
	}
	
	@RequestMapping(value = "/etc/path", method = RequestMethod.GET)
	public String pathInit() {
		return "etc/path";
	}
	
	/**
	 * projects Init Controller
	 * @return url
	 */
}


