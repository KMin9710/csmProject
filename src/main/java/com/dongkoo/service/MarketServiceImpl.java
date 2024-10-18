package com.dongkoo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongkoo.mapper.MarketMapper;
import com.dongkoo.model.MarketVO;

@Service
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketMapper marketmapper;
	
	//매장 등록
	@Override
	public int addMarket(MarketVO market) {		
		
		try {
			return marketmapper.addMarket(market);
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	//매장 이름 중복 확인
	@Override
	public int nameCheck(MarketVO market) throws Exception {
		return marketmapper.nameCheck(market);
	}
	
}
