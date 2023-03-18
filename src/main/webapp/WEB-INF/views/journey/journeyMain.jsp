<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./journeycss/bundle1.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle2.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle3.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/travel.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/journeyTop.css" type="text/css" />
<link rel="stylesheet" href="./css/common.css" type="text/css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<head>
<meta charset="UTF-8">
<title>여행 메인 페이지 </title>
</head>
<script src="./js/journeyTop.js"></script>
<body style="background-color: white; overflow-x: hidden; overflow-y: auto;">
	<div id="top">
        <%@include file="../top.jsp" %> 
	</div>
	<%@include file="./searchbox.jsp" %> 
	<section class="home-c1-banners">
	    <div class="main-banner">
	        <a><img src="http://image8.coupangcdn.com/image/bannerunit/bannerunit_8044d229-e229-482a-ab12-7da4ce0005c2.jpg" class="banner-image selected" data-tti-key="sync"></a>
	    </div>
	</section>
	<section class="home-category-section home-section">
	    <div class="travel-sub-category" style="margin-top: 0px;">
	        <h4 class="travel-sub-category-title">여행 카테고리</h4>
	        <ul class="travel-sub-categories">
	            <li class="category-item">
	                <a href="/journeyView">
	                    <div class="category-image">
	                    <img src="http://image9.coupangcdn.com/image/component_62_asset/component_62_asset_94b4ab55-3357-4680-8ad8-c166613c87af.png">
	                    </div>
	                    <span class="category-name">호텔</span>
	                </a>
	            </li>
	            <li class="category-item">
	                <a>
	                 <div class="category-image">
	                 <img src="http://image7.coupangcdn.com/image/component_62_asset/component_62_asset_9d112669-36f4-41cc-b1f3-ecf301781d8a.png">
	                 </div>
	                 <span class="category-name">펜션</span>
	            </a>
	            </li>
	            <li class="category-item">
	                <a href="/ticketView">
	                    <div class="category-image">
	                    <img src="http://image6.coupangcdn.com/image/component_62_asset/component_62_asset_2c199468-9831-4429-8972-58862551484d.png">
	                    </div>
	                    <span class="category-name">티켓</span>
	                </a>
	            </li>
	        </ul>
	    </div>
	</section>
	<section class="home-c2-banners home-section">
	    <div class="grid-banner">
	        <h2 class="grid-banner-title">인기트립</h2>
	        <ul class="grid-banners">
	            <li class="grid-banner-item">
	                <a>
	                    <dl>
	                        <dt><img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_4e915243-4840-4def-8994-c56713b2be3f.jpg"
	                                class="banner-item-image"></dt>
	                        <dd><span class="banner-item-title">여수 녹테마레 미디어아트</span><span
	                                class="banner-item-description">와우회원 8,700원~</span></dd>
	                    </dl>
	                </a>
	            </li>
	            <li class="grid-banner-item">
	                <a>
	                    <dl>
	                        <dt><img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_a4761c7d-3c30-45be-ad68-884841e9ba41.jpg"
	                                class="banner-item-image"></dt>
	                        <dd><span class="banner-item-title">롯데월드 종합이용권</span><span
	                                class="banner-item-description">최대 35% 할인</span></dd>
	                    </dl>
	                </a>
	            </li>
	            <li class="grid-banner-item">
	                <a>
	                    <dl>
	                        <dt><img src="http://image6.coupangcdn.com/image/bannerunit/bannerunit_310b7cb7-7e30-410f-8509-78ca91631800.jpg"
	                                class="banner-item-image"></dt>
	                        <dd><span class="banner-item-title">경주월드 종일권</span><span
	                                class="banner-item-description">와우특가 51,000원~</span></dd>
	                    </dl>
	                </a>
	            </li>
	            <li class="grid-banner-item">
	                <a>
	                    <dl>
	                        <dt><img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_3a4fd182-4342-40bd-ae38-de8ec97ad54f.jpg"
	                                class="banner-item-image"></dt>
	                        <dd><span class="banner-item-title">서울랜드 AFTER2</span><span
	                                class="banner-item-description">평일 한정 이용권 18,900원~</span></dd>
	                    </dl>
	                </a>
	            </li>
	        </ul>
	    </div>
	</section>
           
	<div id="copyright">
	         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
	 </div>
</body>
</html>
