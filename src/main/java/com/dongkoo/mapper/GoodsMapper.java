package com.dongkoo.mapper;

import java.util.List;

import com.dongkoo.model.AttachImageVO;
import com.dongkoo.model.Criteria;
import com.dongkoo.model.GoodsVO;
import com.dongkoo.model.NamingVO;

public interface GoodsMapper {

	//제품 등록
	public void goodsEnroll(GoodsVO goods);
	
	//카테고리 리스트
	public List<NamingVO> cateList();
	
	//제품 리스트
	public List<GoodsVO> goodsGetList(Criteria cri, String ID);
	
	//제품 총 개수
	public int goodsGetTotal(Criteria cri);
	
	//제품 상세 조회
	public GoodsVO goodsGetDetail(String PDNO);
	
	//제품 수정
	public int goodsModify(GoodsVO vo);
	
	//제품 삭제
	public int goodsDelete(String PDNO);
	
	//제품 이름 중복검사
	public int pdnoCheck(String pdno);
	
	//이미지 등록
	public void imageEnroll(AttachImageVO vo);
	
	//지정 상품 이미지 전체 삭제
	public void deleteImageAll(String PDNO);
	
	//어제자 날짜 이미지 리스트
	public List<AttachImageVO> checkFileList();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
