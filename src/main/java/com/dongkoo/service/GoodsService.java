package com.dongkoo.service;

import java.util.List;

import com.dongkoo.model.Criteria;
import com.dongkoo.model.GoodsVO;
import com.dongkoo.model.NamingVO;

public interface GoodsService {
	
	//제품 등록
	public void goodsEnroll(GoodsVO goods);
	
	//제품코드 중복 검사
	public int pdnoCheck(String pdno) throws Exception;
	
	//카테고리
	public List<NamingVO> cateList();

	//제품 리스트
	public List<GoodsVO> goodsGetList(Criteria cri);
	
	//제품 총 갯수
	public int goodsGetTotal(Criteria cri);
	
	//제품 상세 조회
	public GoodsVO goodsGetDetail(String PDNO);
	
	//제픔 수정
	public int goodsModify(GoodsVO vo);

	//제품 삭제
	public int goodsDelete(String PDNO);
	
	
	
	
	
	
	
	
	
	
	
}
