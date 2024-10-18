package com.dongkoo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dongkoo.model.MarketVO;
import com.dongkoo.model.MemberVO;
import com.dongkoo.service.MarketService;


@Controller
@RequestMapping(value="/market")
public class MarketController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MarketService marketservice;
	
	//market 등록 페이지 이동
	@RequestMapping(value="/marketJoin", method=RequestMethod.GET)
	public void marketJoinPageGET() {
		logger.info("marketJoin page ----");
	}
	
	
	//market 등록 기능
	@PostMapping("/marketJoin")
	public String addMarketPOST(MarketVO market, HttpServletRequest request) throws Exception {
		//로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		String loginID = mvo.getID();
		market.setID(loginID);
		
		//매장 등록
		marketservice.addMarket(market);
		
		return "redirect:/mkinfo";
	}
	
	//매장명 중복 검사
	@RequestMapping(value="/marketNameChk", method=RequestMethod.POST)
	@ResponseBody
	public String marketNameChkPOST(HttpSession session, MarketVO market) throws Exception {
		// 세션에서 로그인한 사용자의 ID를 가져옴
		String userId = (String) session.getAttribute("userId");

		market.setID(userId);
		
		int result = marketservice.nameCheck(market);
		
		if(result != 0) {
			return "fail";			//중복 매장명 존재
		} else {
			return "success";		//중복 매장명 없음
		}
	}
	
	//첨부파일 업로드
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxActionPOST(MultipartFile MK_IMAGE) {
		logger.info("uploadAjaxActionPOST ----");
		//logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
		//logger.info("파일 타입 : " + uploadFile.getContentType());
		//logger.info("파일 크기 : " + uploadFile.getSize());
		
		String uploadFolder = "C:\\upload";
		//날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		//폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}	
	}
	
	
}
