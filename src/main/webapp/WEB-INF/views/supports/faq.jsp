<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/category.css"> 
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function deleteRow(idx){
   if(confirm("정말로 삭제하시겠습니까?")){
	   //삭제 요청명으로 이동한다.
      location.href = "delete.do?idx="+idx;
   }
}
</script>
<style type="text/css">
.cifYev {
    width: 100%;
    height: 60px;
    margin: 35px 0px;
    font-family: "맑은 고딕", malgun gothic, apple sd gothic neo, "나눔고딕", nanumgothic, "돋움", dotum, sans-serif;
}
.cifYev > li {
    width: calc(10%);
}
.dSWQUC {
    float: left;
    padding: 19px 0px;
    text-align: center;
    font-size: 14px;
    font-weight: bold;
    border: 1px solid rgb(238, 238, 238);
    background-color: rgb(250, 250, 250);
    color: rgb(85, 85, 85);
    cursor: pointer;
}
.laopsh{
	
}
</style>
</head>

<body style="background-color: #ffffff">
 <div id="top">
    <%@include file="../top.jsp" %>
    </div>
<div class="container">
	
<%@include file="../category.jsp" %>

	
	<ul class="sc-nly1np-0 cifYev" style="width: 1500px;">
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=ALL"> 
					<span class="text">젠부</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=DELIVERY"> 
					<span class="text">배송문의</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=CANCEL"> 
					<span class="text">취소/교환/반품</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=REFUND"> 
					<span class="text">환불</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=MEMBER"> 
					<span class="text">회원서비스</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=CASH"> 
					<span class="text">쿠팡캐시</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./faq.do?categoryCode=MOBILE"> 
					<span class="text">로켓모바일</span>
				</a></li>
			</ul>
		<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row" varStatus="loop">		
		<div class="d-grid gap-2">
			<button type="button" class="btn"  data-bs-toggle="collapse" data-bs-target="#a${row.idx}">
		      ${row.title }<br /> </button>
		    <div id="a${row.idx}" class="collapse" style="background-color: rgb(250,250,250);">
		    	${row.contents }
		    </div>
		</div>
	</c:forEach>
</section>
</div>

    <div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>
</body>
</html>