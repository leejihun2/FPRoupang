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
 <link rel="stylesheet" href="/css/style.css">
 <link rel="stylesheet" href="/css/common.css" type="text/css">
 <link rel="stylesheet" href="/css/ddp.css" type="text/css">
 <link rel="stylesheet" href="/css/list.css" type="text/css">
 <link rel="stylesheet" href="/css/productReview.css" type="text/css">
 <link rel="stylesheet" href="/css/side.css" type="text/css">
 <link rel="stylesheet" href="/css/main.css" type="text/css">
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
<body>
<script type="text/javascript">
var pIdx;
var newCount;

function totalP(){
    var total = 0;
    $('input[name=selected_product]:checked').each(function() {
       var t = $(this).closest('.checkbox_inner').find('.product-price').text().replace(',', '').trim();
       total += parseInt(t.substring(0,t.length-1));
    });
    $('#totalP').text(total.toLocaleString());
}

function chgCount(symbol, f) {

   var parentId = $(f).closest("div").attr('id');
   var pCount = $('#' + parentId).children('span').text();
   pIdx = $('#' + parentId).children('.pIdx').val();
   var tempPrice = $('#' + parentId).parent().parent().find('.product-price').text().replace(',', '').trim();
   var pPrice = tempPrice.substring(0,tempPrice.length-1);
   var uPrice = eval("Number(pPrice)/Number(pCount)");
   console.log(pPrice);
   console.log(parentId,pCount,pIdx,pPrice,uPrice);
   if (symbol == "+") {
      newCount = eval("Number(pCount)+1");
      var newPrice = eval("Number(pPrice)+Number(uPrice)");
   } 
   else {
      newCount = eval("Number(pCount)-1");
      var newPrice = eval("Number(pPrice)-Number(uPrice)");

   }
   if (eval("Number(newCount) < 1") == false) {
      $('#' + parentId).children('span').text(newCount);
      $('#' + parentId).parent().parent().find('.product-price').text(newPrice.toLocaleString()+'원');
   }
   
   totalP();
}

function checkAll() {
   if ($("#selected_all_product").is(':checked')) {
      $("input[name=selected_product]").prop("checked", true);
   } else {
      $("input[name=selected_product]").prop("checked", false);
   }
   
   totalP();
}

$(function() {

   $('input[name=selected_product]').click(function() {
      var chks = document.getElementsByName("selected_product");
      var chksChecked = 0;

      for (var i = 0; i < chks.length; i++) {
         var cbox = chks[i];

         if (cbox.checked) {
            chksChecked++;
         }
      }

      if (chks.length == chksChecked) {
         $("#selected_all_product").prop("checked", true);
      } else {
         $("#selected_all_product").prop("checked", false);
      }
      
      totalP();
   });

   $('.cButton').click(function() {

      var count1 = {
         mem_id : $('#mem_id').val(),
         product_idx : pIdx,
         product_count : newCount
      }

      $.ajax({
         type : 'post',
         url : '/plusMinus.do',
         data : JSON.stringify(count1),
         contentType : "application/json;charset:utf-8",
         dataType : "text",
         success : sucCallBack,
         error : errCallBack
      });
   });
   
   $('#purchase').click(function(){
      
      if($('input:checkbox[name=selected_product]:checked').val()==null) {
         alert("구매할 상품을 선택해주세요");
      }
      
      else{         
          var chkArray = new Array(); // 배열 선언
          
           $('input:checkbox[name=selected_product]:checked').each(function() {
               chkArray.push(this.value);
           });
          location.href="puchaseExpectInfo.do?chkArray="+chkArray;
      }
   });
});

function sucCallBack(resData) {
   console.log("success");
}

