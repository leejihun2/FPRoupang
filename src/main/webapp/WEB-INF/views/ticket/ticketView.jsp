<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    <style>
    .sticky {
	  position: -webkit-sticky;
	  position: sticky;
	  top: 0;
	}
	.search_title{
	    color: #fff;
	    font-size: 16px;
	    line-height: 25px;
	    font-weight: 400;
	    letter-spacing: -1px;
	}
	.search_title>img {
	    display: block;
	    margin: 3px 0;
	    width: 88px;
	    height: 15px;
	}
	</style>
<body style="background-color: white;">
    <!-- top.html에서 인클루드 -->
    <div id="top" style="margin-bottom:0px;">
        <%@include file="../top.jsp" %>
    </div>
	<nav class="navbar navbar-expand-sm navbar-dark sticky" style="background-color:rgb(3,194,165); height: 123px;">
	    <div class="container">
            <ul class="navbar-nav me-auto search-wizard-tab">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">숙박</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">티켓/패스</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">패키지/항공</a>
                </li>
            </ul>
            <div class="collapse navbar-collapse">
            	<h4 class="search_title">
	                <img src="https://img1a.coupangcdn.com/image/coupang/travel/logo/logo-travel-white.png">
	                <p>티켓/패스</p>
                </h4>
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
	            <span class="navbar-toggler-icon"></span>
	            </button>
	            <form class="d-flex">
	                <input class="form-control me-2" type="text" placeholder="Search">
	                <button class="btn btn-primary" type="button">Search</button>
	            </form>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:0px;">
    	<section class="category-c1-banners">
    		<div class="sub-category">
    			<h4>티켓/패스 카테고리</h4>
    			<ul>
    				<li class="category-item">
    					<a target="_blank"></a>
    				</li>
    			</ul>
    		</div>
    	</section>
<!--<div class="search-wizard-container">
		<ul class="search-wizard-tab">
			<li><a class="selected">숙박</a></li>
			<li><a class="">티켓/패스</a></li>
			<li><a class="">패키지/항공</a></li>
			<li><a class="">렌터카</a></li>
		</ul>
		<div class="lodging-search-wizard">
			<h4 class="wizard-logo">
				<img
					src="//img1a.coupangcdn.com/image/coupang/travel/logo/logo-travel-white.png">
			</h4>
			<ul class="wizard-components">
				<li class="wizard-keyword"><div class="search-keyword-wrap">
						<div class="search-keyword">
							<div class="search-keyword-input">
								<i class="travel-icon icon-search-sm-white search-keyword-icon">icon</i><input
									type="text" class="search-keyword-text"
									placeholder="국내외 지역명, 숙소명으로 검색" value="">
							</div>
						</div>
					</div></li>
				<li class="wizard-dates"><div class="date-picker">
						<a class="date-picker-input"><span>3월 2일 (목) - 3월 3일
								(금)</span><i class="travel-icon icon-caret-down-white"
							style="width: 12px; height: 7px; background-size: 12px 7px; margin-top: 20px; margin-right: 15px; float: right;">icon</i></a>
					</div></li>
				<li class="wizard-personnel"><div class="personnel-selector">
						<a class="personnel-selector-input"><span>성인 2, 아동 0</span><i
							class="travel-icon icon-caret-down-white"
							style="width: 12px; height: 7px; background-size: 12px 7px; margin-top: 20px; margin-right: 15px; float: right;">icon</i></a>
					</div></li>
			</ul>
			<a class="wizard-search-btn"><i
				class="travel-icon icon-search-blue"
				style="margin-top: 13px; margin-left: 13px;">icon</i></a>
		</div>
	</div> -->
	</div>
</body>
</html>