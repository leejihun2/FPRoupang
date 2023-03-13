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
  <!-- Latest compiled JavaScript -->
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
.kQQPrS {
    width: 100%;
    height: 60px;
    margin: 35px 0px;
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
    width: 280px;
}
.kQQPrS > li {
    width: calc(25%);
}
</style>
</head>
<body style="background-color: #ffffff">
 <div id="top">
    <%@include file="../top.jsp" %>
    </div>
<div class="container">
	
	<%@include file="../category.jsp" %>
		<div class="sc-oaw5ke-1 kCoHZO">
			<ul class=" sc-nly1np-0 kQQPrS">
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./notice.do?categoryCode=ALL"> <span class="text">전체</span>
				</a></li>
				<li class=" sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./notice.do?categoryCode=NOTICE"> <span class="text">공지</span>
				</a></li>
				<li class=" sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./notice.do?categoryCode=EVENT"> <span class="text">이벤트</span>
				</a></li>
				<li class="sc-8mvsno-0 dSWQUC"><a class="nav-link"
					href="./notice.do?categoryCode=AIRTICKET"> <span class="text">항공권</span>
				</a></li>
			</ul>
		</div>
		<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row" varStatus="loop">	
    	<details class="detail-box">
	        <summary class="detail-box-title"
	            style="background-color:#ffffff;border-style:none;cursor:pointer;padding:.5rem 1rem;">
	            ${row.title }
	           <br /><span style="font-size: 12px;">${row.regidate }</span> 
	        </summary>
	        <div class="detail-box-description"
	            style="border-bottom-width:1px;border-color:#f5f5f5;border-left-width:1px;border-right-width:1px;border-style:solid;border-top-width:0 !important;margin-top:0;padding:.5rem;">
	            ${row.contents }
	        </div>
    	</details>	
	</c:forEach>
</div>
    <div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>
</body>
</html>