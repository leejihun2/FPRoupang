<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
            <img src="https://static.coupangcdn.com/ra/cmg_paperboy/image/1676615742559/0222%5BPC%5DC1.jpg"
                onload="logImageLoadTime2(this);" width="1920" height="450"> 
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
                                <img class="li-img" src="../images/C2-1-한국피앤지판매유한회사.jpg" alt=""></li>
                            <li class="li-list">
                                <img src="../images/C2-2-프리즘.jpg" alt=""></li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
                    </ul>
               </dd> 
            </dl>
        </div>
        <!-- 여행 -->
        <div id="categoryBest_travel" class="category-best-unit travel">
            <dl class="category-best">
               <dt class="title">
                <img width="114" src="../images/best_title_travel.png" class="best_title_img"><p>
                    <a href="" class="go-category">바로가기></a></p></dt>
               
                <dd class="hot-keyword" style="bottom:197px">
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
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/버즈.jpg" class="catagory-images" alt="">
                                <span class="name">ACRO 프로 버즈 무선 블루투스 이어폰</span><br>
                                <span class="price"><strong>70,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어팟케이스.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 변색방지 에어팟 1 / 2 세대</span><br>
                                <span class="price"><strong>15,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/신지모루.jpg" class="catagory-images" alt="">
                                <span class="name">신지모루 애플워치 풀커버 자가복원 TPU 액정보호필름 3p</span><br>
                                <span class="price"><strong>12,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/에어맥스.jpg" class="catagory-images" alt="">
                                <span class="name">Apple 에어팟 맥스 블루투스헤드셋</span><br>
                                <span class="price"><strong>700,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/케이스.jpg" class="catagory-images" alt="">
                                <span class="name">케이스케이스케이스케이스케이스케이스</span><br>
                                <span class="price"><strong>8,000</strong>원</span>
                            </a>
                        </li>
                        <li class="category-best__ad-badge">
                            <a class="product-unit category-best-link" href="#">
                                <img  src="../images/충전.jpg" class="catagory-images" alt="">
                                <span class="name">벨킨 USB 4 C타입 PD 100W 40Gbps 초고속 케이블</span><br>
                                <span class="price"><strong>29,000</strong>원</span>
                            </a>
                        </li>
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