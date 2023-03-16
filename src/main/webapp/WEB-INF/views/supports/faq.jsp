<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/CustomerService.css" type="text/css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function deleteRow(idx){
   if(confirm("정말로 삭제하시겠습니까?")){
	   //삭제 요청명으로 이동한다.
      location.href = "delete.do?idx="+idx;
   }
}
</script>
</head>

<body style="background-color: #ffffff">
	<div id="top">
		<%@include file="../top.jsp"%>
	</div>
	<div class="container">
	<ul class="sc-nly1np-0 cifYev" style="width: 1500px;">
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=ALL"> 
					<span class="text">전부</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=DELIVERY"> 
					<span class="text">배송문의</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=CANCEL"> 
					<span class="text">취소/환불</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=MEMBER"> 
					<span class="text">회원서비스</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=CASH"> 
					<span class="text">루팡캐시</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=MOBILE"> 
					<span class="text">로켓모바일</span>
				</a></li>
			</ul>
	<c:forEach items="${lists }" var="row" varStatus="loop">
		<div class="question">
			<button class="accordion" onclick="viewContent()"><span style="color: #6f6aff ;" >Q</span>${row.title }</button>
			<div class="panel">
				<span class="col-3" style="color: #6f6aff ;">A</span>${row.contents }
		</c:forEach>
	</div>
	<div id="copyright">
		<%@include file="../copyright.jsp"%>
		<!-- 원하는 파일 경로를 삽입하면 된다 -->
	</div>
	<script src="../js/CustomerService.js"></script>
</body>
</html>