<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/page/pmain.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class = "top_area">
		<div class="top_left_area">
			<a href="/page/pmain">
				<img class="logo_area" src="../resources/images/dklogo.PNG" width=120px height=130px>
			</a>
			<div class="info">
				<div class="info_name">
					<h3 style="padding:0.5em 0.5em; background:black; margin:0.5em 0em; color:white; font-weight:bold; width:100px;text-align:center;display:inline-block;margin-left:50px;"
					data-ke-size="size23">매장명</h3>
					<h3 style="padding:0.5em 0.5em; background:white; margin:0.5em 0em; color:black; font-weight:bold; width:180px;text-align:center;display:inline-block;border:1px solid gray;"
					data-ke-size="size23">동구매장</h3>	
					<h3 style="padding:0.5em 0.5em; background:black; margin:0.5em 0em; color:white; font-weight:bold; width:100px;text-align:center;display:inline-block;margin-left:30px;"
					data-ke-size="size23">매장코드</h3>
					<h3 style="padding:0.5em 0.5em; background:white; margin:0.5em 0em; color:black; font-weight:bold; width:180px;text-align:center;display:inline-block;border:1px solid gray;"
					data-ke-size="size23">DKCS0001</h3>
				</div>
				<!--  
				<div class="info_path">
					<h3 style="padding:0.5em 0.5em; background:black; margin:0.5em 0em; color:white; font-weight:bold; width:100px;text-align:center;display:inline-block;margin-left:50px;"
					data-ke-size="size23">PATH</h3>
					<h3 style="padding:0.5em 0.9em; background:white; margin:0.5em 0em; color:black; font-weight:bold; width:525px;display:inline-block;border:1px solid gray;"
					data-ke-size="size23">HOME</h3>
					
				</div>
				-->
			</div>
		</div>
		<div class="top_right_area">
			<div class="info_day">
				<h3 style="padding:0.5em 0.5em; background:black; margin:0.5em 0em; color:white; font-weight:bold; width:100px;text-align:center;display:inline-block;margin-left:50px;"
				data-ke-size="size23">TODAY</h3>
				<h3 style="padding:0.5em 0.5em; background:white; margin:0.5em 0em; color:black; font-weight:bold; width:180px;text-align:center;display:inline-block;border:1px solid gray;"
				data-ke-size="size23">
					<script>
						date = new Date().toLocaleDateString();
						document.write(date);
					</script>
				</h3>
			</div>
			<div class="info_img">
				<img class="img_area1" src="../resources/images/logo1.png" width=50px height=35px>
				<img class="img_area2" src="../resources/images/logo2.png" width=40px height=35px>
				<img class="img_area3" src="../resources/images/logo3.png" width=40px height=35px>
			</div>
			<div class="info_img_de">
				<p>공지사항</p>
				<p>원격지원</p>
				<p>대시보드</p>
			</div>
		</div>
	</div>
	<div class = "left_area">
		<c:if test="${ member != null }">
			<div class="login_success_area">
				<img class="info_area" src="../resources/images/person.png" width=90px height=90px>
        		<span>${member.NAME}님</span>
        		<ul class = "list">
        			<li>
        				<a href="/page/logout.do">로그아웃</a>
        			</li>
        			<li>
        				<a href="../myinfo">내정보</a>
        			</li>
        		</ul>
        	</div>
        </c:if>
        <div class="page_menu">
        	<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;"
				data-ke-size="size23"> ※ 상품관리
			</h3>
			<a class ="menu_list11" href="../goods/gdList">- 상품 목록</a>
			<a class ="menu_list12" href="../goods/gdJoin">- 상품 등록</a>
			<a class ="menu_list13" href="../goods/gdDetail">- 상품 수정 및 삭제</a>
			<a class ="menu_list14" href="../goods/gdCate">- 카테고리 관리</a>
			<a class ="menu_list15" href="">- 가격 관리</a>
			<a class ="menu_list16" href="">- 진열 관리</a>
			<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;margin-top:20px;"
				data-ke-size="size23"> ※ 재고관리
			</h3>
			<a class ="menu_list21" href="">- 재고 현황</a>
			<a class ="menu_list22" href="">- 입고 관리</a>
			<a class ="menu_list23" href="">- 수불 관리</a>
			<a class ="menu_list24" href="">- 재고 이동</a>
			<a class ="menu_list25" href="">- 재고 조정</a>
			<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;margin-top:20px;"
				data-ke-size="size23"> ※ 판매관리
			</h3>
			<a class ="menu_list31" href="">- 판매 내역</a>
			<a class ="menu_list32" href="">- 주문 등록/처리</a>
			<a class ="menu_list33" href="">- 반품/교환 관리</a>
			<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;margin-top:20px;"
				data-ke-size="size23"> ※ 고객관리
			</h3>
			<a class ="menu_list41" href="">- 고객 목록</a>
			<a class ="menu_list42" href="">- 고객 등록</a>
			<a class ="menu_list43" href="">- 고객 정보 수정</a>
			<a class ="menu_list44" href="">- 고객 문의/피드백 관리</a>
			<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;margin-top:20px;"
				data-ke-size="size23"> ※ 창고관리
			</h3>
			<a class ="menu_list51" href="">- 창고 목록</a>
			<a class ="menu_list52" href="">- 창고별 재고 관리</a>
			<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;margin-top:20px;"
				data-ke-size="size23"> ※ 매출 보고서
			</h3>
			<a class ="menu_list61" href="">- 재고 보고서</a>
			<a class ="menu_list62" href="">- 판매 분석</a>
			<a class ="menu_list63" href="">- 고객 분석</a>
			<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;margin-top:20px;"
				data-ke-size="size23"> ※ 사용자 관리
			</h3>
			<a class ="menu_list71" href="">- 사용자 리스트</a>
			<a class ="menu_list72" href="">- 사용자 권한 관리</a>
			<a class ="menu_list73" href="">- 매장 설정</a>
			<h3 style="background:white; margin:0.5em 0em; color:black; font-weight:bold;margin-top:20px;"
				data-ke-size="size23"> ※ 대시보드
			</h3>
			<a href="">- 매장 주요 지표</a>
			<a href="">- 알림 및 공지</a>
			
        </div>
	</div>



</body>
</html>