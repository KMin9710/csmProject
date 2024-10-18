package com.dongkoo.mapper;

import com.dongkoo.model.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);
	
	//아이디 중복검사
	public int idCheck(String ID);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);
	
	
}
