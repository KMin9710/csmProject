package com.dongkoo.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dongkoo.model.MarketVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MarketMapperTests {

	@Autowired
	private MarketMapper mapper;
	
	
	@Test
	public void addMarket() throws Exception {
		
		String ID = "admin123";
		int MKNO = 240926005;
		String MK_NAME = "구로점";
		String MK_BUSNUM = "test";
		String MK_ADDR1 = "test";
		String MK_ADDR2 = "test";
		String MK_ADDR3 = "test";
		String MK_TEL = "test";
		String MK_INDU = "test";
		String MK_TIME = "test";
		String MK_IMAGE = "test";
		
		MarketVO market = new MarketVO();
		market.setID(ID);
		market.setMKNO(MKNO);
		market.setMK_NAME(MK_NAME);
		market.setMK_BUSNUM(MK_BUSNUM);
		market.setMK_ADDR1(MK_ADDR1);
		market.setMK_ADDR2(MK_ADDR2);
		market.setMK_ADDR3(MK_ADDR3);
		market.setMK_TEL(MK_TEL);
		market.setMK_INDU(MK_INDU);
		market.setMK_TIME(MK_TIME);
		market.setMK_IMAGE(MK_IMAGE);
		
		int result = 0;
		result = mapper.addMarket(market);
		
		System.out.println("결과 : " + result);
	}
	
	
	/* 매장 삭제
	@Test
	public void deleteMarketTest() {
		int MKNO = 240926005;
		
		mapper.deleteMarket(MKNO);
	}
	*/
	
	/*
	@Test
	public void getMarketTest() {
		String ID = "test";
		
		List<MarketVO> list = mapper.getMarket(ID);
		for(MarketVO market : list) {
			System.out.println(market);
			market.getMK_NAME();
			System.out.println("보유 매장 이름 : " + market.getMK_NAME());
		}
		
		
	}
	*/
		
	
	
	
	
	
}
