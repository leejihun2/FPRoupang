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
	*{
	    margin: 0;
	    padding: 0;
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
	    width: 685px;
	}
	.travel-thumbnail .thumbnails-wrap {
	    position: relative;
	    float: left;
	    overflow: hidden;
	    height: 60px;
	    margin-right: 3px;
	}
	.travel-detail-basis {
	    float: right;
	    width: 270px;
	    border: 1px solid #ddd;
	    color: #333;
	    border-top: 1px solid #ddd;
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
	.travel-scroll-tab-headers{
		clear:both;
	}
	.ticket-detail-vendor-items-result th{
		text-align:center;
	    padding: 13px 0;
	    border-bottom: 1px solid #ddd;
    	
	}
	.ticket-cancellation-refund-policy th{
	    padding: 13px 13px;
	    background-color: #FFFEED;
	    border-top: 1px solid #ddd;
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
	                        </div>
	                        <div class="travel-thumbnail">
	                            <div class="thumbnails-wrap" style="width:527px;">
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
                	    <article class="travel-scroll-tab" style="margin-bottom:100px;">
	                 	   
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
	                        <div class="ilpPanel" style="margin-bottom:10px;">
	                        	<div class="ticket-detail-vendor-items">
	                        		<table class="ticket-detail-vendor-items-result" style="width:100%;">
	                        			<colgroup>
	                        				<col width="55%" />
	                        				<col width="30%"/>
	                        				<col width="*"/>
	                        			</colgroup>
	                        			<tr>
	                        				<th>상품명</th>
	                        				<th>요금</th>
	                        				<th>선택</th>
	                        			</tr>
	                        			<c:forEach items="${Total_Ticket_info}" var="row" varStatus="loop">
                        				<tr>
                        					<td>
                        						${row.ti_title } <br />
                        						<p class="duetime">유효기간 : ${row.ti_duetime1 }~${row.ti_duetime2 }</p>
                        						${row.ti_intro }
                        					</td>
                        					<td style="text-align:right;">
                        						<span class="price_title">쿠팡판매가</span> <br />
                        						<em class="price"><b><fmt:formatNumber value="${row.ti_price}"/>원</b></em><br />
                        						<div class="ticket_price" style="color:rgb(174,0,0);">
                        						<c:if test="${row.ti_discount ne 0 }">
	                        						<span class="price_title">와우판매가</span> <br />
	                        						<em class="price"><b><fmt:formatNumber value="${(row.ti_price)*(100-row.ti_discount)/100 }"/>원</b></em><br />
                        						</c:if>
                        						</div>
                        						<div class="cashback-area">
                        							<div class="search-item-cash-back">
		                        						<span class="cash-text">
		                        							<em>최대 <fmt:formatNumber value="${(row.ti_price)*(100-row.ti_discount)/100*0.05 }" pattern="#,##0"/>원 적립</em>
		                        						</span>
	                        						</div>
                        						</div>
											</td>
                        					<td><button class="btn btn-primaryinfo" type="button">선택</button></td>
                        				</tr>
	                        			</c:forEach>
	                        		</table>
	                        	</div>
	                        </div>
	                        <c:if test="${Total_Ticket.t_conservice ne null && Total_Ticket.t_fac ne null}">
	                        <div class="service-infomation" style="margin-bottom: 10px;">
                        		<table class="ticket-service-infomation" style="width:100%;">
                        			<colgroup>
                        				<col width="30%"/>
                        				<col width="*"/>
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
		                       						${Total_Ticket.t_conservice }
	                       						</div>
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
	                       						<div class="item-content">
	                       							${Total_Ticket.t_fac }
	                       						</div>
											</td>
	                       				</tr>
                       				</c:if>
                        		</table>
	                        </div>
	                        </c:if>
	                        <div class="instruction-manual" style="margin-bottom: 10px;">
                        		<table class="ticket-instruction-manual" style="width:100%;">
                        			<colgroup>
                        				<col width="30%"/>
                        				<col width="*"/>
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
	                        <div class="cancellation-refund-policy" style="margin-bottom: 10px;">
                        		<table class="ticket-cancellation-refund-policy" style="width:100%;">
                        			<colgroup>
                        				<col width="30%"/>
                        				<col width="*"/>
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
                       							<p class="policy-text">
                       								${Total_Ticket.t_cancelfee}
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
                       								${Total_Ticket.t_cancelnoti }
                       							</p>
                       						</div>
										</td>
                       				</tr>
                        		</table>
	                        </div>
	                    </article>
	                </section>

	                <aside class="travel-detail-basis">
	                	<div class="ticket-basis-product">
		                	<div class="basis-product">
		                		<h2 style="margin-top: 0px; margin-bottom: 5px;">${t_title }</h2>
			                	<div class="basis-product-address">
			                		대충 주소
			                	</div>
			                	<div class="basis-product-best-review">
			                		대충 제일 좋은 리뷰
			                	</div>
			                	<button class="btn btn-primaryinfo" style="height: 42px; line-height: 40px; font-size: 18px;">상품 구매</button>
		                	</div>
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
	                			<div class="basis-cashback-button">
	                				<p class="basis-cashback-button-text">아직 멤버쉽 회원이 아니신가요?</p>
	                				<button type="button" class="btn btn-primaryinfo">멤버쉽 가입하기</button>
	                			</div>
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
	                			<li class="basis-key-info">
	                				<label class="key-info-title">취소가능</label>
	                				<span class="key-info-description">미사용 100% 환불가능</span>
	                			</li>
	                		</ul>
	                		<div>환불하기</div>
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
