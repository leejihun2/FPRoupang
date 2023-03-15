<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6076fe794faf6e2a97f29c6ebfadce5&libraries=services"></script>
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
    <link rel="stylesheet" href="../css/star_rating.css" type="text/css">
	<link rel="stylesheet" href="../css/star_total.css" type="text/css">
	<script src="../js/star.js"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<style>
	*{
	    margin: 0;
	    padding: 0;
	}
	
	html {
	  scroll-behavior: smooth;
	}
	h4 {
	    display: block;
	    margin-block-start: 1.33em;
	    margin-block-end: 1.33em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	}
	.cash-text {
	    display: inline-block;
	    vertical-align: top;
	    color: #333;
	    font-size: 12px;
	    font-weight: 400;
	    letter-spacing: normal;
	    line-height: 19px;
	}
	.cashback-area{
		margin-top: 10px;
	}
	.carousel-image {
	    width: 100%;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    background-size: contain;
	    margin-top: -1px;
	}
	.search-item-cash-back {
	    position: relative;
	    display: inline-block;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    height: 20px;
	    padding: 0 8px 0 8px;
	    border-radius: 10px;
	    border: 1px solid #ccc;
	    background-color: #fff;
	    font-size: 12px;
	    line-height: 20px;
	    color: #333;
	}
	.travel-detail-content {
	    float: left;
	    margin-left:50px;
	    width: 685px;
	}
	.travel-thumbnail .thumbnails-wrap {
	    position: relative;
	    float: left;
	    overflow: hidden;
	    height: 70px;
	    margin-right: 3px;
	}
	.travel-detail-basis {
	    float: left;
	    width: 270px;
	    border: 1px solid #ddd;
	    color: #333;
	    border-top: 1px solid #ddd;
	    margin-left:20px;
	}
	.thumbnail-img {
	    width: 50px;
	    height: 50px;
	}
	.travel-thumbnail:after .thumbnails:after, .travel-thumbnail:after .travel-scroll-tab-header:after .travel-scroll-tab-header-wrapper:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	.travel-scroll-tab-header-wrapper{
		display:flex;
		background-color:white;
		z-index:0;
	}
	.travel-scroll-tab-headers li {
		cursor: pointer;
	}
	.thumbnails li {
		cursor: pointer;
	}	
	.thumbnail-img:hover {
		outline: 2px solid green;
	}	
	.basis-cashback-list{
	    padding-inline-start: 40px;
	}
	.travel-scroll-tab-headers li {
	    font-size: 18px;
	    height: 48px;
	    line-height: 48px;
	    padding: 0 40px;
	    display: block;
	    color: #111;
	    text-align: center;
	}
	.travel-scroll-tab-headers.lg li.selected , .travel-scroll-tab-headers.lg li:hover {
	    font-weight: 700;
	    color: #00a289;
		border-bottom: 3px solid #00a289;
	}
	.travel-scroll-tab-headers{
		clear:both;
	}
	th{
		height: 56px;
	    padding: 13px 13px;
	    background-color: #fafafa;
	    border-top: 1px solid #ddd;
	}
	table th:not(:first-child){
		border-left: 1px solid #ddd;
	}
	.ticket-detail-vendor-items-result td{
		height: 56px;
	    padding: 13px 10px;
	    border-bottom: 1px solid #ddd;
	    border-top: 1px solid #ddd;
	}
	
	td{
		height: 56px;
	    padding: 13px 10px;
	}
	.ticket-detail-vendor-items-result td:nth-child(2n+1){
	    letter-spacing: -1px;
	    line-height: 23px;
        font-size: 14px;
    	font-weight: 400;
	}
	tr:not(:last-child) td:nth-child(2n){
	    border-bottom: 1px solid #ddd;
	}
	.ticket-detail-vendor-items-result td:not(:first-child){
		border-left: 1px solid #ddd;
	}
	.price_title{
		font-size: 13px;
	    padding-right: 0;
	}
	.price{
		font-size: 18px;
		font-style: normal;
	}
	.duetime{
	    font-size: 13px;
	    font-weight: 600;
	    letter-spacing: -1px;
	    color: #999;
	    margin-bottom: 6px;
	}
	.item-title>label {
	    font-size: 15px;
	    font-weight: 700;
	    color: #333;
	    letter-spacing: -.9px;
	    margin-left:30px;
	}
	.item-content{
	    padding: 30px 0;
	    font-size: 14px;
	    letter-spacing: -.7px;
	}
	p {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	.cashback-title{
		display: inline-block;
    	height: 24px;
	}
	.basis-cashback-list {
	    margin-top: 6px;
	    margin-left: -10px;
	}
	.cashback-text {
	    display: block;
	    color: #555;
	    letter-spacing: -1px;
	}
	.basis-cashback-list li {
	    font-size: 13px;
	    line-height: 18px;
	    margin-top: 5px;
	}
	.ticket-basis-product{
	    padding: 30px 20px;
    	color: #333;
	}
	.basis-aside-cashback{
	    padding: 20px;
    	border-top: 1px solid #ddd;
	}
	
	.basis-aside-section {
	    padding: 30px 20px;
	    border-top: 1px solid #ddd;
	}
	.basis-cashback-button {
	    margin-top: 8px;
	    margin-left: 30px;
	}
	.basis-cashback-button-text {
	    margin-top: 8px;
	    margin-bottom: 8px;
	    font-size: 14px;
	    font-weight: 700;
	    color: #111;
	}
	.key-info-title {
	    float: left;
	    display: block;
	    width: 65px;
	    top: 0;
	    color: #999;
	}
	.key-info-description {
	    float: left;
	    display: block;
	    width: calc(100% - 65px);
	    padding-left: 8px;
	    color: #111;
	}
	.basis-key-infos{
		padding-inline-start: 0px; 
		font-size: 14px;
	}
	.thumbnail-item{
	    margin-right: 3px;
	    margin-bottom: 3px;
	}
	.sticky{
		position: sticky;
		top: 0;
	}
	.fixed{
		position: fixed;
		top:0;
		z-index:1000;
	    border-bottom: 1px solid #ddd;
	}
	/* 바디에 스크롤 막는 방법 */
	.not_scroll{
	    position: fixed;
	    overflow: hidden;
	    width: 100%;
	    height: 100%;
	}
	.Bookingbtn{
		width: 100%;
		background-color: #346aff;
		color: white;
		padding: 1px;
		margin: 1px;
	}
	#Bookingselect{
	 	width: 100%;
	 	padding: 1px;
	    margin: 1px;
	}
	.travel-icon.icon-adult {
    	width: 11px;
    	height: 18px;
   		background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+Cjxzdmcgd2lkdGg9IjExcHgiIGhlaWdodD0iMThweCIgdmlld0JveD0iMCAwIDExIDE4IiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiPgogICAgPCEtLSBHZW5lcmF0b3I6IFNrZXRjaCA0OC4yICg0NzMyNykgLSBodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2ggLS0+CiAgICA8dGl0bGU+aWNvbl9zZWF0X2FkdWx0PC90aXRsZT4KICAgIDxkZXNjPkNyZWF0ZWQgd2l0aCBTa2V0Y2guPC9kZXNjPgogICAgPGRlZnM+PC9kZWZzPgogICAgPGcgaWQ9IlREUF9ob3RlbCZhbXA7cmVzb3J0IiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjkxLjAwMDAwMCwgLTExMTMuMDAwMDAwKSI+CiAgICAgICAgPGcgaWQ9InJvb21zIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg3MC4wMDAwMDAsIDEwMzguMDAwMDAwKSIgc3Ryb2tlPSIjODg4ODg4Ij4KICAgICAgICAgICAgPGcgaWQ9InBheF9hZHVsdCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNjIxLjAwMDAwMCwgNzAuMDAwMDAwKSI+CiAgICAgICAgICAgICAgICA8ZyBpZD0iaWNvbl9zZWF0X2FkdWx0IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLjAwMDAwMCwgNS4wMDAwMDApIj4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMi4yNSwzLjU5OTk5OTkgQzIuMjUsNS4zMDkwNTc0OCAzLjY0MDk0MjMzLDYuNjk5OTk5ODEgNS4zNDk5OTk5LDYuNjk5OTk5ODEgQzcuMDU5MDU3NDgsNi42OTk5OTk4MSA4LjQ0OTk5OTgxLDUuMzA5MDU3NDggOC40NDk5OTk4MSwzLjU5OTk5OTkgQzguNDQ5OTk5ODEsMS44OTA5NDIzMyA3LjA1OTA1NzQ4LDAuNSA1LjM0OTk5OTksMC41IEMzLjY0MDk0MjMzLDAuNSAyLjI1LDEuODkwOTQyMzMgMi4yNSwzLjU5OTk5OTkgWiBNMTAuNSwxNy41IEwxMC41LDEwLjY5MjMzMDcgQzEwLjUsOC45MTUzNDQ4MiA4LjM5MTc0NjgzLDcuNSA1LjUsNy41IEMyLjYwODI1MzE3LDcuNSAwLjUsOC45MTUzNDQ4MiAwLjUsMTAuNjkyMzMwNyBMMC41LDE3LjUgTDEwLjUsMTcuNSBaIiBpZD0iQ29tYmluZWQtU2hhcGUiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+) no-repeat;
    	background-size: 11px 18px;
	}
	.travel-icon {
	    display: inline-block;
	    text-indent: -9999px;
	}
	/**********************************/
	tr {
	    display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	}
	.lodging-room .room-item {
    	width: 100%;
	    border-collapse: collapse;
	    border-spacing: 0;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ddd;
	}
	.col-summary {
    	width: 170px;
	}
	.col-guest {
	    width: 85px;
	}
	.col-price {
	    width: 133px;
	}
	.col-reservation {
	    width: 119px;
	}
	.room-item th.room-header__item-name {
	    padding-left: 15px;
	    font-size: 18px;
	    color: #111;
	    letter-spacing: -1px;
	}
	.room-item th:first-child {
	    border-left: none;
	}
	.room-item th {
	    padding: 13px 0;
	    background-color: #fafafa;
	    border-left: 1px solid #ddd;
	    border-bottom: 1px solid #ddd;
	}
	.room-item th.room-header__guest {
	    font-size: 16px;
	    font-weight: 400;
	    color: #111;
	    letter-spacing: -1px;
	    text-align: center;
	}
	.room-item th.room-header__price {
	    padding-right: 16px;
	    font-size: 16px;
	    font-weight: 400;
	    color: #333;
	    letter-spacing: -1px;
	    text-align: right;
	    width: 181px;
	}
	.room-item th.room-header__reservation {
	    font-size: 16px;
	    font-weight: 400;
	    color: #333;
	    letter-spacing: -1px;
	    text-align: center;
	}
	.room-item tbody td:first-child {
	    border-left: none;
	}
	.room-item tbody td {
	    padding: 12px;
	    color: #333;
	    border-left: 1px solid #eee;
	    vertical-align: top;
	}
	.room-summary .room-thumbnail {
	    display: block;
	    cursor: pointer;
	}
	.room-summary .room-thumbnail .thumbnail-img {
	    width: 100%;
	    height: 96px;
	     vertical-align: top;
	}
	.room-summary .room-main-facilities li.facility .facility-item {
	    position: relative;
	    display: block;
	    width: 100%;
	}
	.room-summary .room-thumbnail > a {
	    display: block;
	    background: #333;
	    color: #fff;
	    font-size: 12px;
	    text-align: center;
	    padding: 5px;
	    text-decoration: underline;
	    letter-spacing: -1px;
	}
	.rate-plan{
		font-size: 12px;
	}
	.search-item-cash-back {
	    position: relative;
	    display: inline-block;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    height: 20px;
	    padding: 0 8px 0 24px;
	    border-radius: 10px;
	    border: 1px solid #ccc;
	    background-color: #fff;
	    font-size: 12px;
	    line-height: 20px;
	    color: #333;
	}
	.search-item-cash-back .list-cash-icon {
	    position: absolute;
	    top: 2px;
	    left: 4px;
	    width: 14px;
	    height: 14px;
	}
	.travel-web-tdp-price.right {
    text-align: right;
	}
	.travel-web-tdp-price {
	    display: inline-block;
	    min-width: 150px;
	    width: 100%;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".thumbnail-img").click(function(e){
			document.getElementById("thumbnail").style.backgroundImage="url("+e.target.src+")";
			$(".thumbnail-img").each(function(index, item){
				item.style.outline="";
			})
			e.target.style.outline="2px solid green";
		});

		$.fn.Scrolling = function(obj, tar) {
			var _this = this;
			$(window).scroll(function(e) {
				var end = obj + tar;
				$(window).scrollTop() >= obj ? _this.addClass("fixed") : _this.removeClass("fixed");
				if($(window).scrollTop() >= end) _this.removeClass("fixed");
			});
		};
		$("#sticky_menu").Scrolling($("#sticky_menu").offset().top, ($(".travel-scroll-tab").height() - $("#sticky_menu").height()));
		
		$(".travel-scroll-tab-headers>li").click(function(e){
			replaceClass();
			e.target.classList.add("selected");
			var value = e.target.value;
			var url='';
			if(value==1){
				url='selectProduct';
			}
			if(value==2){
				url='introProduct';
			}
			if(value==3){
				url='reviewProduct';
			}
			if(value==4){
				url='inquiryProduct';
			}
            location.href="#"+url;
		});
	    $(".bnt_open").on("click", function(e){
	        $("html, body").addClass("not_scroll");
	    });
	});
	function replaceClass(){
		var elem = $(".selected");
		elem.removeClass("selected");
	}
