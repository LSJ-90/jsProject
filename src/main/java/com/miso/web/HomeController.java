package com.miso.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.miso.persistence.HomeDao;
import com.miso.web.vo.EmpVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeDao homeDao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/javascript/practice", method = RequestMethod.GET)
	public String practiceInit(Model model) {
		
		EmpVo empInfo = homeDao.selectEmpInfo();
		model.addAttribute("empInfo", empInfo );
		
		List<EmpVo> empInfos = homeDao.selectAllEmpInfo();
		// System.out.println(empInfos.toString());
		model.addAttribute("empInfos", empInfos );
		
		return "javascript/practice";
	}
	
	@RequestMapping(value = "/javascript/hoisting", method = RequestMethod.GET)
	public String hoistingInit() {
		
		return "javascript/hoisting";
	}
}


