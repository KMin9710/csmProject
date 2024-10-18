package com.dongkoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongkoo.mapper.AttachMapper;
import com.dongkoo.model.AttachImageVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService {
	
	@Autowired AttachMapper attachMapper;
	
	@Override
	public List<AttachImageVO> getAttachList(String PDNO) {
		log.info("getAttachList .... ");
		return attachMapper.getAttachList(PDNO);
		
	}
	
	
}
