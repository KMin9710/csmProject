package com.dongkoo.controller;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dongkoo.model.AttachImageVO;
import com.dongkoo.model.Criteria;
import com.dongkoo.model.GoodsVO;
import com.dongkoo.model.MemberVO;
import com.dongkoo.model.NamingVO;
import com.dongkoo.model.PageDTO;
import com.dongkoo.service.GoodsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private GoodsService goodsService;
	
	//상품 등록 페이지 이동
	@RequestMapping(value="/gdJoin", method = RequestMethod.GET)
	public void goodsJoinGET(Model model) throws Exception {
		logger.info("gdJoin 페이지 진입");
		ObjectMapper objm = new ObjectMapper();
		List<NamingVO> list = goodsService.cateList();
		String cateList = objm.writeValueAsString(list);
		model.addAttribute("cateList", cateList);
	

	}
	
	//상품 조회 페이지 이동
	@RequestMapping(value = "/gdList", method = RequestMethod.GET)
	public void goodsListGET(Criteria cri, Model model) {
		List<GoodsVO> list = goodsService.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			
		}else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		
		model.addAttribute("pageMaker", new PageDTO(cri, goodsService.goodsGetTotal(cri)));
	
	}
	
	//상품 상세 조회 페이지 이동
	@RequestMapping(value = "/gdDetail", method = RequestMethod.GET)
	public void goodsDetailGET(Criteria cri, Model model) throws Exception {
		List<GoodsVO> list = goodsService.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, goodsService.goodsGetTotal(cri)));
		
	}
	
	
	//상품 상세 조회 페이지 이동
	@GetMapping({"/gdDetailShow", "/gdModify"})
	public void goodsGetInfoGET(String PDNO, Criteria cri, Model model) throws JsonProcessingException {
		logger.info("goodsDetailShow & gdModify()...." + PDNO);
		
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("cateList", mapper.writeValueAsString(goodsService.cateList()));
		
		model.addAttribute("cri", cri);
		model.addAttribute("goodsInfo", goodsService.goodsGetDetail(PDNO));
		
	}
	
	//상품 등록
	@PostMapping("/gdJoin")
	public String goodsJoinPOST(GoodsVO goods, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		String loginID = mvo.getID();
		goods.setID(loginID);
		
		goodsService.goodsEnroll(goods);
		return "redirect:/goods/gdJoin";
	}
	
	//상품 수정
	@PostMapping("/gdModify")
	public String goodsModifyPOST(GoodsVO vo, RedirectAttributes rttr) {
		logger.info("goodsModifyPOST ... " + vo);
		int result = goodsService.goodsModify(vo);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/goods/gdList";
	}
	
	//상품 삭제
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(String PDNO, RedirectAttributes rttr) {
		logger.info("goodsDelete .... ");
		int result = goodsService.goodsDelete(PDNO);
		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/goods/gdList";
	}
	
	
	//상품명 중복 검사
	@RequestMapping(value="/goodsNameChk", method=RequestMethod.POST)
	@ResponseBody
	public String goodsNameChkPOST(String pdno) throws Exception {

		int result = goodsService.pdnoCheck(pdno);
			
		if(result != 0) {
			return "fail";			//중복 아이디 존재
		} else {
			return "success";		//중복 아이디 없음
		}
	}	
		
	//첨부파일 업로드
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] PD_IMAGE) {
		logger.info("uploadAjaxActionPOST ----");
		
		for(MultipartFile multipartFile : PD_IMAGE) {
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			}catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
			
			
		}
		
		//logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
		//logger.info("파일 타입 : " + uploadFile.getContentType());
		//logger.info("파일 크기 : " + uploadFile.getSize());
			
		String uploadFolder = "C:\\upload";
		//날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
			
		//폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
			
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<AttachImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : PD_IMAGE) {
			
			AttachImageVO vo = new AttachImageVO();
			
			String PD_IMAGE_NAME = multipartFile.getOriginalFilename();
			vo.setFileName(PD_IMAGE_NAME);
			vo.setUploadPath(datePath);
			
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			PD_IMAGE_NAME = uuid + "_" + PD_IMAGE_NAME;
			
			File saveFile = new File(uploadPath, PD_IMAGE_NAME);
			
			try {
				multipartFile.transferTo(saveFile);
				
				File thumbnailFile = new File(uploadPath, "s_" + PD_IMAGE_NAME);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				double ratio = 3;
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
				
				Graphics2D graphic = bt_image.createGraphics();
				graphic.drawImage(bo_image, 0, 0, width, height, null);
				
				ImageIO.write(bt_image, "png", thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
	}
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
