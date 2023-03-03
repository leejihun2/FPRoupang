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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link href="/star/star.css" rel="stylesheet">
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
	<%@include file="../top.jsp"%>
	<div id="top"></div>
	<div class="container">
		<%@include file="../category.jsp"%>

		<div class="text-right"></div>
		<!-- 방명록 반복 부분 s -->
		<c:forEach items="${lists }" var="row">
			<div class="border mt-2 mb-2">
				<div class="media">
					<div class="media-left mr-3"></div>
					
						<div class="media-body">
							<h4 class="media-heading">제목:${row.goods_title }</h4>
							<p>${row.ccomment }</p>
						</div>
						<div class="media-right">
							<c:if test="${sessionScope.siteUserInfo.id eq row.id }">
								<button class="btn btn-secondary"
									onclick="location.href='modify.do?idx=${row.idx}';">
									수정</button>
								<button class="btn btn-secondary"
									onclick="javascript:deleteRow(${row.idx});">삭제</button>
							</c:if>
						</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="copyright">
		<%@include file="../copyright.jsp"%>
		<!-- 원하는 파일 경로를 삽입하면 된다 -->
	</div>
</body>
</html>