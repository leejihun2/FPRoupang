<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#wrap {
    position: relative;
    clear: both;
    width: 100%;
    height: 100%;
}
header {
    position: relative;
    width: 980px;
    height: 70px;
    border-bottom: 2px solid #8a8a8a;
    margin: 0 auto -1px;
}
.contents-cart {
    position: relative;
    visibility: hidden;
    width: 980px;
    border: 1px solid #e0e0e0;
    margin: 0 auto 70px;
    padding: 40px 39px;
    background: #fff;
}
.table-bordered {
    border: 1px solid #dee2e6;
}
.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
}
.cartTable {
    width: 898px;
    border-top: 0;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.tabs-wrap .normal-cart {
    float: left;
    width: 100%;
    border-top: 1px solid lightgrey;
    border-right: 1px solid lightgrey;
    border-bottom: 0;
    border-left: 1px solid lightgrey;
    padding-top: 17px;
    padding-bottom: 16px;
    padding-left: 4px;
    background: #fff;
    font-weight: 700;
    color: #0073e9;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
.head {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
}
.head th {
    background: #fafafa;
    text-align: center;
}
.cartTable th {
    height: 40px;
    font-size: 13px;
}
.all-select-event span {
    position: absolute;
}
.cartTable .cart-bundle-title {
    text-align: left;
    line-height: 16px;
    padding: 26px 22px 24px;
}
.cartTable td {
    border-bottom: 1px solid #ddd;
    line-height: 35px;
    text-align: center;
}
.cart-bundle-title .rocket {
    float: left;
    line-height: 16px;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -.5px;
}
.rocket-free {
    margin-right: 3px;
    font-weight: 700;
}
.rocket-delivery-info {
    margin-left: 20px;
    float: left;
    line-height: 16px;
    font-size: 12px;
}
.cart-deal-item {
    position: relative;
}
.cart-deal-item td:first-child {
    width: 50px;
    overflow: hidden;
}

.cart-deal-item td {
    padding: 10px 0;
    z-index: 1;
}
.cartTable td {
    border-bottom: 1px solid #ddd;
    line-height: 35px;
    text-align: center;
}
#cartTable-sku td.cart-deal-item__image {
    padding-right: 15px;
}

.cart-deal-item td:nth-child(2) {
    width: 80px;
    overflow: hidden;
}
.product-name-part {
    border-bottom: 1px solid #e2e5e7;
    padding-bottom: 5px;
    letter-spacing: -1px;
}
.product-name {
    margin-right: 5px;
    font-weight: 700;
    font-size: 14px;
    line-height: 22px;
    color: #55575f;
}
.delivery-date {
    visibility: hidden;
    font-size: 13px;
    color: #111;
    letter-spacing: -.5px;
    clear: both;
}
.unit-cost {
    color: #888;
    letter-spacing: 0;
    vertical-align: top;
}
.option-price-part {
    font-size: 12px;
    line-height: 24px;
}
.option-benefit .promo-cash-benefit {
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 2px 6px;
    margin-left: 5px;
    color: #333;
}
.promo-cash-benefit__icon {
    display: inline-block;
    background-image: url(//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_2x.png);
    background-size: cover;
    width: 14px;
    height: 14px;
    vertical-align: text-bottom;
}
.promo-cash-benefit__text {
    display: inline-block;
    vertical-align: bottom;
    margin-left: 3px;
}
.cart-deal-item .unit-total-price {
    position: relative;
    line-height: normal;
    border-left: 1px solid #ddd;
    font-size: 12px;
    color: #888;
}
.cart-deal-item td.product-box {
    padding: 10px 5px 10px 15px;
    text-align: left;
    vertical-align: top;
    z-index: 100;
}
.delivery-fee {
    border-left: 1px solid #ddd;
    font-size: 12px;
    color: #888;
}
.quantity-select {
    width: 52px;
}
.sr-only {
    position: absolute;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px,1px,1px,1px);
}
.badge-list .badge-item {
    float: left;
    width: auto;
}
.delivery-date.rocket .arrive-date, .delivery-date.rocket .arrive-date span {
    color: #00891a;
    height: 15px;
}
.rocket-total-price-area {
    display: inline-block;
}

.bundle-price-total td {
    position: relative;
    padding: 20px 35px 16px 0;
    background: #f7f7f7;
    font-size: 12px;
    line-height: 29px;
    text-align: right;
}
.all-select-product {
    float: left;
    margin-left: 15px;
    font-size: 12px;
    cursor: pointer;
}
.order-table-foot {
    clear: both;
    position: relative;
    padding: 20px 0 35px;
}
.payment-reward-cash-area {
    position: relative;
    margin: 20px 0 40px;
    padding: 20px 20px 20px 54px;
    border: 1px solid #ddd;
    border-radius: 2px;
    font-size: 14px;
}
.payment-reward-cash-area__icon {
    position: absolute;
    left: 20px;
    top: 16px;
    height: 24px;
}
.payment-reward-cash-area__title {
    margin: 0 0 8px;
    font-size: 14px;
    font-weight: 700;
    color: #111;
}
.cart-total-price {
    clear: both;
    border: 4px solid #c8c8c8;
    text-align: center;
}
.cart-total-price .price-area {
    padding: 20px 15px 18px;
    font-size: 14px;
    line-height: 17px;
    color: #555;
    text-align: center;
}
.cart-total-price em {
    padding: 0 4px 0 5px;
    font: 700 17px/17px tahoma;
    color: #111;
}
.symbol-plus1 {
    margin: 0 11px 0 10px;
    vertical-align: -4px;
    background: url(//img1a.coupangcdn.com/image/www/newBuy/img_plus_2.gif) no-repeat;
}
.symbol-equal1 {
    background: url(//img1a.coupangcdn.com/image/www/newBuy/img_equals_2.gif) no-repeat;
}
.cart-total-price .final-order-price {
    color: #ea0000;
    font-size: 20px;
}
.goShopping {
    font-size: 22px;
    font-weight: 700;
    display: inline-block;
    position: relative;
    width: 216px;
    line-height: 18px;
    border: 2px solid #0073e9;
    border-radius: 4px;
    padding: 22px 0 19px;
    text-align: center;
}
.goPayment {
    background: #0073e9;
    color: #fff;
    font-size: 22px;
    font-weight: 700;
    display: inline-block;
    position: relative;
    width: 216px;
    line-height: 18px;
    border: 2px solid #0073e9;
    border-radius: 4px;
    padding: 22px 0 19px;
    text-align: center;
}
.order-buttons, .summary-area {
    margin-top: 30px;
    text-align: center;
    position: relative;
}
.selected-delete, .selected-soldout-delete  {
    display: inline-block;
    margin-left: 10px;
    padding: 5px 6px;
    border: 1px solid #ccc;
    text-align: center;
    font-size: 12px;
    color: #111;
}
.option-benefit {
    padding-top: 10px;
    width: 100%;
    line-height: 12px;
    font-size: 12px;
    color: #888;
    text-align: right;
}
.product-box .option-item.modify-float {
    float: none;
}
</style>
</head>
<div id="wrap">
	<header>
	    <div class="logo" >
	      <a href="/">
	         <img src="/images/roupang.png" style="width: 170px; height: 60px; float: left;"/>
	      </a>
	   </div>
	</header>
	<section id="contents-cart" class="contents-cart async-content" style="visibility: visible;">        
	    <div id="cartContent" data-faraway="" data-rocket-freemessage="{&quot;rocketFreshFreeShippingRemaingAmount&quot;:&quot;15000&quot;,&quot;rocketFreshShippingOverAmount&quot;:&quot;15000&quot;,&quot;skuFreeShippingOverAmount&quot;:&quot;0&quot;, &quot;skuFreeShippingRemaingAmount&quot;:&quot;0&quot;, &quot;freshLack&quot;:false, &quot;rocketLack&quot;:false }">
	       <div class="tabs-wrap">
	         <div class="tabs">
	            <span id="cartItemCount" class="normal-cart">장바구니</span>
	         </div>
	      </div>
	       <table class="cartTable">
	            <colgroup>
	               <col width="50">
	               <col width="80">
	               <col width="*">
	               <col width="90">
	               <col width="90">
	              </colgroup>
	            <thead>
		            <tr class="head">
		                <th scope="col" class="all-select-event"></th>
		                <th scope="colgroup" id="th-product-box" colspan="2">상품정보</th>
		                <th scope="col" id="th-unit-total-price">상품금액</th>
		                <th scope="col" id="th-delivery-fee">배송비</th>
		            </tr>
		            
	            </thead>
	            <tbody>
	            
	            </tbody>
	     	</table>
	      <div class="order-buttons">
	      	<tr>
		        <h2 class="sr-only">장바구니</h2>
		        <p class="txt">장바구니에 담은 상품이 없습니다.</p>
		        <p class="login-area">
		            <span>로그인을 하시면, 장바구니에 보관된 상품을 확인하실 수 있습니다.</span>
		            <a href="https://login.coupang.com/login/login.pang?rtnUrl=https%3A%2F%2Fcart.coupang.com%2FcartView.pang" class="login"></a>
		        </p>
	       </tr>
	          <a href="/myLogin.do" class="goPayment" id="btnPay" data-pay-url="/cart/orderV3?isAllChecked=false">로그인 하러 가기</a>
	      </div>
	       <iframe id="ab_iframe" class="ab_test" src="" width="0" height="0" frameborder="0" vspace="0"></iframe>
	   </div>
	</section>
</div>
</body>
</html>