<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charSet="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <meta name="next-head-count" content="2" />
    <meta charSet="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="csrf-token" content="jogZeNtZ-fo2pNeObBtP3lGvZilgWPxm4M2g" />
    <meta charSet="utf-8" />
    <meta name="google-site-verification" content="zaNrGtrOLMjglkziY2IvmL8dOXyCWHGArDHqFazJQVI" />
    <meta http-equiv="x-dns-prefetch-control" content="on" />
    <title>루팡!</title>
    <!-- 쿠팡 타이틀 이미지 -->
    <link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon" />
    <!-- 쿠팡 css폴더에서 링크드 -->
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/common.css" type="text/css">
    <link rel="stylesheet" href="./css/ddp.css" type="text/css">
    <link rel="stylesheet" href="./css/list.css" type="text/css">
    <link rel="stylesheet" href="./css/productReview.css" type="text/css">
    <link rel="stylesheet" href="./css/side.css" type="text/css">
    <link rel="stylesheet" href="./css/main.css" type="text/css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>아이디 찾기</title>
</head>
<body style="background-color: white;">
	<div id="top">
        <%@include file="../top.jsp" %>
    </div>
		<div class="w3-content w3-container w3-margin-top" style="height: 900px;">
    		<section id="contents" class="contents home">
    			<div class="w3-content w3-container w3-margin-top" style="height: 900px;">
					<div class="w3-center w3-large w3-margin-top">
						<h3 style="float:left">계정정보 찾기</h3>
					</div>
					<div>
						<table class="table table-bordered" style="width: 90%;">
						<tr>
							<td align="center" bgcolor="#fafbfd">
								<h5><font color="#7a7a7a">${dto.name } 회원님의 아이디입니다.</font><br /></h5>
								<h5><font color="#0db015"><b>${dto.email }</b></font><br /></h5>
								<button onclick="location.href='/myLogin.do'" id=findBtn class="btn btn-primary me-md-2" >로그인</button>
							</td>
						</tr>
						</table>
					</div>
				</div>
	<div id="cartnav">
         <%@include file="../cartnav.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
        </div>
	</section>
		</div>	
		<div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    	</div>
		
	
</body>
</html>