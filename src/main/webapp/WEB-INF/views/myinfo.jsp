<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="../resources/css/page/myinfo.css">
</head>
<body>
<div class = "wrapper">
	<c:if test="${ member != null }">
	<ul class = "list">
		<li>
			<span>아이디 : ${member.ID}</span>		
		</li>
		<li>
			<span>이름 : ${member.NAME}</span>
		</li>
		<li>
			<span>생년월일 : ${member.BD}</span>		
		</li>
		<li>
			<span>전화번호 : ${member.TEL}</span>
		</li>
		<li>
			<span>주소 : ${member.ADDR2}, ${member.ADDR3}</span>
		</li>
		<li>
			<span>이메일 : ${member.EMAIL}</span>
		</li>
	
	</ul>
	</c:if>

</div>


</body>
</html>