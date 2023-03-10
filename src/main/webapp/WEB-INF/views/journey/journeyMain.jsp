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
<style>
.personnel-selector-text {
    padding: 20px 25px;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -.4px;
    color: #555;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

.personnel-selector .personnel-selector-layer {
    position: absolute;
    top: 0;
    right: 0;
    width: 290px;
    margin-top: -5px;
    z-index: 1001;
}
.personnel-selector-pane {
    font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
    z-index: 1;
    cursor: default;
    display: block;
    position: absolute;
    left: 0;
    padding: 30px 30px 20px;
    background-color: #fff;
    -webkit-box-shadow: 0 2px 6px rgb(0 0 0 / 16%), 0 0 0 1px rgb(0 0 0 / 8%);
    box-shadow: 0 2px 6px rgb(0 0 0 / 16%), 0 0 0 1px rgb(0 0 0 / 8%);
    border-radius: 0 0 3px 3px;
}
.best-keyword-title {
    font-size: 13px;
    font-weight: 700;
    letter-spacing: -.5px;
    color: #00a289;
    padding: 25px 30px 10px;
}
</style>
<script type="text/javascript">
/* 티켓 search 활성화 */
function ticketchange(){
		$("#journeySearch").css("display","none");
	    $("#ticketSearch").css("display","block");
	    $("#recommendSelect_j").css("display","none");
	    $("#dynamicCal").css("display","none");
	    $("#staticCal").css("display","block")	
		$("#kidadult").css("display","block")
}
/* 여행 search 활성화 */
function journeychange(){
		$("#journeySearch").css("display","block");
		
	    $("#ticketSearch").css("display","none");
	    $("#recommendSelect_t").css("display","none");
}
function recommend_t(){
	$("#recommendSelect_t").css("display","block");
}
function recommend_j(){
	$("#recommendSelect_j").css("display","block");
}
function dynamicCalReset(){
	$("#dynamicCal").css("display","none");	
	$("#staticCal").css("display","block")	
	$("#kidadult").css("display","block")
	$("#searchIcon").css("display","block");
}
function personnel(){
	$(".personnel-selector-layer").css("display","block")
}
function del(){
	$(".personnel-selector-layer").css("display","none")
}
window.onload = function(){
	date = new Date;
	
    var year = date.getFullYear();

    var month = ("0"+(date.getMonth()+1)).slice(-2); 
    
    var today = month + '/' + ("0" + date.getDate()).slice(-2) + '/' +year ; 
    
    var tomorrow = month + '/' + (date.getDate()+1) + '/' +year;
    
    document.getElementById("inputDate").value = today + ' - ' + tomorrow;
    
}  
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'right'
  }, function(start, end, label) {
    /*  console.log("A new date selection was made: " + start.format('YY-MM-DD') + ' to ' + end.format('YY-MM-DD'));  */
     $.ajax({
	      type: 'POST', 
	      url: '/dateSave', 
	      data: JSON.stringify({
	          ji_duetime1 : start.format('YY/MM/DD'),
	          ji_duetime2 : end.format('YY/MM/DD')
	        }),
	      contentType: "application/json",	  	 
	      success: function(response) {
	        console.log('서버에 전송 완료');
	      },
	      error: function(xhr, status, error) {
	        console.error('서버 전송 에러:', error);
	     }
	 });
  });
});
var countA=2;
var countK=0;

var countUp=function(){
    countA=countA+1;
    document.querySelector("#ji_adult").innerText=countA;
};
var countDown=function(){
    if(countA>0){
        countA=countA-1;        
        document.querySelector("#ji_adult").innerText=countA;
        
    }
};
var countUp2=function(){
    countK=countK+1;
    document.querySelector("#ji_kid").innerText=countK;
};
var countDown2=function(){
    if(countK>0){
        countK=countK-1;        
        document.querySelector("#ji_kid").innerText=countK;
        
    }
};
function resultPerson(){
    $.ajax({
        type: 'GET',
        url: '/personnel', 
        data: {
        	ji_adult: countA,
        	ji_kid: countK
        }, 
        success: function(response) { 
            console.log(response);
            $("#ji_kid").text(countK);
            $("#ji_adult").text(countA);
            $("#result").text('성인 ' + countA + ', ' + '아동 ' + countK);
            $(".personnel-selector-layer").css("display","none");
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus + ': ' + errorThrown);
        }
    });
}
</script>
<body>
<div id="top">
        <%@include file="../top.jsp" %> 
