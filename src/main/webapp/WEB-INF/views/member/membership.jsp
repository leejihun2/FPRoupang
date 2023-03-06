<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${sessionScope.user_id!=null }">
		"로그인 되었습니다."
	
	</c:if>
	<c:if test="${sessionScope.membership eq 1 }">
		"이미 가입되었습니다."
		<form action="/cancelMembership.do">
            <input type="submit" value="해지하기" />
            <input type="reset" value="유지하기" />
        </form>
	</c:if>
	<c:if test="${sessionScope.membership ne 1 }">
		"멤버쉽가입을 해주세요."
		<form action="/joinMembership.do">
            <input type="submit" value="신청하기" />
        </form>
	</c:if>
</body>
</html>