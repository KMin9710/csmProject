package com.dongkoo.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dongkoo.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper membermapper;
	
	/* 회원가입 테스트
	@Test
	public void memberJoin() throws Exception {
		MemberVO member = new MemberVO();
		
		member.setID("adtest");
		member.setPW("adtest");
		member.setNAME("adtest");
		member.setBD("adtest");
		member.setTEL("adtest");
		member.setADDR1("adtest");
		member.setADDR2("adtest");
		member.setADDR3("adtest");
		member.setEMAIL("adtest");
		
		membermapper.memberJoin(member);
		
	}
	*/

	
	/* 아이디 중복 테스트
	@Test
	public void memberIdChk() throws Exception {
		String id="test";			//존재 아이디
		String id2="test123";		//존재하지 않는 아이디
		membermapper.idCheck(id);
		membermapper.idCheck(id2);
	}
	*/
	
	@Test
	public void memberLogin() throws Exception {
		MemberVO member = new MemberVO();
		
		member.setID("test");
		member.setPW("test");
		
		membermapper.memberLogin(member);
		System.out.println("결과값 : " + membermapper.memberLogin(member));
		
		
		
	}
	
	
	
	
	
	
	
	
}
