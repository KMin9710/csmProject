package com.dongkoo.mapper;

import java.util.List;

import com.dongkoo.model.AttachImageVO;

public interface AttachMapper {

	//이미지 데이터 변환
	public List<AttachImageVO> getAttachList(String PDNO);
	
	
	
}
