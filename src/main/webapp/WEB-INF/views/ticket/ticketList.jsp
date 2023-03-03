<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
    <style>
    .sticky {
	  position: -webkit-sticky;
	  position: sticky;
	  top: 0;
	}
	.search_title{
	    color: #fff;
	    font-size: 16px;
	    line-height: 25px;
	    font-weight: 400;
	    letter-spacing: -1px;
	}
	.search_title>img {
	    display: block;
	    margin: 3px 0;
	    width: 88px;
	    height: 15px;
	}
	</style>
<body style="background-color: white;">
    <!-- top.html에서 인클루드 -->
    <div id="top" style="margin-bottom:0px;">
        <%@include file="../top.jsp" %>
    </div>
	<nav class="navbar navbar-expand-sm navbar-dark sticky" style="background-color:rgb(3,194,165); height: 123px;">
	    <div class="container">
            <ul class="navbar-nav me-auto search-wizard-tab">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">숙박</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">티켓/패스</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">패키지/항공</a>
                </li>
            </ul>
            <div class="collapse navbar-collapse">
            	<h4 class="search_title">
	                <img src="https://img1a.coupangcdn.com/image/coupang/travel/logo/logo-travel-white.png">
	                <p>티켓/패스</p>
                </h4>
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
	            <span class="navbar-toggler-icon"></span>
	            </button>
	            <form class="d-flex">
	                <input class="form-control me-2" type="text" placeholder="Search">
	                <button class="btn btn-primary" type="button">Search</button>
	            </form>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:0px;">
    	<section class="category-c1-banners">
    		<div class="sub-category">
    			<h2>티켓/패스 카테고리</h2>
    			<ul>
	    			<c:forEach items="${ticket_list }" var="ticket" varStatus="loop">
		    			<li>
		    				<a href="#?value=${ticket.idx }">
		    				<img src="/uploads/${ticket.t_title_image }"/><br />
		    				${ticket.title } <br />
		    				${ticket.ti_price }원 
			    				<c:if test="${ticket.ti_discount ne 0 }">
			    					${ticket.ti_discount}% 할인
			    				</c:if>
		    				<br />
		    				${ticket.ti_title } 기준
		    				</a>
		   				</li>
	    			</c:forEach>
    			</ul>
   			</div>
		</section>
	</div>
</body>
</html>