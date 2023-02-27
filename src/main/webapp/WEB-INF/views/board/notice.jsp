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
</head>
<body style="background-color: #ffffff">
 <div id="top">
    <%@include file="../top.jsp" %>
    </div>
<div class="container">
	
	<%@include file="../category.jsp" %>
	<div class="text-right">
	</div>
		<div class="container d-flex justified-content-center">
			<ul class="nav nav-justified" style="width: 1500px;">
				<li class="nav-item"><a class="nav-link"
					href="./faq.do?categoryCode=ALL"> <span class="text">전체</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./faq.do?categoryCode=DELIVERY"> <span class="text">공지</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./faq.do?categoryCode=CANCEL"> <span class="text">이벤트</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./faq.do?categoryCode=REFUND"> <span class="text">해외항공권</span>
				</a></li>
			</ul>
		</div>
		<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row" varStatus="roop">		
		<div class="d-grid gap-2">
			<button type="button" class="btn"  data-bs-toggle="collapse" data-bs-target="#a${row.idx}">
		      ${row.title }<br /> </button>
		    <div id="a${row.idx}" class="collapse" style="background-color: rgb(250,250,250);">
		    	${row.contents }
		    </div>
			<!--  수정,삭제버튼 -->
			<div class="media-right">
				<!-- 수정/삭제 버튼은작성자 본인에게만 보여야 하므로 세션영역에 저장된
				아이디와 게시물을 작성한 아이디가 같을때만 버튼을 출력한다. 
				EL에서는 영역을 지정하는 내장객체를 생략할 수 있다. 따라서 sessionScope
				는 삭제해도 무방하다.-->
				<c:if test="${name eq row.email }">
					<button class="btn btn-secondary"
						onclick="location.href='modify.do?idx=${row.idx}';">
						수정
					</button>
					<button class="btn btn-secondary"
						onclick="javascript:deleteRow(${row.idx});">
						삭제
					</button>
				</c:if>
			</div>
		</div>
	</c:forEach>
</div>

</body>
</html>