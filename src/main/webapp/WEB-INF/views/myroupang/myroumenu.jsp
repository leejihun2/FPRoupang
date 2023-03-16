<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roupang</title>
</head>
<style>
.sel-btn{
background-color: blue;
background-size: 32px;
margin: 1px -9px 15px -4px;
padding: 11px;
border-radius: 5px;
border-color: 3px grey;
color: white;
box-shadow: 10px 10px 10px;
align-content: right;
cursor: pointer;
hover:
}

.sel-btn:hover{
	background-color: orange;
	blur: 20px;
	
}
.gongback{
	border: 13px solid white;
}
</style>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/myroupang.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/ddp.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/productReview.css" type="text/css">
<link rel="stylesheet" href="../css/side.css" type="text/css">
<link rel="stylesheet" href="../css/main.css" type="text/css">

<body>
<s:authorize access="isAnonymous()">
	<%@include file="../auth/login.jsp" %>
</s:authorize>
<%--    <c:choose>
      <c:when test="${not empty name }"> --%>

<s:authorize access="isAuthenticated()">
<%@include file="../top.jsp" %>
 
<div class="mainconcon">
<div class="gongback"></div>
<div class="mainconcon2">
<div class="di1">
    <div class="di2">
        <span class="mycoutitle">
            MY루팡
        </span>
    </div>
<div id="myMenu" class="me1">
<nav>
<div class="me2">
	
	<s:authorize access="hasAnyRole('admin', 'seller')">
		<a href="/admin/index.do">
			<div class="sel-btn">판매자센터 이동</div>
		</a>
	</s:authorize>
	
    <div class="ttxt">
        MY 쇼핑
    </div>
    <div class="gg">
        <ul>
            <li id="order-list-page" class="selected">
                <a href="/myroupang/orderlist.do" title="주문목록/배송조회" target="_self" class="oo">
                    주문목록/배송조회
                </a>
            </li>
            <li id="cancel-return" >
                <a href="/myroupang/cancelReturn.do" title="취소/반품/교환/환불내역" target="_self" class="oo">
                        취소/환불내역
                </a>
            </li>
            <li id="rocket-wow" >
                <a href="***와우 멤버십 링크 " title="와우 멤버십" target="_self" class="oo">
                    와우 멤버십
                </a>
            </li>
            <li id="rocket-fresh" >
                <a href="***로켓프레시 프레시백 링크 " title="로켓프레시 프레시백" target="_self" class="oo">
                    로켓프레시 프레시백
                </a>
            </li>
            <li id="subscribe-page" >
                <a href="***정기배송관리 링크" title="정기배송관리" target="_self" class="oo">
                    정기배송관리
                </a>
            </li>
            <li id="receipt-page" >
                <a href="***영수증 조회/출력" title="영수증 조회/출력" target="_self" class="oo">
                    영수증 조회/출력
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="me3">
    <div class="ttxt">
        MY 혜택
    </div>
    <div class="gg">
        <ul>
            <li id="discount-coupon" >
                <a href="****할인쿠폰" title="할인쿠폰" target="_self" class="oo">
                    할인쿠폰
                </a>
            </li>
            <li id="coupang-cash">
                <a href="****쿠팡캐시/기프트카드" title="쿠팡캐시/기프트카드" target="_self" class="oo">
                    루팡캐시/기프트카드
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="me4">
    <div class="ttxt">
        MY 활동
    </div>
    <div class="gg">
        <ul>
            <li id="cs-main" >
                <a href="****문의하기" title="문의하기" target="_self" class="oo">
                    문의하기
                </a>
            </li>
            <li id="inquiry-list" >
                <a href="***문의내역 확인" title="문의내역 확인" target="_self" class="oo">
                    문의내역 확인
                </a>
            </li>
            <li id="product-review" >
                <a href="../review/review.do" title="" target="_self" class="oo">
                    리뷰관리
                </a>
            </li>
            <li id="product-wish" >
                <a href="../myroupang/wishlist.do" title="찜 리스트" target="_self" class="oo">
                    찜 리스트
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="me5">
    <div class="ttxt">
        MY 정보
    </div>
        <div class="gg">
        <ul>
            <li id="user-modify" >
                <a href="../myroupang/mylist.do" title="개인정보확인/수정" target="_self" class="oo">
                    개인정보확인/수정
                </a>
            </li>
            <li id="coupay-page" >
                <a href="*****" title="결제수단·쿠페이 관리" target="_self" class="oo">
                    결제수단·루페이 관리
                </a>
            <li id="zip-page" >
                <a href="../myroupang/deliverylist.do" title="배송지 관리" target="_self" class="oo">
                    배송지 관리
                </a>
            </li>
        </ul>
    </div>
</div>
</nav>
</div>
<!-- ---------------------------------------------------------------------------- -->
    <div class="le1">
        <ul class="le2">
            <li class="downmenu ">
                <a href="문의링크문의링크" class="gmkSJg">
                    <span class=" kHVTpM">
                        <span class="ledbar">
                            루팡문의
                        </span>
                    </span>
                </a>
            </li>
            <li class="downmenu">
                <a href=" 고객의 소리 고객의 소리 고객의 소리" 
                    class=" gmkSJg " 
                    
                    >
                <span class="dZcFMb">
                    <span class="ledbar">
                        고객의 소리
                    <span class="sc-1liba5b-20 sou">
                        제안·칭찬·불편 신고
                    </span>
                    </span>
                </span>
                </a>
            </li>
            <li class="downmenu">
                <a href="../myroupang/cancelReturn.do" 
                class=" gmkSJg " 
                >
                <span class="dEVvkn">
                    <span class="ledbar">
                        상품취소 안내
                    </span>
                </span>
            </a>
        </li>
    </ul>
</div>
</div>
<!-- ------------------------------------------------------------------- -->
 </s:authorize>
</body>
</html>