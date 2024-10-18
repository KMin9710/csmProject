<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 등록하기</title>
<link rel="stylesheet" href="../resources/css/market/marketJoin.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="subject">
			<h1>매장등록하기</h1>
		</div>
		<form id="marketjoin_form" method="post">
		<div class="wrap">
			<!-- ------------------------------------------------- -->
			<div class="name_wrap">
				<div class="name_name">매장명</div>
				<div class="name_input_box">
					<input class="name_input" name="MK_NAME">
				</div>
				<span class="name_input_re_1">사용 가능한 매장명 입니다.</span>		<!-- 매장명 중복 확인 -->
				<span class="name_input_re_2">매장명이 이미 존재합니다.</span>
				<span class="final_name_ck">매장명을 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="busnum_wrap">
				<div class="busnum_name">사업자번호</div>
				<div class="busnum_input_box">
					<input class="busnum_input" name="MK_BUSNUM">
				</div>
				<span class="final_busnum_ck">사업자번호를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="tel_wrap">
				<div class="tel_name">전화번호(-제외)</div>
				<div class="tel_input_box">
					<input class="tel_input" name="MK_TEL">
				</div>
				<span class="final_tel_ck">전화번호를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="addr_wrap">
				<div class="addr_name">주소</div>
				<div class="addr_input_1_wrap">
					<div class="addr_input_1_box">
						<input class="addr_input_1" name="MK_ADDR1" readonly="readonly">
					</div>
					<div class="addr_button" onclick="execution_daum_address()">
						<span>주소 검색</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="addr_input_2_wrap">
					<div class="addr_input_2_box">
						<input class="addr_input_2" name="MK_ADDR2" readonly="readonly">
					</div>
				</div>
				<div class="addr_input_3_wrap">
					<div class="addr_input_3_box">
						<input class="addr_input_3" name="MK_ADDR3" readonly="readonly">
					</div>
				</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="indust_wrap">
				<div class="indust_name">업종</div>
				<div class="indust_input_box">
					<input class="indust_input" name="MK_INDU">
				</div>
				<span class="final_indust_ck">업종을 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->
			<div class="time_wrap">
				<div class="time_name">영업시간(요일/시작시간/종료시간)</div>
				<div class="time_input_wrap">
					<div class="time_input_box">
						<input class="time_input" name="MK_TIME">
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- ------------------------------------------------- -->
			<div class="img_wrap">
				<div class="img_name">대표가게사진</div>
				<div class="img_input_wrap">
					<div class="img_input_box">
						<input type="file" id="fileItem" name="MK_IMAGE" style="height:30px;">
					</div>
					<div class="clearfix"></div>
					<span class="final_img_ck">사진을 선택해주세요.</span>
				</div>
			</div>
			<!-- ------------------------------------------------- -->

		</div>
		<div class="marketjoin_button_wrap">
			<input type="button" class="marketjoin_button" value="등록하기">
		</div>
		<input type = "hidden" id="userId" value="${member.ID}">
		
		</form>
	</div>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

/* 매장등록 유효성 검사 통과유무 변수 */
var nameCheck=false;
var busnumCheck=false;
var telCheck=false;
var addrCheck=false;
var industCheck=false;

var checkCode = ""; //이메일 전송 인증번호 저장위한 코드


$(document).ready(function(){
	//매장등록 버튼(회원가입 기능 작동)
	$(".marketjoin_button").click(function(){
		
		/* 입력값 변수 */
		var name = $('.name_input').val();
		var busnum = $('.busnum_input').val();
		var tel = $('.tel_input').val();
		var addr = $('.addr_input').val();
		var indust = $('.indust_input').val();

		/* name 유효성 검사 */
		if(name == "") {
			$('.final_name_ck').css('display', 'block');
			nameCheck = false;
		}else {
			$('.final_name_ck').css('display', 'none');
			nameCheck = true;	
		}
		
		/* busnum 유효성 검사 */
		if(busnum == "") {
			$('.final_busnum_ck').css('display', 'block');
			busnumCheck = false;
		}else {
			$('.final_busnum_ck').css('display', 'none');
			busnumCheck = true;	
		}
		
		/* tel 유효성 검사 */
		if(tel == "") {
			$('.final_tel_ck').css('display', 'block');
			telCheck = false;
		}else {
			$('.final_tel_ck').css('display', 'none');
			telCheck = true;	
		}
		
		/* addr 유효성 검사 */
		if(addr == "") {
			$('.final_addr_ck').css('display', 'block');
			addrCheck = false;
		}else {
			$('.final_addr_ck').css('display', 'none');
			addrCheck = true;	
		}
		
		/* indust 유효성 검사 */
		if(indust == "") {
			$('.final_indust_ck').css('display', 'block');
			industCheck = false;
		}else {
			$('.final_indust_ck').css('display', 'none');
			industCheck = true;	
		}
		
		
		/* 최종 유효성 검사 */
		if(nameCheck&&busnumCheck&&telCheck&&addrCheck&&industCheck){
            $("#marketjoin_form").attr("action", "/market/marketJoin");
            $("#marketjoin_form").submit(); 
        }
		
		return false;
		
		
		//$("#marketjoin_form").attr("action", "/member/join");
		//$("#marketjoin_form").submit();
	});
});

//매장명 중복 검사
$('.name_input').on("propertychange change keyup paste input", function() {
	//console.log("keyup 테스트");
	var ID = $('#userId').val();
	var name = $('.name_input').val();
	
	var data={ID : ID, MK_NAME : name};
	
	$.ajax({
		type : "post",
		url : "/market/marketNameChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.name_input_re_1').css("display","inline-block");
				$('.name_input_re_2').css("display", "none");
				nameckCheck = true;
			} else {
				$('.name_input_re_2').css("display","inline-block");
				$('.name_input_re_1').css("display", "none");
				nameckCheck = false;
			}
		}//success 종료
	});//ajax 종료
});//function 종료


//이미지 업로드
$("input[type='file']").on("change", function(e){

	let formData = new FormData();
	let fileInput = $('input[name="MK_IMAGE"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("MK_IMAGE", fileObj);
	
	$.ajax({
		url: '/market/uploadAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json'
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





/* 다음 주소 연동 */
function execution_daum_address(){
 
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                addr += extraAddr;
            
            } else {
                addr += ' ';
            }

            $(".addr_input_1").val(data.zonecode);
            $(".addr_input_2").val(addr);
            
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".addr_input_3").attr("readonly",false);
            $(".addr_input_3").focus();
 
        }
    }).open();    
 
}










</script>





</body>
</html>