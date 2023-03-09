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
					alert("이미 판매자신청이 완료된 계정입다.");
					history.go(-2);
					
					console.log("아이디 중복에러");
					
					return false;
				}
			},
			error : function(errData){ 
				
				console.log(""); 
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
										</select> <input type="hidden" name="component"
											id="searchSelectedCategory" value=""> <label
											for="headerSearchKeyword"> <input type="text"
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
						<h3 class="none">쇼핑</h3>
						<ul class="menu shopping-menu-list" style="height: 400px;">
							<li class="fashion-sundries"><a href="javascript:;"
								style="cursor: default;">패션의류/잡화<i class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/categories/186764"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"womanclothe"} }'>
													여성패션<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/498704"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"womanclothe"} }'>의류</a>
														</li>
														<li><a href="/np/categories/498775"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"womanclothe"} }'>속옷/잠옷</a>
														</li>
														<li><a href="/np/categories/498797"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"womanclothe"} }'>신발</a>
														</li>
														<li><a href="/np/categories/498828"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"womanclothe"} }'>가방/잡화</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/187069"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"manclothe"} }'>남성패션<i
													class="depth-select-icon"></i></a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/498917"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"manclothe"} }'>의류</a>
														</li>
														<li><a href="/np/categories/498962"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"manclothe"} }'>속옷/잠옷</a>
														</li>
														<li><a href="/np/categories/498974"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"manclothe"} }'>신발</a>
														</li>
														<li><a href="/np/categories/499007"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"manclothe"} }'>가방/잡화</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/502993"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"unisexfashion"} }'>남녀
													공용 의류<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/502994"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"unisexfashion"} }'>티셔츠</a>
														</li>
														<li><a href="/np/categories/502995"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"unisexfashion"} }'>맨투맨/후드티</a>
														</li>
														<li><a href="/np/categories/502998"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"unisexfashion"} }'>셔츠</a>
														</li>
														<li><a href="/np/categories/509288"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"unisexfashion"} }'>빅사이즈</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/213201"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"childfashion"} }'>유아동패션<i
													class="depth-select-icon"></i></a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/499090"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"childfashion"} }'>베이비</a>
														</li>
														<li><a href="/np/categories/499116"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"childfashion"} }'>여아</a>
														</li>
														<li><a href="/np/categories/499186"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"childfashion"} }'>남아</a>
														</li>
													</ul>
												</div></li>
										</ul>
										<span class="gnb-banner" style="background: #FFF"> <a
											class="category-banner-button"
											href="https://pages.coupang.com/p/82356" title="여성패션"
											data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"womanclothe"} }'>여성패션</a>
											<img alt="여성패션"
											data-banner-src="//image9.coupangcdn.com/image/displayitem/displayitem_e2178e2e-cdb1-4653-8759-e9181206b316.jpg"
											class="category-banner-image" />
										</span>

									</div>
								</div></li>
							<li class="beauty"><a href="/np/categories/176522"
								class="first-depth"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>뷰티<i
									class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/campaigns/7979"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>명품뷰티
											</a>
												<div class="third-depth-list">
													<ul></ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176530"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>스킨케어
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/486248"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>스킨</a>
														</li>
														<li><a href="/np/categories/486249"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>로션</a>
														</li>
														<li><a href="/np/categories/486250"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>에센스/세럼/앰플</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/509393"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>클린/비건뷰티
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/509394"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>스킨케어</a>
														</li>
														<li><a href="/np/categories/509395"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>메이크업</a>
														</li>
														<li><a href="/np/categories/509396"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>네일&amp;툴</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/486551"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>클렌징/필링
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/486559"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>클렌징
																폼</a></li>
														<li><a href="/np/categories/486560"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>클렌징
																젤/파우더</a></li>
														<li><a href="/np/categories/486561"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>클렌징
																비누</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/campaigns/7642"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>더마코스메틱
											</a>
												<div class="third-depth-list">
													<ul></ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176573"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>메이크업
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/176587"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>베이스
																메이크업</a></li>
														<li><a href="/np/categories/176574"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>아이
																메이크업</a></li>
														<li><a href="/np/categories/176581"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>립
																메이크업</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176598"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>향수
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/176599"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>여성향수</a>
														</li>
														<li><a href="/np/categories/176600"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>남성향수</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176839"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>남성화장품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/176840"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>남성스킨케어</a>
														</li>
														<li><a href="/np/categories/176843"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>남성메이크업</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176763"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>네일
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/427310"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>네일팁/스티커</a>
														</li>
														<li><a href="/np/categories/176767"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>일반네일</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176807"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>뷰티소품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/176808"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>화장솜/면봉</a>
														</li>
														<li><a href="/np/categories/176811"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>아이소품</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/403012"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>어린이화장품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/403013"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>메이크업</a>
														</li>
														<li><a href="/np/categories/403014"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>향수</a>
														</li>
														<li><a href="/np/categories/403015"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>네일케어</a>
														</li>
														<li><a href="/np/categories/403016"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>세트/키트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/campaigns/475"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>로드샵
											</a>
												<div class="third-depth-list">
													<ul></ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176602"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>헤어
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/403017"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>샴푸</a>
														</li>
														<li><a href="/np/categories/403024"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>린스/컨디셔너</a>
														</li>
														<li><a href="/np/categories/176631"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>트리트먼트/팩/앰플</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176699"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>바디
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/176700"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>샤워/입욕용품</a>
														</li>
														<li><a href="/np/categories/176710"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>바디로션/크림</a>
														</li>
														<li><a href="/np/categories/176719"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>핸드/풋/데오</a>
														</li>
														<li><a href="/np/categories/176744"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>제모/슬리밍/청결제</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/176963"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>선물세트/키트
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/176964"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>선물세트</a>
														</li>
														<li><a href="/np/categories/176974"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"beauty"} }'>여행용키트</a>
														</li>
													</ul>
												</div></li>
										</ul>
										<span class="gnb-banner" style="background: #FFF"> <a
											class="category-banner-button"
											href="https://pages.coupang.com/p/57230" title="뷰티"
											data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"beauty"} }'>뷰티</a>
											<img alt="뷰티"
											data-banner-src="//image10.coupangcdn.com/image/displayitem/displayitem_d2ea45ab-ec05-4acf-a5fe-8aa46451b60f.png"
											class="category-banner-image" />
										</span>

									</div>
								</div></li>
							<li class="child-birth"><a href="/np/categories/221934"
								class="first-depth"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>출산/유아동<i
									class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/categories/508565"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아동패션
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/508566"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>베이비</a>
														</li>
														<li><a href="/np/categories/508592"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>여아</a>
														</li>
														<li><a href="/np/categories/508663"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>남아</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/485952"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>기저귀
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/485953"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>일회용기저귀</a>
														</li>
														<li><a href="/np/categories/485957"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>수영장기저귀</a>
														</li>
														<li><a href="/np/categories/485976"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>기저귀가방</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/485979"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>물티슈
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/485980"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>물티슈</a>
														</li>
														<li><a href="/np/categories/485981"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>건티슈</a>
														</li>
														<li><a href="/np/categories/485982"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>물티슈액세서리</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/221939"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>분유/어린이식품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/221995"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>분유</a>
														</li>
														<li><a href="/np/categories/446135"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>이유식</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/509025"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>어린이
													건강식품 <i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/509028"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>비타민/미네랄</a>
														</li>
														<li><a href="/np/categories/509029"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>홍삼</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/221943"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>수유용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/485989"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>젖병</a>
														</li>
														<li><a href="/np/categories/485992"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>젖꼭지</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/221943">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/334841"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>이유용품/유아식기
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/334842"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>이유식용품</a>
														</li>
														<li><a href="/np/categories/334871"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>턱받이</a>
														</li>
														<li><a href="/np/categories/371346"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>빨대컵/유아컵</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/221946"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>매트/안전용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/509106"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>일반매트</a>
														</li>
														<li><a href="/np/categories/509107"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>퍼즐매트</a>
														</li>
														<li><a href="/np/categories/509108"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>폴더매트</a>
														</li>
														<li><a href="/np/categories/509109"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>벽매트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/381650"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유모차/웨건
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/381651"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>디럭스유모차</a>
														</li>
														<li><a href="/np/categories/381652"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>절충형유모차</a>
														</li>
														<li><a href="/np/categories/381653"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>웨건</a>
														</li>
														<li><a href="/np/categories/381656"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유모차/웨건액세서리</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/381697"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>카시트
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/381698"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>신생아바구니카시트</a>
														</li>
														<li><a href="/np/categories/381699"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>영유아카시트</a>
														</li>
														<li><a href="/np/categories/381700"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>주니어카시트</a>
														</li>
														<li><a href="/np/categories/381701"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>부스터카시트</a>
														</li>
														<li><a href="/np/categories/381702"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>카시트액세서리</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/381717"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>아기띠/외출용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/509152"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>아기띠</a>
														</li>
														<li><a href="/np/categories/509153"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>올인원
																아기띠</a></li>
														<li><a href="/np/categories/509154"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>힙시트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/221944"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>욕실용품/스킨케어
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/222358"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아워시/샴푸</a>
														</li>
														<li><a href="/np/categories/222371"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아구강케어</a>
														</li>
														<li><a href="/np/categories/222352"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아스킨케어</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/221945"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>위생/건강/세제
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/222402"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>위생용품</a>
														</li>
														<li><a href="/np/categories/403108"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아항균지퍼팩</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/221942"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아동침구
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/222195"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>낮잠이불</a>
														</li>
														<li><a href="/np/categories/222196"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>겉싸개/속싸개</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/221947"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아가구/인테리어
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/222457"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아동침대</a>
														</li>
														<li><a href="/np/categories/222464"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>유아의자/소파</a>
														</li>
														<li><a href="/np/categories/222471"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>수납/정리함</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/349657"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>완구/교구
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/campaigns/821"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>연령별완구</a>
														</li>
														<li><a href="/np/categories/349665"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>캐릭터별완구</a>
														</li>
														<li><a href="/np/categories/349686"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"baby"} }'>신생아/영아완구</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/349657">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list more-category"><a
												href="/np/categories/221934">더보기</a></li>
										</ul>
										<span class="gnb-banner" style="background: #FFF"> <a
											class="category-banner-button"
											href="https://www.coupang.com/np/campaigns/17571"
											title="출산/유아동"
											data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"baby"} }'>출산/유아동</a>
											<img alt="출산/유아동"
											data-banner-src="//image8.coupangcdn.com/image/displayitem/displayitem_40533a3f-9cb0-478b-9293-64054778ac39.jpg"
											class="category-banner-image" />
										</span>

									</div>
								</div></li>
							<li class="food"><a href="/np/categories/194276"
								class="first-depth"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>식품<i
									class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/campaigns/10076"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>유기농/친환경
													전문관 </a>
												<div class="third-depth-list">
													<ul></ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/194282"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>과일
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/194284"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>사과/배</a>
														</li>
														<li><a href="/np/categories/194288"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>귤/한라봉/감귤류</a>
														</li>
														<li><a href="/np/categories/194294"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>감/홍시/곶감</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/194373"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>견과/건과
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/194376"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>땅콩/호두</a>
														</li>
														<li><a href="/np/categories/194381"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>밤/잣/은행</a>
														</li>
														<li><a href="/np/categories/394584"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>과일가루</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/194432"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>채소
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/194434"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>두부/콩나물</a>
														</li>
														<li><a href="/np/categories/194445"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>감자/고구마</a>
														</li>
														<li><a href="/np/categories/194454"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>당근/뿌리채소</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/194432">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/194627"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>쌀/잡곡
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/194629"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>백미</a>
														</li>
														<li><a href="/np/categories/194630"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>현미/찹쌀/흑미</a>
														</li>
														<li><a href="/np/categories/194687"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>곡류선물세트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/194688"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>축산/계란
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/194690"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>소고기</a>
														</li>
														<li><a href="/np/categories/194726"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>돼지고기</a>
														</li>
														<li><a href="/np/categories/194756"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>닭/오리고기</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/194829"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>수산물/건어물
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/194831"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>생선</a>
														</li>
														<li><a href="/np/categories/194889"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>오징어/낙지/연체류</a>
														</li>
														<li><a href="/np/categories/194898"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>새우/게/갑각류</a>
														</li>
														<li><a href="/np/categories/195000"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>수산물선물세트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/195006"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>생수/음료
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/195008"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>생수</a>
														</li>
														<li><a href="/np/categories/497920"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>탄산수</a>
														</li>
														<li><a href="/np/categories/195015"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>과일/야채음료</a>
														</li>
														<li><a href="/np/categories/195050"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>탄산/스포츠음료</a>
														</li>
														<li><a href="/np/categories/311357"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>전통주</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/195142"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>커피/원두/차
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/429888"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>커피믹스</a>
														</li>
														<li><a href="/np/categories/429889"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>원두/생두</a>
														</li>
														<li><a href="/np/categories/429890"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>캡슐/더치/티백</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/195142">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/195266"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>과자/초콜릿/시리얼
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/195268"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>과자</a>
														</li>
														<li><a href="/np/categories/195282"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>비스킷/크래커</a>
														</li>
														<li><a href="/np/categories/195291"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>쿠키/파이</a>
														</li>
														<li><a href="/np/categories/195398"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>전통과자/떡</a>
														</li>
														<li><a href="/np/categories/497936"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>어린이간식</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/195443"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>면/통조림/가공식품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/486355"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>라면/컵라면</a>
														</li>
														<li><a href="/np/categories/486403"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>면류/파스타</a>
														</li>
														<li><a href="/np/categories/195484"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>참치/햄/통조림</a>
														</li>
														<li><a href="/np/categories/486855"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>즉석밥/누룽지</a>
														</li>
														<li><a href="/np/categories/486581"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>카레/짜장/양념</a>
														</li>
														<li><a href="/np/categories/486582"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>즉석국/간편조리</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/195576"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>가루/조미료/오일
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/195578"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>가루/분말류</a>
														</li>
														<li><a href="/np/categories/195621"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>설탕/소금/조미료</a>
														</li>
														<li><a href="/np/categories/195669"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>식용유/오일</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/195694"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>장/소스/드레싱/식초
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/195696"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>장류</a>
														</li>
														<li><a href="/np/categories/195716"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>케찹/마요네즈</a>
														</li>
														<li><a href="/np/categories/195720"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>머스타드</a>
														</li>
														<li><a href="/np/categories/195778"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>꿀</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/195783"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>유제품/아이스크림
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/445928"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>냉장우유</a>
														</li>
														<li><a href="/np/categories/195786"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>멸균우유</a>
														</li>
														<li><a href="/np/categories/195802"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>두유</a>
														</li>
														<li><a href="/np/categories/195889"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>기타
																디저트</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/225461"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>냉장/냉동/간편요리
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/486687"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>밀키트</a>
														</li>
														<li><a href="/np/categories/446032"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>즉석밥/볶음밥</a>
														</li>
														<li><a href="/np/categories/446035"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>즉석국/탕/찌개</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/196076"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>건강식품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/campaigns/6585"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>건강기능식품</a>
														</li>
														<li><a href="/np/campaigns/10288"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>성인용
																건강식품</a></li>
														<li><a href="/np/campaigns/10289"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>여성용
																건강식품</a></li>
														<li><a href="/np/campaigns/10290"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"food"} }'>남성용
																건강식품</a></li>
														<li class="more-category"><a
															href="/np/categories/196076">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list more-category"><a
												href="/np/categories/194276">더보기</a></li>
										</ul>
										<span class="gnb-banner" style="background: #FFF"> <a
											class="category-banner-button" href="/np/campaigns/8234"
											title="창고형매장"
											data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"food"} }'>식품</a>
											<img alt="창고형매장"
											data-banner-src="//image7.coupangcdn.com/image/displayitem/displayitem_96ace47f-0079-4436-9cf0-25a43ac75517.jpg"
											class="category-banner-image" />
										</span>

									</div>
								</div></li>
							<li class="kitchen"><a href="/np/categories/185669"
								class="first-depth"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>주방용품<i
									class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/categories/186504"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>주방가전
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/186506"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>전기밥솥</a>
														</li>
														<li><a href="/np/categories/445266"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>전자레인지</a>
														</li>
														<li><a href="/np/categories/445267"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>오븐</a>
														</li>
														<li><a href="/np/categories/384889"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>가스레인지</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/186504">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185671"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>냄비/프라이팬
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185673"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>냄비/뚝배기</a>
														</li>
														<li><a href="/np/categories/185686"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>프라이팬</a>
														</li>
														<li><a href="/np/categories/185705"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>냄비/프라이팬세트</a>
														</li>
														<li><a href="/np/categories/185722"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>찜솥/들통</a>
														</li>
														<li><a href="/np/categories/185729"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>압력솥/가마솥</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185976"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>주방조리도구
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/186012"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>조리도구</a>
														</li>
														<li><a href="/np/categories/186038"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>조리도구세트</a>
														</li>
														<li><a href="/np/categories/186045"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>가위/슬라이서/스퀴져</a>
														</li>
														<li><a href="/np/categories/186059"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>믹싱볼/대야</a>
														</li>
														<li><a href="/np/categories/186063"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>채반/소쿠리</a>
														</li>
														<li><a href="/np/categories/186067"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>다지기/절구/밀대</a>
														</li>
														<li><a href="/np/categories/486528"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>석쇠/버너/화로</a>
														</li>
														<li><a href="/np/categories/186085"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>야채탈수기</a>
														</li>
														<li><a href="/np/categories/407524"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>간식/도시락조리도구</a>
														</li>
														<li><a href="/np/categories/509037"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>베이킹용품</a>
														</li>
														<li><a href="/np/categories/509166"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>칼</a>
														</li>
														<li><a href="/np/categories/508986"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>도마</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185735"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>그릇/홈세트
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185737"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>식기홈세트</a>
														</li>
														<li><a href="/np/categories/185744"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>그릇/식기</a>
														</li>
														<li><a href="/np/categories/185782"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>접시/플레이트</a>
														</li>
														<li><a href="/np/categories/486307"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>식탁보/테이블매트</a>
														</li>
														<li><a href="/np/categories/185792"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>쟁반/베드트레이</a>
														</li>
														<li><a href="/np/categories/185764"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>이유/유아식기</a>
														</li>
														<li><a href="/np/categories/509147"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>제기/제수용품</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185823"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>수저/커트러리
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185825"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>수저/커트러리세트</a>
														</li>
														<li><a href="/np/categories/185831"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>숟가락/티스푼</a>
														</li>
														<li><a href="/np/categories/185837"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>젓가락</a>
														</li>
														<li><a href="/np/categories/185841"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>포크/디저트포크</a>
														</li>
														<li><a href="/np/categories/185846"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>나이프</a>
														</li>
														<li><a href="/np/categories/185852"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>유아동수저</a>
														</li>
														<li><a href="/np/categories/185863"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>서빙스푼/스쿱</a>
														</li>
														<li><a href="/np/categories/185867"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>수저통/수저받침</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185797"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>컵/텀블러/와인용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185799"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>머그/드링크자</a>
														</li>
														<li><a href="/np/categories/185805"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>커피잔/찻잔</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/186412"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>주전자/커피/티용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/508880"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>주전자/티포트</a>
														</li>
														<li><a href="/np/categories/186414"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>커피용품</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/186147"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>주방수납/정리
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/384929"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>공간별수납/정리</a>
														</li>
														<li><a href="/np/categories/186149"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>식기건조대/선반</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185872"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>밀폐저장/도시락
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185874"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>밀폐보관용기</a>
														</li>
														<li><a href="/np/categories/185884"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>특수저장용기</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/399678"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>주방잡화
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/399679"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>수세미/세척솔</a>
														</li>
														<li><a href="/np/categories/399685"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>고무장갑</a>
														</li>
														<li><a href="/np/categories/399686"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>행주</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/399678">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/186260"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>일회용품/종이컵
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/186262"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>랩/호일/유산지</a>
														</li>
														<li><a href="/np/categories/276482"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>키친타올</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185955"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>보온/보냉용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185957"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>보온/보냉병</a>
														</li>
														<li><a href="/np/categories/185958"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>보온/보냉도시락</a>
														</li>
														<li><a href="/np/categories/185962"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>보온죽통/푸드자</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/campaigns/695"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>수입주방
											</a>
												<div class="third-depth-list">
													<ul></ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/429840"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>1인가구
													주방용품 <i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/campaigns/2346"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>1인
																식기세트</a></li>
														<li><a href="/np/categories/429842"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>샐러드볼/시리얼볼</a>
														</li>
														<li><a href="/np/campaigns/2159"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"kitchen"} }'>미니밥솥</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/429840">더보기</a></li>
													</ul>
												</div></li>
										</ul>
										<span class="gnb-banner" style="background: #FFF"> <a
											class="category-banner-button" href="/np/campaigns/695"
											title="주방용품"
											data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"kitchen"} }'>주방용품</a>
											<img alt="주방용품"
											data-banner-src="//image8.coupangcdn.com/image/displayitem/displayitem_643bfe69-0865-4c49-a911-a56d050bfcc5.jpg"
											class="category-banner-image" />
										</span>

									</div>
								</div></li>
							<li class="life"><a href="/np/categories/115673"
								class="first-depth"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>생활용품<i
									class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/categories/144042"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>방한용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/144043"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>손난로/핫팩</a>
														</li>
														<li><a href="/np/categories/144049"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>보온/난방텐트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/123111"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>헤어
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/123139"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>샴푸/린스</a>
														</li>
														<li><a href="/np/categories/123170"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>트리트먼트/팩/앰플</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/509357"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>바디/세안
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/509358"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>샤워/입욕용품</a>
														</li>
														<li><a href="/np/categories/509509"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>바디로션/크림</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/114471"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>구강/면도
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/114563"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>면도기/날</a>
														</li>
														<li><a href="/np/categories/114564"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>면도크림/젤</a>
														</li>
														<li><a href="/np/categories/114565"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>치약</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/465071"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>화장지/물티슈
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/465073"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>화장지</a>
														</li>
														<li><a href="/np/categories/465074"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>갑티슈/여행용티슈</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/465072"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>생리대/성인기저귀
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/465077"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>일반생리대</a>
														</li>
														<li><a href="/np/categories/465078"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>오버나이트</a>
														</li>
														<li><a href="/np/categories/465079"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>팬티라이너</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/502258"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>기저귀
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/502259"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>일회용기저귀</a>
														</li>
														<li><a href="/np/categories/502263"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>수영장기저귀</a>
														</li>
														<li><a href="/np/categories/502264"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>천기저귀/액세서리</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/399742"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>세탁세제
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/399743"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>액체세제</a>
														</li>
														<li><a href="/np/categories/399744"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>분말세제</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/399758"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>청소/주방세제
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/498021"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>친환경/천연세제</a>
														</li>
														<li><a href="/np/categories/399760"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>청소세제</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/114472"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>탈취/방향/살충
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/114596"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>탈취제</a>
														</li>
														<li><a href="/np/categories/154294"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>제습제</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/114473"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>건강/의료용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/114642"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>마스크</a>
														</li>
														<li><a href="/np/categories/114650"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>의약외품/상비용품</a>
														</li>
														<li><a href="/np/categories/114641"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>눈/렌즈용품</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/174692"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>성인용품(19)
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/219159"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>콘돔</a>
														</li>
														<li><a href="/np/categories/403213"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>마사지젤/오일</a>
														</li>
														<li><a href="/np/categories/219162"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>성인
																완구/게임(19)</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/225844"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>세탁/청소용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/225845"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>청소용품</a>
														</li>
														<li><a href="/np/categories/225852"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>밀대/청소포</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/419509"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>욕실용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/419510"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>샤워기/헤드</a>
														</li>
														<li><a href="/np/categories/419523"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>목욕/샤워용품</a>
														</li>
														<li><a href="/np/categories/419534"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>수건/타월</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/419509">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/399909"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>생활전기용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/399910"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>멀티탭/연장선</a>
														</li>
														<li><a href="/np/categories/399915"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>전구/램프</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/114727"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>수납/정리
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/115136"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>선반/진열대</a>
														</li>
														<li><a href="/np/categories/115133"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>리빙박스</a>
														</li>
														<li><a href="/np/categories/403207"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"living"} }'>이사박스/종이박스</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list more-category"><a
												href="/np/categories/115673">더보기</a></li>
										</ul>
										<span class="gnb-banner" style="background: #FFF"> <a
											class="category-banner-button" href="/np/categories/114471"
											title="생활용품"
											data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"living"} }'>생활용품</a>
											<img alt="생활용품"
											data-banner-src="//image9.coupangcdn.com/image/displayitem/displayitem_792cc2d5-804f-4445-9d91-8f562b3d62b0.jpg"
											class="category-banner-image" />
										</span>

									</div>
								</div></li>
							<li class="home_decoration"><a href="/np/categories/184555"
								class="first-depth"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>홈인테리어<i
									class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/categories/508188"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>방한용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/508189"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>손난로/핫팩</a>
														</li>
														<li><a href="/np/categories/508190"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>보온/난방텐트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/317255"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>F/W
													침구샵 <i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/317256"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>이불/침구세트</a>
														</li>
														<li><a href="/np/categories/491427"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>매트리스/토퍼</a>
														</li>
														<li><a href="/np/categories/317268"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>패드/스프레드</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/413976"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>싱글하우스
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/413977"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>침대/매트리스</a>
														</li>
														<li><a href="/np/campaigns/1314"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>침구</a>
														</li>
														<li><a href="/np/categories/413986"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>러그/카페트/거실화</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/417542"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>홈데코
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/417543"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>캔들/캔들홀더</a>
														</li>
														<li><a href="/np/categories/417572"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>디퓨저/방향제</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/417542">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/184557"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>가구
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/184559"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>침실가구</a>
														</li>
														<li><a href="/np/categories/434922"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>드레스룸</a>
														</li>
														<li><a href="/np/categories/184621"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>거실가구</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/184791"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>수납/정리
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/184793"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>행거</a>
														</li>
														<li><a href="/np/categories/184799"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>옷걸이/도어훅</a>
														</li>
														<li><a href="/np/categories/184805"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>리빙박스</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/400472"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>침구
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/400473"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>이불</a>
														</li>
														<li><a href="/np/categories/400481"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>요/패드</a>
														</li>
														<li><a href="/np/categories/400491"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>매트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185101"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>커튼/블라인드
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185103"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>커튼</a>
														</li>
														<li><a href="/np/categories/185110"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>블라인드/쉐이드</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/185150"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>카페트/쿠션/거실화
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/185152"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>러그/카페트</a>
														</li>
														<li><a href="/np/categories/197131"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>발매트/주방매트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/400554"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>수예/수선
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/400555"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>원단</a>
														</li>
														<li><a href="/np/categories/400562"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>실</a>
														</li>
														<li><a href="/np/categories/400572"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>바늘</a>
														</li>
														<li class="more-category"><a
															href="/np/categories/400554">더보기</a></li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/419692"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>욕실용품
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/419693"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>샤워기/헤드</a>
														</li>
														<li><a href="/np/categories/419700"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>목욕/샤워용품</a>
														</li>
														<li><a href="/np/categories/419711"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>수건/타월</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/407567"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>조명/스탠드
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/407569"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>장스탠드</a>
														</li>
														<li><a href="/np/categories/407570"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>단스탠드</a>
														</li>
														<li><a href="/np/categories/407571"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>무드등</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/280701"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>셀프인테리어
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/280743"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>벽지/도배용품</a>
														</li>
														<li><a href="/np/categories/280702"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>페인트/핸디코트</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/384621"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>원예/가드닝
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/418920"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>꽃다발/꽃선물</a>
														</li>
														<li><a href="/np/categories/384622"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>다육이/선인장</a>
														</li>
														<li><a href="/np/categories/384625"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"home_decoration"} }'>식물/나무</a>
														</li>
													</ul>
												</div></li>
										</ul>
										<span class="gnb-banner" style="background: #FFF"> <a
											class="category-banner-button" href="/np/campaigns/6733"
											title="홈인테리어"
											data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"home_decoration"} }'>홈인테리어</a>
											<img alt="홈인테리어"
											data-banner-src="//image9.coupangcdn.com/image/displayitem/displayitem_85231ec7-7c1a-4794-b01c-59df96daa2d3.jpg"
											class="category-banner-image" />
										</span>

									</div>
								</div></li>
							<li class="appliances-digital"><a
								href="/np/categories/178255" class="first-depth">가전디지털<i
									class="select-icon"></i></a>
								<div class="depth">
									<div class="depth-list banner third">
										<ul>
											<li class="second-depth-list"><a
												href="/np/categories/178454"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>TV/영상가전
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/178456"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>TV</a>
														</li>
														<li><a href="/np/categories/509601"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>미러링/스트리밍</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/403245"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>냉장고
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/403246"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>3/4도어냉장고</a>
														</li>
														<li><a href="/np/categories/403247"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>양문형냉장고</a>
														</li>
														<li><a href="/np/categories/403248"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>일반냉장고</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/486733"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>세탁기/건조기
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/509624"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>세탁기건조기세트</a>
														</li>
														<li><a href="/np/categories/486734"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>세탁기</a>
														</li>
														<li><a href="/np/categories/486735"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>건조기</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/178627"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>생활가전
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/178663"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>공기청정기</a>
														</li>
														<li><a href="/np/categories/178658"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>다리미/재봉/보풀</a>
														</li>
														<li><a href="/np/categories/178667"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>도어록/비디오폰</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/413352"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>청소기
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/campaigns/17009"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>먼지비움청소기</a>
														</li>
														<li><a href="/np/categories/413353"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>스틱청소기</a>
														</li>
														<li><a href="/np/categories/413354"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>진공청소기</a>
														</li>
													</ul>
												</div></li>
											<li class="second-depth-list"><a
												href="/np/categories/227812"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>계절가전
													<i class="depth-select-icon"></i>
											</a>
												<div class="third-depth-list">
													<ul>
														<li><a href="/np/categories/238887"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>공기청정기</a>
														</li>
														<li><a href="/np/categories/388046"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>선풍기</a>
														</li>
														<li><a href="/np/categories/227820"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>에어컨</a>
														</li>
														<li><a href="/np/categories/238886"
															data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>제습기</a>
														</li></li>
										</ul>
									</div></li>
							<li class="second-depth-list"><a
								href="/np/categories/333478"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>뷰티/헤어가전
									<i class="depth-select-icon"></i>
							</a>
								<div class="third-depth-list">
									<ul>
										<li><a href="/np/categories/486670"
											data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>헤어드라이어</a>
										</li>
										<li><a href="/np/categories/486673"
											data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>고데기/매직기</a>
										</li>
										<li><a href="/np/categories/333479"
											data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>헤어스타일러</a>
										</li></li>
						</ul>
					</div>
					</li>
					<li class="second-depth-list"><a href="/np/categories/178713"
						data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>건강가전
							<i class="depth-select-icon"></i>
					</a>
						<div class="third-depth-list">
							<ul>
								<li><a href="/np/categories/509621"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>안마의자</a>
								</li>
								<li><a href="/np/categories/178715"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>안마/찜질기</a>
								</li>
								<li><a href="/np/categories/178722"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>전동칫솔/구강가전</a>
								</li></li>
					</ul>
				</div>
				</li>
				<li class="second-depth-list"><a href="/np/categories/445736"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>주방가전
						<i class="depth-select-icon"></i>
				</a>
					<div class="third-depth-list">
						<ul>
							<li><a href="/np/categories/445737"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>전기밥솥</a>
							</li>
							<li><a href="/np/categories/445743"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>전자레인지</a>
							</li>
							<li><a href="/np/categories/445744"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>오븐</a>
							</li>
							<li><a href="/np/categories/445747"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>가스레인지</a>
							</li>
							<li class="more-category"><a href="/np/categories/445736">더보기</a></li>
						</ul>
					</div></li>
				<li class="second-depth-list"><a href="/np/categories/497135"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>노트북
				</a>
					<div class="third-depth-list">
						<ul></ul>
					</div></li>
				<li class="second-depth-list"><a href="/np/categories/497136"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>데스크탑
						<i class="depth-select-icon"></i>
				</a>
					<div class="third-depth-list">
						<ul>
							<li><a href="/np/categories/497137"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>브랜드PC</a>
							</li>
							<li><a href="/np/categories/497138"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>일체형PC</a>
							</li>
						</ul>
					</div></li>
				<li class="second-depth-list"><a href="/np/categories/497141"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>모니터
				</a>
					<div class="third-depth-list">
						<ul></ul>
					</div></li>
				<li class="second-depth-list"><a href="/np/categories/497244"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>휴대폰
				</a>
					<div class="third-depth-list">
						<ul></ul>
					</div></li>
				<li class="second-depth-list"><a href="/np/categories/497245"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>태블릿PC
						<i class="depth-select-icon"></i>
				</a>
					<div class="third-depth-list">
						<ul>
							<li><a href="/np/categories/497246"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>태블릿PC</a>
							</li>
							<li><a href="/np/categories/497247"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>액세서리</a>
							</li>
						</ul>
					</div></li>
				<li class="second-depth-list"><a href="/np/categories/497252"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>스마트워치/밴드
						<i class="depth-select-icon"></i>
				</a>
					<div class="third-depth-list">
						<ul>
							<li><a href="/np/categories/497253"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>스마트워치</a>
							</li>
							<li><a href="/np/categories/497254"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>스마트밴드</a>
							</li>
							<li><a href="/np/categories/503019"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>액세서리</a>
							</li>
						</ul>
					</div></li>
				<li class="second-depth-list"><a href="/np/categories/395267"
					data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>게임
						<i class="depth-select-icon"></i>
				</a>
					<div class="third-depth-list">
						<ul>
							<li><a href="/np/campaigns/1366"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>게이밍노트북</a>
							</li>
							<li><a href="/np/campaigns/1596"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>게이밍데스크탑</a>
							</li>
							<li><a href="/np/campaigns/1391"
								data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"digital"} }'>게이밍모니터</a>
							</li>
							<li><a href="/np/categories/395274"></a></li>
						</ul>
					</div></li>
				<li class="second-depth-list more-category"><a
					href="/np/categories/178255">더보기</a></li>
				</ul>
				<span class="gnb-banner" style="background: #FFF"> <a
					class="category-banner-button" href="/np/campaigns/3884"
					title="가전디지털"
					data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"digital"} }'>가전디지털</a>
					<img alt="가전디지털"
					data-banner-src="//image6.coupangcdn.com/image/displayitem/displayitem_248e20ee-5bc9-4381-adb7-5d912b6e2487.png"
					class="category-banner-image" />
				</span>
			</div>
		</div>
		</li>
		<h3 class="none">티켓</h3>
		<ul class="menu ticket-menu-list">
			<li class="travel-leisure"><a
				href="https://trip.coupang.com?channel=category"
				style="cursor: pointer;">여행/티켓 <i class="select-icon"></i></a>
				<div class="depth">
					<div class="depth-list banner">
						<div class="travel-category-nav">
							<a href="https://trip.coupang.com?channel=category"
								class="travel-home">여행 홈 바로가기</a>
							<p class="travel-leisure">국내여행</p>
							<ul class="travel-second-depth-list">
								<li class="travel-second-depth-row"><a
									href="/np/categories/396465"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>펜션/캠핑
								</a>
									<div class="travel-third-depth-list">
										<ul></ul>
									</div></li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396466"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>호텔/리조트
								</a>
									<div class="travel-third-depth-list">
										<ul></ul>
									</div></li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396467"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>티켓/패스
										<i class="depth-select-icon"></i>
								</a>
									<div class="travel-third-depth-list">
										<ul>
											<li><a href="/np/categories/156698"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>스키/눈썰매장</a>
											</li>
											<li><a href="/np/categories/396472"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>스파/온천/워터파크</a>
											</li>
											<li><a href="/np/categories/396471"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>테마파크</a>
											</li>
										</ul>
									</div>
								</li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396468"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>렌터카
										<i class="depth-select-icon"></i>
								</a>
									<div class="travel-third-depth-list">
										<ul>
											<li><a href="/np/categories/396479"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>제주렌터카</a>
											</li>
											<li><a href="/np/categories/396480"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>전국렌터카</a>
											</li>
										</ul>
									</div></li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396470"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>패키지여행/항공
										<i class="depth-select-icon"></i>
								</a>
									<div class="travel-third-depth-list">
										<ul>
											<li><a href="/np/categories/396482"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>제주항공권</a>
											</li>
											<li><a href="/np/categories/396483"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Domestic"} }'>제주여행</a>
											</li>
										</ul>
									</div></li>
							</ul>
							<p class="travel-international">해외여행</p>
							<ul class="travel-second-depth-list">
								<li class="travel-second-depth-row"><a
									href="/np/categories/396554"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>패키지여행
										<i class="depth-select-icon"></i>
								</a>
									<div class="travel-third-depth-list">
										<ul>
											<li><a href="/np/categories/396559"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>동남아시아/방콕/싱가포르</a>
											</li>
											<li><a href="/np/categories/396560"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>일본</a>
											</li>
										</ul>
									</div></li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396555"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>자유여행/항공
										<i class="depth-select-icon"></i>
								</a>
									<div class="travel-third-depth-list">
										<ul>
											<li><a href="/np/categories/396566"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>동남아시아/방콕/싱가포르</a>
											</li>
											<li><a href="/np/categories/396570"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>괌/사이판/호주</a>
											</li>
										</ul>
									</div></li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396556"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>티켓/패스/현지투어
										<i class="depth-select-icon"></i>
								</a>
									<div class="travel-third-depth-list">
										<ul>
											<li><a href="/np/categories/396576"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>동남아시아/방콕/싱가포르</a>
											</li>
											<li><a href="/np/categories/396573"
												data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>일본</a>
											</li>
										</ul>
									</div></li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396558"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>호텔
								</a></li>
								<li class="travel-second-depth-row"><a
									href="/np/categories/396580"
									data-log-props='{ "id":"category_menu", "param":{"categoryLabel":"Travel-Overseas"} }'>실시간항공권
								</a></li>
							</ul>
							</div>
							<span class="gnb-banner" style="background: #FFF"> <a
								class="category-banner-button"
								href="https://pages.coupang.com/p/58690" title="국내여행"
								data-log-props='{ "id":"category_menu_banner", "param":{"categoryLabel":"Travel-Domestic"} }'>국내여행</a>
								<img alt="국내여행"
								data-banner-src="//image10.coupangcdn.com/image/displayitem/displayitem_4f3cf2c3-210e-45fe-a481-d89a21e35296.jpg"
								class="category-banner-image" />
							</span>
						</div>
					</div>
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
						<a href="../myLogout.do"
							data-replaced="true" class="login"
							data-log-props='{ "id":"logout" }'> 로그아웃</a></li>

					</c:when>
					<c:otherwise>
						<li id="login" class="log"><a href="../myLogin.do"
							data-replaced="true" class="login"
							data-log-props='{ "id":"login" }'>로그인</a></li>
						<li id="join" class="join"><a
							href="regist.do"
							data-log-props='{ "id":"member_register" }'>회원가입</a></li>
					</c:otherwise>
				</c:choose>


				<li class="cs-center more"><a
					href="./supports/faq.do?categoryCode=ALL"
					data-log-props='{ "id":"customer_center" }'>고객센터</a>
					<p>
						<a href="./supports/faq.do?categoryCode=ALL"
							data-log-props='{ "id":"customer_center_1" }'>자주묻는질문</a> 
							
							<a href="./supports/inquiry.do"
							data-log-props='{ "id":"customer_center_3" }'>1:1 채팅문의</a> 
							
							<a href="./supports/voc.do"
							data-log-props='{ "id":"customer_center_2" }'>고객의 소리</a> 
							
							<a href="./supports/returnPolicy.do"
							data-log-props='{ "id":"customer_center_4" }'>취소 / 반품 안내</a>
					</p></li>
					
				<li class="cs-center more"><a
					href="/product_insert">상품등록</a>
				</li>
				<li class="cs-center more"><a
					href="/journey_insert">상품등록(여행)</a>
				</li>
			</menu>
			<menu id="subscribeHeader">
				<li><a class="bookmark"
					data-log-props='{ "id": "add_to_favorites" }'>즐겨찾기</a></li>
				<li class="vendor-join more"><a href="./Sell_Authorized.do" id="sellerApp">입점신청<i class="ic"></i></a>
					<p>
						<a
							href="https://wing.coupang.com/vendor/joining/welcome?inflow=WEB_HEADER_B"
							data-log-props='{ "id":"seller_page" }' target="_blank">오픈마켓</a>
						<a
							href="https://with.coupang.com/contract/initialize?inflow=WEB_HEADER_B"
							data-log-props='{ "id":"travel_seller_page" }' target="_blank">여행·티켓</a>
						<a href="https://supplier.coupang.com/welcome/join"
							data-log-props='{ "id":"rocket_seller_page" }' target="_blank">로켓배송</a>
						<a href="https://partners.coupang.com"
							data-log-props='{ "id":"coupang_partners_page" }' target="_blank">제휴마케팅</a>
					</p></li>
			</menu>
		</section>
	</article>
	</div>
	</div>
</body>
</html>