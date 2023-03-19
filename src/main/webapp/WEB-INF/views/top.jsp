<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#sellerApp').click(function(){
		
		$.ajax({
			url : "/checkSeller.do",
			type : "post",
			data : {
				member_idx : $('#member_idx').val()
			},
			dataType : 'json',
			success : function(result){ 
				
				if (result==0) {
					
					console.log("판매자 신청가능");
				} else {
					alert("이미 판매자신청이 완료된 계정입니다.");
					location.href = "/";

					
					console.log("아이디 중복에러");
					
					return false;
				}
			},
			
			
		});  
		
	});
});
onload = function(){
	const select = document.querySelector('.coupang-select');
	const header = select.querySelector('.coupang-select-header');
	const label = header.querySelector('.coupang-select-label');
	const arrow = header.querySelector('.coupang-select-arrow');
	const options = select.querySelector('.coupang-select-options');
	const optionLinks = options.querySelectorAll('a');
	header.addEventListener('click', function() {
		select.classList.toggle('coupang-select-open');
		options.style.display = select.classList
				.contains('coupang-select-open') ? 'block' : 'none';
	});
	optionLinks.forEach(function(link) {
		link.addEventListener('click', function(event) {
			event.preventDefault();
			label.textContent = link.textContent;
			select.dataset.value = link.dataset.value;
			select.dispatchEvent(new Event('change'));
			select.classList.remove('coupang-select-open');
			options.style.display = 'none';
		});
	});
}
</script>
<style type="text/css">
    .coupang-select {
        position: relative;
        display: inline-block;
      }
      .coupang-select-header {
        display: flex;
        align-items: center;
        padding: 6px 12px;
        cursor: pointer;
      }
      .coupang-select-label {
        flex-grow: 1;
        margin-right: 8px;
        margin-top : 5px;
        width: 70px;
        height: 23px;
        color: #8F8F8F;
        font-size: 12px;
      }
      .coupang-select-arrow {
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 5px 5px 0 5px;
        border-color: #8F8F8F transparent transparent transparent;
      }
      .coupang-select-options {
        position: absolute;
        top: 37px;
        display: none;
        right:2px;
        z-index: 1;
        list-style: none;
        border: 1px solid #ccc;
        border-top: none;
        border-radius: 0 0 4px 4px;
        background-color: #fff;
        max-height: 300px;
        overflow-y: auto;
        font-size: 12px;
        border: 1px solid #e1e1e1;
        margin-left: 1px solid #e1e1e1;
      }
      .coupang-select-options li a {
        display: block;
        padding: 6px 12px;
        color: #333;
        text-decoration: none;
        width: 89px;
      }
      .coupang-select-options li a:hover {
        color: blue;
        text-decoration: underline;
      }
