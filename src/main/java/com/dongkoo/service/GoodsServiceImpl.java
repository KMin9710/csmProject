package com.dongkoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongkoo.mapper.AttachMapper;
import com.dongkoo.mapper.GoodsMapper;
import com.dongkoo.model.AttachImageVO;
import com.dongkoo.model.Criteria;
import com.dongkoo.model.GoodsVO;
import com.dongkoo.model.NamingVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper mapper;
	
	@Autowired
	private AttachMapper attachmapper;
	
	//제품 등록
	@Override
	public void goodsEnroll(GoodsVO goods) {
		log.info("(service)goodsEnroll ----------- ");
		mapper.goodsEnroll(goods);
		
		if(goods.getImageList() == null || goods.getImageList().size() <= 0) {
			return;
		}
		
		goods.getImageList().forEach(attach -> {
			
			attach.setPDNO(goods.getPDNO());
			mapper.imageEnroll(attach);
			
		});
		
	}
	
	//제품코드 이름 중복 확인
	@Override
	public int pdnoCheck(String pdno) throws Exception {
		return mapper.pdnoCheck(pdno);
	}
	
	//카테고리 리스트
	@Override
	public List<NamingVO> cateList() {
		log.info("(service)cateList ...");
		return mapper.cateList();
	}
	
	//제품 리스트
	@Override
	public List<GoodsVO> goodsGetList(Criteria cri, String ID) {
		log.info("goodsGetTotalList()...");
		
		List<GoodsVO> list = mapper.goodsGetList(cri, ID);
		
		for(GoodsVO vo : list) {
			String PDNO = vo.getPDNO();
			List<AttachImageVO> imageList = attachmapper.getAttachList(PDNO);
			vo.setImageList(imageList);
		}
		
		return list;
	}
	
	//제품 총 갯수
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal()...");
		return mapper.goodsGetTotal(cri);
	}
	
	//제품 상세 조회
	@Override
	public GoodsVO goodsGetDetail(String PDNO) {
		log.info("(service)goodsGetDetail...." + PDNO);
		return mapper.goodsGetDetail(PDNO);
	}
	
	//제품 정보 수정
	@Override
	public int goodsModify(GoodsVO vo) {
		log.info("goodsModify .... ");
		int result = mapper.goodsModify(vo);
		
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			mapper.deleteImageAll(vo.getPDNO());
			vo.getImageList().forEach(attach -> {
				attach.setPDNO(vo.getPDNO());
				mapper.imageEnroll(attach);
				
			});
		}
		return result;
		
	}
	
	@Override
	public int goodsDelete(String PDNO) {
		log.info("goodsDelete .... ");
		return mapper.goodsDelete(PDNO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
