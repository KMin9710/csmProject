package com.dongkoo.service;

import com.dongkoo.model.MarketVO;

public interface MarketService {
	
	//마켓 등록
	public int addMarket(MarketVO market) throws Exception;

	
	
	//마켓 이름 중복 검사
	public int nameCheck(MarketVO market) throws Exception;

}