function errCallBack(errData) {
   console.log(errData.status + ":" + errData.statusText);
}
</script>
<!-- 장바구니 목록 보여주는 곳 -->
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
            <span id="cartItemCount" class="normal-cart">장바구니 > 구매</span>
         </div>
      </div>
       <table class="cartTable">
            <caption class="none">장바구니</caption>
            <colgroup>
               <col width="50">
               <col width="80">
               <col width="*">
               <col width="90">
               <col width="90">
              </colgroup>
            <thead>
            <tr class="head">
                <th scope="col" class="all-select-event">
                   	<label style="margin-bottom: 0;">
                      <input title="모든 상품을 결제상품으로 설정" type="checkbox" class="all-deal-select"><span>&nbsp;전체선택</span>
                     </label>
                  </th>
                <th scope="colgroup" id="th-product-box" colspan="2">상품정보</th>
                <th scope="col" id="th-unit-total-price">상품금액</th>
                <th scope="col" id="th-delivery-fee">배송비</th>
            </tr>
            </thead>
          <tbody id="cartTable-sku">
             <tr>
                 <td colspan="5" class="cart-bundle-title">
                     <span class="title rocket">로켓배송 상품 </span>
                     <span class="rocket-delivery-info">
                          <span class="rocket-free">무료배송</span>
                     </span>
                  <div id="lateRocketWowOverNightMessage" class="late-dawn-delivery-message" style="display: none"></div>
                 </td>
             </tr>
               <tr class="cart-deal-item " data-item-status="CHECKED" data-adult="false" data-bundle-id="22422683546" data-bundle-type="PRODUCT" data-app="" data-has-id="false" data-has-wid="false" data-group-type="rocket">
                    <td class="product-select-event">
                         <input type="checkbox" title="탐사수 무라벨 상품을 결제상품으로 설정" value="22422683546" class="dealSelectChk">
                    </td>
                   <td class="cart-deal-item__image ">
                      <!--  <a href="" class="">
                           <img src="//thumbnail6.coupangcdn.com/thumbnails/remote/120x120ex/image/retail/images/1299257297593781-973ae0d8-4990-405e-9301-cf36ef543da0.jpg" width="78" height="78" class="product-img img" alt="탐사수 무라벨" data-bundle-id="22422683546">
                       </a> -->
                    </td>
                    <td class="product-box">
                        <div class="product-name-part">
                            <a href="//www.coupang.com/vp/products/5625704601?vendorItemId=80771756696" class="product-name moveProduct modify-color">${map.p_title}</a>
                        </div>
                            <div id="80771756696" data-dawn-only="false" class="option-item modify-float" data-quantity="2" data-vendor-id="A00010028" data-vi="80771756696" data-vip="" data-pid="5625704601" data-itemid="13430253618" data-bundle-id="22422683546">
                                <div class="option-item-info" data-restock-notification-state="false">
                                    <div class="option-name">
                                        <span class="option-item-name" style="display:none;">${map.p_title}</span>
                                    </div>
                                         <p class="delivery-enterprise" style="display: none"><img src="//img1a.coupangcdn.com/image/cart/generalCart/warning_ic.png" alt="">이 상품은 <strong>로켓배송</strong>이 아닌 <strong>협력택배사</strong>가 배송하는 상품입니다.</p>
                                </div>
                                <div class="option-price-part">
                           <span class="unit-cost" data-sale-price="15490"><span class="sr-only">제품가격</span>${map.pi_price}</span>
                           <span class="select-select">
                              <select class="quantity-select" data-url="/memberCartItem/quantity/22422683546/" data-quantity="2" data-all="false" title="탐사수 무라벨, 2L, 30개입 수량변경">
                                       <option value="1" selected="selected">1</option>
                                       <option value="2" >2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                    <option value="10">10+</option>
                              </select>
                           </span>
                           <span class="select-text">
                              <input type="button" class="quantity-chg none" value="수량변경">
                           </span>
                           <span class="unit-price-area"><span class="sr-only">구매가격</span></span>
                                    <div class="badge-list">
                               <div class="badge-item option-benefit">
                                     <span class="promo-cash-benefit ">
                                        <i class="promo-cash-benefit__icon"></i><em class="promo-cash-benefit__text">최대 310원 적립</em>
                                     </span>
                               </div>
                                  </div>
                                </div>
                           </div>
                    </td>
                    <td class="unit-total-price">
                  <div class="unit-total-sale-price">${map.pi_price}</div>
               <img src="//img1a.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png" width="56" height="14" class="vendor-badge rocket" alt="로켓배송">
                    </td>
                       <td class="delivery-fee" rowspan="1" headers="th-delivery-fee">
                                <span class="delivery-fee__free">무료</span>
                        </td>
               </tr>
        <tr class="special-gift-area" style="display: none;">
        </tr>
        <tr class="bundle-price-total">
            <td colspan="5">
                <div class="rocket-tooltip" id="rocket-tooltip" style="display: block; right: 346px;">
                    <div class="arrow"></div>
                </div>
                <span class="rocket-total-price-area">
               <h3 class="sr-only">로켓배송상품 주문금액 정보</h3>상품가격
               <span class="total-product-price number">${map.pi_price}</span>원 <span class="coupon-area">
                    <span class="symbol symbol-plus"><span class="sr-only">더하기</span></span>배송비 
                    <span id="rocket-delivery-charge" class="delivery-charge"><strong>무료</strong></span>
               <span class="symbol symbol-equal"><span class="sr-only">결과는</span></span>주문금액
                    <span class="total-order-price number">${map.pi_price}</span>원</span>
               </span>
            </td>
        </tr>
    </tbody>
        </table>
      <div class="order-table-foot">
          <span class="all-select-product">
            <label>
               <input title="모든 상품을 결제상품으로 설정" type="checkbox" class="all-deal-select"> <span>전체선택</span><span class="cart-count-bottom">( <em>0</em> / ${map.count} )</span>
            </label>
            <a href="javascript:void(0);" class="selected-delete logging" data-login="true" data-view-type="shoppingCart" data-event-name="selectiveDeletionClick" data-log-label="cart-p-deleteMulti" data-coulog-type="clickEvent" data-listener-event-type="click">선택삭제</a>
            <a href="javascript:void(0);" class="selected-soldout-delete logging" data-login="true" data-view-type="shoppingCart" data-event-name="deleteAllEosAndOosClick" data-log-label="cart-p-outDeleteAll" data-coulog-type="clickEvent">품절/판매종료상품 전체삭제</a>
         </span>
         <div class="payment-benefit"></div>
      </div>
       <div class="download-coupon-area" style="display: none;"></div>
          <div class="payment-reward-cash-area">
             <img class="payment-reward-cash-area__icon" src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png">
             <h3 class="payment-reward-cash-area__title">캐시적립 혜택</h3>
             <span class="payment-reward-cash-area__desc">쿠페이 머니 결제 시 5% 적립</span>
          </div>
       <div class="cart-total-price" data-total-price="0" data-discount-price="0">
            <div class="cart-total-price__inner">
            <div class="price-area">
                <h2 class="sr-only" id="cart-total-price">
                    장바구니 총 주문금액 정보
                </h2>
                총 상품가격
                <em class="final-product-price">${map.pi_price}</em>원
                <span class="final-sale-area">
                </span>
                <span class="symbol-plus1"><span class="sr-only">더하기</span></span>
                총 배송비
                <em class="final-delivery-charge">${map.delifee}</em>원
                <span class="symbol-equal1"><span class="sr-only">결과는</span></span>
                총 주문금액
                <em class="final-order-price" data-final-order-price="0">
                  ${map.allSum} 원
                </em>
            </div>
          </div>
       </div>
      <div class="order-buttons">
          <a id="continueShoopingBtn" class="goShopping logging" href="//www.coupang.com" data-view-type="shoppingCart" data-event-name="continuouslyShoppingClick" data-log-label="cart-p-continuouslyShoppingClick" data-coulog-type="clickEvent" data-listener-event-type="click">계속 쇼핑하기</a>
          <a href="javascript:void(0);" class="goPayment" id="btnPay" data-pay-url="/cart/orderV3?isAllChecked=false">구매하기</a>
          <div class="item-disabled" style="display: none;"></div>
      </div>
       <iframe id="ab_iframe" class="ab_test" src="" width="0" height="0" frameborder="0" vspace="0"></iframe>
   </div>
</section>
   </div>


<!-- bottom -->
</body>
</html>