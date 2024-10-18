<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/css/member/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

</head>
<body>
	<div class="wrapper">
		<div class="subject">
			<h1>상세정보입력</h1>
		</div>
		<form id="join_form" method="post">
		<div class="wrap">
			<!-- ------------------------------------------------- -->
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="ID">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디 입니다.</span>		<!-- 아이디 중복 확인 -->
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="PW">
				</div>
				<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="name_wrap">
				<div class="name_name">이름</div>
				<div class="name_input_box">
					<input class="name_input" name="NAME">
				</div>
				<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="bd_wrap">
				<div class="bd_name">생년월일(YYYYMMDD)</div>
				<div class="bd_input_box">
					<input class="bd_input" name="BD">
				</div>
				<span class="final_bd_ck">생년월일을 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="tel_wrap">
				<div class="tel_name">전화번호(-제외)</div>
				<div class="tel_input_box">
					<input class="tel_input" name="TEL">
				</div>
				<span class="final_tel_ck">전화번호를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="addr_wrap">
				<div class="addr_name">주소</div>
				<div class="addr_input_1_wrap">
					<div class="addr_input_1_box">
						<input class="addr_input_1" name="ADDR1" readonly="readonly">
					</div>
					<div class="addr_button" onclick="execution_daum_address()">
						<span>주소 검색</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="addr_input_2_wrap">
					<div class="addr_input_2_box">
						<input class="addr_input_2" name="ADDR2" readonly="readonly">
					</div>
				</div>
				<div class="addr_input_3_wrap">
					<div class="addr_input_3_box">
						<input class="addr_input_3" name="ADDR3" readonly="readonly">
					</div>
				</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
			<!-- ------------------------------------------------- -->			
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="EMAIL">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<span class="mail_input_box_warn"></span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
				</div>
				<div class="clearfix"></div>
				<span class="final_mailnum_ck">인증번호를 입력해주세요.</span>
				<span class="mail_check_input_box_warn"></span>
			</div>
			<!-- ------------------------------------------------- -->
		</div>
		<div class="join_button_wrap">
			<input type="button" class="join_button" value="가입하기">
		</div>
		</form>
	</div>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

/* 회원가입 유효성 검사 통과유무 변수 */
var idCheck=false;
var pwCheck=false;
var nameCheck=false;
var bdCheck=false;
var telCheck=false;
var addrCheck=false;
var mailCheck=false;
var mailnumCheck=false;

var checkCode = ""; //이메일 전송 인증번호 저장위한 코드


$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
		/* 입력값 변수 */
		var id = $('.id_input').val();
		var pw = $('.pw_input').val();
		var name = $('.name_input').val();
		var bd = $('.bd_input').val();
		var tel = $('.tel_input').val();
		var addr = $('.addr_input_1').val();
		var mail = $('.mail_input').val();
		var mailnum = $('.mail_check_input').val();
		
		/* id 유효성 검사 */
		if(id == "") {
			$('.final_id_ck').css('display', 'block');
			idCheck = false;
		}else {
			$('.final_id_ck').css('display', 'none');
			idCheck = true;	
		}
		
		/* pw 유효성 검사 */
		if(pw == "") {
			$('.final_pw_ck').css('display', 'block');
			pwCheck = false;
		}else {
			$('.final_pw_ck').css('display', 'none');
			pwCheck = true;	
		}
		
		/* name 유효성 검사 */
		if(id == "") {
			$('.final_name_ck').css('display', 'block');
			nameCheck = false;
		}else {
			$('.final_name_ck').css('display', 'none');
			nameCheck = true;	
		}
		
		/* bd 유효성 검사 */
		if(bd == "") {
			$('.final_bd_ck').css('display', 'block');
			bdCheck = false;
		}else {
			$('.final_bd_ck').css('display', 'none');
			bdCheck = true;	
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
		
		/* mail 유효성 검사 */
		if(mail == "") {
			$('.final_mail_ck').css('display', 'block');
			mailCheck = false;
		}else {
			$('.final_mail_ck').css('display', 'none');
			mailCheck = true;	
		}
		
		/* 인증번호 유효성 검사 */
		if(mailnum == "") {
			$('.final_mailnum_ck').css('display', 'block');
			mailnumCheck = false;
		}else {
			$('.final_mailnum_ck').css('display', 'none');
			mailnumCheck = true;	
		}
		
		/* 최종 유효성 검사 */
		if(idCheck&&pwCheck&&nameCheck&&bdCheck&&telCheck&&addrCheck&&mailCheck&&mailnumCheck){
            $("#join_form").attr("action", "/member/join");
            $("#join_form").submit(); 
        }
		
		return false;
		
		
		//$("#join_form").attr("action", "/member/join");
		//$("#join_form").submit();
	});
});


//아이디 중복 검사
$('.id_input').on("propertychange change keyup paste input", function() {
	//console.log("keyup 테스트");
	var ID = $('.id_input').val();
	var data={ID : ID}
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}
		}//success 종료
	});//ajax 종료
});//function 종료


/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    
    var email = $(".mail_input").val();            // 입력한 이메일
    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
    var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
    
    
    /* 이메일 형식 유효성 검사 */
    if(mailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
        warnMsg.css("color", "green");
        
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        warnMsg.css("color", "red");
        return false;
    }    
 
    
    $.ajax({
        
        type:"GET",
        url:"mailCheck?email=" + email,
        success:function(data){
            
            console.log("data : " + data);
            cehckBox.attr("disabled",false);
            boxWrap.attr("id", "mail_check_input_box_true");
            checkCode = data;
        }
    });
});

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){
    
    var inputCode = $(".mail_check_input").val();        // 입력코드    
    var checkResult = $(".mail_check_input_box_warn");    // 비교 결과     
    
    if(inputCode == checkCode){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");
        mailnumCheck = true;
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        mailnumCheck = false;
    }    
    
});

//입력 이메일 형식 유효성 검사
function mailFormCheck(email) {
    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return form.test(email);
    
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
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $(".addr_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);            // 대체가능
            
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".addr_input_3").attr("readonly",false);
            $(".addr_input_3").focus();
 
        }
    }).open();    
 
}



</script>



</body>


</html>