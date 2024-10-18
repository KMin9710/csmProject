package com.dongkoo.mapper;

import java.util.List;

import com.dongkoo.model.MarketVO;

public interface MarketMapper {

	//마켓 등록
	public int addMarket(MarketVO market) throws Exception;
	
	//마켓 삭제
	public int deleteMarket(int MKNO);
	
	//마켓 목록
	public List<MarketVO> getMarket(String ID);
	
	//매장 확인
	public MarketVO checkMarket(MarketVO market);

	//마켓 이름 중복검사
	public int nameCheck(MarketVO market) throws Exception;
	
}
