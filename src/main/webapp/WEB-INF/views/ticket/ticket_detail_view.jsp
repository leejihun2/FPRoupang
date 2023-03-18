<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6076fe794faf6e2a97f29c6ebfadce5&libraries=services"></script>

<meta charset="UTF-8">
<title>Roupang</title>
<!-- 쿠팡 타이틀 이미지 -->
<link rel="shortcut icon"
	href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico"
	type="image/x-icon" />
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
<link rel="stylesheet" href="../css/reviewdetail.css" type="text/css">
<script src="../js/star.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<style>
<<<<<<<
HEAD
* {
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

.cashback-area {
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
	margin-left: 50px;
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
	margin-left: 20px;
}

.thumbnail-img {
	width: 50px;
	height: 50px;
}

.travel-thumbnail:after .thumbnails:after, .travel-thumbnail:after .travel-scroll-tab-header:after .travel-scroll-tab-header-wrapper:after
	{
	content: "";
	display: block;
	clear: both;
}

.travel-scroll-tab-header-wrapper {
	display: flex;
	background-color: white;
	z-index: 0;
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

.basis-cashback-list {
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

.travel-scroll-tab-headers.lg li.selected, .travel-scroll-tab-headers.lg li:hover
	{
	font-weight: 700;
	color: #00a289;
	border-bottom: 3px solid #00a289;
}

.travel-scroll-tab-headers {
	clear: both;
}

.ticket-detail-vendor-items-result th {
	text-align: center;
	padding: 13px 0;
	border-bottom: 1px solid #ddd;
}

.ticket-cancellation-refund-policy th {
	padding: 13px 13px;
	background-color: #FFFEED;
	border-top: 1px solid #ddd;
}

th {
	height: 56px;
	padding: 13px 13px;
	background-color: #fafafa;
	border-top: 1px solid #ddd;
}

table th:not(:first-child) {
	border-left: 1px solid #ddd;
}

.ticket-detail-vendor-items-result td {
	height: 56px;
	padding: 13px 10px;
	border-bottom: 1px solid #ddd;
	border-top: 1px solid #ddd;
}

td {
	height: 56px;
	padding: 13px 10px;
}

.ticket-detail-vendor-items-result td:nth-child(2n+1) {
	letter-spacing: -1px;
	line-height: 23px;
	font-size: 14px;
	font-weight: 400;
}

tr:not(:last-child) td:nth-child(2n) {
	border-bottom: 1px solid #ddd;
}

.ticket-detail-vendor-items-result td:not(:first-child) {
	border-left: 1px solid #ddd;
}

.price_title {
	font-size: 13px;
	padding-right: 0;
}

.price {
	font-size: 18px;
	font-style: normal;
}

.duetime {
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
	margin-left: 30px;
}

.item-content {
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

.cashback-title {
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

.ticket-basis-product {
	padding: 30px 20px;
	color: #333;
}

.basis-aside-cashback {
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

.basis-key-infos {
	padding-inline-start: 0px;
	font-size: 14px;
}

.thumbnail-item {
	margin-right: 3px;
	margin-bottom: 3px;
}

.sticky {
	position: sticky;
	top: 0;
}

.fixed {
	position: fixed;
	top: 0;
	z-index: 1000;
	border-bottom: 1px solid #ddd;
}
/* 바디에 스크롤 막는 방법 */
.not_scroll {
	position: fixed;
	overflow: hidden;
	width: 100%;
	height: 100%
}

.inquiryContents {
	border: 1px solid #ddd;
	padding: 30px;
}

.inquiry-title {
	float: left;
	line-height: 40px;
	margin-top: 0px;
	margin-bottom: 0px;
}

.inquiryContents button {
	width: 80px;
	height: 36px;
	line-height: 34px;
	float: right;
	font-size: 14px;
	font-weight: 700;
	background-color: #fff;
	color: #346aff;
	border: 1px solid #346aff;
}

.inquiry-header:after {
	content: "";
	display: block;
	clear: both;
}

.inquiry-header {
	margin-bottom: 25px;
}

.inquiry-notice li {
	font-size: 13px;
	letter-spacing: -1px;
	color: #555;
}

.inquiry-notice {
	margin-bottom: 30px;
	overflow: hidden;
}

#myModal {
	position: fixed;
	z-index: 9999;
}

=======
* {
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

.cashback-area {
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
	margin-left: 50px;
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
	margin-left: 20px;
}

.thumbnail-img {
	width: 50px;
	height: 50px;
}

.travel-thumbnail:after .thumbnails:after, .travel-thumbnail:after .travel-scroll-tab-header:after .travel-scroll-tab-header-wrapper:after
	{
	content: "";
	display: block;
	clear: both;
}

.travel-scroll-tab-header-wrapper {
	display: flex;
	background-color: white;
	z-index: 0;
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

.basis-cashback-list {
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

.travel-scroll-tab-headers.lg li.selected, .travel-scroll-tab-headers.lg li:hover
	{
	font-weight: 700;
	color: #00a289;
	border-bottom: 3px solid #00a289;
}

.travel-scroll-tab-headers {
	clear: both;
}

.ticket-detail-vendor-items-result th {
	text-align: center;
	padding: 13px 0;
	border-bottom: 1px solid #ddd;
}

.ticket-cancellation-refund-policy th {
	padding: 13px 13px;
	background-color: #FFFEED;
	border-top: 1px solid #ddd;
}

th {
	height: 56px;
	padding: 13px 13px;
	background-color: #fafafa;
	border-top: 1px solid #ddd;
}

table th:not(:first-child) {
	border-left: 1px solid #ddd;
}

.ticket-detail-vendor-items-result td {
	height: 56px;
	padding: 13px 10px;
	border-bottom: 1px solid #ddd;
	border-top: 1px solid #ddd;
}

td {
	height: 56px;
	padding: 13px 10px;
}

.ticket-detail-vendor-items-result td:nth-child(2n+1) {
	letter-spacing: -1px;
	line-height: 23px;
	font-size: 14px;
	font-weight: 400;
}

tr:not(:last-child) td:nth-child(2n) {
	border-bottom: 1px solid #ddd;
}

.ticket-detail-vendor-items-result td:not(:first-child) {
	border-left: 1px solid #ddd;
}

.price_title {
	font-size: 13px;
	padding-right: 0;
}

.price {
	font-size: 18px;
	font-style: normal;
}

.duetime {
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
	margin-left: 30px;
}

.item-content {
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

.cashback-title {
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

.ticket-basis-product {
	padding: 30px 20px;
	color: #333;
}

.basis-aside-cashback {
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

.basis-key-infos {
	padding-inline-start: 0px;
	font-size: 14px;
}

.thumbnail-item {
	margin-right: 3px;
	margin-bottom: 3px;
}

.sticky {
	position: sticky;
	top: 0;
}

.fixed {
	position: fixed;
	top: 0;
	z-index: 1000;
	border-bottom: 1px solid #ddd;
}
/* 바디에 스크롤 막는 방법 */
.not_scroll {
	position: fixed;
	overflow: hidden;
	width: 100%;
	height: 100%
}

.inquiryContents {
	border: 1px solid #ddd;
	padding: 30px;
}

.inquiry-title {
	float: left;
	line-height: 40px;
	margin-top: 0px;
	margin-bottom: 0px;
}

.inquiryContents button {
	width: 80px;
	height: 36px;
	line-height: 34px;
	float: right;
	font-size: 14px;
	font-weight: 700;
	background-color: #fff;
	color: #346aff;
	border: 1px solid #346aff;
}

.inquiry-header:after {
	content: "";
	display: block;
	clear: both;
}

.inquiry-header {
	margin-bottom: 25px;
}

.inquiry-notice li {
	font-size: 13px;
	letter-spacing: -1px;
	color: #555;
}

.inquiry-notice {
	margin-bottom: 30px;
	overflow: hidden;
}

#myModal {
	position: fixed;
	z-index: 9999;
}

.container:after {
	clear: both;
	display: block;
	content: "";
}
>>>>>>>
branch

 

'
main


'
of

 

https


:
//


github


.com
/


leejohun
/


FPRoupang


.git
</style>
<script type="text/javascript">
	onload = function(){
		var mapContainer = document.getElementById('map'),
		mapOption = {center: new kakao.maps.LatLng(33.450701, 126.570667),level: 5};  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다 (membership테이블에 사업장 주소명을 파라미터로 받는다.])
		geocoder.addressSearch('대구광역시 동구 동부로 149 9층', function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    // 결과값으로 받은 위치를 마커로 표시
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
	    	// 인포윈도우로 장소에 대한 설명을 표시
		    var infowindow = new kakao.maps.InfoWindow({});
		    infowindow.open(map);
		    map.setCenter(coords);
			} 
		});  
	}
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
	        $("ul").attr("style","margin-bottom:0px; padding-left:0px;");
	        $("a").attr("style","text-decoration:none");
	        $(".gnb-menu").attr("style","margin-top:10px; margin-left:65px; padding-left:0px;");
	        $(".thumbnails").attr("style","margin:10px; padding-left:0px;")
	    });
	});
	
	function replaceClass(){
		var elem = $(".selected");
		elem.removeClass("selected");
	}
	
	function addModal(bot_num, idx){
		$('.modal-content').load('/showModal?bot_idx='+bot_num+'&ti_idx='+idx+'&seller_idx='+$("#seller_idx").val());
	}
	
	onload = function(){
		var mapContainer = document.getElementById('map'),
		mapOption = {center: new kakao.maps.LatLng(33.450701, 126.570667),level: 3};  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다 (membership테이블에 사업장 주소명을 파라미터로 받는다.])
		geocoder.addressSearch('서울시 중구 신당동 432-2008', function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    // 결과값으로 받은 위치를 마커로 표시
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
	    	// 인포윈도우로 장소에 대한 설명을 표시
		    var infowindow = new kakao.maps.InfoWindow({});
		    infowindow.open(map);
		    map.setCenter(coords);
			} 
		});  
	}
