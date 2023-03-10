<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	.search-items .search-item {
	    float: left;
	    display: block;
	    width: 180px;
	    margin: 20px;
	    padding-bottom: 20px;
	    letter-spacing: -.4px;
	}
	.sub-category .category-list{
	    height: 19px;
	    border-bottom: 1px solid #ccc;
	    margin-bottom: 30px;
	    text-align: center;
	}
	.category-list .category-list-title-text {
	    font-size: 33px;
	    font-weight: 200;
	    color: #777;
	    letter-spacing: -.9px;
	    padding: 0 40px;
	    background-color: #fff;
	}
	.search-items .search-item {
	    float: left;
	    display: block;
	    width: 180px;
	    margin-right: 20px;
	    margin-top: 20px;
	    padding-bottom: 20px;
	    letter-spacing: -.4px;
	}
	.search-item>a:link{
		color: black;
		text-decoration: none;
	}
	.search-item>a:visited{
		color: black;
		text-decoration: none;
	}
	.ticket_img{
		width: 180px;
	    height: 180px;
	    margin-bottom: 8px;
	    background-size: cover;
	    background-position: 50%;
	    background-repeat: no-repeat;
	    position: relative;
	}
	.ticket_title{
		overflow:hidden;
		margin-bottom: 5px;
	    font-size: 14px;
	    line-height: 17px;
	}
	.search-result:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	em {
	    font-size: 16px;
	    font-weight: 700;
	    font-style: normal;
	    font-family: Tahoma,sans-serif;
	}
	.ticket_price_descipt{
		font-size: 13px;
		opacity : 0.4;
	}
	.cashback-area{
		margin-top: 15px;
	}
	.cash-text {
	    display: inline-block;
	    vertical-align: top;
	    color: #333;
	    font-size: 12px;
	    font-weight: 400;
	    letter-spacing: normal;
	    line-height: 19px;
	}
	.search-item-cash-back {
	    position: relative;
	    display: inline-block;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    height: 20px;
	    padding: 0 8px 0 8px;
	    border-radius: 10px;
	    border: 1px solid #ccc;
	    background-color: #fff;
	    font-size: 12px;
	    line-height: 20px;
	    color: #333;
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
            </ul>
            <div class="collapse navbar-collapse">
            	<h4 class="search_title">
	                <img src="https://img1a.coupangcdn.com/image/coupang/travel/logo/logo-travel-white.png">
	                <p>티켓/패스</p>
                </h4>
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
	            <span class="navbar-toggler-icon"></span>
	            </button>
	            <form action="/ticket_List" class="d-flex">
	                <input class="form-control me-2" type="hidden" name="category" value="${sub_idx}">
	                <input class="form-control me-2" type="text" name="title" value="${title }">
	                <button class="btn btn-primary" type="submit">Search</button>
	            </form>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:0px;">
    	<section class="category-c1-banners">
    		<div class="sub-category">
    			<div class="category-list">
    				<span class="category-list-title-text">${category_title}</span>
    			</div>
   			</div>
   		</section>
   		<section class="search-result">
			<ul class="search-items">
			<c:if test="${like_title ne null}">
				<c:forEach items="${ticket_list }" var="ticket" varStatus="loop">
		  			<li class="search-item">
		  				<a href="ticketDetail?value=${ticket.idx }" target="_blank">
		 					<div class="ticket_img" style="background-image:url(/uploads/${ticket.t_title_image })"></div>
		 					<div class="ticket_title">
		 						${ticket.title }
		 					</div>
			  				<c:choose>
			  					<c:when test="${ticket.ti_discount ne 0 }">
			  						<div class="ticket_discount">
			  							<del><fmt:formatNumber value="${ticket.ti_price}"/></del>원
			  							${ticket.ti_discount }%
			  						</div>
			  						<div class="ticket_price" style="color:rgb(174,0,0);">
			   						<em><b><fmt:formatNumber value="${(ticket.ti_price)*(100-ticket.ti_discount)/100 }"/></b></em>원 	
			  						</div>
			  					</c:when>
			  					<c:otherwise>
			  						<div class="ticket_price">
			   						<em><b><fmt:formatNumber value="${ticket.ti_price}"/></b></em>원 	
			  						</div>
			  					</c:otherwise>
			  				</c:choose>
			  				<span class="ticket_price_descipt">
			   					${ticket.ti_title } 기준
			  				</span>
			  				<div class="cashback-area">
			  					<div class="search-item-cash-back">
				  					<span class="cash-text">
					  					최대 <fmt:formatNumber value="${(ticket.ti_price)*(100-ticket.ti_discount)/100*0.05 }"/>원 적립
					  				</span>
				  				</div>
			  				</div>
		  				</a>
	 				</li>
				</c:forEach>
			</c:if>
			</ul>
		</section>
	</div>
</body>
</html>