</style>
</head>
<body>
	<div id="container" class="renewal home srp-sync srp-sync-brand">
		<div class="renewal-header">
			<header id="header">
				<section style="margin-top: 35px; auto;" id="contents"
					class="contents home">
					<div class="clearFix">
						<h1>
							<a href="/" title="Coupang - 내가 잘사는 이유"
								data-log-props='{ "id": "coupang_logo" }'><img
								src="../images/roupang.png" width="190" height="58" alt="쿠팡로고"></a>
						</h1>
						<div class="search-form product-search clearFix">
							<form id="headerSearchForm" method="get" action="/np/search"
								data-actionurl="/np/search">
								<fieldset>
									<legend>상품검색</legend>
										<div class="header-searchForm select--category" style="width: 110px;">
									     <div class="coupang-select">
										    <div class="coupang-select-header">
										      <span class="coupang-select-label">전체</span>
										      <span class="coupang-select-arrow"></span>
										    </div>
										    <ul class="coupang-select-options">
										      <li><a href="#" data-value="-1">전체</a></li>
										      <li><a href="#" data-value="186764">여성패션</a></li>
										      <li><a href="#" data-value="316168">남성패션</a></li>
										      <li><a href="#" data-value="383370">뷰티</a></li>
										      <li><a href="#" data-value="383370">유아동</a></li>
										      <li><a href="#" data-value="383370">식품</a></li>
										      <li><a href="#" data-value="383370">주방용품</a></li>
										      <li><a href="#" data-value="383370">생활용품</a></li>
										      <li><a href="#" data-value="383370">홈인테리어</a></li>
										      <li><a href="#" data-value="383370">가전디지털</a></li>
										    </ul>
										  </div>
										<input type="hidden" name="component" id="searchSelectedCategory" value="">
										<input style="left: 115px;" type="text" id="headerSearchKeyword" class="coupang-search" name="q" title="쿠팡 상품 검색" value=""placeholder="찾고 싶은 상품을 검색해보세요!">
									</div>
									<input type="hidden" name="channel" value="user"> 
									<a href="javascript:;" id="headerSearchBtn" class="search" title="검색">검색</a>
								</fieldset>
							</form>
							<div id="headerPopupWords" class="popularity-words"></div>
							<div class="history-btns">
								<span class="delete-all-kwdhistory del-button">전체삭제</span><span
									class="history-onoff on">최근검색어끄기</span>
							</div>
						</div>
						<ul class="icon-menus">
							<li class="my-coupang more">
							<a href="/myroupang/orderlist.do"
								data-log-props='{ "id": "mycoupang" }'><span
									class="my-coupang-icon">&nbsp;</span> <span
									class="my-coupang-title">마이루팡</span> </a>
								<p class="my-coupang-menu">
									<span class="wrapper"><i class="speech-icon"></i> <a
										href="/myroupang/orderlist.do"
										data-log-props='{ "id": "mycoupang_1" }'>주문목록</a> <a
										href="/myroupang/cancelReturn.do"
										data-log-props='{ "id": "mycoupang_2" }'>취소/반품</a> <a
										href="/myroupang/wishlist.do"
										data-log-props='{ "id": "mycoupang_4" }'>찜 리스트</a> <a
										href="https://subscribe-order.coupang.com/manage/subs.pang"
										class="subscription-menu-a"
										data-log-props='{ "id": "mycoupang_5" }'> <span
											class="subscription-menu-label">정기배송</span> <span
											class="subscription-menu-warning-icon"></span></a> </span>
								</p></li>
							<li class="cart more"><a
								href="/cart.do"
								class="clearFix mycart-preview-module"
								data-log-props='{ "id": "cart" }'><span class="cart-icon">&nbsp;</span>
									<span class="cart-title">장바구니</span> <em id="headerCartCount"></em></a>
								<div id="mycart-preview">
									<span class="wrapper"><i class="speech-icon"></i>
										<ul class="mycart-preview-products"></ul></span>
								</div></li>
						</ul>
					</div>
				</section>
				<!-- 카테고리 부분  -->
				<div class="category-btn category-2depth-active">
					<a href="javascript:;">카테고리</a>
					<div class="category-layer" id="gnbAnalytics" style="">
					<script type="text/javascript">
						$(function(){
							$(".menu.shopping-menu-list>li").hover(function(evt){
								var sub_idx=$(this).val();
								$.post(
									"/category_list2",
									{sub_idx : $(this).val()},
									function(data){
										$("#"+sub_idx).empty()
										if(sub_idx == 9){
											$("#"+sub_idx).append("<a href='/journey_Main'>여행홈으로 바로가기</a>");
										}
										$("#"+sub_idx).append("<ul>");
										$.each(data, function(e){
											$("#"+sub_idx).append("<li class='cate_list'><a href='#"+data[e].title+"'>"+data[e].title+"</a></li>");
											
										});
										$("#"+sub_idx).append("</ul>");
									}
								);
							});
						})
					</script>
					<style>
						.menu.shopping-menu-list>li:hover>.depth{
						    display: block;
						    width: 591px;
						    height: 100%;
						    left:150px;
						    overflow: hidden;
						    padding : 10px;
						}
						.depth>.cate_list{
							clear:both;
							margin-left : 20px;
							color: #333;
							font-size: 12px;
						}
					</style>
						<ul class="menu shopping-menu-list" id="shopping-menu-list" style="height: 240px;">
							<li class="fashion-sundries" value="1"><a href="#" class="first-depth">패션의류/잡화<i class="select-icon"></i></a>
								<div class="depth" id="1"></div>
							</li>
							<li class="beauty" value="2"><a href="#" class="first-depth">뷰티<i class="select-icon"></i></a>
								<div class="depth" id="2"></div>
							</li>
							<li class="child-birth" value="3"><a href="#" class="first-depth">출산/유아동<i class="select-icon"></i></a>
								<div class="depth" id="3"></div>
							</li>
							<li class="food" value="4"><a href="#" class="first-depth">식품<i class="select-icon"></i></a>
								<div class="depth" id="4"></div>
							</li>
							<li class="kitchen" value="5"><a href="#" class="first-depth">주방용품<i class="select-icon"></i></a>
								<div class="depth" id="5"></div>
							</li>
							<li class="life" value="6"><a href="#" class="first-depth">생활용품<i class="select-icon"></i></a>
								<div class="depth" id="6"></div>
							</li>
							<li class="home_decoration" value="7"><a href="#" class="first-depth">홈인테리어<i class="select-icon"></i></a>
								<div class="depth" id="7"></div>
							</li>
							<li class="appliances-digital" value="8"><a href="#" class="first-depth">가전디지털<i class="select-icon"></i></a>
								<div class="depth" id="8"></div>
							</li>
							<li class="travel-leisure" value="9"><a href="/journey_Main" style="cursor: pointer;">여행/티켓 <i class="select-icon"></i></a>
								<div class="depth" id="9"></div>
							</li>
						</ul>
					</div>
				</div>
	</header>
	<article class="top-bar">
		<section>
			<menu id="headerMenu">
				<s:authorize access="isAuthenticated()">
					<s:authentication property="name" var="name" />
				</s:authorize>
				<c:choose>
					<c:when test="${not empty name }">
						<li id="login" class="log">
						<a href="/myroupang/orderlist.do"><s:authentication property="name" />님</a>
						<a href="../myLogout.do" data-replaced="true" class="login" > 로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li id="login" class="log"><a href="../myLogin.do" data-replaced="true" class="login">로그인</a></li>
						<li id="join" class="join"><a href="regist.do">회원가입</a></li>
					</c:otherwise>
				</c:choose>


				<li class="cs-center more">
					<a href="/supports/faq.do?categoryCode=ALL">고객센터</a>
					<p>
						<a href="/supports/faq.do?categoryCode=ALL" >자주묻는질문</a> 
						<a href="/supports/inquiry.do" >1:1 채팅문의</a> 
						<a href="/supports/voc.do" >고객의 소리</a> 
						<a href="/supports/returnPolicy.do" >취소 / 반품 안내</a>
					</p></li>
					
			</menu>
			<menu id="subscribeHeader">
				<li class="vendor-join more"><a href="/Sell_Authorized.do" id="sellerApp">입점신청<i class="ic"></i></a>
					<p>
						<a href="https://wing.coupang.com/vendor/joining/welcome?inflow=WEB_HEADER_B" target="_blank">오픈마켓</a>
						<a href="/journey_Main" target="_blank">여행·티켓</a>
						<a href="https://supplier.coupang.com/welcome/join" target="_blank">로켓배송</a>
						<a href="https://partners.coupang.com" target="_blank">제휴마케팅</a>
					</p></li>
			</menu>
		</section>
	</article>
	</div>
	</div>
</body>
</html>