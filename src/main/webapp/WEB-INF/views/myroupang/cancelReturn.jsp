<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roupang</title>
<link rel="stylesheet" href="../css/common.css" type="text/css">
</head>
<style>

.roll{
background-color: white;
width: 780px;
height: 500px;
position: absolute;
top:350px; 
right: 259px;
}

/*  */
.hWCtfZ {
    margin: 0px 0px 24px;
}
.igWACu {
    margin-bottom: 15px;
}
.te99{
margin-top: 80px;
font-size: 13px;
color: gray;
}

.bu3{
margin-top: 30px;
display: flex;

align-items:center;
justify-content:center;
}

.bupre{
	background-image: url("but3.png");
	background-size: 30px;
}
.bunex{
	background-image: url("but5.png");
	background-size: 30px;
}
</style>
<body>
<s:authorize access="isAnonymous()">
		<%@include file="../auth/login.jsp" %>
</s:authorize>
 <s:authorize access="isAuthenticated()">
<%@include file="../myroupang/myroupang.jsp" %>

<div class="roll" >
	<h1 style="font-size: 30px; margin-bottom:30px;">취소/반품/교환/환불내역</h1>

	
		<div class="te99">
			<span>- 취소/반품/교환 신청한 내역을 확인할 수 있습니다.
			<br>- 하단 상품목록에 없는 상품은 1:1문의 또는 고객센터(1111-2222)로 문의주세요.</span>
		</div>
		
		
		<div class="bu3">
			<button class="bupre">
			</button>
			<button class="bunex">
			</button>
		</div>

</div>
 </s:authorize>
</body>
</html>