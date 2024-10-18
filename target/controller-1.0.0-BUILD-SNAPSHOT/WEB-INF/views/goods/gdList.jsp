<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="../resources/css/goods/gdList.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style type = "text/css">
	#result_card img {
		max-width : 100%;
		height : auto;
		display : block;
	}

</style>
  
</head>
<body>
<div class = "wrapper">
	<%@ include file = "../header.jsp" %>

	<div class = "right_area">
		<div class="subject">
			<h1>* 상품 목록</h1>
		</div>
		<div class="goods_table_wrap">
        	<!-- 상품 리스트 O -->
	        <c:if test="${listcheck != 'empty'}">
	       		<table class="goods_table">
	       			<thead>
	       				<tr>
							<td class="th_column_1">사진</td>
	       					<td class="th_column_2">제품번호</td>
	       					<td class="th_column_3">카테고리</td>
	       					<td class="th_column_4">제품명</td>
	       					<td class="th_column_5">제조사</td>
	       					<td class="th_column_6">제조국</td>
	       					<td class="th_column_7">사이즈</td>
	       					<td class="th_column_8">컬러</td>
	       					<td class="th_column_9">원가</td>
	       					<td class="th_column_10">판매금액</td>
	       					<td class="th_column_11">등록일</td>
	       				</tr>
	       			</thead>	
	       			<c:forEach items="${list}" var="list">
		       		<tr>
		       			<td>
		       				<div class="image_wrap" data-PDNO="${list.imageList[0].PDNO}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
		       					<img>
		       				</div>
		       			</td>
		                <td><c:out value="${list.PDNO}"></c:out></td>
		                <td><c:out value="${list.PD_SCATE}"></c:out></td>
		                <td><c:out value="${list.PD_NAME}"></c:out></td>
		                <td><c:out value="${list.PD_MAKER}"></c:out></td>
		                <td><c:out value="${list.PD_NARA}"></c:out></td>
		                <td><c:out value="${list.PD_SIZE}"></c:out></td>
		                <td><c:out value="${list.PD_COLOR}"></c:out></td>
		                <td><fmt:formatNumber value="${list.PD_INPR}" pattern="#,###" /></td>
		                <td><fmt:formatNumber value="${list.PD_OUTPR}" pattern="#,###" /></td>
		                <td><fmt:formatDate value="${list.PDDAY}" pattern="yyyy-MM-dd"/></td>
		            </tr>
	          		</c:forEach>
	            </table>
	        </c:if>
	                    <!-- 상품 리스트 X -->
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 상품이 없습니다.
                			</div>
                		</c:if>
                	</div>
                	
                	<!-- 검색 영역 -->
                	<div class="search_wrap">
                		<form id="searchForm" action="/goods/gdList" method="get">
                			<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<input type="hidden" name="type" value="G">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
                	
                	<!-- 페이지 이름 인터페이스 영역 -->
                	<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                		
                			<!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.pageStart -1}">이전</a>
                				</li>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    </ul>
                	</div>
                	
                	<form id="moveForm" action="/goods/gdList" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
                	</form>
	</div>

</div>

<script>
let searchForm = $('#searchForm');
let moveForm = $('#moveForm');

$(document).ready(function(){
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
	
		const bobj = $(obj);
		
		if(bobj.data("PDNO")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '../resources/images/person.png');
			console.log("PDNO : " + bobj.data("PDNO"))
		}
		
	});
	
	
	/*이미지 정보 호출
	let PDNO = '<c:out value="${goodsInfo.PDNO}"/>';
	let uploadResult = '<c:out value="${goodsInfo.PD_IMAGE}"/>';
	
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
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
		str += "</div>";
		
		uploadResult.html(str);						
		
	});
	*/
	
});


/* 이미지 출력 
function showUploadImage(uploadResultArr){ */
	
	/* 전달받은 데이터 검증 
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = '<c:out value="${goodsInfo.PD_IMAGE}"/>';
	
	let obj = uploadResultArr[0];
	
	let str = "";
	
	let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
	
	str += "<div id='result_card'>";
	str += "<img src='/display?fileName=" + fileCallPath +"'>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
	str += "</div>";
	
	uploadResult.append(str);
    
}*/

/* 제품 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});


/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

	













</script>

























</body>
</html>