<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charSet="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <meta name="next-head-count" content="2" />
    <meta charSet="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="csrf-token" content="jogZeNtZ-fo2pNeObBtP3lGvZilgWPxm4M2g" />
    <meta charSet="utf-8" />
    <meta name="google-site-verification" content="zaNrGtrOLMjglkziY2IvmL8dOXyCWHGArDHqFazJQVI" />
    <meta http-equiv="x-dns-prefetch-control" content="on" />
    <title>루팡!</title>
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
<body style="background-color: white;">
    <!-- top.html에서 인클루드 -->
    <div id="top">
        <%@include file="./top.jsp" %>
    </div>
        <section class="main-today reach-ratio-wrap" id="todaysHot"> 
        <c:forEach items="${image_dto}" var="dto" varStatus="loop">
        <div id="demo" class="carousel slide carousel-fade" data-bs-ride="carousel">
        	<div class="carousel-inner">
        		<div class="carousel-item active">
            		<img src="/uploads/${dto.image1}" width="1920" height="450">
            	</div>
            	<div class="carousel-item">
            		<img src="/uploads/${dto.image2}" width="1920" height="450">
            	</div>
            	<div class="carousel-item">
            		<img src="/uploads/${dto.image3}" width="1920" height="450">
            	</div>
            	<div class="carousel-item">
            		<img src="/uploads/${dto.image4}" width="1920" height="450">
            	</div>
            	<div class="carousel-item">
            		<img src="/uploads/${dto.image5}" width="1920" height="450">
            	</div>
            	<div class="carousel-item">
            		<img src="/uploads/${dto.image6}" width="1920" height="450">
            	</div>
            </div>
        </div>    
        </c:forEach> 
        </section>
        <hr/>
