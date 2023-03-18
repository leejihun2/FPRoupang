<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>루팡!</title>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6076fe794faf6e2a97f29c6ebfadce5&libraries=services"></script>
<script src="./js/journeyTop.js"></script>
</head>
<script type="text/javascript">

</script>
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
	    height: 340px;
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
	.journey_img{
		width: 180px;
	    height: 180px;
	    margin-bottom: 8px;
	    background-size: cover;
	    background-position: 50%;
	    background-repeat: no-repeat;
	    position: relative;
	}
	.journey_title{
		overflow:hidden;
		margin-bottom: 5px;
	    font-size: 14px;
	    line-height: 17px;
	    height: 34px;
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
	.journey_price_descipt{
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
    <%@include file="./searchbox.jsp" %>
    <div class="container" style="margin-top:0px;">
    	<section class="category-c1-banners">
    		<div class="sub-category">
    			<div class="category-list">
    				<span class="category-list-title-text">${category_title}</span>
    			</div>
   			</div>
   		</section>
   		<input type="hidden" id="location" name="location" value="${like_loc }">
   		<section class="search-result">
   			<div class="row">
	   			<div class="col-9">
					<ul class="search-items">
				<%-- <c:if test="${not empty search_list or not empty like_loc}">--%>			
						<c:forEach items="${journey_list }" var="journey" varStatus="loop">
				  			<li class="search-item">
				  				<a href="journeyDetail?value=${journey.idx }" target="_blank">
			 					<div class="journey_img" style="background-image:url(/uploads/${journey.j_title_image })"></div>
				 					<div class="journey_title">
				 						${journey.title }
				 					</div>
					  				<c:choose>
					  					<c:when test="${journey.ji_discount ne 0 }">
					  						<div class="journey_discount">
					  							<del><fmt:formatNumber value="${journey.ji_price}"/></del>원
					  							${journey.ji_discount }%
					  						</div>
					  						<div class="journey_price" style="color:rgb(174,0,0);">
					   						<em><b><fmt:formatNumber value="${(journey.ji_price)*(100-journey.ji_discount)/100 }"/></b></em>원 	
					  						</div>
					  					</c:when>
					  					<c:otherwise>
					  						<div class="journey_price">
					   						<em><b><fmt:formatNumber value="${journey.ji_price}"/></b></em>원 	
					  						</div>
					  					</c:otherwise>
					  				</c:choose>
					  				<span class="journey_price_descipt">
					   					${journey.ji_title } 기준
					  				</span>
					  				<div class="cashback-area">
					  					<div class="search-item-cash-back">
						  					<span class="cash-text">
							  					최대 <fmt:formatNumber value="${(journey.ji_price)*(100-journey.ji_discount)/100*0.05 }"/>원 적립
							  				</span>
						  				</div>
					  				</div>
				  				</a>
			 				</li>
						</c:forEach>
		 			<%-- 	</c:if> --%>
					</ul>
				</div>
				<div class="col-3 basis-location introduction-item">
					<div id="map" style="width:100%;height:500px;"></div>
	        	</div>
	        	<script type="text/javascript">
				 kakao.maps.load(function() {
					  sysdateLoad();
				  var locationValues = document.getElementById("location").value.split(',');
				  var mapContainer = document.getElementById('map');
				  var mapOption = {
				    center: new kakao.maps.LatLng(33.450701, 126.570667),
				    level: 11
				  };
				  var map = new kakao.maps.Map(mapContainer, mapOption);
				  var geocoder = new kakao.maps.services.Geocoder();
				  var bounds = new kakao.maps.LatLngBounds();
				
				  for (var i = 0; i < locationValues.length; i++) {
				    (function(i) {
				      geocoder.addressSearch(locationValues[i], function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				          var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				          });
				          var infowindow = new kakao.maps.InfoWindow({
				            content: '<div>' + locationValues[i]+ '</div>'
				          });
				          kakao.maps.event.addListener(marker, 'click', function() {
				            infowindow.open(map, marker);
				          });
				          bounds.extend(coords);
				          map.setBounds(bounds);
				        }
				      });
				    })(i);
				  }
				});
				</script>
			</div>
		</section>
	</div>
</body>
</html>