</script>
<body style="background-color: white;">
    <div id="top" style="margin-bottom:0px;">
        <%@include file="../top.jsp" %>
    </div>
    <div class="container">
	    <div id="travel-container">
	        <div class="travel-detail">
	            <div class="travel-detail-container" style="width:1100px;">
	                <section class="travel-detail-content">
	                    <div class="travel-carousel-container">
	                        <div class="travel-carousel use-background clickable" style="width: 100%; height: 512px;">
	                        	<div class="carousel-image" id="thumbnail" style="height: 512px; background-image: url(/uploads/${Total_journey.j_title_image }); background-color:rgb(85,85,85);"></div>
	                        </div>
	                        <div class="travel-thumbnail">
	                            <div class="thumbnails-wrap" style="width:527px;">
	                                <ul class="thumbnails" style="margin:10px;">
	                                	<li><a class="thumbnail-item">
	                                	<img src="/uploads/${Total_journey.j_title_image }" class="thumbnail-img" style="outline:2px solid green;"/>
	                                	</a></li>
	                                	<c:if test="${not empty Total_journey.j_image1 }">
	                                		<li><a class="thumbnail-item"><img src="/uploads/${Total_journey.j_image1 }" class="thumbnail-img" />
	                                		<c:if test="${not empty Total_journey.j_image2 }">
			                                	<li><a class="thumbnail-item"><img src="/uploads/${Total_journey.j_image2 }" class="thumbnail-img" /></a></li>
	                                			<c:if test="${not empty Total_journey.j_image3 }">
		            	        	            	<li><a class="thumbnail-item"><img src="/uploads/${Total_journey.j_image3 }" class="thumbnail-img" /></a></li>
	                	        	        		<c:if test="${not empty Total_journey.j_image4 }">
			    	        	                    	<li><a class="thumbnail-item"><img src="/uploads/${Total_journey.j_image4 }" class="thumbnail-img" /></a></li>
				                                	</c:if>
			                                	</c:if>
		                                	</c:if>
	                                	</c:if>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
                	    <article class="travel-scroll-tab" style="margin-bottom:100px; margin-top:10px;">
	                        <section class="travel-scroll-tab-header">
	                            <div class="travel-scroll-tab-header-wrapper" id="sticky_menu" style="width:100%">
	                                <ul class="travel-scroll-tab-headers lg"> 
	                                    <li class="lg selected" value="1">객실 선택</li>
	                                    <li class="lg" value="2">숙소 설명</li>
	                                    <li class="lg" value="3">상품평</li>
	                                    <li class="lg" value="4">상품문의</li>
	                                </ul>
	                            </div>
		                        <div class="ilpPanel" style="margin-bottom:10px;" id="selectProduct">
		                        	<div class="ticket-detail-vendor-items">
										<c:forEach items="${Total_Journey_info}" var="row"
											varStatus="loop">
											<table class="room-item">
												<colgroup>
													<col class="col-summary">
													<col>
													<col class="col-guest">
													<col class="col-price">
													<col class="col-reservation">
												</colgroup>
												<thead>
													<tr>
														<th class="room-header__item-name" colspan="2">${row.ji_title }</th>
														<th class="room-header__guest">인원</th>
														<th class="room-header__price">1박 기준 요금</th>
														<th class="room-header__reservation">예약</th>
													</tr>
												</thead>
												<tbody>
													<tr data-rate-category-id="3245">
														<td rowspan="1"><div class="room-summary">
																<div class="room-thumbnail">
																	<span>${row.ji_image1 }</span> <a>객실사진 및 정보 더보기
																		&gt;</a>
																</div>
															</div></td>
														<td>
															<ul class="room-rate-plans">
																<li class="room-rate-plan">
																	<span class="rate-plan">
																	 ${row.ji_intro}
																	</span>
																</li>
															</ul>
														</td>
														<td><ul class="room-guest">
																<li><span class="travel-icon-text room-guest-text"
																	style="line-height: 20px;"> <i
																		class="travel-icon icon-adult"
																		style="margin-bottom: 2px; margin-right: 3px;">icon</i>
																		x ${row.ji_adult } <c:if test="${row.ji_kid ne 0}">
																			<i class="bi bi-person"></i>x<b>${row.ji_kid }</b>
																		</c:if>
																</span></li>
															</ul></td>
														<td><c:choose>
																<c:when test="${row.ji_roomnum ne 0 }">
																	<div class="rate-category-price">
																		<div
																			class="travel-web-tdp-price travel-price__md right">
																			<div class="travel-price__discount">
																				<div>
																					<span class="travel-price__dynamic-discount">
																						<em class="price"><b><fmt:formatNumber
																									value="${row.ji_price}" />원</b></em>
																					</span> <span class="travel-price__discount-rate">
																						<c:if test="${row.ji_discount ne 0 }">
																							<span class="price_title">할인판매가</span>
																							<br />
																							<em class="price"> <b> <fmt:formatNumber
																										value="${(row.ji_price)*(100-row.ji_discount)/100 }" />원
																							</b>
																							</em>
																							<br />
																						</c:if>
																					</span>
																				</div>
																			</div>
																			<div class="travel-price__cashback">
																				<div class="search-item-cash-back">
																					<img class="list-cash-icon"
																						src="//image11.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png">
																					<span class="ctravel-price__sale benefit"> <em>최대
																							<fmt:formatNumber
																								value="${(row.ji_price)*(100-row.ji_discount)/100*0.05 }"
																								pattern="#,##0" />원 적립
																					</em>
																					</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</c:when>
																<c:otherwise>
																	<span>매진</span>
																</c:otherwise>
															</c:choose></td>
														<td>
															<div class="rate-category-reservation">
																<div class="travel-select full-width"
																	style="margin: 0px;">
																	<input type="hidden" value="${row.ji_idx}" />
																	<c:choose>
																		<c:when test="${row.ji_roomnum > 0}">
																			<select name="" id="Bookingselect">
																				<c:forEach begin="1" end="${row.ji_roomnum}" var="i">
																					<option>객실 ${i}개</option>
																				</c:forEach>
																			</select>
																			<button class="Bookingbtn">예약</button>
																		</c:when>
																		<c:otherwise>
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</c:forEach>
									</div>
		                     </div>
		                        <div class="service-infomation" style="margin-bottom: 10px;" id="introProduct">
		                        <c:if test="${Total_journey.j_conservice ne '' && Total_journey.j_confacility ne '' && Total_journey.common_items ne ''}">
	                        		<table class="ticket-service-infomation" style="width:100%;">
	                        			<colgroup>
	                        				<col width="30%"/>
	                        				<col width="*"/>
	                        			</colgroup>
	                        			<tr>
	                        				<th colspan="2">시설안내</th>
	                        			</tr>
	                        			<c:if test="${Total_journey.common_items ne ''}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>공통구비품목</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							${Total_journey.common_items }
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                        			<c:if test="${Total_journey.j_confacility ne ''}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>편의시설</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
			                       						${Total_journey.j_confacility }
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                        			<c:if test="${Total_journey.j_conservice ne ''}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>편의서비스</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
			                       						${Total_journey.j_conservice}
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                        		</table>
		                        </c:if>
		                        </div>
		                        <div class="cancellation-refund-policy" style="margin-bottom: 10px;">
	                        		<table class="ticket-cancellation-refund-policy" style="width:100%;">
	                        			<colgroup>
	                        				<col width="30%"/>
	                        				<col width="*"/>
	                        			</colgroup>
	                        			<tr>
	                        				<th colspan="2">숙소 정책</th>
	                        			</tr>
	                        			<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>숙소 정책</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.loging_policy}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>체크인/체크아웃</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.check_io}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>예약안내</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.j_booking}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<c:if test="${Total_Journey.add_fare ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>추가 인원</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.add_fare }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<c:if test="${Total_Journey.add_bed ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>추가 침구류</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.add_bed }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<c:if test="${Total_Journey.breakfast_noti ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>조식 유의사항</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.breakfast_noti }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<!------------------------------------------------------------------->
	                       				<c:if test="${Total_Journey.j_notice ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>유의사항</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.j_notice }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>취소수수료 안내</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.j_cancelfee}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>취소 유의사항</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.j_cancelnoti }
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                        		</table>
		                        </div>
								<div class="reviewProduct" style="margin-bottom: 10px;"
									id="reviewProduct">
									<table class="ticket-cancellation-refund-policy"
										style="width: 100%;">
										<colgroup>
											<col width="30%" />
											<col width="*" />
										</colgroup>
										<tr>
											<th colspan="2">리뷰</th>
										</tr>
										<tr>
											<td><c:forEach items="${lists }" var="row">
													<div class="border mt-2 mb-2">
														<!--  -->
														<ul class="comment">
															<li>
															</li>
														</ul>
														<!--  -->
														<div class="media">
															<c:forEach begin="1" end="5" var="i">
																<c:choose>
																	<c:when test="${Math.round(row.star_rate) >= i }">
																		<div class="star-ratings">
																			<div class="star-ratings-fill space-x-2 text-lg"
																				:style="{ width: ratingToPercent + '%' }">
																				<span>★</span>
																			</div>
																			<div class="star-ratings-base space-x-2 text-lg">
																				<span>★</span>
																			</div>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="star-ratings text-lg">
																			<span>★</span>
																		</div>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</div>
														<div class="media-body">
															<p class="star-ratings">${row.summary }</p>
																<p>${row.review }</p>
															<div class="media">가격&nbsp;&nbsp;&nbsp;
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when test="${Math.round(row.star_servey1) >= i }">
																			<div class="star-ratings">
																				<div class="star-ratings-fill space-x-2 text-lg"
																					:style="{ width: ratingToPercent + '%' }">
																					<span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span>
																				</div>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="star-ratings text-lg">
																				<span>★</span>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="media">서비스&nbsp;
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when test="${Math.round(row.star_servey2) >= i }">
																			<div class="star-ratings">
																				<div class="star-ratings-fill space-x-2 text-lg"
																					:style="{ width: ratingToPercent + '%' }">
																					<span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span>
																				</div>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="star-ratings text-lg">
																				<span>★</span>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="media">시설&nbsp;&nbsp;&nbsp;
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when test="${Math.round(row.star_servey3) >= i }">
																			<div class="star-ratings">
																				<div class="star-ratings-fill space-x-2 text-lg"
																					:style="{ width: ratingToPercent + '%' }">
																					<span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span>
																				</div>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="star-ratings text-lg">
																				<span>★</span>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</div>
														</div>
												</c:forEach>
											</td>
									</table>
								</div>

								<div id="inquiryProduct">
		                        
		                        </div>
	                        </section>
	                    </article>
	                </section>

	                <aside class="travel-detail-basis">
	                	<div class="ticket-basis-product">
		                	<div class="basis-product">
		                		<h2 style="margin-top: 0px; margin-bottom: 5px;">${j_title }</h2>
			                	<div class="basis-product-address">
			                	<span style="font-size: 12px;">${Total_Journey.location}</span>
			                	</div>
								<input type="hidden" name="ratevalue5" value="${totalstar.star_rate}"
									step="0.1" min="0" max="5" />
								<div class="rating-wrap5">
									<div class="rating5">
										<div class="overlay5"></div>
									</div>
								</div>
		                	</div>
		                </div>
		                
	                	<div class="basis-aside-cashback">
	                		<div class="basis-product-cashback-column">
	                			<div class="cashback-title">포인트 적립</div>
	                			<span class="cashback-info-separator">|</span>
	                			<ul class="basis-cashback-list">
	                				<li>
	                					<span class="cashback-text">루페이 머니 결제 시 1% 적립</span>
	                				</li>
	                				<li>
	                					<span class="cashback-text">[로켓와우 + 루페이 계좌이체] 결제 시 2% 적립</span>
	                				</li>
	                				<li>
	                					<span class="cashback-text">[로켓와우 + 루페이 머니] 결제 시 4% 추가적립</span>
	                				</li>
	                			</ul>
	                			<div class="basis-cashback-button">
	                				<span class="basis-cashback-button-text">아직 멤버쉽 회원이 아니신가요?</span><br />
	                				<button type="button" class="btn btn-primaryinfo">멤버쉽 가입하기</button>
	                			</div>
	                		</div>
	                	</div>
	                	
	                	<div class="basis-aside-section" style="margin-bottom:140px;" >
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
	                			<li class="basis-key-info">
	                				<label class="key-info-title">취소가능</label>
	                				<span class="key-info-description">미사용 100% 환불가능</span>
	                			</li>
	                		</ul>
	                	</div>
	                	
	                	<div class="basis-aside-section">
	                		<div class="basis-introduction introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">소개</h4>
	                			<div class="introduction-text-wrapper">
	                				<p class="introduction-text">${Total_Journey.j_intro }</p>
	                			</div>
	                		</div>
	                		<c:if test="${Total_Journey.notice ne null }">
	                		<div class="basis-introduction introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">알려드리는 말</h4>
	                			<div class="introduction-text-wrapper">
	                				<p class="introduction-text">${Total_Journey.notice }</p>
	                			</div>
	                		</div>
	                		</c:if>
	                		<div class="basis-location introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">위치</h4>
	                			<span class="item-subtitle"></span>
	                		</div>
	                		<div class="travel-simple-map">
	                			<input type="hidden" id="location" value="${Total_Journey.location}" />
								<div id="map" style="width:100%;height:350px;"></div>
	                		</div>
	                		<script type="text/javascript">
	                		 kakao.maps.load(function() {
	           				  var locationValues = document.getElementById("location").value.split(',');
	           				  var mapContainer = document.getElementById('map');
	           				  var mapOption = {
	           				    center: new kakao.maps.LatLng(33.450701, 126.570667),
	           				    level: 5
	           				  };
	           				  var map = new kakao.maps.Map(mapContainer, mapOption);
	           				  var geocoder = new kakao.maps.services.Geocoder();
	           				  var bounds = new kakao.maps.LatLngBounds();
	           				
	           				  for (var i = 0; i < locationValues.length; i++) {
	           				    (function(i) {
	           				      geocoder.addressSearch(locationValues[i], function(result, status) {
	           				        if (status === kakao.maps.services.Status.OK) {
	           				          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	           				          var marker = new kakao.maps.Marker({
	           				            map: map,
	           				            position: coords
	           				          });
	           				          var infowindow = new kakao.maps.InfoWindow({
	           				            content: '<div>' + locationValues[i]+ '</div>'
	           				          });
	           				          kakao.maps.event.addListener(marker, 'click', function() {
	           				            infowindow.open(map, marker);
	           				          });
	           				          bounds.extend(coords);
	           				          map.setBounds(bounds);
	           				        }
	           				      });
	           				    })(i)	           				  
	           				    };
	           				});
	                		</script>
	                	</div>
	                	<div class="basis-aside-section">
	                		<div class="basis-review-section">
             						<div class="star-ratings">
					          <input type="hidden" name="ratevalue1" value="${totalstar.star_rate}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap1">
					            <div class="rating1">상품평 
					                <div class="overlay1"></div> 
					            </div>${totalstar.star_rate0}
					          </div>
								</div>
								<div class="star-ratings">
					          <input type="hidden" name="ratevalue2" value="${totalstar.star_servey1}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap2">
					            <div class="rating2">가격
					                <div class="overlay2"></div>
					            </div>
					          </div>
								</div>
								<div class="star-ratings">
					          <input type="hidden" name="ratevalue3" value="${totalstar.star_servey2}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap3">
					            <div class="rating3">서비스
					                <div class="overlay3"></div>
					            </div>
					          </div>
								</div>
								<div class="star-ratings">
					          <input type="hidden" name="ratevalue4" value="${totalstar.star_servey3}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap4">
					            <div class="rating4">시설
					                <div class="overlay4"></div>
					            </div>
					          </div>
								</div>
	                			<c:forEach items="${lists}" var="row">
									<div class="border mt-2 mb-2">
										<div class="media-body">
											<!--  -->
											<p class="star-ratings">
											${row.summary }
											</p>
											<p>
											${row.review }
											</p>
										</div>
								</c:forEach>
	                		</div>
	                	</div>
	                </aside>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content" id="modal_content">
	    	</div>
	    </div>
    </div>
</body>
</html>
