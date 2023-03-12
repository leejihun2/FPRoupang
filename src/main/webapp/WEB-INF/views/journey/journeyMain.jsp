<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./journeycss/bundle1.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle2.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle3.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/travel.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/journeyTop.css" type="text/css" />
<link rel="stylesheet" href="./css/common.css" type="text/css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<head>
<meta charset="UTF-8">
<title>여행 메인 페이지 </title>
</head>
<script src="./js/journeyTop.js"></script>
<body>
<div id="top">
        <%@include file="../top.jsp" %> 
</div>
			 <%@include file="./searchbox.jsp" %> 
                <section class="home-c1-banners">
                    <div class="main-banner">
                        <a><img src="http://image8.coupangcdn.com/image/bannerunit/bannerunit_8044d229-e229-482a-ab12-7da4ce0005c2.jpg" class="banner-image selected" data-tti-key="sync"></a>
                        <a><img src="http://image6.coupangcdn.com/image/bannerunit/bannerunit_8e45dcfa-e3fa-4304-93de-94e7485dc51e.jpg" class="banner-image"></a>
                        <a><img src="http://image6.coupangcdn.com/image/bannerunit/bannerunit_1a507dba-ed5c-402c-adb6-a8eb8be95723.jpg" class="banner-image"></a>
                        <div class="banner-info">
                            <div class="info-indicator">
                                <ul class="info-indicators">
                                    <li class="selected" style="width: 144.444px;"><span class="indicator-bar">&nbsp;</span>
                                        <p class="indicator-description"><i class="icon-dot"></i><span>화이트데이 티켓/패스</span></p>
                                    </li>
                                    <li class="" style="width: 144.444px;"><span class="indicator-bar">&nbsp;</span>
                                        <p class="indicator-description"><i class="icon-dot"></i><span>와우회원 추가할인</span></p>
                                    </li>
                                    <li class="" style="width: 144.444px;"><span class="indicator-bar">&nbsp;</span>
                                        <p class="indicator-description"><i class="icon-dot"></i><span>단독 특가 펜션</span></p>
                                    </li>
                                    <li class="" style="width: 144.444px;"><span class="indicator-bar">&nbsp;</span>
                                        <p class="indicator-description"><i class="icon-dot"></i><span>금호리조트 4개 지점</span></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="home-category-section home-section">
                    <div class="travel-sub-category" style="margin-top: 0px;">
                        <h4 class="travel-sub-category-title">여행 카테고리</h4>
                        <ul class="travel-sub-categories">
                            <li class="category-item">
                                <a href="/journeyView" target="_blank">
                                    <div class="category-image">
                                    <img src="http://image9.coupangcdn.com/image/component_62_asset/component_62_asset_94b4ab55-3357-4680-8ad8-c166613c87af.png">
                                    </div>
                                    <span class="category-name">호텔</span>
                                </a>
                            </li>
                            <li class="category-item">
                                <a target="_blank">
	                                <div class="category-image">
	                                <img src="http://image7.coupangcdn.com/image/component_62_asset/component_62_asset_9d112669-36f4-41cc-b1f3-ecf301781d8a.png">
	                                </div>
	                                <span class="category-name">펜션</span>
                            </a>
                            </li>
                            <li class="category-item">
                                <a href="/ticketView" target="_blank">
                                    <div class="category-image">
                                    <img src="http://image6.coupangcdn.com/image/component_62_asset/component_62_asset_2c199468-9831-4429-8972-58862551484d.png">
                                    </div>
                                    <span class="category-name">티켓</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="home-c2-banners home-section">
                    <div class="grid-banner">
                        <h2 class="grid-banner-title">인기트립</h2>
                        <ul class="grid-banners">
                            <li class="grid-banner-item">
                                <a>
                                    <dl>
                                        <dt><img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_4e915243-4840-4def-8994-c56713b2be3f.jpg"
                                                class="banner-item-image"></dt>
                                        <dd><span class="banner-item-title">여수 녹테마레 미디어아트</span><span
                                                class="banner-item-description">와우회원 8,700원~</span></dd>
                                    </dl>
                                </a>
                            </li>
                            <li class="grid-banner-item">
                                <a>
                                    <dl>
                                        <dt><img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_a4761c7d-3c30-45be-ad68-884841e9ba41.jpg"
                                                class="banner-item-image"></dt>
                                        <dd><span class="banner-item-title">롯데월드 종합이용권</span><span
                                                class="banner-item-description">최대 35% 할인</span></dd>
                                    </dl>
                                </a>
                            </li>
                            <li class="grid-banner-item">
                                <a>
                                    <dl>
                                        <dt><img src="http://image6.coupangcdn.com/image/bannerunit/bannerunit_310b7cb7-7e30-410f-8509-78ca91631800.jpg"
                                                class="banner-item-image"></dt>
                                        <dd><span class="banner-item-title">경주월드 종일권</span><span
                                                class="banner-item-description">와우특가 51,000원~</span></dd>
                                    </dl>
                                </a>
                            </li>
                            <li class="grid-banner-item">
                                <a>
                                    <dl>
                                        <dt><img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_3a4fd182-4342-40bd-ae38-de8ec97ad54f.jpg"
                                                class="banner-item-image"></dt>
                                        <dd><span class="banner-item-title">서울랜드 AFTER2</span><span
                                                class="banner-item-description">평일 한정 이용권 18,900원~</span></dd>
                                    </dl>
                                </a>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="home-recommendation home-section">
                    <div class="listing-widget">
                        <h2 class="listing-widget-title">고객님을 위한 여행상품</h2>
                        <div class="listing-widget-nav"><a class="product-nav nav-left disabled"><i
                                    class="arrow-left"></i></a><a class="product-nav nav-right"><i class="arrow-right"></i></a>
                        </div>
                        <div class="listing-widget-results">
                            <ul class="product-items" style="left: 0px;">
                                <li class="product-item">
                                    <a>
                                        <div class="item-thumbnail" style="background-image: url(&quot;//thumbnail8.coupangcdn.com/thumbnails/remote/800x400q65crop400x400/image/travel_reactor/travelSeller/common/A00165112/cda052fb-a987-4acb-a66f-27e106245106.JPG&quot;), url(&quot;//img1a.coupangcdn.com/image/coupang/travel/tlp/no-image/no-image-200x200.svg&quot;);"></div>
                                        <div class="item-content">
                                            <div class="item-title"
                                                style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2;">
                                                [양평] 양평패러글라이딩 미래항공스포츠 체험비행 이용권
                                            </div>
                                            <div class="item-price"><span class="price-sale"><em>140,000</em>원</span></div>
                                            <div class="item-rating">
                                                <div class="rating-star" style="width: 70px; height: 14px;">
                                                    <div class="rating-star-empty" style="background-size: 14px;"></div>
                                                    <div class="rating-star-full" style="width: 70px; background-size: 14px;"></div>
                                                </div>(15)
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-item">
                                    <a>
                                        <div class="item-thumbnail"  style="background-image: url(&quot;//thumbnail9.coupangcdn.com/thumbnails/remote/800x400q65crop400x400/image/travel_reactor/travelSeller/common/A00186378/29da4be0-1b62-4a56-addb-249bac068448.jpg&quot;), url(&quot;//img1a.coupangcdn.com/image/coupang/travel/tlp/no-image/no-image-200x200.svg&quot;);"></div>
                                        
                                        <div class="item-content">
                                            <div class="item-title"
                                                style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2;">
                                                [제주] 세리월드 카트+세계자동차박물관 /서귀포 카트체험</div>
                                            <div class="item-price"><span class="price-sale"><em>20,000</em>원</span></div>
                                            <div class="item-rating">
                                                <div class="rating-star" style="width: 70px; height: 14px;">
                                                    <div class="rating-star-empty" style="background-size: 14px;"></div>
                                                    <div class="rating-star-full" style="width: 70px; background-size: 14px;"></div>
                                                </div>(3)
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-item">
                                    <a>
                                        <div class="item-thumbnail" style="background-image: url(&quot;//thumbnail7.coupangcdn.com/thumbnails/remote/800x400q65crop400x400/image/travel_reactor/travelSeller/common/A00186565/22c88ddd-544f-4d5c-b5fa-bda8f800fa1d.jpg&quot;), url(&quot;//img1a.coupangcdn.com/image/coupang/travel/tlp/no-image/no-image-200x200.svg&quot;);"></div>
                                        <div class="item-content">
                                            <div class="item-title"
                                                style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2;">
                                                [세종시] 베어트리파크 입장권</div>
                                            <div class="item-price"><span class="price-sale"><em>8,000</em>원</span></div>
                                            <div class="item-rating">
                                                <div class="rating-star" style="width: 70px; height: 14px;">
                                                    <div class="rating-star-empty" style="background-size: 14px;"></div>
                                                    <div class="rating-star-full" style="width: 70px; background-size: 14px;">
                                                    </div>
                                                </div>(67)
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-item">
                                    <a>
                                        <div class="item-thumbnail" style="background-image: url(&quot;//thumbnail6.coupangcdn.com/thumbnails/remote/800x400q65crop400x400/image/travel_reactor/travelSeller/common/A00056672/2c5927d3-b2ab-47c2-a038-84de743acdbb.jpg&quot;), url(&quot;//img1a.coupangcdn.com/image/coupang/travel/tlp/no-image/no-image-200x200.svg&quot;);"></div>
                                        <div class="item-content">
                                            <div class="item-title"
                                                style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2;">
                                                [코타키나발루] 무료 1Day 시티투어+디나완 반딧불 투어</div>
                                            <div class="item-price"><span class="price-sale"><em>55,000</em>원</span></div>
                                            <div class="item-rating">
                                                <div class="rating-star" style="width: 70px; height: 14px;">
                                                    <div class="rating-star-empty" style="background-size: 14px;"></div>
                                                    <div class="rating-star-full" style="width: 70px; background-size: 14px;">
                                                    </div>
                                                </div>(1)
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-item">
                                    <a>
                                        <div class="item-thumbnail"  style="background-image: url(&quot;//thumbnail10.coupangcdn.com/thumbnails/remote/800x400q65crop400x400/image/travel_reactor/travelSeller/hotel/A00127940/55e426a9-266d-4a0a-aa51-ae19573756a6.jpeg&quot;), url(&quot;//img1a.coupangcdn.com/image/coupang/travel/tlp/no-image/no-image-200x200.svg&quot;);">
                                        </div>
                                        <div class="item-content">
                                            <div class="item-title"
                                                style="overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2;">
                                                [서귀포] 브리즈베이호텔</div>
                                            <div class="item-price"><span class="price-sale"><em>55,000</em>원</span></div>
                                            <div class="item-rating">
                                                <div class="rating-star" style="width: 70px; height: 14px;">
                                                    <div class="rating-star-empty" style="background-size: 14px;"></div>
                                                    <div class="rating-star-full" style="width: 56px; background-size: 14px;">
                                                    </div>
                                                </div>(20)
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>
        </div>
</section>
<div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
 </div>
</body>
</html>
