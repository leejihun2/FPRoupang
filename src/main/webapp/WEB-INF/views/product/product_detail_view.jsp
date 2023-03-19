<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="/css/style.css">
 <link rel="stylesheet" href="/css/common.css" type="text/css">
 <link rel="stylesheet" href="/css/ddp.css" type="text/css">
 <link rel="stylesheet" href="/css/list.css" type="text/css">
 <link rel="stylesheet" href="/css/productReview.css" type="text/css">
 <link rel="stylesheet" href="/css/side.css" type="text/css">
 <link rel="stylesheet" href="/css/main.css" type="text/css">
 <link rel="stylesheet" href="../css/star_rating.css" type="text/css">
<link rel="stylesheet" href="../css/star_total.css" type="text/css">
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script src="../js/star.js"></script>
 <style type="text/css">
 .prod-atf {
    display: inline-block;
    width: 100%;
}
.prod-image {
    position: relative;
    float: left;
    width: 490px;
    text-align: center;
}
.prod-image__item img {
    display: block;
    width: 100%;
    height: 100%;
}

img {
    vertical-align: top;
}
.zoomContainer{
	position: absolute;
    left: 80px;
    top: 200.5382080078125px;
    height: 410px;
    width: 410px;
    z-index: 6;
}
.prod-buy {
    position: relative;
    float: right;
    width: 479px;
    font-size: 12px;
}
.prod-buy-header .prod-buy-header__title {
    font-size: 18px;
    font-weight: bold;
    width: 380px;
}
.prod-buy-header {
    position: relative;
    padding: 0 0 10px;
    border-bottom: 1px solid #ccc;
}
.prod-favorite .prod-favorite-btn {
    width: 40px;
    height: 40px;
    border: 0 none;
    cursor: pointer;
    outline: 0;
    background: url(//img1a.coupangcdn.com/image/dragonstone/sdp/PCSDP_imageasset_180417-min.png) no-repeat -218px -209px;
}
.prod-buy-header__info {
    padding-top: 2px;
    min-height: 12px;
    *zoom: 1;
}
.reward-cash-badge__inr {
    box-sizing: border-box;
    display: inline-block;
    padding: 0 8px;
    height: 20px;
    border-radius: 10px;
    border: solid 1px #ccc;
    background-color: #fff;
}
.prod-price .prod-price-onetime {
    position: relative;
    padding: 17px 0;
}
.reward-cash-ico {
    display: inline-block;
    width: 14px;
    margin-top: 2px;
    vertical-align: top;
}
.prod-price .major-price-coupon {
    color: #cb1400;
    
}
.delivery-badge-img {
    vertical-align: sub;
}
.delivery-badge-img {
    height: 14px;
}
.total-price {
    font-size: 20px;
    line-height: 21px;
}
.prod-price .price-align {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    margin-bottom: 2px;
}
.prod-shipping-fee-and-pdd-wrapper.apply-unknown-customer-handling {
    padding: 14px 0 3px 0;
}
.prod-txt-bold {
    font-weight: bold !important;
}
.prod-option__item button .multiple {
    position: relative;
    height: 54px;
    background: #fafafa;
    padding: 0 12px 0 10px;
    border: 1px solid #ccc;
    box-shadow: 0 1px 1px 0 rgba(0,0,0,0.1);
    color: #111;
    cursor: pointer;
}
.prod-option__item button  {
    margin-right: 5px;
    border: 1px solid #E1E1E1;
}
.prod-option__item button {
    width: 100%;
    text-align: left;
    font-family: inherit;
}
.prod-buy-quantity .prod-buy__quantity {
    display: table;
    width: 100%;
}
.prod-buy-quantity {
    position: relative;
    clear: both;
    display: inline-block;
    width: 80px;
}
.prod-quantity__form {
    display: table;
    width: 100%;
    border: 1px solid #ccc;
}
.prod-buy-quantity button {
    background: transparent;
    position: relative;
    height: 20px;
    width: 20px;
    display: block;
    border: 0 none;
    font-size: 0;
    line-height: 0;
}
.prod-buy {
    font-size: 12px;
}
.prod-buy-footer .prod-cart-btn {
	margin : 10px;
    background-color : white;
    color: #346aff;
}
.prod-option__item button.multiple span.title {
    float: none;
    display: block;
}
.prod-option__selected-container{
	background-color: #f0f0f0;
}
.prod-option__item span.value {
    padding-left: 1px;
    color: #111;
    font-weight: bold;
    overflow: hidden;
    text-overflow: ellipsis;
    display: table-cell;
}
.prod-image__item__border {
    display: block;
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
}
.prod-image__item {
    position: relative;
    overflow: hidden;
    border-radius: 2px;
    width: 50px;
    height: 50px;
    margin-bottom: 4px;
    outline: 0;
    cursor: pointer;
}
.prod-buy-footer button {
    display: block;
    float: left;
    cursor: pointer;
    position: relative;
    line-height: 40px;
    width: 191px;
    height: 42px;
    text-align: center;
    font-weight: bold;
    font-size: 16px;
    border: 1px solid #346aff;
}
.prod-buy-btn {
    background-color: #346aff;
    color: #fff;
    margin-top: 10px;
}
.tab .tab-titles {
    border-top: 2px solid #555;
    border-bottom: 1px solid #ccc;
    border-left: 1px solid #ccc;
    list-style-type: none;
    font-size: 0;
    top: 0;
    width: 100%;
    -webkit-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.tab .tab-titles>li {
    display: inline-block;
    padding: 15px 20px 14px;
    width: 25%;
    border-right: 1px solid #ccc;
    background-color: #fafafa;
    text-align: center;
    color: #555;
    font-weight: bold;
    font-size: 16px;
    box-sizing: border-box;
    cursor: pointer;
}
.product-detail .product-essential-info .table-title {
    padding-bottom: 10px;
    font-size: 20px;
    font-weight: 700;
}
.prod-delivery-return-policy-table th {
    padding: 12px 16px;
    border-bottom: 1px solid #eee;
    background-color: #fafafa;
    color: #111;
    font-weight: 400;
    font-size: 12px;
    overflow: hidden;
    text-align: left;
}
.prod-delivery-return-policy-table td {
    white-space: normal;
    word-break: break-all;
    padding: 12px 16px;
    color: #333;
    border-bottom: 1px solid #eee;
    border-right: none;
    border-left: none;
    border-top: none;
    line-height: 17px;
    font-size: 12px;
}
.prod-vendor-container {
    border-top: 1px solid #eee;
    padding: 14px 0;
}
#container {
    position: relative;
    min-width: 980px;
    overflow: hidden;
}
.prod-delivery-return-policy-table th {
    padding: 12px 16px;
    border-bottom: 1px solid #eee;
    background-color: #fafafa;
    color: #111;
    font-weight: 400;
    font-size: 12px;
    overflow: hidden;
}
.prod-delivery-return-policy-table td {
    white-space: normal;
    word-break: break-all;
    padding: 12px 16px;
    color: #333;
    border-bottom: 1px solid #eee;
    border-right: none;
    border-left: none;
    border-top: none;
    line-height: 17px;
    font-size: 12px;
}
.prod-delivery-return-policy-title {
    padding-bottom: 10px;
    font-size: 20px;
    font-weight: 700;
    border-top: 1px solid #eee;
    
}
.prod-delivery-return-policy-table {
    width: 100%;
    margin-bottom: 40px;
    table-layout: fixed;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    font-size: 1em;
}
.subType-IMAGE {
    width: 780px;
    margin: 0 auto;
    height: 50vh; /* 이미지 컨테이너의 높이를 화면의 절반(50vh)으로 설정 */
  	overflow: hidden; /* 이미지 컨테이너를 넘치는 이미지 부분을 숨김 */
}
.product-detail .product-detail-seemore .product-detail-seemore-btn {
    display: inline-block;
    padding: 14px 80px;
    background: inherit;
    border-radius: 2px;
    outline: none;
    font-weight: 700;
    border: 1px solid #346aff;
    font-size: 1.2em;
    cursor: pointer;
}
.product-detail .product-detail-seemore {
    display: none;
    width: 350px;
}
.info-btn{
	background: white;
	color: #346aff;
}
 </style>
 <script type="text/javascript">
function info_open(){
	console.log("zㅋ");
	$('#info-open').css('display','none');
	$('#info-close').css('display','block');
	$('.subType-IMAGE').css('height','100%');
}
function info_close(){
	$('#info-open').css('display','block');
	$('#info-close').css('display','none');
	$('.subType-IMAGE').css('height','50vh');
}
 </script>
</head>
<body style="background-color: white;">
	<%@ include file="../top.jsp" %>
	<%@include file="../star.jsp"%>
	<section id="contents" class="contents product">
		<div class="prod-atf">
			<div class="prod-atf-main">
				<div class="prod-image" data-global-banner-fold="">
					<div id="repImageContainer" class="prod-image-container"
						data-global-banner-fold="">
						<img class="prod-image__detail"
							src="//thumbnail9.coupangcdn.com/thumbnails/remote/492x492ex/image/retail/images/8241452974062391-578867d8-15c5-4efc-98df-353081cc5d55.jpg">
						<div class="zoomContainer">
							
							<div class="zoomLens">&nbsp;</div>
							<div class="zoomWindowContainer" style="width: 430px;">
								<div
									style="overflow: hidden; background-position: -570px -491.004px; text-align: center; background-color: rgb(255, 255, 255); width: 430px; height: 430px; float: left; background-size: 1000px 1000px; z-index: 100; border: 0px solid rgb(136, 136, 136); background-repeat: no-repeat; position: absolute; background-image: url(&quot;//image9.coupangcdn.com/image/retail/images/8241452974062391-578867d8-15c5-4efc-98df-353081cc5d55.jpg&quot;); top: 0px; left: 410px; display: none;"
									class="zoomWindow">&nbsp;</div>
							</div>
						</div>
						<div class="prod-image__items">

							<div class="prod-image__item prod-image__item">
								<img
									src="//thumbnail9.coupangcdn.com/thumbnails/remote/48x48ex/image/retail/images/8241452974062391-578867d8-15c5-4efc-98df-353081cc5d55.jpg"
									onerror="this.src='//t1a.coupangcdn.com/thumbnails/remote/490x490/image/coupang/common/no_img_1000_1000.png';"
									alt="thumb image"
									data-src="//thumbnail9.coupangcdn.com/thumbnails/remote/48x48ex/image/retail/images/8241452974062391-578867d8-15c5-4efc-98df-353081cc5d55.jpg"
									class="lazy-load-img"> <i
									class="prod-image__item__border"></i>
							</div>
							<div class="prod-image__item">
								<img
									src="//thumbnail9.coupangcdn.com/thumbnails/remote/48x48ex/image/product/image/vendoritem/2018/10/02/3000244423/823a66cb-4284-492c-a693-37f2a58b494d.jpg"
									onerror="this.src='//t1a.coupangcdn.com/thumbnails/remote/490x490/image/coupang/common/no_img_1000_1000.png';"
									alt="thumb image"
									data-src="//thumbnail9.coupangcdn.com/thumbnails/remote/48x48ex/image/product/image/vendoritem/2018/10/02/3000244423/823a66cb-4284-492c-a693-37f2a58b494d.jpg"
									class="lazy-load-img"> <i
									class="prod-image__item__border"></i>
							</div>
							<div class="prod-image__item">
								<img
									src="//thumbnail9.coupangcdn.com/thumbnails/remote/48x48ex/image/product/image/vendoritem/2018/08/16/3000244423/ed6dfef8-b7c4-488a-bbc7-1a3b14b764ef.jpg"
									onerror="this.src='//t1a.coupangcdn.com/thumbnails/remote/490x490/image/coupang/common/no_img_1000_1000.png';"
									alt="thumb image"
									data-src="//thumbnail9.coupangcdn.com/thumbnails/remote/48x48ex/image/product/image/vendoritem/2018/08/16/3000244423/ed6dfef8-b7c4-488a-bbc7-1a3b14b764ef.jpg"
									class="lazy-load-img"> <i
									class="prod-image__item__border"></i>
							</div>
						</div>
					</div>

					<div id="prodStickyBanner"
						class="product-sticky-banner-clickable prod-sticky-banner"
						style="display: none;"></div>
				</div>
				<div class="subscribe-banner"></div>
				<div
					class="prod-buy       new-oos-style  not-loyalty-member  eligible-address       without-subscribe-buy-type     DISPLAY_0       only-one-delivery"
					data-fresh-eligible="false" data-wow-benefit-sameday-delivery=""
					data-is-rocket-plus-2-description-change-target="true">
					<div class="prod-buy-blocker">
						<div class="prod-buy-blocker__bg"></div>
						<div class="prod-buy-blocker__spinner"></div>
					</div>
					<div class="prod-title-badges">
						<span class="prod-pre-order-badge" style="display: none"> <span
							class="prod-pre-order-badge-text"></span>
						</span>
					</div>
					<a href="" class="prod-brand-name" data-brand-name=""
						data-coulog="{&quot;logCategory&quot;:&quot;event&quot;, &quot;logType&quot;:&quot;click&quot;, &quot;logLabel&quot;:&quot;brandName&quot;, &quot;customURL&quot;:&quot;/click_sdp_brand_name&quot;, &quot;extraParam&quot;:&quot;page=SDP&amp;type=brandSDP&amp;contents=brandName&amp;productId=119465439&amp;vendorItemId=3000244423&quot;}"
						style="display: none;"></a>
					<div class="prod-buy-header">
						<div class="prod-favorite" style="float: right;">
								<button class="prod-favorite-btn "></button>
						</div>
						<h2 class="prod-buy-header__title">상하목장 유기농 우유 </h2>
						<div class="prod-buy-header__info">
							<span class="prod-buy-header__productreview" data-virolecode="3"
								id="prod-buy-header__productreview" style="display: block;">
								<a href="#sdpReview" class="moveAnchor"
								id="prod-review-nav-link"> <span
									class="rating-star-container" style="float: left;"> <span
										class="rating-star-num" style="width: 100.0%;"></span>
								</span> <span class="count">151,804개 상품평</span>
							</a>
							</span>
						</div>
						
					</div>
					<div class="prod-price-container">
						<div class="prod-price">
							<div class="prod-price-onetime">
								<div class="prod-origin-price ">
									<div class="origin-price-info-icon"></div>
								</div>
								<div class="prod-coupon-price price-alignmajor-price-coupon"> 
									<span class="total-price"> <strong>23,100원</strong></span> 
									<span class="unit-price font-medium">(100ml당 481원)</span>
									<div class="reward-cash-badge__inr">
										<img src="//image6.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png"
											class="reward-cash-ico"> 
										<span class="reward-cash-txt">최대 1,155원 적립 </span>
									</div>
								</div>
							</div>  
							<button class="prod-coupon-download-btn" style="display: none;">쿠폰받기</button>
						</div>
					</div>
					<div class="prod-limit-notice-container"></div>
					<div
						class="prod-shipping-fee-and-pdd-wrapper apply-unknown-customer-handling">
						<div class="prod-delivery-notice-container"></div>

						<div
							class="prod-delivery-company-and-seller-store-above-pdd-placeholder">
							<div
								class="prod-gold-fish-delivery-company-above-pdd-placeholder">

							</div>
							<div class="prod-gold-fish-vendor-above-pdd-placeholder">
								<div class="prod-vendor"></div>
							</div>
						</div>

						<div class="prod-shipping-fee-container">


							<div class="prod-shipping-fee ">


								<div class="SHIPPING_FEE_DISPLAY_0">
									<div class="prod-shipping-fee-message">
										<span><em class="prod-txt-bold">무료배송</em></span>

									</div>
									<div class="prod-shipping-consolidation"></div>
								</div>


								<div class="prod-pre-order-release-container"
									style="display: none;">
									<span class="prod-pre-order-release-msg"></span>
								</div>
							</div>
						</div>
					</div>
						<div class="prod-option__item " data-attribute-type-id="7823,7652">
							<div>
									<button class="prod-option__selected  multiple">
										<table>
											<colgroup>
												<col>


												<col width="15px">
											</colgroup>
											<tbody>
												<tr>
													<td><span class="title">개당 용량 × 수량</span> <span
														class="value "> 200ml × 24팩 </span></td>
													<td><i class="dropdown-icon"></i></td>
												</tr>
											</tbody>
										</table>
									</button>
							</div>
						</div>
					</div>
					<div class="prod-buy-quantity-and-footer ">
						
						<div class="prod-buy-footer ">
							<div class="prod-onetime-order " style="">
							
								<button class="prod-cart-btn"
									data-gaclick="{&quot;hitType&quot;:&quot;event&quot;, &quot;eventCategory&quot;:&quot;addCartButton&quot;, &quot;eventAction&quot;:&quot;click&quot;, &quot;eventLabel&quot;:&quot;optionBarButton&quot;, &quot;eventValue&quot;:0}">
									장바구니 담기</button>
								<button class="prod-buy-btn"
									data-gaclick="{&quot;hitType&quot;:&quot;event&quot;, &quot;eventCategory&quot;:&quot;orderButton&quot;, &quot;eventAction&quot;:&quot;click&quot;, &quot;eventLabel&quot;:&quot;buy_optionBarButton&quot;, &quot;eventValue&quot;:0}">
									<span class="prod-buy-btn__txt">바로구매</span>
								</button>
							</div>   
						</div>
						<select name="" id="" style="height:43px; margin-top: 9px; margin-left: 5px;">
								<option>1</option> 
								<option>2</option>
								<option>3</option>
						</select>
					</div>

					<!--buy box winner-->

					<!--description-->
					<!--coupick - coupang choice-->
					<div class="prod-coupick"></div>
					<!--vfp-->
					<div class="prod-vfp-banner impression-log impression-log-reload"
						style="display: none;" data-impression-event-name="vfpbanner"></div>




					<div id="prod-offer-banner"
						class="prod-offer-banner js-window-platform"></div>

				</div>

			</div>
		<div id="btf" style="width: 980px; margin: 0 auto 40px auto; padding-top: 10px;">
			<div id="sdpAdsBottom" class="sdp-ads impression-log"
				data-impression-event-name="sdp-ads" style="">
				<div class="recommendation">
					<div class="recommendation-header">
					</div>
					<div class="recommendation-inner">
						<div id="cid_11ul49rtqat_7076726"
							class="ui-horizontal-pagination-scroller">
							<div class="hps-scroll-inner" style="width: 5190px;">
								<table>
									<tr>
									</tr>
								</table>
							</div>
							<div class="hps-pagination-buttons">
								<div class="hps-pagination-buttons__prev"
									style="cursor: inherit; opacity: 0;"></div>
								<div class="hps-pagination-buttons__next"
									style="cursor: pointer; opacity: 1;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="categoryBest" class="invalid-category-best"
				style="display: none"></div>
			<div class="border-overlap"></div>

			<div id="sdpAds" class="sdp-ads impression-log"
				data-impression-event-name="sdp-ads" style="display: none;"></div>



			<div id="sdp-mid-banner-btf-tab" style="display: none;"></div>

			<div id="btfTab" class="tab" data-reordering-sdp-widgets="true">
				<ul class="tab-titles">
					<li name="detail" class="active"><a href="#pd_detail">상품상세</a></li>
					<li name="review"><a href="#reviewProduct">상품평</a><span class="product-tab-review-count"></span></li>
					<li name="qna"><a href="#inquiryProduct">상품문의</a></li>
					<li name="etc"><a href="#pd_deli">배송/교환/반품 안내</a></li>
				</ul>
				<ul class="tab-contents" >
					<li class="product-detail tab-contents__content">
						<div class="prod-selling-point" style="display: none;">
							<div class="prod-selling-point__title">특장점</div>
							<div class="prod-selling-point__content"></div>
						</div>
							<div id="itemBrief"
								class="product-essential-info  essential-table-collapsed">
								<div class="product-item__table">
								<br />
									<p class="table-title">필수 표기정보</p>
									<table class="prod-delivery-return-policy-table essential-info-table" id="pd_detail">
										<colgroup>
											<col width="150px">
											<col width="340px">
											<col width="150px">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th>제품명</th>
												<td>유기농 우유</td>
												<th>식품의 유형</th>
												<td>컨텐츠참조</td>
											</tr>
											<tr>
												<th>생산자 및 소재지</th>
												<td>컨텐츠참조</td>
												<th>제조연월일, 소비기한 또는 품질유지기한</th>
												<td>소비기한(또는 유통기한) : 2023년 04월 20일 이거나 그 이후인 상품</td>
											</tr>
											<tr>
												<th>포장단위별 내용물의 용량(중량), 수량</th>
												<td>200ml*24개입, 1개</td>
												<th>원재료명 및 함량</th>
												<td>컨텐츠참조</td>
											</tr>
											<tr>
												<th>영양성분</th>
												<td>컨텐츠참조</td>
												<th>유전자변형식품에 해당하는 경우의 표시</th>
												<td>해당없음</td>
											</tr>
											<tr>
												<th>소비자안전을 위한 주의사항</th>
												<td>컨텐츠참조</td>
												<th>수입식품 문구</th>
												<td>해당없음</td>
											</tr>
											<tr>
												<th>소비자상담관련 전화번호</th>
												<td colspan="3">쿠팡고객센터 1577-7011</td>
											</tr>
										</tbody>
									</table>
									<div id="productDetail" class="product-detail-content product-detail-content-new hide-overflow">
								       <div class="product-detail-content-inside">
							               <div class="vendor-item">
						                       <div class="type-IMAGE_NO_SPACE">
				                                   <div class="subType-IMAGE">
			                                           <img src="//thumbnail8.coupangcdn.com/thumbnails/remote/q89/image/retail/images/66714582619463-3719f18c-dfe4-4907-b4e4-271fece8646d.jpg" onerror="this.src='//t1a.coupangcdn.com/thumbnails/remote/622x622/image/coupang/common/no_img_1000_1000.png'" width="100%" alt="">
				                                   </div>
						                       </div>
							               </div>
								       </div>
								   </div>
							       <br />
							       <div class="product-detail-seemore" style="display: block; margin: 0 auto;">
							            <div class="product-detail-seemore-btn" id="info-open"  style="display: inline-block;">
							                <button type="button" onclick="info_open();" class="info-btn">상품정보 더보기</button>
							                	
							            </div>
							            <div class="product-detail-seemore-btn" id="info-close"  style="display: none">
							                <button type="button" onclick="info_close();" class="info-btn">상품정보 숨기기</button>
							            </div>
							        </div>
								   <br />
									<p class="prod-delivery-return-policy-title">상품평</p>
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
											<td>
												<div class="product-review">
													<div class="product-review__title-wrap"></div>
													<div>
														<h4 class="travel-title travel-title-sm"
															style="margin-top: 0px; margin-bottom: 0px;">가격</h4>
														<input type="hidden" name="ratevalue2"
															value="${totalstar.star_servey1}" step="0.1" min="0"
															max="5" />
														<div class="rating-wrap2">
															<div class="rating2">
																<div class="overlay2"></div>
															</div>${totalstar.servey1_0}
														</div>
														<h4 class="travel-title travel-title-sm"
															style="margin-top: 0px; margin-bottom: 0px;">서비스</h4>
														<input type="hidden" name="ratevalue3"
															value="${totalstar.star_servey2}" step="0.1" min="0"
															max="5" />
														<div class="rating-wrap3">
															<div class="rating3">
																<div class="overlay3"></div>
															</div>${totalstar.servey2_0}
														</div>
														<h4 class="travel-title travel-title-sm"
															style="margin-top: 0px; margin-bottom: 0px;">시설</h4>
														<input type="hidden" name="ratevalue4"
															value="${totalstar.star_servey3}" step="0.1" min="0"
															max="5" />
														<div class="rating-wrap4">
															<div class="rating4">
																<div class="overlay4"></div>
															</div>${totalstar.servey3_0}
														</div>
													</div>
													<c:forEach items="${lists }" var="row">
														<div class="product-review-list" id="product-reviews">
															<div class="product-review-item">
																<div class="element-profile">
																	<div class="element-profile-image"
																		style="background-image: url(&quot;//img1a.coupangcdn.com/image/productreview/web/pdp/profile/img-profile-empty.png&quot;);">
																	</div>
																	<div class="element-profile-content">
																		<div class="element-names">
																			<span class="element-display-name">${row.name }</span>
																		</div>
																		<div class="element-rating">
																			<div class="rating-wrap">
																				<input type="hidden" name="ratevalue"
																					value="${row.star_rate}" step="0.1" min="0" max="5" />
																				<div class="rating">
																					<div class="overlay"></div>
																				</div>${row.star_rate}
																			</div>
																			<span class="element-review-date">${row.regiDate }</span>
																		</div>
																	</div>
																</div>
																<div class="element-item-name"></div>
																<ul class="element-attachments"></ul>
																<div class="element-contents">
																	<p class="title">${row.summary }</p>
																	<p class="content">${row.review }</p>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
												</div>
											</td>
										</tr>
									</table>
								</div>

								
									<p class="prod-delivery-return-policy-title">상품문의</p>
										<div id="inquiryProduct">
									<section class="inquiryContents">
										<div class="inquiry-header">
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
								<div class="product-item__table product-seller">
									<br />
            						<p class="prod-delivery-return-policy-title">배송정보</p>
								</div>
								<table class="prod-delivery-return-policy-table essential-info-table" id="pd_deli">
										<colgroup>
									        <col width="150px">
									        <col width="340px">
									        <col width="150px">
									        <col width="*">
									    </colgroup>
										<tbody>
									    <tr>
									        <th>배송방법</th>
									        <td>순차배송</td>
									            <th rowspan="2">배송비</th>
									            <td rowspan="2">
									                무료배송<br>- 로켓배송 상품 중 19,800원 이상 구매 시 무료배송<br>- 도서산간 지역 추가비용 없음
									            </td>
									    </tr>
									    <tr>
									        <th>묶음배송 여부</th>
									        <td>가능</td>
									    </tr>
									    <tr class="shipping-info-delivery-period">
									        <th>배송기간</th>
									        <td colspan="3">
								           	 	<ul>
								                    <li class="prod-delivery-period-contents etc-pdd-info">
								                            <span>ㆍ쿠팡친구 배송 지역 : 주문 및 결제 완료 후, 1-2일 이내 도착</span>
								                    </li>
								                    <li class="prod-delivery-period-contents">
								                        ㆍ쿠팡친구 미배송 지역 : 주문 및 결제 완료 후, 2-3일 이내 도착
								                        <p class="prod-delivery-period__notice">
								                                - 도서 산간 지역 등은 하루가 더 소요될 수 있습니다. 곧 고객님께도 쿠팡친구가 찾아갈 수 있도록 노력하겠습니다
								                        </p>
								                    </li>
								                    <li class="prod-delivery-period-contents">ㆍ천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.</li>
									            </ul>
									        </td>
									    </tr>
									    </tbody>
									</table>
									<p class="prod-delivery-return-policy-title">판매자 정보</p>
					                <table class="prod-delivery-return-policy-table">
					                    <colgroup>
					                        <col width="150px">
					                        <col width="*">
					                    </colgroup>
					                    <tbody>
					                    <tr>
					                        <th>판매자</th>
					                        <td>
					                            쿠팡
					                            <a class="prod-delivery-return-policy-table__phone-link" href="tel:+8215777011" target="_blank">1577-7011</a>
					                        </td>
					                    </tr>
					               		</tbody>
									</table>
							</div>
							<div class="custom-ditues"></div>
						</div>
						<div id="comparisonList"
							style="overflow: hidden; padding-top: 30px; display: none;"
							data-impression-event-name="comparisonlist"></div>
						<div id="brandOtherProductsBottom"
							class="brand-other-products impression-log"
							data-impression-event-name="brandshop"
							data-params="{&quot;logLabel&quot;:&quot;brandShop&quot;,&quot;customUrl&quot;:&quot;/sdp_brand_shop_banner&quot;,&quot;productLevel&quot;:&quot;true&quot;}"
							style="display: none; overflow: hidden; border-top: 1px solid #eee; margin-top: 30px;"></div>
						<div id="laptopParityCompare" style="display: none"></div>
					</li>
					<li class="promotion-carousel-item">
						<div class="even">
							<a href=""></a>
						</div>
					</li>
					<li class="promotion-carousel-item" data-item-index="5">
						<div class="odd">
							<a href=""></a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>