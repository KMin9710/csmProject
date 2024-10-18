package com.dongkoo.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dongkoo.model.MemberVO;
import com.dongkoo.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
		//회원가입 PAGE
		@RequestMapping(value="/join", method=RequestMethod.GET)
		public void joinPageGET() {
			logger.info("join page ----");
		}
		
		//로그인 PAGE
		@RequestMapping(value="/login", method=RequestMethod.GET)
		public void loginPageGET() {
			logger.info("login page ----");
		}
		
		//회원가입 기능
		@RequestMapping(value="/join", method=RequestMethod.POST)
		public String joinPOST(MemberVO member) throws Exception {
			logger.info("join 진입");
			
			String rawPw = "";
			String encodePw = "";
			
			rawPw = member.getPW();
			encodePw = pwEncoder.encode(rawPw);
			member.setPW(encodePw);
			
			memberservice.memberJoin(member);
			logger.info("join service 성공");
			return "redirect:/main";
		}
		
		//아이디 중복 검사
		@RequestMapping(value="/memberIdChk", method=RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String ID) throws Exception {
			logger.info("memberIdChk() 진입");
			
			int result = memberservice.idCheck(ID);
			
			logger.info("결과값 = " + result);
			
			if(result != 0) {
				return "fail";			//중복 아이디 존재
			} else {
				return "success";		//중복 아이디 없음
			}
		}
		
		//이메일 인증
		@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
		@ResponseBody
		public String mailCheckGET(String email) throws Exception {
			
			logger.info("이메일 데이터 전송 확인");
			logger.info("인증번호 : " + email);
			
			//인증번호 생성
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			logger.info("인증번호 : " + checkNum);
			
			//이메일 보내기
			String setFrom = "dbsrbals97@naver.com";
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content =
					"동구 의류매장 관리 프로그램 회원가입 인증 메일 입니다." +
					"<br><br>" +
					"인증번호는 " + checkNum + "입니다." +
					"<br>" +
					"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
			}catch (Exception e) {
				e.printStackTrace();
			}
			String num = Integer.toString(checkNum);
			
			return num;
		}
		
		
		//로그인 기능
		@RequestMapping(value="login.do", method=RequestMethod.POST)
		public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
			
			HttpSession session = request.getSession();
			String rawPw = "";
			String encodePw = "";
			
			MemberVO lvo = memberservice.memberLogin(member);
			
			if(lvo != null) {
				rawPw = member.getPW();
				encodePw = lvo.getPW();
				
				if(true == pwEncoder.matches(rawPw, encodePw)) {
					lvo.setPW("");
					session.setAttribute("member", lvo);
					return "redirect:/mkinfo";
				}else {
					rttr.addFlashAttribute("result", 0);
					return "redirect:/member/login";
				}
			}else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}
		}
		
		
		
	
}
