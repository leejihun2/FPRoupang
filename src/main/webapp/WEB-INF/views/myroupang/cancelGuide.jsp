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
.conconcon{
    background-color: white;
    width: 980px;
    height: auto;
    margin: auto;
}
.none {
    display: block;
    text-indent: -9em;
    width: 0;
    height: 0;
    overflow: hidden;
    font-size: 0;
}

.content-link {
    height: 84px;
    padding: 20px 0 0 55px;
    background: url(//img1a.coupangcdn.com/image/www/cs/webrefundpolicy/webrefundPolicy_menu.gif) no-repeat;
}
.content1 {
    height: 720px;
   	background: url(//img1a.coupangcdn.com/image/www/cs/webrefundpolicy/v1/policy_contents01.png) no-repeat;
}
.content2 {
    height: 594px;
    background: url(//img1a.coupangcdn.com/image/www/cs/webrefundpolicy/v1/policy_contents02.png) no-repeat;
}
.content3 {
    height: 433px;
    background: url(//img1a.coupangcdn.com/image/www/cs/webrefundpolicy/v1/policy_contents03.png) no-repeat;
}
.content4 {
    height: 737px;
    background: url(//img1a.coupangcdn.com/image/www/cs/webrefundpolicy/v1/policy_contents04.png) no-repeat;
}
.content5 {
    height: 852px;
    background: url(//img1a.coupangcdn.com/image/www/cs/webrefundpolicy/v1/policy_contents05.png) no-repeat;
}
.content6 {
    height: 938px;
    background: url(//img1a.coupangcdn.com/image/www/cs/webrefundpolicy/v1/policy_contents06.png) no-repeat;
}
.intro {
    position: relative;
    height: 164px;
}
</style>

<body>
<s:authorize access="isAnonymous()">
		<%@include file="../auth/login.jsp" %>
</s:authorize>
 <s:authorize access="isAuthenticated()">
<%@include file="../top.jsp" %>

<div class="conconcon">	

	<div id="returnPolicy">
		
			
			
        <div class="intro">
        	<img src="../images/guideTopbtn.png" alt="버튼맵" usemap="#cancelImage">
			<map name="cancelImage">
				<area shape="rect"  coords="776,58,934,105" 
					href="../myroupang/orderlist.do" alt="취소/반품 신청 바로가기">
          	</map>
        </div>

        <div class="content1" name="content1"></div>

        <div class="content2" name="content2"></div>

        <div class="content3" name="content3"></div>

        <div class="content4" name="content4"></div>

        <div class="content5" name="content5"></div>

        <div class="content6" name="content6"></div>


</div>

</div>
</s:authorize>
<div>
	<%@include file="../copyright.jsp" %>
</div>
</body>
</html>