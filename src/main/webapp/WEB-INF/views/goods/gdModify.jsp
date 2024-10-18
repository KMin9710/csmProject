<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="../resources/css/goods/gdModify.css">
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
			<h1>* 상품 수정</h1>
		</div>
		<form action = "/goods/gdModify" id="modifyForm" method="post">
		<div class="wrap">
			<div class="left_wrap">
			<!-- ------------------------------------------------- -->
			<div class="pdno_wrap">
				<div class="pdno_name">제품번호</div>
				<div class="pdno_input_box">
					<input class="pdno_input" name="PDNO" value="<c:out value="${goodsInfo.PDNO }"/>">
				</div>
				<span class="pdno_input_re_1">사용 가능한 제품번호 입니다.</span>		<!-- 아이디 중복 확인 -->
				<span class="pdno_input_re_2">제품번호가 이미 존재합니다.</span>
				<span class="final_pdno_ck">제품번호를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="cate_wrap">
				<div class="cate_name">카테고리</div>
				<div class="bcate">대분류
					<div class="bcate_input_box">
						<select class="cate1" name="PD_BCATE">
							<option selected value="none">선택</option>
						</select>
						<!-- <input class="bcate_input" name="PD_BCATE"> -->
					</div>
				</div>
				<div class="mcate">중분류
					<div class="mcate_input_box">
						<select class="cate2" name="PD_MCATE">
							<option selected value="none">선택</option>
						</select>
						<!-- <input class="mcate_input" name="PD_MCATE"> -->
					</div>
				</div>
				<div class="scate">소분류
					<div class="scate_input_box">
						<select class="cate3" name="PD_SCATE">
							<option selected value="none">선택</option>
						</select>
						<!-- <input class="scate_input" name="PD_SCATE"> -->
					</div>
				</div>
				<span class="final_cate_ck">카테고리를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="name_wrap">
				<div class="name_name">제품명</div>
				<div class="name_input_box">
					<input class="name_input" name="PD_NAME" value="${goodsInfo.PD_NAME }">
				</div>
				<span class="final_name_ck">제품명을 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="maker_wrap">
				<div class="maker_name">제조사</div>
				<div class="maker_input_box">
					<input class="maker_input" name="PD_MAKER" value="${goodsInfo.PD_MAKER }">
				</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="nara_wrap">
				<div class="nara_name">제조국</div>
				<div class="nara_input_box">
					<input class="nara_input" name="PD_NARA" value="${goodsInfo.PD_NARA }">
				</div>
			</div>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="right_wrap">
			<div class="size_wrap">
				<div class="size_name">사이즈</div>
				<div class="size_input_box">
					<input class="size_input" name="PD_SIZE" value="${goodsInfo.PD_SIZE }">
				</div>
				<span class="final_size_ck">사이즈를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="color_wrap">
				<div class="color_name">컬러</div>
				<div class="color_input_box">
					<input class="color_input" name="PD_COLOR" value="${goodsInfo.PD_COLOR }">
				</div>
				<span class="final_color_ck">컬러를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="inpr_wrap">
				<div class="inpr_name">원가</div>
				<div class="inpr_input_box">
					<input class="inpr_input" name="PD_INPR" value="${goodsInfo.PD_INPR }">
				</div>
				<span class="final_inpr_ck">원가를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="outpr_wrap">
				<div class="outpr_name">판매금액</div>
				<div class="outpr_input_box">
					<input class="outpr_input" name="PD_OUTPR" value="${goodsInfo.PD_OUTPR }">
				</div>
				<span class="final_outpr_ck">판매금액을 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="ltcd_wrap">
				<div class="ltcd_name">진열코드</div>
				<div class="ltcd_input_box">
					<input class="ltcd_input" name="PD_LTCD" value="${goodsInfo.PD_LTCD }">
				</div>
				<span class="final_ltcd_ck">진열코드를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->
			<div class="image_wrap">
				<div class="image_name">제품 사진</div>
				<div class="image_input_wrap">
					<div class="image_input_box">
						<input type="file" id = "fileItem" name ='PD_IMAGE' multiple>
						<div id = "uploadResult">
						
						</div>
					</div>
					<div class="clearfix"></div>
					<span class="final_image_ck">제품 사진을 선택해주세요.</span>
				</div>
			</div>
			</div>
			<!-- ------------------------------------------------- -->
		</div>
		</form>
		<div class="gdmodify_button_wrap">
			<button id="cancelBtn" class="cancel_Btn">취 소</button>
			<button id="modifyBtn" class="modify_Btn">수 정</button>
		</div>
	
	</div>
</div>
<script>


//매장명 중복 검사
$('.pdno_input').on("propertychange change keyup paste input", function() {
	//console.log("keyup 테스트");
	var pdno = $('.pdno_input').val();
	var data={pdno : pdno}
	
	$.ajax({
		type : "post",
		url : "/goods/goodsNameChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.pdno_input_re_1').css("display","inline-block");
				$('.pdno_input_re_2').css("display", "none");
				pdnockCheck = true;
			} else {
				$('.pdno_input_re_2').css("display","inline-block");
				$('.pdno_input_re_1').css("display", "none");
				pdnockCheck = false;
			}
		}//success 종료
	});//ajax 종료
});//function 종료


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
	
	//기존 이미지 출력
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
</script>

<script>

/* 카테고리 */
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

/* 카테고리 배열 초기화 메서드 */
function makeCateArray(obj,array,cateList, name_GU){
	for(let i = 0; i < cateList.length; i++){
		if(cateList[i].name_GU === name_GU){
			obj = new Object();
			
			obj.name_NM = cateList[i].name_NM;
			obj.name_CD = cateList[i].name_CD;
			obj.name_FILT = cateList[i].name_FILT;
			
			array.push(obj);
			
		}
	}
}	

	/* 배열 초기화 */
