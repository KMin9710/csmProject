<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 매장</title>
<link rel="stylesheet" href="../resources/css/mkinfo.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
	<c:if test="${ member != null }">
		<h1>${member.NAME}님 안녕하세요.</h1>	
		<p><img class="logo_area" src="../resources/images/mklogo.png" width=100px height=100px></p>
		<div class="info_area">
			<a href="page/pmain" class="viewbtn">매장 관리하러 가기</a>
			<a href="market/marketJoin" class="viewbtn">매장 등록하러 가기</a>
		</div>
	</c:if>
	</div>


</body>
</html>