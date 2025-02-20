package com.dongkoo.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dongkoo.mapper.AttachMapper;
import com.dongkoo.model.AttachImageVO;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private AttachMapper attachMapper;
	
	
	//Main Page
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void mainPageGET() {
		logger.info("main page ----");
	}
	
	//로그인 후 매장 등록 Page
	@RequestMapping(value="/mkinfo", method=RequestMethod.GET)
	public void mkinfoPageGET() {
		logger.info("mkinfo page ----");
	}
	
	//이미지 출력
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		
		logger.info("getImage()..." + fileName);
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	//이미지 파일 삭제
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("deleteFile ... " + fileName);
		File file = null;
		
		try {
			//썸네일 파일 삭제
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			logger.info("originFileName : " + originFileName);
			file = new File(originFileName);
			file.delete();
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
		
	}
	
	//이미지 정보 반환
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(String PDNO) {
		logger.info("getAttachList .... " + PDNO);
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(PDNO), HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