<section id="contents" class="contents home">
  
        <div id="personalCategories" data-personalcategories='[WOMAN_CLOTHE, MAN_CLOTHE, BEAUTY, BABY, FOOD, KITCHEN, LIVING, FURNITURE, ELECTRONICS, SPORTS, CAR, HOBBY, OFFICE, BOOKS, PETS, TRAVEL, BABY_FASHION, HEALTH]'></div>
            <div id="todayDiscoveryUnit" class="reach-ratio-wrap" style="margin-bottom: 50px;">
                <div class="main-section today-discovery" style="width: 977px; margin-bottom: 0px;">
                    <h2>오늘의 발견<small style="font-size: 14px; color: gray;"> | 오늘 루팡이 엄선한 가장 HOT한 상품!</small></h2>
                    <div class="discovery-list">
                        <ul>
                            <li class="li-list">
                                <img class="li-img" src="../images/C2-1-한국피앤지판매유한회사.jpg" alt=""></li>
                            <li class="li-list">
                                <img src="../images/C2-2-프리즘.jpg" alt=""></li>
                            <li class="li-list">
                                <img class="li-img-min" src="../images/C2_3.jpg" alt="">
                            </li>
                            <li class="li-list">
                                <img class="li-img-min" src="../images/C2_3.jpg" alt="">
                            </li>
                            <li class="li-list">
                                <img class="li-img-min" src="../images/C2_3.jpg" alt="">
                            </li>
                            <li class="li-list">
                                <img class="li-img-min" src="../images/C2_3.jpg" alt="">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        <div class="decker-carousel">
            <h2><i class="bi bi-bag-check" style="color: violet;"></i><strong> 오늘의 쇼핑 제안</strong></h2> 
            <div id="pd" class="carousel carousel-dark slide" >
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <ul>
                        <li><a href=""><img class="today-pd" src="../images/버즈.jpg" alt=""><p class="today-p">ACRO 프로 버즈 무선 블루투스 이어폰</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/에어팟케이스.jpg" alt=""><p class="today-p">신지모루 변색방지 에어팟 1 / 2 세대 TPU 케이스 + 철가루 방지 스티커 + 카라비너</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/신지모루.jpg" alt=""><p class="today-p">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/에어맥스.jpg" alt=""><a href=""><p class="today-p">Apple 에어팟 맥스 블루투스헤드셋</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/케이스.jpg" alt=""><a href=""><p class="today-p">케이스케이스케이스케이스케이스케이스</p></a></li>
                    </ul>
                  </div>
                  <div class="carousel-item">
                    <ul>
                        <li><a href="#"><img class="today-pd" src="../images/버즈.jpg" alt=""><p class="today-p">ACRO 프로 버즈 무선 블루투스 이어폰</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/에어팟케이스.jpg" alt=""><p class="today-p">신지모루 변색방지 에어팟 1 / 2 세대 TPU 케이스 + 철가루 방지 스티커 + 카라비너</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/신지모루.jpg" alt=""><p class="today-p">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/에어맥스.jpg" alt=""><a href=""><p class="today-p">Apple 에어팟 맥스 블루투스헤드셋</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/케이스.jpg" alt=""><a href=""><p class="today-p">케이스케이스케이스케이스케이스케이스</p></a></li>
                    </ul>
                  </div>
                  <div class="carousel-item">
                    <ul>
                        <li><a href="#"><img class="today-pd" src="../images/버즈.jpg" alt=""><p class="today-p">ACRO 프로 버즈 무선 블루투스 이어폰</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/에어팟케이스.jpg" alt=""><p class="today-p">신지모루 변색방지 에어팟 1 / 2 세대 TPU 케이스 + 철가루 방지 스티커 + 카라비너</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/신지모루.jpg" alt=""><p class="today-p">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/에어맥스.jpg" alt=""><a href=""><p class="today-p">Apple 에어팟 맥스 블루투스헤드셋</p></a></li>
                        <li><a href=""><img class="today-pd" src="../images/케이스.jpg" alt=""><a href=""><p class="today-p">케이스케이스케이스케이스케이스케이스</p></a></li>
                    </ul>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#pd" data-bs-slide="prev" style="left: -63px;">
                    <span class="carousel-control-prev-icon" ></span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#pd" data-bs-slide="next" style="right: -67px;">
                    <span class="carousel-control-next-icon"></span>
                  </button>
                </div>
            </div>
        </div>
        <div class="decker-carousel">
            <h2><i class="bi bi-graph-up-arrow" style="color: purple;"></i><strong> 좋아할만한 카테고리 상품</strong></h2> 
            <div id="tpd" class="carousel carousel-dark slide" >
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <ul>
                        <li><a href="#"><img class="like-pd" src="../images/버즈.jpg" alt=""><p class="like-p">ACRO 프로 버즈 무선 블루투스 이어폰</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/에어팟케이스.jpg" alt=""><p class="like-p">신지모루 변색방지 에어팟 1 / 2 세대 TPU 케이스 + 철가루 방지 스티커 + 카라비너</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/신지모루.jpg" alt=""><p class="like-p">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/에어맥스.jpg" alt=""><p class="like-p">Apple 에어팟 맥스 블루투스헤드셋</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/케이스.jpg" alt=""><p class="like-p">케이스케이스케이스케이스케이스케이스</p></a></li>케이스케이스케이스</p></a></li>
                    </ul>
                  </div>
                  <div class="carousel-item">
                    <ul>
                        <li><a href="#"><img class="like-pd" src="../images/버즈.jpg" alt=""><p class="like-p">ACRO 프로 버즈 무선 블루투스 이어폰</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/에어팟케이스.jpg" alt=""><p class="like-p">신지모루 변색방지 에어팟 1 / 2 세대 TPU 케이스 + 철가루 방지 스티커 + 카라비너</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/신지모루.jpg" alt=""><p class="like-p">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/에어맥스.jpg" alt=""><p class="like-p">Apple 에어팟 맥스 블루투스헤드셋</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/케이스.jpg" alt=""><p class="like-p">케이스케이스케이스케이스케이스케이스</p></a></li>케이스케이스케이스</p></a></li>
                    </ul>
                  </div>
                  <div class="carousel-item">
                    <ul>
                        <li><a href="#"><img class="like-pd" src="../images/버즈.jpg" alt=""><p class="like-p">ACRO 프로 버즈 무선 블루투스 이어폰</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/에어팟케이스.jpg" alt=""><p class="like-p">신지모루 변색방지 에어팟 1 / 2 세대 TPU 케이스 + 철가루 방지 스티커 + 카라비너</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/신지모루.jpg" alt=""><p class="like-p">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/에어맥스.jpg" alt=""><p class="like-p">Apple 에어팟 맥스 블루투스헤드셋</p></a></li>
                        <li><a href="#"><img class="like-pd" src="../images/케이스.jpg" alt=""><p class="like-p">케이스케이스케이스케이스케이스케이스</p></a></li>케이스케이스케이스</p></a></li>
                    </ul>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#tpd" data-bs-slide="prev" style="left: -63px;">
                    <span class="carousel-control-prev-icon" ></span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#tpd" data-bs-slide="next" style="right: -67px;">
                    <span class="carousel-control-next-icon"></span>
                  </button>
                </div>
            </div>
        </div>
        <h3 class="category-best-title-ad-product">HOT! TREND 카테고리별 추천 광고상품</h3>
        <!-- 가전 -->
        <div id="categoryBest_digital" class="category-best-unit digital">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_digital.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
                    <dd class="hot-keyword" style="bottom:5615px">
                    <strong>HOT키워드</strong>
                    <p><a class="keyword" href="#">#태블릿PC</a></p>
                    <p><a class="keyword" href="#">#공기청정기</a></p>
                    <p><a class="keyword" href="#">#게이밍모니터</a></p>
                    <p><a class="keyword" href="#">#마사지기</a></p>
                    <p><a class="keyword" href="#">#블루투스스피커</a></p>
                    </dd> 
               
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="../images/C3_PC.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                       <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 뷰티 -->
        <div id="categoryBest_beauty" class="category-best-unit beauty">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_beauty.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:5013px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#수분토너</a></p>
                <p><a class="keyword" href="#">#클렌징폼</a></p>
                <p><a class="keyword" href="#">#에센스</a></p>
                <p><a class="keyword" href="#">#톤업크림</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_9554df12-148a-4870-a666-d5c46c278fc2.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                        <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 식품 -->
        <div id="categoryBest_food" class="category-best-unit food">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_food.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:4411px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#비타민</a></p>
                <p><a class="keyword" href="#">#다이어트</a></p>
                <p><a class="keyword" href="#">#간편식</a></p>
                <p><a class="keyword" href="#">#야식</a></p>
                <p><a class="keyword" href="#">#간식</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://static.coupangcdn.com/na/cmg_paperboy/image/1678424573085/0315_%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B3_%E1%84%8C%E1%85%AE%E1%84%89%E1%85%B5%E1%86%A8%E1%84%92%E1%85%AC%E1%84%89%E1%85%A1_C3_PC.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                       <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 여성패션 -->
        <div id="categoryBest_womanclothe" class="category-best-unit womanclothe">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_womanclothe2.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:3809px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#원피스</a></p>
                <p><a class="keyword" href="#">#청바지</a></p>
                <p><a class="keyword" href="#">#반팔</a></p>
                <p><a class="keyword" href="#">#에코백</a></p>
                <p><a class="keyword" href="#">#샌들</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_44c91377-add6-44fd-bc68-4732a37303e9.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                       <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
         <!-- 남성패션 -->
         <div id="categoryBest_manclothe" class="category-best-unit manclothe">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_manclothe.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:3207px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#반바지</a></p>
                <p><a class="keyword" href="#">#반팔</a></p>
                <p><a class="keyword" href="#">#셔츠</a></p>
                <p><a class="keyword" href="#">#카드지갑</a></p>
                <p><a class="keyword" href="#">#슬리퍼</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_b045cab8-340b-454e-91c9-299315e9bfe6.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                        <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
         <!-- 출산유아동 -->
         <div id="categoryBest_manclothe" class="category-best-unit manclothe">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_baby.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:2605px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#물티슈</a></p>
                <p><a class="keyword" href="#">#아기과자</a></p>
                <p><a class="keyword" href="#">#출산준비물</a></p>
                <p><a class="keyword" href="#">#카시트</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://thumbnail8.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_f4b2a56d-efa0-43d7-9ca8-4148fe47358c.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                        <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 가구 홈 인테리어 -->
        <div id="categoryBest_home_decoration" class="category-best-unit home_decoration">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_home_decoration.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:2003px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#행거</a></p>
                <p><a class="keyword" href="#">#수건</a></p>
                <p><a class="keyword" href="#">#매트리스</a></p>
                <p><a class="keyword" href="#">#서랍장</a></p>
                <p><a class="keyword" href="#">#옷걸이</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_4bd168b7-dea8-4188-ab8b-0f40fbdbc824.png" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                       <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 주방용품 -->
        <div id="categoryBest_kitchen" class="category-best-unit kitchen">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_kitchen.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:1401px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#텀블러</a></p>
                <p><a class="keyword" href="#">#수세미</a></p>
                <p><a class="keyword" href="#">#프라이팬</a></p>
                <p><a class="keyword" href="#">#도마</a></p>
                <p><a class="keyword" href="#">#식기건조대</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://thumbnail7.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_77121383-41a5-4cdd-922f-1b57d771cc12.png" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                        <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 생활용품 -->
        <div id="categoryBest_living" class="category-best-unit living">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_living.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:799px">
                <strong>HOT키워드</strong>
                <p><a class="keyword" href="#">#바디워시</a></p>
                <p><a class="keyword" href="#">#제습제</a></p>
                <p><a class="keyword" href="#">#액체세제</a></p>
                <p><a class="keyword" href="#">#헤어스페리이</a></p>
                <p><a class="keyword" href="#">#키친타올</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://static.coupangcdn.com/xa/cmg_paperboy/image/1678352800511/C3_PC%EC%97%98%EC%98%A4%EC%BC%80%EC%9D%B4%28%EC%9C%A0%29%28%ED%86%A0%ED%83%88%EB%A6%AC%ED%8E%98%EC%96%B4%29.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                       <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 여행 -->
        <div id="categoryBest_travel" class="category-best-unit travel">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_travel.png" class="best_title_img">
                    <p><a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:197px">
                <strong>HOT키워드</strong>
                <!-- mid_category list에 담고 뿌랴줌 a태그사이에 ${row.title} -->
	               	<p><a class="keyword" href="#">#티켓</a></p>
	                <p><a class="keyword" href="#">#호텔</a></p>
	                <p><a class="keyword" href="#">#펜션</a></p>
                </dd> 
               <dd class="promotion">
                <!-- 이미지슬라이드 부트 적용 -->
                    <ul>
                        <li>
                            <span class="caption">
                                <strong></strong>
                            </span>
                            <img src="https://thumbnail6.coupangcdn.com/thumbnails/remote/x/image/bannerunit/bannerunit_52ce5738-e844-4b28-b2a9-42766e71105c.jpg" alt="" width="325" height="536">
                        </li>
                    </ul>
               </dd> 
               <dd class="best-product-list">
                    <ul>
                    <c:forEach items="${journeyList}" varStatus="loop" var="row">
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link"
                             href="journeyDetail?value=${row.idx }" target="_blank">
                                <div class="catagory-images" style="background-image:url(/uploads/${row.j_title_image})"></div>
                                <span class="name">${row.title }</span><br>
                                <span class="price">
                                	<b><fmt:formatNumber value="${row.ji_price}" />원</b>
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
               </dd> 
            </dl>
            <dl>
                <a href="">
                    <img src="../images/쿠키트래블_CM_PC.jpg" style="width: 950px;" alt="">
                </a>
            </dl>
        </div>
        <!-- CRITEO JS TRACKER for MARKETING TEAM -->
        <script type="text/javascript">
            window.criteo_q = window.criteo_q || [];
            window.criteo_q.push(
                { event: "setAccount", account: 3119 },
                { event: "setSiteType", type: "d" },
                { event: "viewHome" });
        </script>
        <!-- 장바구니 네비게이션 바 -->
        <div id="cartnav">
            <%@include file="./cartnav.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
        </div>
    </section>
    <div id="copyright">
         <%@include file="./copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>

<!-- copyright.html에서 인클루드 -->
</body>
</html>