</script>
<body style="background-color: white;">
	<div id="top" style="margin-bottom: 0px;">
		<%@include file="../top.jsp"%>
	</div>
	<div class="container">
		<div id="travel-container">
			<div class="travel-detail">
				<div class="travel-detail-container" style="width: 1100px;">
					<section class="travel-detail-content">
						<div class="travel-carousel-container">
							<div class="travel-carousel use-background clickable"
								style="width: 100%; height: 512px;">
								<div class="carousel-image" id="thumbnail"
									style="height: 512px; background-image: url(/uploads/${Total_Ticket.t_title_image }); background-color:rgb(85,85,85);"></div>
							</div>
							<input type="hidden" id="seller_idx"
								value="${Total_Ticket.member_idx}" />
							<div class="travel-thumbnail">
								<div class="thumbnails-wrap" style="width: 527px;">
									<ul class="thumbnails" style="margin: 10px;">
										<li><a class="thumbnail-item"> <img
												src="/uploads/${Total_Ticket.t_title_image }"
												class="thumbnail-img" style="outline: 2px solid green;" />
										</a></li>
										<c:if test="${not empty Total_Ticket.t_image1 }">
											<li><a class="thumbnail-item"><img
													src="/uploads/${Total_Ticket.t_image1 }"
													class="thumbnail-img" /></a></li>
											<c:if test="${not empty Total_Ticket.t_image2 }">
												<li><a class="thumbnail-item"><img
														src="/uploads/${Total_Ticket.t_image2 }"
														class="thumbnail-img" /></a></li>
												<c:if test="${not empty Total_Ticket.t_image3 }">
													<li><a class="thumbnail-item"><img
															src="/uploads/${Total_Ticket.t_image3 }"
															class="thumbnail-img" /></a></li>
													<c:if test="${not empty Total_Ticket.t_image4 }">
														<li><a class="thumbnail-item"><img
																src="/uploads/${Total_Ticket.t_image4 }"
																class="thumbnail-img" /></a></li>
													</c:if>
												</c:if>
											</c:if>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<article class="travel-scroll-tab"
							style="margin-bottom: 100px; margin-top: 10px;">
							<section class="travel-scroll-tab-header">
								<div class="travel-scroll-tab-header-wrapper" id="sticky_menu"
									style="width: 100%">
									<ul class="travel-scroll-tab-headers lg">
										<li class="lg selected" value="1">상품 선택</li>
										<li class="lg" value="2">상품 설명</li>
										<li class="lg" value="3">상품평</li>
										<li class="lg" value="4">상품문의</li>
									</ul>
								</div>
								<div class="ilpPanel" style="margin-bottom: 10px;"
									id="selectProduct">
									<div class="ticket-detail-vendor-items">
										<table class="ticket-detail-vendor-items-result"
											style="width: 100%;">
											<colgroup>
												<col width="55%" />
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tr>
												<th>상품명</th>
												<th>요금</th>
												<th>선택</th>
											</tr>
											<c:forEach items="${Total_Ticket_info}" var="row"
												varStatus="loop">
												<tr>
													<td>
														<p>
															<b>${row.ti_title }</b>
														</p>
														<p class="duetime">유효기간 : ${row.ti_duetime1 }~${row.ti_duetime2 }</p>
														${row.ti_intro }
													</td>
													<td style="text-align: right;"><span
														class="price_title">루팡판매가</span> <br /> <em class="price"><b><fmt:formatNumber
																	value="${row.ti_price}" />원</b></em><br />
														<div class="ticket_price" style="color: rgb(174, 0, 0);">
															<c:if test="${row.ti_discount ne 0 }">
																<span class="price_title">할인판매가</span>
																<br />
																<em class="price"><b><fmt:formatNumber
																			value="${(row.ti_price)*(100-row.ti_discount)/100 }" />원</b></em>
																<br />
															</c:if>
														</div>
														<div class="cashback-area">
															<div class="search-item-cash-back">
																<span class="cash-text"> <em>최대 <fmt:formatNumber
																			value="${(row.ti_price)*(100-row.ti_discount)/100*0.05 }"
																			pattern="#,##0" />원 적립
																</em>
																</span>
															</div>
														</div></td>
													<td>
														<button class="btn btn-primaryinfo bnt_open" type="button"
															onclick="addModal(${row.bot_idx},${row.ti_idx})"
															data-toggle="modal" data-target="#myModal">선택</button>
													</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
								<div class="service-infomation" style="margin-bottom: 10px;"
									id="introProduct">
									<c:if
										test="${Total_Ticket.t_conservice ne null && Total_Ticket.t_fac ne null}">
										<table class="ticket-service-infomation" style="width: 100%;">
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tr>
												<th colspan="2">시설안내</th>
											</tr>
											<c:if test="${Total_Ticket.t_conservice ne null}">
												<tr>
													<td>
														<h4 class="item-title">
															<label>편의시설</label>
														</h4>
													</td>
													<td>
														<div class="item-content">
															${Total_Ticket.t_conservice }</div>
													</td>
												</tr>
											</c:if>
											<c:if test="${Total_Ticket.t_fac ne null}">
												<tr>
													<td>
														<h4 class="item-title">
															<label>이용시설</label>
														</h4>
													</td>
													<td>
														<div class="item-content">${Total_Ticket.t_fac }</div>
													</td>
												</tr>
											</c:if>
										</table>
									</c:if>
								</div>
								<div class="instruction-manual" style="margin-bottom: 10px;">
									<table class="ticket-instruction-manual" style="width: 100%;">
										<colgroup>
											<col width="30%" />
											<col width="*" />
										</colgroup>
										<tr>
											<th colspan="2">사용방법</th>
										</tr>
										<c:if test="${Total_Ticket.t_notice ne null}">
											<tr>
												<td>
													<h4 class="item-title">
														<label>유의사항</label>
													</h4>
												</td>
												<td>
													<div class="item-content">
														<p class="policy-text">${Total_Ticket.t_notice }</p>
													</div>
												</td>
											</tr>
										</c:if>
										<tr>
											<td>
												<h4 class="item-title">
													<label>예약안내</label>
												</h4>
											</td>
											<td>
												<div class="item-content">
													<p class="policy-text">${Total_Ticket.t_booking }</p>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="cancellation-refund-policy"
									style="margin-bottom: 10px;">
									<table class="ticket-cancellation-refund-policy"
										style="width: 100%;">
										<colgroup>
											<col width="30%" />
											<col width="*" />
										</colgroup>
										<tr>
											<th colspan="2">취소/환불규정</th>
										</tr>
										<tr>
											<td>
												<h4 class="item-title">
													<label>취소수수료 안내</label>
												</h4>
											</td>
											<td>
												<div class="item-content">
													<p class="policy-text">${Total_Ticket.t_cancelfee}</p>
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
													<p class="policy-text">${Total_Ticket.t_cancelnoti }</p>
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
															<li></li>
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
															<div class="media">
																가격&nbsp;&nbsp;&nbsp;
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
															<div class="media">
																서비스&nbsp;
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
															<div class="media">
																시설&nbsp;&nbsp;&nbsp;
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
												</c:forEach></td>
										</tr>
									</table>
								</div>

								<div id="inquiryProduct">
									<section class="inquiryContents">
										<div class="inquiry-header">
											<h4 class="inquiry-title">상품문의</h4>
											<button type="button"
												onclick="location.href='/supports/voc.do'">문의하기</button>
										</div>
										<ul class="inquiry-notice">
											<li>구매한 상품의 <strong>취소/환불은 마이루팡 구매내역에서 신청</strong>
												가능합니다.
											</li>
											<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
											<li><strong>가격, 판매자, 취소/환불 및 배송 등 해당 상품 자체와 관련
													없는 문의는 고객센터 내 1:1 문의하기</strong>를 이용해주세요.</li>
											<li><strong>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설,
													비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</strong></li>
											<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.
											</li>
										</ul>
										<div class="inquiry-content">
											<table style="border-top: solid 3px; width: 100%;">
												<c:choose>
													<c:when test="${not empty inquryList }">

													</c:when>
													<c:otherwise>
														<tr>
															<td style="text-align: center; height: 250px;"><strong>문의사항이
																	없습니다.</strong></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</section>
								</div>
							</section>
						</article>
					</section>

					<aside class="travel-detail-basis">
						<div class="ticket-basis-product">
							<div class="basis-product">
								<h2 style="margin-top: 0px; margin-bottom: 5px;">${t_title }</h2>
								<div class="basis-product-address"></div>
								<input type="hidden" name="ratevalue5"
									value="${totalstar.star_rate}" step="0.1" min="0" max="5" />
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
									<li><span class="cashback-text">루페이 머니 결제 시 1% 적립</span></li>
									<li><span class="cashback-text">[로켓와우 + 루페이 계좌이체]
											결제 시 2% 적립</span></li>
									<li><span class="cashback-text">[로켓와우 + 루페이 머니] 결제
											시 4% 추가적립</span></li>
								</ul>
								<div class="basis-cashback-button">
									<span class="basis-cashback-button-text">아직 멤버쉽 회원이
										아니신가요?</span><br />
									<button type="button" class="btn btn-primaryinfo">멤버쉽
										가입하기</button>
								</div>
							</div>
						</div>

						<div class="basis-aside-section" style="margin-bottom: 140px;">
							<ul class="basis-key-infos">
								<li class="basis-key-info"><label class="key-info-title">바로사용</label>
									<span class="key-info-description">오늘부터 사용가능</span></li>
								<li class="basis-key-info"><label class="key-info-title">티켓타입</label>
									<span class="key-info-description">이용 기간 내 사용</span></li>
								<li class="basis-key-info"><label class="key-info-title">사용방법</label>
									<span class="key-info-description">QR/바코드 확인 후 입장</span></li>
								<li class="basis-key-info"><label class="key-info-title">예약필요</label>
									<span class="key-info-description">구매 후 자동 예약</span></li>
								<li class="basis-key-info"><label class="key-info-title">취소가능</label>
									<span class="key-info-description">미사용 100% 환불가능</span></li>
							</ul>
						</div>

						<div class="basis-aside-section">
							<div class="basis-introduction introduction-item">
								<h4 class="travel-title travel-title-sm"
									style="margin-top: 0px; margin-bottom: 10px;">소개</h4>
								<div class="introduction-text-wrapper">
									<p class="introduction-text">${Total_Ticket.t_intro }</p>
								</div>
							</div>
							<c:if test="${Total_Ticket.notice ne null }">
								<div class="basis-introduction introduction-item">
									<h4 class="travel-title travel-title-sm"
										style="margin-top: 0px; margin-bottom: 10px;">알려드리는 말</h4>
									<div class="introduction-text-wrapper">
										<p class="introduction-text">${Total_Ticket.notice }</p>
									</div>
								</div>
							</c:if>
							<div class="basis-location introduction-item">
								<h4 class="travel-title travel-title-sm"
									style="margin-top: 0px; margin-bottom: 10px;">위치</h4>
								<span class="item-subtitle"></span>
							</div>
							<div class="travel-simple-map">
								<div id="map" style="width: 100%; height: 350px;"></div>
							</div>
						</div>


						<div class="basis-aside-section">
							<div class="basis-review-section">
								<div class="basis-review-section-rating">
									<label class="basis-review-section-title">상품평</label>
									<div class="basis-review-section-rating-star rating-star"
										style="width: 110px; height: 22px;">
										<div class="rating-star-empty" style="background-size: 22px;"></div>
										<div class="rating-star-full"
											style="width: 110px; background-size: 22px;"></div>
									</div>
									<span class="basis-review-section-count">3 &gt;</span>
								</div>
								<ul class="basis-review-section-list">
									<div class="basis-review-section-list-item">
										<div class="basis-review-item">
											<div
												style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 4;">
												아쿠아 필드 좋아해서 미리 예매해 가보았어요 요즘 사람들 마스크 전부 안쓰네요 실내에서도 마스크 해제되서
												안써도되나? 하고 안썼다가 감기몸살 옴팡 지게 걸렸어요. 코로나일지도… 마스크는 쓰는게 좋겠습니다.</div>
											<div class="basis-review-item-author">
												<img class="basis-review-item-author-icon"
													src="//img1a.coupangcdn.com/image/productreview/web/pdp/profile/img-profile-empty.png"><span
													class="basis-review-item-author-name">슈퍼윙스</span>
											</div>
										</div>
									</div>
								</ul>
								<div class="basis-review-section-all">
									<a class="basis-review-section-all-link">전체 상품평 보기</a>
								</div>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</div>
	<div id="copyright">
		<c:import url="../copyright.jsp"></c:import>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" id="modal_content"></div>
		</div>
	</div>
</body>
</html>
