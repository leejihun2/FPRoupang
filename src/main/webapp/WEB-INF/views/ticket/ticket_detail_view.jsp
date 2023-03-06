<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Roupang</title>
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
	.carousel-image {
	    width: 100%;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    background-size: contain;
	    margin-top: -1px;
	}
	.travel-detail-content {
	    float: left;
	    width: 685px;
	}
	.travel-detail-basis {
	    float: right;
	    width: 270px;
	    border: 1px solid #ddd;
	    color: #333;
	}
	.thumbnail-img {
	    width: 50px;
	    height: 50px;
	}
	.travel-thumbnail:after .thumbnails:after, .travel-thumbnail:after .travel-scroll-tab-header-wrapper:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	.travel-scroll-tab-headers li {
		cursor: pointer;
	}
	.thumbnails li {
		cursor: pointer;
	}
	ul {
	    display: block;
	    list-style-type: disc;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 40px;
	}
	li {
	    display: list-item;
	    text-align: -webkit-match-parent;
	}
	.travel-scroll-tab-headers.lg li a {
	    font-size: 18px;
	    padding: 0 40px;
	}
	.travel-scroll-tab-headers li a {
	    display: block;
	    color: #111;
	    text-align: center;
	}
	.travel-scroll-tab-headers.lg li.selected a, .travel-scroll-tab-headers.lg li:hover a {
	    font-weight: 700;
	    color: #00a289;
	}
	
</style>
<body style="background-color: white;">
    <div id="top" style="margin-bottom:0px;">
        <%@include file="../top.jsp" %>
    </div>
    <div class="container">
	    <div id="travel-container">
	        <div class="travel-detail">
	            <div class="travel-breadcrumb">
	            	
	            </div>
	            <div class="travel-detail-container">
	                <section class="travel-detail-content">
	                    <div class="travel-carousel-container">
	                        <div class="travel-carousel use-background clickable" style="width: 100%; height: 512px;">
	                        	<div class="carousel-image" style="height: 512px; background-image: url(/uploads/${Total_Ticket.t_title_image });"></div>
	                            <a class="carousel-nav prev" onclick="plusSlides(-1)"> < </a>
	                            <a class="carousel-nav next" onclick="plusSlides(1)"> > </a>
	                        </div>
	                        <div class="travel-thumbnail">
	                            <div class="thumbnails-wrap">
	                                <ul class="thumbnails">
	                                	<li><a class="thumbnail-item">
	                                	<img src="/uploads/${Total_Ticket.t_title_image }" class="thumbnail-img" /></a></li>
	                                	<c:if test="${not empty Total_Ticket.t_image1 }">
	                                		<li><a class="thumbnail-item"><img src="/uploads/${Total_Ticket.t_image1 }" class="thumbnail-img" /></a></li>
	                                		<c:if test="${not empty Total_Ticket.t_image2 }">
			                                	<li><a class="thumbnail-item"><img src="/uploads/${Total_Ticket.t_image2 }" class="thumbnail-img" /></a></li>
	                                			<c:if test="${not empty Total_Ticket.t_image3 }">
		            	        	            	<li><a class="thumbnail-item"><img src="/uploads/${Total_Ticket.t_image3 }" class="thumbnail-img" /></a></li>
	                	        	        		<c:if test="${not empty Total_Ticket.t_image4 }">
			    	        	                    	<li><a class="thumbnail-item"><img src="/uploads/${Total_Ticket.t_image4 }" class="thumbnail-img" /></a></li>
				                                	</c:if>
			                                	</c:if>
		                                	</c:if>
	                                	</c:if>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                    <article class="travel-scroll-tab">
	                        <section class="travel-scroll-tab-header">
	                            <div class="travel-scroll-tab-header-wrapper">
	                                <ul class="travel-scroll-tab-headers lg">
	                                    <li class="lg selected"><a style="height: 48px; line-height: 48px;">상품 선택</a></li>
	                                    <li class="lg"><a style="height: 48px; line-height: 48px;">상품 설명</a></li>
	                                    <li class="lg"><a style="height: 48px; line-height: 48px;">상품평</a></li>
	                                    <li class="lg"><a style="height: 48px; line-height: 48px;">상품문의</a></li>
	                                </ul>
	                            </div>
	                        </section>
	                    </article>
	                </section>
	                <aside class="travel-detail-basis">
	                	<div class="basis-product">
	                		<h2>${t_title }</h2>
		                	<div class="basis-product-address">
		                		대충 주소
		                	</div>
		                	<div class="basis-product-best-review">
		                		대충 제일 좋은 리뷰
		                	</div>
		                	<button class="btn btn-primaryinfo" style="height: 42px; line-height: 40px; font-size: 18px;">상품 구매</button>
	                	</div>
	                	<div class="basis-aside-cashback">
	                		<div class="basis-product-cashback-column">
	                			<div class="cashback-title">포인트 적립</div>
	                			<span class="cashback-info-separator">|</span>
	                			<ul class="basis-cashback-list">
	                				<li>
	                					<span class="cashback-text">쿠페이 머니 결제 시 1% 적립</span>
	                				</li>
	                				<li>
	                					<span class="cashback-text">[로켓와우 + 쿠페이 계좌이체] 결제 시 2% 적립</span>
	                				</li>
	                				<li>
	                					<span class="cashback-text">[로켓와우 + 쿠페이 머니] 결제 시 4% 추가적립</span>
	                				</li>
	                			</ul>
	                		</div>
	                	</div>
	                	<div class="basis-aside-section">
	                		<ul class="basis-key-infos">
	                			<li class="basis-key-info">
	                				<label class="key-info-title">바로사용</label>
	                				<span class="key-info-description">오늘부터 사용가능</span>
	                			</li>
	                			<li class="basis-key-info">
	                				<label class="key-info-title">티켓타입</label>
	                				<span class="key-info-description">이용 기간 내 사용</span>
	                			</li>
	                			<li class="basis-key-info">
	                				<label class="key-info-title">사용방법</label>
	                				<span class="key-info-description">QR/바코드 확인 후 입장</span>
	                			</li>
	                			<li class="basis-key-info">
	                				<label class="key-info-title">예약필요</label>
	                				<span class="key-info-description">구매 후 자동 예약</span>
	                			</li>
	                		</ul>
	                	</div>
	                	<div class="basis-aside-section">
	                		<div class="basis-introduction introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">소개</h4>
	                			<div class="introduction-text-wrapper">
	                				<p class="introduction-text">${Total_Ticket.t_intro }</p>
	                			</div>
	                		</div>
	                		<c:if test="${Total_Ticket.notice ne null }">
	                		<div class="basis-introduction introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">알려드리는 말</h4>
	                			<div class="introduction-text-wrapper">
	                				<p class="introduction-text">${Total_Ticket.notice }</p>
	                			</div>
	                		</div>
	                		</c:if>
	                		<div class="basis-location introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">위치</h4>
	                			<span class="item-subtitle">대충 주소</span>
	                		</div>
	                		<div class="travel-simple-map">
	                			대충 지도
	                		</div>
	                	</div>
	                	<div class="basis-aside-section">
	                		<div class="basis-review-section">
	                		
	                		
	                			대충 리뷰
	                		</div>
	                	</div>
	                </aside>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
