<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="../resources/css/goods/gdDetailShow.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>


</head>
<body>
<div class = "wrapper">
<%@ include file = "../header.jsp" %>

	<div class = "right_area">
		<div class="subject">
			<h1>* 상품 수정 및 삭제</h1>
		</div>
		<div class="wrap">
			<div class="left_wrap">
			<!-- ------------------------------------------------- -->
			<div class="pdno_wrap">
				<div class="pdno_name">제품번호</div>
				<div class="pdno_input_box">
					<input class="pdno_input" value="<c:out value="${goodsInfo.PDNO }"/>" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->
			<div class="cate_wrap">
				<div class="cate_name">카테고리</div>
				<div class="bcate">대분류
					<div class="bcate_input_box">
						<select class="cate1" disabled>
							<option selected value="none">선택</option>
						</select>
						<!-- <input class="bcate_input" name="PD_BCATE"> -->
					</div>
				</div>
				<div class="mcate">중분류
					<div class="mcate_input_box">
						<select class="cate2" disabled>
							<option selected value="none">선택</option>
						</select>
						<!-- <input class="mcate_input" name="PD_MCATE"> -->
					</div>
				</div>
				<div class="scate">소분류
					<div class="scate_input_box" >
						<select class="cate3" disabled>
							<option selected value="none">선택</option>
						</select>
						<!-- <input class="scate_input" name="PD_SCATE"> -->
					</div>
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="name_wrap">
				<div class="name_name">제품명</div>
				<div class="name_input_box">
					<input class="name_input" value="${goodsInfo.PD_NAME }" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="maker_wrap">
				<div class="maker_name">제조사</div>
				<div class="maker_input_box">
					<input class="maker_input" value="${goodsInfo.PD_MAKER }" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="nara_wrap">
				<div class="nara_name">제조국</div>
				<div class="nara_input_box">
					<input class="nara_input" value="${goodsInfo.PD_NARA }" disabled>
				</div>
			</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="right_wrap">
			<div class="size_wrap">
				<div class="size_name">사이즈</div>
				<div class="size_input_box">
					<input class="size_input" value="${goodsInfo.PD_SIZE }" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="color_wrap">
				<div class="color_name">컬러</div>
				<div class="color_input_box">
					<input class="color_input" value="${goodsInfo.PD_COLOR }" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="inpr_wrap">
				<div class="inpr_name">원가</div>
				<div class="inpr_input_box">
					<input class="inpr_input" value="${goodsInfo.PD_INPR }" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="outpr_wrap">
				<div class="outpr_name">판매금액</div>
				<div class="outpr_input_box">
					<input class="outpr_input" value="${goodsInfo.PD_OUTPR }" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="ltcd_wrap">
				<div class="ltcd_name">진열코드</div>
				<div class="ltcd_input_box">
					<input class="ltcd_input" value="${goodsInfo.PD_LTCD }" disabled>
				</div>
			</div>
			<!-- ------------------------------------------------- -->
			<div class="image_wrap">
				<div class="image_name">제품 사진</div>
				<div class="image_input_wrap">
					<div class="image_input_box">
						<input type="file" id = "fileItem" name ='PD_IMAGE' value="${goodsInfo.PD_IMAGE }" multiple disabled>
						<div id = "uploadResult">
						
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			</div>
			<!-- ------------------------------------------------- -->
		</div>
		
		<div class="button_wrap">
			<button id="modifyBtn" class="modify_btn">수정</button>
			<button id="deleteBtn" class="delete_btn">삭제</button>
		</div>
		
		<form id ="moveForm" action="/goods/gdList" method="get">
			<input type="hidden" name ="pageNum" value="${cri.pageNum }">
			<input type="hidden" name ="amount" value="${cri.amount }">
			<input type="hidden" name ="keyword" value="${cri.keyword }">
			
		</form>
	
	</div>
</div>
<script>