makeCateArray(cate1Obj,cate1Array,cateList,1);
makeCateArray(cate2Obj,cate2Array,cateList,2);
makeCateArray(cate3Obj,cate3Array,cateList,3);


	/* 중분류 <option> 태그 */
$(cateSelect1).on("change",function(){
	
	let selectVal1 = $(this).find("option:selected").val();	
	
	cateSelect2.children().remove();
	cateSelect3.children().remove();
	
	cateSelect2.append("<option value='none'>선택</option>");
	cateSelect3.append("<option value='none'>선택</option>");
	
	for(let i = 0; i < cate2Array.length; i++){
		if(selectVal1 === cate2Array[i].name_FILT){
			cateSelect2.append("<option value='"+cate2Array[i].name_CD+"'>" + cate2Array[i].name_NM + "</option>");	
		}
	}// for
	
});

	/* 소분류 <option>태그 */
$(cateSelect2).on("change",function(){
	
	let selectVal2 = $(this).find("option:selected").val();
	
	cateSelect3.children().remove();
	
	cateSelect3.append("<option value='none'>선택</option>");		
	
	for(let i = 0; i < cate3Array.length; i++){
		if(selectVal2 === cate3Array[i].name_FILT){
			cateSelect3.append("<option value='"+cate3Array[i].name_CD+"'>" + cate3Array[i].name_NM + "</option>");	
		}
	}// for		
	
});

	
	
	//이미지 삭제 버튼 동작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
		deleteFile();
	});
	
	//파일 삭제 메서드
	function deleteFile() {
		
		$("#result_card").remove();

	}

	//이미지 업로드
	$("input[type='file']").on("change", function(e){
		
		//이미지 존재시 삭제
		if($("#result_card").length > 0) {
			deleteFile();
		}

		let formData = new FormData();
		let fileInput = $('input[name="PD_IMAGE"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		for (let i = 0; i < fileList.length; i++) {
			formData.append("PD_IMAGE", fileList[i]);	
		}
		
		$.ajax({
			url: '/goods/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result) {
	    		alert("이미지 파일이 아닙니다.")
	    	}
		});	
	});

	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB

	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}

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

	/* 수정 버튼 */
	$("#modifyBtn").on("click", function(e) {
		e.preventDefault();
	
			let pdnoCheck = false;
			let cateCheck = false;
			let nameCheck = false;
			let sizeCheck = false;
			let colorCheck =false;
			let inprCheck = false;
			let outprCheck =false;
			let ltcdCheck = false;
			let imageCheck =false;
			
			/* 체크 변수 */
			let pdno = $("input[name='PDNO']").val();
			let cate = $("input[name='PD_SCATE']").val();
			let name = $("input[name='PD_NAME']").val();
			let size = $("input[name='PD_SIZE']").val();
			let color = $("input[name='PD_COLOR']").val();
			let inpr = $("input[name='PD_INPR']").val();
			let outpr = $("input[name='PD_OUTPR']").val();
			let ltcd = $("input[name='PD_LTCD']").val();
			let image = $("input[name='PD_IMAGE']").val();
			

			/* pdno 유효성 검사 */
			if(pdno == "") {
				$('.final_pdno_ck').css('display', 'block');
				pdnoCheck = false;
			}else {
				$('.final_pdno_ck').css('display', 'none');
				pdnoCheck = true;	
			}
			
			/* cate 유효성 검사 */
			if(cate == "") {
				$('.final_cate_ck').css('display', 'block');
				cateCheck = false;
			}else {
				$('.final_cate_ck').css('display', 'none');
				cateCheck = true;	
			}
			
			/* name 유효성 검사 */
			if(name == "") {
				$('.final_name_ck').css('display', 'block');
				nameCheck = false;
			}else {
				$('.final_name_ck').css('display', 'none');
				nameCheck = true;	
			}
			
			/* size 유효성 검사 */
			if(size == "") {
				$('.final_size_ck').css('display', 'block');
				sizeCheck = false;
			}else {
				$('.final_size_ck').css('display', 'none');
				sizeCheck = true;	
			}
			
			/* color 유효성 검사 */
			if(color == "") {
				$('.final_color_ck').css('display', 'block');
				colorCheck = false;
			}else {
				$('.final_color_ck').css('display', 'none');
				colorCheck = true;	
			}
			
			/* inpr 유효성 검사 */
			if(inpr == "") {
				$('.final_inpr_ck').css('display', 'block');
				inprCheck = false;
			}else {
				$('.final_inpr_ck').css('display', 'none');
				inprCheck = true;	
			}
			
			/* outpr 유효성 검사 */
			if(outpr == "") {
				$('.final_outpr_ck').css('display', 'block');
				outprCheck = false;
			}else {
				$('.final_outpr_ck').css('display', 'none');
				outprCheck = true;	
			}
			
			/* ltcd 유효성 검사 */
			if(ltcd == "") {
				$('.final_ltcd_ck').css('display', 'block');
				ltcdCheck = false;
			}else {
				$('.final_ltcd_ck').css('display', 'none');
				ltcdCheck = true;	
			}
			
			/* image 유효성 검사 */
			if(image == "") {
				$('.final_image_ck').css('display', 'block');
				imageCheck = false;
			}else {
				$('.final_image_ck').css('display', 'none');
				imageCheck = true;	
			}
			
			
			/* 최종 유효성 검사 */
			if(pdnoCheck&&cateCheck&&sizeCheck&&nameCheck&&colorCheck&&inprCheck&&outprCheck&&ltcdCheck&&imageCheck){
	        	$("#modifyForm").submit();
			}else {
				return false;
			}
	});


</script>



</body>
</html>