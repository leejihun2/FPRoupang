<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
	function ticketchange(){
		$("#journeySearch").css("display","none");
	    $("#ticketSearch").css("display","block");
	    $("#recommendSelect_j").css("display","none");
	    $("#dynamicCal").css("display","none");
	    $("#staticCal").css("display","block")	
		$("#kidadult").css("display","block")
		$("#sub_idx").val(1);
	}
	/* 여행 search 활성화 */
	function journeychange(){
		$("#journeySearch").css("display","block");
		$("#sub_idx").val(2);
	    $("#ticketSearch").css("display","none");
	    $("#recommendSelect_t").css("display","none");
	}
</script>
<style>
	.main-banner {
	    position: absolute;
	    top: 0;
	    left: 50%;
	    height:450px;
	    margin-left: -960px;
	    cursor: pointer;
	}
</style>
<body style="background-color: white; overflow-x: hidden; overflow-y: auto;">
    <!-- top.html에서 인클루드 -->
    <div id="top" style="margin-bottom:0px;">
        <%@include file="../top.jsp" %>
    </div>
	<%@include file="../journey/searchbox.jsp" %> 
    <div class="container" style="margin-top:0px;">
    	<section class="category-c1-banners">
    		<div class="main-banner" style="background-image: url(/uploads/에버랜드특가.jpg);">
    			<a><img src="/uploads/에버랜드특가.jpg" class="banner-image"/></a>
    		</div>
   		</section>
   		<section>
    		<div class="sub-category">
    			<div class="travel-sub-category" style="margin-top: 20px;">
                    <h4 class="travel-sub-category-title">티켓/패스 카테고리</h4>
                    <ul class="travel-sub-categories">
                        <li class="category-item">
                            <a href="/ticket_List?category=1" target="_blank">
                                <div class="category-image">
                                <img src="/uploads/테마파크.jpg"/>
                                </div>
                                <span class="category-name">테마파크</span>
                            </a>
                        </li>
                        <li class="category-item">
                            <a href="/ticket_List?title_value=spa" target="_blank">
                             <div class="category-image">
                             <img src="/uploads/워터파크.jpg"/>
                             </div>
                             <span class="category-name">스파/온천/워터파크</span>
                        </a>
                        </li>
                        <li class="category-item">
                            <a href="/ticket_List?title_value=concert" target="_blank">
                                <div class="category-image">
    							<img src="/uploads/공연.png"/>
                                </div>
                                <span class="category-name">공연/전시</span>
                            </a>
                        </li>
                        <li class="category-item">
                            <a href="/ticket_List?title_value=activity" target="_blank">
                                <div class="category-image">
    							<img src="/uploads/엑티비티.jpg"/>
                                </div>
                                <span class="category-name">액티비티/레저</span>
                            </a>
                        </li>
                    </ul>
                </div>
    		</div>
    	</section>
	</div>
	
	<div id="copyright">
		<c:import url="../copyright.jsp"></c:import>
    </div>
</body>
</html>