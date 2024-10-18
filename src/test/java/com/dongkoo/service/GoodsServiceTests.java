package com.dongkoo.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dongkoo.model.AttachImageVO;
import com.dongkoo.model.GoodsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GoodsServiceTests {
	
	@Autowired
	private GoodsService service;
	
	//상품 등록 & 상품 이미지 등록 테스트
	@Test
	public void goodsEnrollTests() {
		
		GoodsVO goods = new GoodsVO();
		
		goods.setID("admin123");
		goods.setPDNO("test12345");
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
		
		//이미지 정보
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>();
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("testImage1");
		image1.setUploadPath("testimage1");
		image1.setUuid("test1111");
		
		image2.setFileName("testImage2");
		image2.setUploadPath("testimage2");
		image2.setUuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		
		goods.setImageList(imageList);
		
		service.goodsEnroll(goods);
		
		System.out.println("등록된 vo : " + goods);
		
		
		
		
		
		
		
		
		
	}
	
	
}