/* 카테고리  */
$(document).ready(function(){

	let cateList = JSON.parse('${cateList}');

	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();

	let cateSelect1 = $(".cate1");
	let cateSelect2 = $(".cate2");
	let cateSelect3 = $(".cate3");

	/* 카테고리 배열 초기화 메서드  */
	function makeCateArray(obj, array, cateList, name_GU) {
		for(let i = 0; i < cateList.length; i++) {
			if(cateList[i].name_GU === name_GU) {
				obj = new Object();
				
				obj.name_NM = cateList[i].name_NM;
				obj.name_CD = cateList[i].name_CD;
				obj.name_FILT = cateList[i].name_FILT;
				
				array.push(obj);
			
			}
		}
	}
	makeCateArray(cate1Obj, cate1Array, cateList, 1);
	makeCateArray(cate2Obj, cate2Array, cateList, 2);
	makeCateArray(cate3Obj, cate3Array, cateList, 3);
	
	let targetCate2 = '';
	let targetCate3 = '${goodsInfo.PD_SCATE}';
	
	/* 소분류 카테고리 지정하기 */
	for(let i = 0; i < cate3Array.length; i++) {
		if(targetCate3 === cate3Array[i].name_CD) {
			targetCate3 = cate3Array[i];
		}
	}
	
	for(let i = 0; i < cate3Array.length; i++) {
		if(targetCate3.name_FILT === cate3Array[i].name_FILT) {
			cateSelect3.append("<option value='"+cate3Array[i].name_CD+"'>"+cate3Array[i].name_NM+"</option>");
		}
	}
	
	$(".cate3 option").each(function(i,obj){
		if(targetCate3.name_CD === obj.value) {
			$(obj).attr("selected", "selected");
		}
	});
	
	
	/* 중분류 카테고리 지정하기 */
	for(let i = 0; i < cate2Array.length; i++) {
		if(targetCate3.name_FILT === cate2Array[i].name_CD) {
			targetCate2 = cate2Array[i];
		}
	}
	
	for(let i = 0; i < cate2Array.length; i++) {
		if(targetCate2.name_FILT === cate2Array[i].name_FILT) {
			cateSelect2.append("<option value='"+cate2Array[i].name_CD+"'>"+cate2Array[i].name_NM+"</option>");
		}
	}
	
	$(".cate2 option").each(function(i,obj){
		if(targetCate2.name_CD === obj.value) {
			$(obj).attr("selected", "selected");
		}
	});
	
	
	/* 대분류 카테고리 지정하기 */
	for(let i = 0; i < cate1Array.length; i++) {
		cateSelect1.append("<option value='"+cate1Array[i].name_CD+"'>"+cate1Array[i].name_NM+"</option>");
	}
	
	$(".cate1 option").each(function(i,obj){
		if(targetCate2.name_FILT === obj.value) {
			$(obj).attr("selected", "selected");
		}
	});
	
	
	//이미지 정보 호출
	let PDNO = '<c:out value="${goodsInfo.PDNO}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/getAttachList", {PDNO : PDNO}, function(arr){	
		
		if(arr.length === 0) {
			let str = "";
			str += "<div id = 'result_card'>";
			str += "<img src = '../resources/images/person.png'>";
			str += "</div>";
			
			uploadResult.html(str);
			
			return;
		}
		
		let str = "";
		let obj = arr[0];	
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>X</div>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
		str += "</div>";
		
		uploadResult.html(str);						
		
	});
	
	
	
	
});


/* 수정 버튼 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = '<input type="hidden" name="PDNO" value="${goodsInfo.PDNO}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/goods/gdModify");
		$("#moveForm").submit();
	});

/* 삭제 버튼 */
	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
		let moveForm = $("#moveForm");
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="PDNO" value="${goodsInfo.PDNO}">');
		moveForm.attr("action", "/goods/goodsDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});


	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		str += "</div>";
		
		uploadResult.append(str);
	    
	}







</script>


</body>
</html>