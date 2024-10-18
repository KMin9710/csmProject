package com.dongkoo.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dongkoo.model.Criteria;
import com.dongkoo.model.GoodsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GoodsMapperTests {

	@Autowired
	private GoodsMapper mapper;
	
	/* 상품 등록 
	
	@Test
	public void goodsEnrollTest() throws Exception {
		
		GoodsVO goods = new GoodsVO();
		
		goods.setID("admin123");
		goods.setPDNO("test1234");
		goods.setPD_BCATE("FC");
		goods.setPD_MCATE("FCOU");
		goods.setPD_SCATE("FCOUJK");
		goods.setPD_NAME("test14");
		goods.setPD_MAKER("test134");
		goods.setPD_NARA("test14");
		goods.setPD_SIZE("test12");
		goods.setPD_COLOR("test12");
		goods.setPD_INPR(1234);
		goods.setPD_OUTPR(5678);
		goods.setPD_LTCD("test");
		goods.setPD_IMAGE("test1.png");
		
		System.out.println("before goodsvo : " + goods);
		mapper.goodsEnroll(goods);
		System.out.println("after goodsvo : " + goods);
		
		
	}
	*/
	
	/*
	@Test
	public void cateListTest() throws Exception {
		System.out.println("cateList() .... " + mapper.cateList());
		
	}
	*/
	
	/*
	@Test
	public void goodsGetListTest() {
		Criteria cri = new Criteria();
		
		cri.setKeyword("asd");
		
		List list = mapper.goodsGetList(cri);
		for(int i = 0; i < list.size(); i++) {
			System.out.println("result : " + i + " : " + list.get(i));
		}
		
		int result = mapper.goodsGetTotal(cri);
		System.out.println("result : " + result);
		
		
	}
	*/
	
	@Test
	public void checkImageListTest() {
		mapper.checkFileList();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
