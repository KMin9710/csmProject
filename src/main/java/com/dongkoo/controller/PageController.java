package com.dongkoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/page")
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
	//home page 진입
	@RequestMapping(value="/pmain", method=RequestMethod.GET)
	public void pmainPageGET() {
		logger.info("pmain page ----");
	}
	
	//내정보 page 진입
	@RequestMapping(value="/myinfo", method=RequestMethod.GET)
	public void myinfoPageGET() {
		logger.info("myinfo page ----");
	}
	
	// 로그아웃 기능
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logoutGET(HttpServletRequest request) throws Exception {
		
		logger.info("logout -----");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/member/login";
	}
	
	
	
}