</div>
<section id="contents" style="width: 1910px;" class="contents">
        <div id="travel-container">
            <div class="travel-home-gateway">
                <section class="home-search-wizard">
                    <div class="home-search-wizard-wrapper">
                        <div class="search-wizard-container">
                            <ul class="search-wizard-tab">
                                <li><a href="javascript:void(0);onclick=journeychange();" id="acc">숙박</a></li>
                                <li><a href="javascript:void(0);onclick=ticketchange();" id="ticket">티켓</a></li>
                            </ul>
                            <div class="lodging-search-wizard" id="journeySearch" style="display: block;">
                                <h4 class="wizard-logo"><img style="width: 130px; height: 25px" src="./images/roupang여행.png"></h4>
                                <ul class="wizard-components">
                                    <li class="wizard-keyword">
                                        <div class="search-keyword-wrap">
                                            <div class="search-keyword">
                                                <div class="search-keyword-input">
                                                    <i class="travel-icon icon-search-sm-white search-keyword-icon">icon</i>
                                                    <input type="text" class="search-keyword-text"onclick="recommend_j()" id="jSearchBox" placeholder="국내외 지역명, 숙소명으로 검색" value="">
                                                </div>
												<div class="best-keyword-group-layer" id="recommendSelect_j" style="display: none; height: 150px; width: 455px;">
													<div class="best-keyword-group-values-layer">
													<h5 class="best-keyword-title" style="">주요검색어 바로선택</h5>
														<ul class="best-keyword-group-value" style="width: 450px;">
															<li style="width: 80px"><a href="/journey_List?category=2&location=제주&" class="best-keyword-group-item">제주</a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=강원" class="best-keyword-group-item">강원</a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=부산" class="best-keyword-group-item">부산</a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=가평" class="best-keyword-group-item">가평</a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=경주" class="best-keyword-group-item">경주</a></li>
														</ul>
														<ul class="best-keyword-group-value" style="width: 450px;">
															<li style="width: 80px"><a href="/journey_List?category=2&location=서울" class="best-keyword-group-item">서울</a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=전주" class="best-keyword-group-item">전주 </a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=강릉" class="best-keyword-group-item">강릉</a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=경기" class="best-keyword-group-item">경기</a></li>
															<li style="width: 80px"><a href="/journey_List?category=2&location=속초" class="best-keyword-group-item">속초</a></li>
														</ul>
													</div>
												</div>
											</div>
                                        </div>
                                    </li>
										<li class="wizard-dates" id="staticCal">
											<div class="date-picker">
												<a href="javascript:void(0);"class="date-picker-input">
													<span style="font-size: 14px;">
														<input type="text" name="daterange" id="inputDate" value="" style="border: none; width: 180px; height:47px; background-color: #3fd1b7; color: white; font-weight: bold;" />
													</span>
												</a>
											</div>
										</li>
									<li class="wizard-personnel" id="kidadult">
                                        <div class="personnel-selector" onclick="personnel();">
	                                        <a class="personnel-selector-input">
	                                            <span id="result">성인 2, 아동 0</span>
	                                            <i class="travel-icon icon-caret-down-white"style="width: 12px; height: 7px; background-size: 12px 7px; margin-top: 20px; margin-right: 15px; float: right;">icon </i>
	                                        </a>
                                     	</div>
											<div class="personnel-selector-layer" style="display: none;">
												<div class="personnel-selector-pane"
													style="width: 300px; top: 98px; left: 1260px;">
													<div class="personnel-selector-pane__spinner-wrap">
														<label>성인</label>
														<div class="travel-spinner"
															style="float: right; width: 106px; height: 32px; border-radius: 17px; border-color: rgb(52, 106, 255);">
															<button class="spinner-minus" type="button"
																onclick="countDown();"
																style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-left-radius: 16px; border-bottom-left-radius: 16px;">
																<i class="spinner-minus-icon"
																	style="width: 8px; height: 8px; margin-top: 14px; margin-left: 11px; border-top-color: rgb(52, 106, 255);"></i>
															</button>
															<div class="spinner-number result"
																style="width: 44px; height: 30px; line-height: 30px; font-size: 14px; font-weight: bold; color: rgb(74, 74, 74); border-left-color: rgb(52, 106, 255); border-right-color: rgb(52, 106, 255);">
																<span id="ji_adult">2</span>
															</div>
															<button class="spinner-plus" type="button"
																onclick="countUp();"
																style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-right-radius: 16px; border-bottom-right-radius: 16px;">
																<i class="spinner-plus-icon"
																	style="width: 8px; height: 8px; margin-top: 14px; margin-left: 11px; border-top-color: rgb(52, 106, 255);">
																	<i
																	style="width: 8px; height: 8px; margin-top: -5px; margin-left: 3px; border-left-color: rgb(52, 106, 255);"></i>
																</i>
															</button>
														</div>
													</div>
													<div class="personnel-selector-pane__spinner-wrap">
														<label>아동</label>
														<div class="travel-spinner result"
															style="float: right; width: 106px; height: 32px; border-radius: 17px; border-color: rgb(52, 106, 255);">
															<button class="spinner-minus" onclick="countDown2();"
																style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-left-radius: 16px; border-bottom-left-radius: 16px;">
																<i class="spinner-minus-icon"
																	style="width: 8px; height: 8px; margin-top: 14px; margin-left: 11px; border-top-color: rgb(204, 204, 204);"></i>
															</button>
															<div class="spinner-number result"
																style="width: 44px; height: 30px; line-height: 30px; font-size: 14px; font-weight: bold; color: rgb(74, 74, 74); border-left-color: rgb(52, 106, 255); border-right-color: rgb(52, 106, 255);">
																<span id="ji_kid">0</span>
															</div>
															<button class="spinner-plus"
																style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-right-radius: 16px; border-bottom-right-radius: 16px;">
																<i class="spinner-plus-icon" onclick="countUp2();"
																	style="width: 8px; height: 8px; margin-top: 14px; margin-left: 11px; border-top-color: rgb(52, 106, 255);"><i
																	style="width: 8px; height: 8px; margin-top: -5px; margin-left: 3px; border-left-color: rgb(52, 106, 255);"></i></i>
															</button>
														</div>
													</div>
													<div class="personnel-selector-pane__button-wrap">
														<button class="travel-button travel-button__white md" onclick="del();"
															style="color: rgb(85, 85, 85); font-size: 14px; font-weight: bold; border: 1px solid rgb(204, 204, 204); width: 100px; height: 32px; line-height: 30px; margin-right: 10px;">취소</button>
														<button class="travel-button travel-button__blue md" onclick="resultPerson();"
															style="font-size: 14px; width: 100px; height: 32px; line-height: 30px;">확인</button>
													</div>
												</div>
											</div>
									</li>
									<li class="wizard-dates" style="display: none;" id="dynamicCal" >
	                                    <div class="date-picker-layer" style="top: 57px;">
											<div class="date-picker-text"></div>
											
										</div>
									</li>
                                </ul>
                                <a class="wizard-search-btn" id="searchIcon">
                                    <i class="travel-icon icon-search-blue"
                                        style="margin-top: 13px; margin-left: 13px;">icon
                                    </i>
                                </a>
                            </div>
                            <!-- 티켓을 눌렀을대 나올 서치박스 -->
                            <div class="lodging-search-wizard" id="ticketSearch" style="display: none;">
                                <h4 class="wizard-logo"><img style="width: 130px; height: 25px;" src="./images/roupang여행.png"></h4>
                                <ul class="wizard-components">
                                    <li class="wizard-keyword">
                                        <div class="search-keyword-wrap">
                                            <div class="search-keyword" >
                                                <div class="search-keyword-input" >
                                                    <i class="travel-icon icon-search-sm-white search-keyword-icon">icon</i>
                                                    <input type="text" class="search-keyword-text" onclick="recommend_t()" id="tSearchBox" placeholder="국내외 지역명, 숙소명으로 검색" value="">
                                                </div>
                                                 <div class="best-keyword-layer" id="recommendSelect_t" style="display:none">
													<h5 class="best-keyword-title">주요검색어 바로선택</h5>
													<ul class="best-keyword-group">
														<li><a href="/ticket_List?category=1&title=롯데월드" class="best-keyword-item">롯데월드</a></li>
														<li><a href="/ticket_List?category=1&title=에버랜드" class="best-keyword-item">에버랜드</a></li>
														<li><a href="/ticket_List?category=1&title=경주월드" class="best-keyword-item">경주월드</a></li>
													</ul>
													<ul class="best-keyword-group">
														<li><a href="/ticket_List?category=1&title=대구이월드" class="best-keyword-item">대구이월드</a></li>
														<li><a href="/ticket_List?category=1&title=키즈카페" class="best-keyword-item">키즈카페</a></li>
														<li><a href="/ticket_List?category=1&title=아쿠아리움" class="best-keyword-item">아쿠아리움</a></li>
													</ul>
													<ul class="best-keyword-group">
														<li><a href="/ticket_List?category=1&title=동물원" class="best-keyword-item">동물원</a></li>
														<li><a href="/ticket_List?category=1&title=스키장" class="best-keyword-item">스키장</a></li>
														<li><a href="/ticket_List?category=1&title=관람회" class="best-keyword-item">관람회</a></li>
													</ul>
												</div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
								<a class="wizard-search-btn">
                                    <i class="travel-icon icon-search-blue"
                                        style="margin-top: 13px; margin-left: 13px;">icon
                                    </i>
                                </a>
                                
                            </div>
                        </div>
                    </div>
                </section>
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
                                <a target="_blank">
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
