<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../resources/css/member/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
</head>
<body>
<div class="wrapper">
	
	<div class="left_area">
		<p><img class="logo_area" src="../../resources/images/dklogo.PNG" width=300px height=300px></p>
	</div>
	
	<div class="right_area">
		<div class="wrap">
			<form id="login_form" method="post">
				<div class="login_wrap">
					<div class="id_wrap">
						<div class="id_name">아이디</div>
						<div class="id_input_box">
							<input class="id_input" name="ID">
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_name">비밀번호</div>
						<div class="pw_input_box">
							<input class="pw_input" name="PW">
						</div>
					</div>
					<c:if test="${result ==0 }">
						<div class = "login_warn">아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>
					<div class="login_button_wrap">
						<input type="button" class="login_button" value="로그인">
					</div>
				</div>
			
			</form>
		</div>
	</div>
</div>

<script>
/* 로그인 버튼 클릭 메서드 */
$(".login_button").click(function() {
	//alert("로그인 버튼 작동");
	
	$("#login_form").attr("action", "/member/login.do");
	$("#login_form").submit();
	
})

</script>


</body>
</html>