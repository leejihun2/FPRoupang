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
					alert("판매자 신청가능");
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
</script>
</head>
<body>
	<div id="container" class="renewal home srp-sync srp-sync-brand">
		<div class="renewal-header">
			<header id="header">
				<section style="margin-left: 130px;" id="contents"
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
									<div class="header-searchForm">
										<div class="select--category">
											<a href="#" class="select--category--button"></a> <a href="#"
												class="select--category__current" id="currentCategoryText"
												data-linkcode="">전체</a>
										</div>
										<select id="searchCategories" class="search_category_filter"
											data-name="">
											<option value="-1">전체</option>
											<option value="/np/categories/186764"
												data-category-id="186664">여성패션</option>
											<option value="/np/categories/187069"
												data-category-id="186969">남성패션</option>
											<option value="/np/categories/502993"
												data-category-id="502893">남녀 공용 의류</option>
											<option value="/np/categories/213201"
												data-category-id="213101">유아동패션</option>
											<option value="/np/categories/176522"
												data-category-id="176422">뷰티</option>
											<option value="/np/categories/221934"
												data-category-id="221834">출산/유아동</option>
											<option value="/np/categories/194276"
												data-category-id="194176">식품</option>
											<option value="/np/categories/185669"
												data-category-id="185569">주방용품</option>
											<option value="/np/categories/115673"
												data-category-id="115573">생활용품</option>
											<option value="/np/categories/184555"
												data-category-id="184455">홈인테리어</option>
											<option value="/np/categories/178255"
												data-category-id="178155">가전디지털</option>
										</select> 
										<input type="hidden" name="component"
											id="searchSelectedCategory" value=""> <label
											for="headerSearchKeyword"> 
											<input type="text" 
											id="headerSearchKeyword" class="coupang-search" name="q"
											title="쿠팡 상품 검색" value=""
											data-searchad='{"channel":"", "copy":"찾고 싶은 상품을 검색해보세요!", "linkType":"", "linkContent":"", "newWindow":""}'
											placeholder="찾고 싶은 상품을 검색해보세요!" autocomplete="off"></label>
									</div>
									<input type="hidden" name="channel" value="user"> <a
										href="javascript:;" id="headerSearchBtn" class="search"
										title="검색">검색</a>
								</fieldset>
							</form>
							<div id="headerPopupWords" class="popularity-words"></div>
							<div class="history-btns">
								<span class="delete-all-kwdhistory del-button">전체삭제</span><span
									class="history-onoff on">최근검색어끄기</span>
							</div>
						</div>
						<ul class="icon-menus">
							<li class="my-coupang more"><a
								href="https://mc.coupang.com/ssr/desktop/order/list"
								data-log-props='{ "id": "mycoupang" }'><span
									class="my-coupang-icon">&nbsp;</span> <span
									class="my-coupang-title">마이쿠팡</span> </a>
								<p class="my-coupang-menu">
									<span class="wrapper"><i class="speech-icon"></i> <a
										href="https://mc.coupang.com/ssr/desktop/order/list"
										data-log-props='{ "id": "mycoupang_1" }'>주문목록</a> <a
										href="https://mc.coupang.com/ssr/desktop/cancel-return-exchange/list"
										data-log-props='{ "id": "mycoupang_2" }'>취소/반품</a> <a
										href="//wish-web.coupang.com/wishInitView.pang"
										data-log-props='{ "id": "mycoupang_4" }'>찜 리스트</a> <a
										href="https://subscribe-order.coupang.com/manage/subs.pang"
										class="subscription-menu-a"
										data-log-props='{ "id": "mycoupang_5" }'> <span
											class="subscription-menu-label">정기배송</span> <span
											class="subscription-menu-warning-icon"></span></a> </span>
								</p></li>
							<li class="cart more"><a
								href="//cart.coupang.com/cartView.pang"
								class="clearFix mycart-preview-module"
								data-log-props='{ "id": "cart" }'><span class="cart-icon">&nbsp;</span>
									<span class="cart-title">장바구니</span> <em id="headerCartCount"></em></a>
								<div id="mycart-preview">
									<span class="wrapper"><i class="speech-icon"></i>
										<ul class="mycart-preview-products"></ul></span>
								</div></li>
						</ul>
					</div>
					<!-- 상대 네비게이션 바 <i class="ic-new" <- new아이콘 -->
					<ul class="gnb-menu clearFix"
						style="margin-left: 65px; margin-top: 10px;">
						<li class="rocket-delivery" style="margin-right: 9px;"><a
							href="https://www.coupang.com/np/campaigns/82"
							class="rocket-delivery">로켓배송</a><i class="ic-new"></i>&nbsp;</li>
						<li class="rocket-fresh"><a
							href="https://www.coupang.com/np/categories/393760"
							class="rocket-fresh"> 로켓프레시</a><i class="ic-new"></i></li>
						<li class="sustainable-market"><a
							href="https://pages.coupang.com/p/63240"
							class="sustainable-market">착한상점</a><i class="ic-new"></i></li>
						<li class="travel"><a
							href="/journey_Main">여행/티켓</a><i class=""></i><i
							class="ic-new"></i></li>
						<li class="subscription"><a
							href="https://www.coupang.com/np/campaigns/83"
							class="subscription">와우회원할인</a></li>
						<li class="gnb-coupangbenefit"><a
							href="https://www.coupang.com/np/coupangbenefit"
							class="gnb-coupangbenefit">이벤트/쿠폰</a></li>
						<li class="gnb-exhibition"><a
							href="https://pages.coupang.com/p/bep" class="gnb-exhibition">기획전</a></li>
					</ul>
				</section>
				<!-- 카테고리 부분  -->
				<div class="category-btn category-2depth-active">
					<a href="javascript:;">카테고리</a>
					<div class="category-layer" id="gnbAnalytics" style="">
					<script type="text/javascript">
						$(function(){
							$(".menu.shopping-menu-list>li").hover(function(evt){
								var type = $(this).val();
								switch(type){
								case 1:
									
									break;
								case 2:
									
									break;
								case 3:
									
									break;
								case 4:
									
									break;
								case 5:
									
									break;
								case 6:
									
									break;
								case 7:
									
									break;
								case 8:
									
									break;
								case 9:
									
									break;
								}
							})
						});
					</script>
					<style>
						.menu.shopping-menu-list>li:hover .depth{
						    display: block;
						    width: 591px;
						    height: 100%;
						    left:150px;
						    overflow: hidden
						}
					</style>
						<ul class="menu shopping-menu-list" id="shopping-menu-list" style="height: 240px;">
							<li class="fashion-sundries" value="1"><a href="#" class="first-depth">패션의류/잡화<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="beauty" value="2"><a href="#" class="first-depth">뷰티<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="child-birth" value="3"><a href="#" class="first-depth">출산/유아동<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="food" value="4"><a href="#" class="first-depth">식품<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="kitchen" value="5"><a href="#" class="first-depth">주방용품<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="life" value="6"><a href="#" class="first-depth">생활용품<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="home_decoration" value="7"><a href="#" class="first-depth">홈인테리어<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="appliances-digital" value="8"><a href="#" class="first-depth">가전디지털<i class="select-icon"></i></a>
								<div class="depth"></div>
							</li>
							<li class="travel-leisure" value="9"><a href="/journey_Main" style="cursor: pointer;">여행/티켓 <i class="select-icon"></i></a>
								<div class="depth"></div>
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
						<s:authentication property="name" />님
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
					
				<li class="cs-center more"><a
					href="/product_insert">상품등록</a>
				</li>
			</menu>
			<menu id="subscribeHeader">
				<li><a class="bookmark" >즐겨찾기</a></li>
				<li class="vendor-join more"><a href="./Sell_Authorized.do" id="sellerApp">입점신청<i class="ic"></i></a>
					<p>
						<a
							href="https://wing.coupang.com/vendor/joining/welcome?inflow=WEB_HEADER_B" target="_blank">오픈마켓</a>
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