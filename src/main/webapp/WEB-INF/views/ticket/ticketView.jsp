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
.category-item{
    width: 13%;
    margin-right: 20px;
}
.category-item>a {
    display: block;
    border: 1px solid #eee;
    border-radius: 2px;
    cursor: pointer;
}
.ticket_sub_category>img {
    width: 100%;
    height: 90px;
}
.category-item>a .cate_name{
    width: 15%;
    vertical-align: middle;
    text-align: center;
    font-size: 14px;
    font-weight: 700;
    letter-spacing: -1px;
    color: #777;
    height: 50px;
    padding: 0 10px;
}
.main-banner {
    position: relative;
    height: 450px;
    background: #fafafa;
}
.banner-image {
    position: absolute;
    top: 0;
    left: 50%;
    margin-left: -960px;
}
</style>
<body style="background-color: white; overflow-x: hidden; overflow-y: auto;">
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
    		<div class="main-banner">
    			<a><img src="/uploads/에버랜드특가.jpg" class="banner-image"/></a>
    		</div>
    		<div class="sub-category">
    			<h2>티켓/패스 카테고리</h2>
    			<ul>
    				<li class="category-item">
    					<a href="ticket_List?category=1">
    					<div class="ticket_sub_category"><img src="/uploads/테마파크.jpg"/></div>
   						<span class="cate_name">테마파크</span>
    					</a>
    				</li>
    				<li class="category-item">
    					<a href="ticket_List?category=1">
    					<div class="ticket_sub_category"><img src="/uploads/워터파크.jpg"/></div>
   						<span class="cate_name">스파/온천/워터파크</span>
    					</a>
    				</li>
    				<li class="category-item">
    					<a href="ticket_List?category=1">
    					<div class="ticket_sub_category"><img src="/uploads/공연.png"/></div>
   						<span class="cate_name">공연/전시</span>
    					</a>
    				</li>
    				<li class="category-item">
    					<a href="ticket_List?category=1">
    					<div class="ticket_sub_category"><img src="/uploads/엑티비티.jpg"/></div>
   						<span class="cate_name">액티비티</span>
    					</a>
    				</li>
    			</ul>
    		</div>
    	</section>
	</div>
	
	<div id="copyright">
		<c:import url="../copyright.jsp"></c:import>
    </div>
</body>
</html>