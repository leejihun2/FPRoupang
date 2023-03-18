<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- daterangepicker cdn -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- map apikey -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6076fe794faf6e2a97f29c6ebfadce5&libraries=services"></script>
<meta charset="UTF-8">
<title>Roupang</title>
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
    <link rel="stylesheet" href="../css/star_rating.css" type="text/css">
	<link rel="stylesheet" href="../css/star_total.css" type="text/css">
	<link rel="stylesheet" href="./journeycss/travel.css" type="text/css" />
	<link rel="stylesheet" href="./journeycss/bundle3.css" type="text/css" />
	<!-- <link rel="stylesheet" href="./journeycss/bundle2.css" type="text/css" /> -->
	<link rel="stylesheet" href="./journeycss/viewdetail.css" type="text/css" />
	<script src="../js/star.js"></script>
	<script src="./js/journeyTop.js"></script>
<style type="text/css">
</style>
</head>
<script type="text/javascript">
	$(function(){
		$(".thumbnail-img").click(function(e){
			document.getElementById("thumbnail").style.backgroundImage="url("+e.target.src+")";
			$(".thumbnail-img").each(function(index, item){
				item.style.outline="";
			})
			console.log("ss");
			e.target.style.outline="2px solid green";
		});

		$.fn.Scrolling = function(obj, tar) {
			var _this = this;
			$(window).scroll(function(e) {
				var end = obj + tar;
				$(window).scrollTop() >= obj ? _this.addClass("fixed") : _this.removeClass("fixed");
				if($(window).scrollTop() >= end) _this.removeClass("fixed");
			});
		};
		$("#sticky_menu").Scrolling($("#sticky_menu").offset().top, ($(".travel-scroll-tab").height() - $("#sticky_menu").height()));
		
		$(".travel-scroll-tab-headers>li").click(function(e){
			replaceClass();
			e.target.classList.add("selected");
			var value = e.target.value;
			var url='';
			if(value==1){
				url='selectProduct';
			}
			if(value==2){
				url='introProduct';
			}
			if(value==3){
				url='reviewProduct';
			}
			if(value==4){
				url='inquiryProduct';
			}
            location.href="#"+url;
		});
	    $(".bnt_open").on("click", function(e){
	        $("ul").attr("style","margin-bottom:0px; padding-left:0px;");
	        $("a").attr("style","text-decoration:none");
	        $(".gnb-menu").attr("style","margin-top:10px; margin-left:65px; padding-left:0px;");
	        $(".thumbnails").attr("style","margin:10px; padding-left:0px;")
	    });
	});
	function replaceClass(){
		var elem = $(".selected");
		elem.removeClass("selected");
	}
</script>
<script type="text/javascript">
function exit(){
	$(".personnel-selector-layer").css("display","none")
}
var countA=2;
var countK=0;

var countUp=function(){
    countA=countA+1;
    document.querySelector("#ji_adult1").innerText=countA;
    document.querySelector("#ji_adult").innerText=countA;
    document.querySelector("#adult").value=countA;
};
var countDown=function(){
    if(countA>0){
        countA=countA-1;        
        document.querySelector("#ji_adult1").innerText=countA;
        document.querySelector("#ji_adult").innerText=countA;
        document.querySelector("#adult").value=countA;
    }
};
var countUp2=function(){
    countK=countK+1;
    document.querySelector("#ji_kid1").innerText=countK;
    document.querySelector("#ji_kid").innerText=countK;
    document.querySelector("#kid").value=countK;
};
var countDown2=function(){
    if(countK>0){
        countK=countK-1;        
        document.querySelector("#ji_kid1").innerText=countK;
        document.querySelector("#ji_kid").innerText=countK;
        document.querySelector("#kid").value=countK;
    }
};
function detail_Serach(){
	
	$.ajax({
	    type: 'GET',
	    url: '/detailSearch', 
	    data: {
	        bot_idx: $('#bot_idx').val(),
	        ji_adult: $('#adult').val(),
	        ji_kid: $('#kid').val(),
	        ji_duetime1: $('#start').val(),
	        ji_duetime2: $('#end').val()
	    },
	    dataType: 'json',
	    success: function(resp) {
	    	if(resp.length === 0){
    			  $(".room-item").empty();
	    	}
	    	else {
	    		$(".room-item").empty();
	    		var tabletd = ""
		    		
	    		$.each(resp, function(i){
	    			tabletd += "<colgroup>"+
	            	"<col class='col-summary' /><col /><col class='col-guest' />"+
	            	"<thead><tr><th class='room-header__item-name roomheader' colspan='2'>" + resp[i].ji_title + "</th>"+
	            	"<th class='room-header__guest roomheader'>인원</th><th class='room-header__price roomheader'>1박 기준 요금</th><th class='room-header__reservation roomheader'>구매</th></tr></thead>"+
	            	"<tbody><tr data-rate-category-id='3245'><td rowspan='1'><div class='room-summary'><div class='room-thumbnail'><img src='/uploads/" + resp[i].ji_image1 + " 'style='width: 160px;'/>"+
	            	"<a class='bnt_open' onclick='addModal("+resp[i].bot_idx+","+resp[i].ji_idx+")' data-toggle='modal' data-target='#myModal'>객실사진 및 정보 더보기&gt;</a></div>"+
	            	"</div></div></td><td style='width:90px;'><ul class='room-rate-plans'><li class='room-rate-plan'><span class='rate-plan'>"+ resp[i].ji_intro+"</span></li></ul></td>";
	    			tabletd += '<td><ul class="room-guest"><li><span class="travel-icon-text room-guest-text" style="line-height: 20px;"><i class="travel-icon icon-adult" style="margin-bottom: 2px; margin-right: 3px;">icon</i>x'+resp[i].ji_adult;
	    			if(resp[i].ji_kid != 0){
	    				tabletd += '<i class="bi bi-person"></i>x<b>'+resp[i].ji_kid+'</b>';		
	    			}
	    			tabletd += '</span></li></ul></td>';
	    			if(resp[i].ji_roomnum != 0 ){
		    			tabletd += "<td><div class='rate-category-price'><div class='travel-web-tdp-price travel-price__md right'>";
		    			tabletd += "<div class='travel-price__discount'><div><span class='travel-price__dynamic-discount'><em class='price'><b>"+ comma(resp[i].ji_price) +"원</b></em></span><br /><span class='travel-price__discount-rate'>";
		    			if(resp[i].ji_discount != 0 ){
	            			tabletd += "<span class='price_title'>할인판매가</span><br /><em class='price'><b>" + comma(resp[i].ji_price * (100- resp[i].ji_discount)/100) +"원</b></em><br /></span>";
	            		}
		    			tabletd += "</div></div><div class='travel-price__cashback'>"+
	            		"<div class='search-item-cash-back'><img class='list-cash-icon' src='//image11.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png'><span class='ctravel-price__sale benefit'><em>최대"+
	            		comma(resp[i].ji_price * (100- resp[i].ji_discount)/100*0.05)+"원 적립</em></span></div></div></div></div></td>";
	    			}else{
	    				tabletd += "<td><span>매진</span></td>";
	    			}
	    			tabletd += "<td><div class='rate-category-reservation'><div class='travel-select full-width'style='margin: 0px;'><input type='hidden' value="+ resp[i].ji_idx +"/>";
	    			if(resp[i].ji_roomnum > 0){
	            		tabletd+= "<select name='' id='Bookingselect'>";
	            		for(var cnt = 1; cnt <= resp[i].ji_roomnum ; cnt++){
	            			tabletd += "<option value='"+cnt+"'";
	            			if(cnt == 1){
	            				tabletd+=" selected";
	            			}
	            			tabletd += ">객실 "+cnt+"개</option>";
	            		}
	            		tabletd+="</select><button class='Bookingbtn'>구매</button>";
	            	}				 
	    			tabletd += "</div></div></td></tr></tbody>";
	    		});
    			$('#room-item').append(tabletd);
	    	}
	    }
	});
}
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function addModal(bot_num, idx){
	console.log("나");
	$('.modal-content').load('/showModalRoom?bot_idx='+bot_num+'&ji_idx='+idx);
}
</script>
<body style="background-color: white;">
    <div id="top" style="margin-bottom:0px;">
        <%@include file="../top.jsp" %>
    </div>
    <div class="container">
	    <div id="travel-container">
	        <div class="travel-detail">
	            <div class="travel-detail-container" style="width:1100px;">
	                <section class="travel-detail-content">
	                    <div class="travel-carousel-container">
	                        <div class="travel-carousel use-background clickable" style="width: 100%; height: 512px;">
	                        	<div class="carousel-image" id="thumbnail" style="height: 512px; background-image: url('/uploads/${Total_Journey.j_title_image }'); background-color:rgb(85,85,85);"></div>
	                        </div>
	                        <div class="travel-thumbnail">
	                            <div class="thumbnails-wrap" style="width:527px;">
	                                <ul class="thumbnails" style="margin:10px;">
	                                	<li><a class="thumbnail-item">
	                                	<img src="/uploads/${Total_Journey.j_title_image }" class="thumbnail-img" style="outline:2px solid green;"/>
	                                	</a></li>
	                                	<c:if test="${not empty Total_Journey.j_image1 }">
	                                		<li id="li-1"><a class="thumbnail-item"><img src="/uploads/${Total_Journey.j_image1 }" class="thumbnail-img" /></a></li>
	                                		<c:if test="${not empty Total_Journey.j_image2 }">
			                                	<li id="li-2"><a class="thumbnail-item"><img src="/uploads/${Total_Journey.j_image2 }" class="thumbnail-img" /></a></li>
	                                			<c:if test="${not empty Total_Journey.j_image3 }">
		            	        	            	<li id="li-3"><a class="thumbnail-item"><img src="/uploads/${Total_Journey.j_image3 }" class="thumbnail-img" /></a></li>
	                	        	        		<c:if test="${not empty Total_Journey.j_image4 }">
			    	        	                    	<li><a class="thumbnail-item"><img src="/uploads/${Total_Journey.j_image4 }" class="thumbnail-img" /></a></li>
				                                	</c:if>
			                                	</c:if>
		                                	</c:if>
	                                	</c:if>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
                	    <article class="travel-scroll-tab" style="margin-bottom:100px; margin-top:10px;">
	                        <section class="travel-scroll-tab-header">
	                            <div class="travel-scroll-tab-header-wrapper" id="sticky_menu" style="width:100%">
	                                <ul class="travel-scroll-tab-headers lg"> 
	                                    <li class="lg selected" value="1">객실 선택</li>
	                                    <li class="lg" value="2">숙소 설명</li>
	                                    <li class="lg" value="3">상품평</li>
	                                    <li class="lg" value="4">상품문의</li>
	                                </ul>
	                            </div> 
								<div class="lodging-room-search">
									<div class="date-range-picker-wrapper">
										<div class="date-range">
											<span class="travel-icon-text date-range__selected-date" style="margin-left: 11px;">
												<i class="travel-icon icon-calendar" style="margin-top: -3px; margin-right: 10px;">icon</i>
											</span>
											<input type="text" name="daterange" id="inputDate"
												style="border: none; width: 230px; color: black;"value="" />
											<script>
											$(function() {
											  $('input[name="daterange"]').daterangepicker({
											     	opens: 'center'
											    }, 
											    function(start, end, label) {
											    	var startDate = start.format('YY/MM/DD');
											        var endDate = end.format('YY/MM/DD');
											        
											        document.querySelector("#start").value=startDate;
											        document.querySelector("#end").value=endDate;
											    });
											});
											</script>
										</div>
									</div>
									<div class="personnel-selector-wrap">
									 <input type="hidden" name="bot_idx" id="bot_idx" value="${Total_Journey.bot_idx }" />
									 <input type="hidden" name="ji_duetime1" id="start" value="" />
									 <input type="hidden" name="ji_duetime2" id="end" value="" />
									 
										<div class="personnel-selector" onclick="personnel();">
											<span id="result" class="travel-icon-text personnel-selector__selected-number" style="margin-left: 11px;">
												<i class="travel-icon icon-person" style="margin-top: -3px; margin-right: 5px;">icon</i>
												성인 <span id="ji_adult1">2</span>, 아동 <span id="ji_kid1">0</span>
											</span><i class="travel-icon icon-arrow-down"style="margin-top: 15px; margin-right: 13px; float: right;">icon</i>
										</div>
										<div class="personnel-selector-layer" style="display: none;">
												<div class="personnel-selector-pane"
													style="width: 300px; left:342px; z-index: 33;">
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
																<input type="hidden" value="2" id="adult" name="ji_adult">
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
															<button class="spinner-minus" type="button" onclick="countDown2();" style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-left-radius: 16px; border-bottom-left-radius: 16px;">
																<i class="spinner-minus-icon" style="width: 8px; height: 8px; margin-top: 14px; margin-left: 11px; border-top-color: rgb(52, 106, 255);"></i>
															</button>
															<div class="spinner-number result"
																style="width: 44px; height: 30px; line-height: 30px; font-size: 14px; font-weight: bold; color: rgb(74, 74, 74); border-left-color: rgb(52, 106, 255); border-right-color: rgb(52, 106, 255);">
																<span id="ji_kid">0</span>
																<input type="hidden" value="0" id="kid" name="ji_kid" >
															</div>
															<button class="spinner-plus" type="button" onclick="countUp2();"
																style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-right-radius: 16px; border-bottom-right-radius: 16px;">
																<i class="spinner-plus-icon" style="width: 8px; height: 8px; margin-top: 14px; margin-left: 11px; border-top-color: rgb(52, 106, 255);">
																<i style="width: 8px; height: 8px; margin-top: -5px; margin-left: 3px; border-left-color: rgb(52, 106, 255);"></i></i>
															</button>
														</div>
													</div>
													<div class="personnel-selector-pane__button-wrap">
														<button type="button" class="travel-button travel-button__white md" onclick="exit()" style="color: rgb(85, 85, 85); font-size: 14px; font-weight: bold; border: 1px solid rgb(204, 204, 204); width: 100px; height: 32px; line-height: 30px; margin-right: 10px;">취소</button>
														<button type="button" class="travel-button travel-button__blue md" onclick="exit()" style="font-size: 14px; width: 100px; height: 32px; line-height: 30px; background-color: rgb(52, 106, 255);color: white;">확인</button>
													</div>
												</div>
											</div>
									</div>
									<button class="travel-button travel-button__white md" type="button" onclick="detail_Serach();"
										style="margin-right: 0px; outline: none; width: 116px; height: 40px; line-height: 38px;">객실확인</button>
									<div class="calendar-frame">
										<div class="lodging-price-calendar">
											<button class="price-calendar-show">
											</button>
										</div>
									</div>
								</div>
								<div class="ilpPanel" style="margin-bottom:10px;" id="selectProduct">
		                        	<div class="ticket-detail-vendor-items">
									<c:forEach items="${Total_Journey_info}" var="row" varStatus="loop">
										 <input type="hidden" name="ji_idx" id="ji_idx" value="${row.ji_idx }"/>
											<table class="room-item" id="room-item">
												<colgroup>
													<col class="col-summary">
													<col>
													<col class="col-guest">
													<col class="col-price">
													<col class="col-reservation">
												</colgroup>
												<thead>
													<tr>
														<th class="room-header__item-name roomheader" colspan="2">${row.ji_title }</th>
														<th class="room-header__guest roomheader">인원</th>
														<th class="room-header__price roomheader">1박 기준 요금</th>
														<th class="room-header__reservation roomheader">구매</th>
													</tr>
												</thead>
												<tbody>
													<tr data-rate-category-id="3245">
														<td rowspan="1">
														<div class="room-summary">
																<div class="room-thumbnail">
																	<img src="/uploads/${row.ji_image1}" style="width: 160px;"/>
																	<a class="bnt_open" onclick="addModal(${row.bot_idx},${row.ji_idx})" data-toggle="modal" data-target="#myModal">객실사진 및 정보 더보기&gt;</a>
																</div>
															</div>
														</td>
														<td>
															<ul class="room-rate-plans">
																<li class="room-rate-plan">
																	<span class="rate-plan">
																	 ${row.ji_intro}
																	</span>
																</li>
															</ul>
														</td>
														<td>
															<ul class="room-guest">
																<li>
																	<span class="travel-icon-text room-guest-text" style="line-height: 20px;">
																	 <i class="travel-icon icon-adult" style="margin-bottom: 2px; margin-right: 3px;">icon</i>
																		x ${row.ji_adult } <c:if test="${row.ji_kid ne 0}">
																			<i class="bi bi-person"></i>x<b>${row.ji_kid }</b>
																		</c:if>
																	</span>
																</li>
															</ul>
														</td>
														<td>
														<c:choose>
																<c:when test="${row.ji_roomnum ne 0 }">
																	<div class="rate-category-price">
																		<div
																			class="travel-web-tdp-price travel-price__md right">
																			<div class="travel-price__discount">
																				<div>
																					<span class="travel-price__dynamic-discount">
																						<em class="price"><b><fmt:formatNumber
																								value="${row.ji_price}" />원</b></em>
																					</span><br />
																					<span class="travel-price__discount-rate">
																						<c:if test="${row.ji_discount ne 0 }">
																							<span class="price_title">할인판매가</span>
																							<br />
																							<em class="price"> <b> <fmt:formatNumber
																										value="${(row.ji_price)*(100-row.ji_discount)/100 }" />원
																							</b>
																							</em>
																							<br />
																						</c:if>
																					</span>
																				</div>
																			</div>
																			<div class="travel-price__cashback">
																				<div class="search-item-cash-back">
																					<img class="list-cash-icon"
																						src="//image11.coupangcdn.com/image/badges/cashback/web/list-cash-icon@2x.png">
																					<span class="ctravel-price__sale benefit"> <em>최대
																							<fmt:formatNumber
																								value="${(row.ji_price)*(100-row.ji_discount)/100*0.05 }"
																								pattern="#,##0" />원 적립
																					</em>
																					</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</c:when>
																<c:otherwise>
																	<span>매진</span>
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<div class="rate-category-reservation">
																<div class="travel-select full-width"
																	style="margin: 0px;">
																	<input type="hidden" value="${row.ji_idx}" />
																	<c:choose>
																		<c:when test="${row.ji_roomnum > 0}">
																			<select name="" id="Bookingselect">
																				<c:forEach begin="1" end="${row.ji_roomnum}" var="i">
																					<option>객실 ${i}개</option>
																				</c:forEach>
																			</select>
																			<button class="Bookingbtn">구매</button>
																		</c:when>
																		<c:otherwise>
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</c:forEach>
									</div>
		                     </div>
		                        <div class="service-infomation" style="margin-bottom: 10px;" id="introProduct">
		                        <c:if test="${Total_Journey.j_conservice ne '' && Total_Journey.j_confacility ne '' && Total_Journey.common_items ne ''}">
	                        		<table class="ticket-service-infomation" style="width:100%;">
	                        			<colgroup>
	                        				<col width="30%"/>
	                        				<col width="*"/>
	                        			</colgroup>
	                        			<tr>
	                        				<th class="info-th" colspan="2">시설안내</th>
	                        			</tr>
	                        			<c:if test="${Total_Journey.common_items ne ''}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>공통구비품목</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							${Total_Journey.common_items }
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                        			<c:if test="${Total_Journey.j_confacility ne ''}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>편의시설</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
			                       						${Total_Journey.j_confacility }
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                        			<c:if test="${Total_Journey.j_conservice ne ''}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>편의서비스</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
			                       						${Total_Journey.j_conservice}
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                        		</table>
		                        </c:if>
		                        </div>
		                        <div class="cancellation-refund-policy" style="margin-bottom: 10px;">
	                        		<table class="ticket-cancellation-refund-policy" style="width:100%;">
	                        			<colgroup>
	                        				<col width="30%"/>
	                        				<col width="*"/>
	                        			</colgroup>
	                        			<tr>
	                        				<th class="info-th" colspan="2">숙소 정책</th>
	                        			</tr>
	                        			<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>숙소 정책</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.loging_policy}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>체크인/체크아웃</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.check_io}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>예약안내</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.j_booking}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<c:if test="${Total_Journey.add_fare ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>추가 인원</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.add_fare }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<c:if test="${Total_Journey.add_bed ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>추가 침구류</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.add_bed }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<c:if test="${Total_Journey.breakfast_noti ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>조식 유의사항</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.breakfast_noti }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<!------------------------------------------------------------------->
	                       				<c:if test="${Total_Journey.j_notice ne null}">
		                       				<tr>
		                       					<td>
		                       						<h4 class="item-title">
		                       							<label>유의사항</label>
		                       						</h4>
		                       					</td>
		                       					<td>
		                       						<div class="item-content">
		                       							<p class="policy-text">${Total_Journey.j_notice }</p>
		                       						</div>
												</td>
		                       				</tr>
	                       				</c:if>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>취소수수료 안내</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.j_cancelfee}
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                       				<tr>
	                       					<td>
	                       						<h4 class="item-title">
	                       							<label>취소 유의사항</label>
	                       						</h4>
	                       					</td>
	                       					<td>
	                       						<div class="item-content">
	                       							<p class="policy-text">
	                       								${Total_Journey.j_cancelnoti }
	                       							</p>
	                       						</div>
											</td>
	                       				</tr>
	                        		</table>
		                        </div>
								<div class="reviewProduct" style="margin-bottom: 10px;"
									id="reviewProduct">
									<table class="ticket-cancellation-refund-policy"
										style="width: 100%;">
										<colgroup>
											<col width="30%" />
											<col width="*" />
										</colgroup>
										<tr>
											<th colspan="2">리뷰</th>
										</tr>
										<tr>
											<td><c:forEach items="${lists }" var="row">
													<div class="border mt-2 mb-2">
														<!--  -->
														<ul class="comment">
															<li>
															</li>
														</ul>
														<!--  -->
														<div class="media">
															<c:forEach begin="1" end="5" var="i">
																<c:choose>
																	<c:when test="${Math.round(row.star_rate) >= i }">
																		<div class="star-ratings">
																			<div class="star-ratings-fill space-x-2 text-lg"
																				:style="{ width: ratingToPercent + '%' }">
																				<span>★</span>
																			</div>
																			<div class="star-ratings-base space-x-2 text-lg">
																				<span>★</span>
																			</div>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="star-ratings text-lg">
																			<span>★</span>
																		</div>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</div>
														<div class="media-body">
															<p class="star-ratings">${row.summary }</p>
																<p>${row.review }</p>
															<div class="media">가격&nbsp;&nbsp;&nbsp;
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when test="${Math.round(row.star_servey1) >= i }">
																			<div class="star-ratings">
																				<div class="star-ratings-fill space-x-2 text-lg"
																					:style="{ width: ratingToPercent + '%' }">
																					<span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span>
																				</div>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="star-ratings text-lg">
																				<span>★</span>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="media">서비스&nbsp;
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when test="${Math.round(row.star_servey2) >= i }">
																			<div class="star-ratings">
																				<div class="star-ratings-fill space-x-2 text-lg"
																					:style="{ width: ratingToPercent + '%' }">
																					<span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span>
																				</div>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="star-ratings text-lg">
																				<span>★</span>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</div>
															<div class="media">시설&nbsp;&nbsp;&nbsp;
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when test="${Math.round(row.star_servey3) >= i }">
																			<div class="star-ratings">
																				<div class="star-ratings-fill space-x-2 text-lg"
																					:style="{ width: ratingToPercent + '%' }">
																					<span>★</span>
																				</div>
																				<div class="star-ratings-base space-x-2 text-lg">
																					<span>★</span>
																				</div>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="star-ratings text-lg">
																				<span>★</span>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</div>
														</div>
												</c:forEach>
											</td>
									</table>
								</div>

								<div id="inquiryProduct">
		                        
		                        </div>
	                        </section>
	                    </article>
	                </section>

	                <aside class="travel-detail-basis">
	                	<div class="ticket-basis-product">
		                	<div class="basis-product">
		                		<h2 style="margin-top: 0px; margin-bottom: 5px;">${j_title }</h2>
			                	<div class="basis-product-address">
			                	<span style="font-size: 12px;">${Total_Journey.location}</span>
			                	</div>
								<input type="hidden" name="ratevalue5" value="${totalstar.star_rate}"
									step="0.1" min="0" max="5" />
								<div class="rating-wrap5">
									<div class="rating5">
										<div class="overlay5"></div>
									</div>
								</div>
		                	</div>
		                </div>
		                
	                	<div class="basis-aside-cashback">
	                		<div class="basis-product-cashback-column">
	                			<div class="cashback-title">포인트 적립</div>
	                			<span class="cashback-info-separator">|</span>
	                			<ul class="basis-cashback-list">
	                				<li>
	                					<span class="cashback-text">루페이 머니 결제 시 1% 적립</span>
	                				</li>
	                				<li>
	                					<span class="cashback-text">[로켓와우 + 루페이 계좌이체] 결제 시 2% 적립</span>
	                				</li>
	                				<li>
	                					<span class="cashback-text">[로켓와우 + 루페이 머니] 결제 시 4% 추가적립</span>
	                				</li>
	                			</ul>
	                			<div class="basis-cashback-button">
	                				<span class="basis-cashback-button-text">아직 멤버쉽 회원이 아니신가요?</span><br />
	                				<button type="button" class="btn btn-primary">멤버쉽 가입하기</button>
	                			</div>
	                		</div>
	                	</div>
	                	
	                	<div class="basis-aside-section" style="margin-bottom:140px;" >
	                		<ul class="basis-key-infos">
	                			<li class="basis-key-info">
	                				<label class="key-info-title">바로사용</label>
	                				<span class="key-info-description">오늘부터 사용가능</span>
	                			</li>
	                			<li class="basis-key-info">
	                				<label class="key-info-title">티켓타입</label>
	                				<span class="key-info-description">이용 기간 내 사용</span>
	                			</li>
	                			<li class="basis-key-info">
	                				<label class="key-info-title">사용방법</label>
	                				<span class="key-info-description">QR/바코드 확인 후 입장</span>
	                			</li>
	                			<li class="basis-key-info">
	                				<label class="key-info-title">예약필요</label>
	                				<span class="key-info-description">구매 후 자동 예약</span>
	                			</li>
	                			<li class="basis-key-info">
	                				<label class="key-info-title">취소가능</label>
	                				<span class="key-info-description">미사용 100% 환불가능</span>
	                			</li>
	                		</ul>
	                	</div>
	                	
	                	<div class="basis-aside-section">
	                		<div class="basis-introduction introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">소개</h4>
	                			<div class="introduction-text-wrapper">
	                				<p class="introduction-text">${Total_Journey.j_intro }</p>
	                			</div>
	                		</div>
	                		<c:if test="${Total_Journey.notice ne null }">
	                		<div class="basis-introduction introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">알려드리는 말</h4>
	                			<div class="introduction-text-wrapper">
	                				<p class="introduction-text">${Total_Journey.notice }</p>
	                			</div>
	                		</div>
	                		</c:if>
	                		<div class="basis-location introduction-item">
	                			<h4 class="travel-title travel-title-sm" style="margin-top: 0px; margin-bottom: 10px;">위치</h4>
	                			<span class="item-subtitle"></span>
	                		</div>
	                		<div class="travel-simple-map">
	                			<input type="hidden" id="location" value="${Total_Journey.location}" />
								<div id="map" style="width:100%;height:350px;"></div>
	                		</div>
	                		<script type="text/javascript">
	                		 kakao.maps.load(function() {
	                		  sysdateLoad();
	                			 
	           				  var locationValues = document.getElementById("location").value.split(',');
	           				  var mapContainer = document.getElementById('map');
	           				  var mapOption = {
	           				    center: new kakao.maps.LatLng(33.450701, 126.570667),
	           				    level: 5
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
	           				    })(i)	           				  
	           				    };
	           				});
	                		</script>
	                	</div>
	                	<div class="basis-aside-section">
	                		<div class="basis-review-section">
             						<div class="star-ratings">
					          <input type="hidden" name="ratevalue1" value="${totalstar.star_rate}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap1">
					            <div class="rating1">상품평 
					                <div class="overlay1"></div> 
					            </div>${totalstar.star_rate0}
					          </div>
								</div>
								<div class="star-ratings">
					          <input type="hidden" name="ratevalue2" value="${totalstar.star_servey1}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap2">
					            <div class="rating2">가격
					                <div class="overlay2"></div>
					            </div>
					          </div>
								</div>
								<div class="star-ratings">
					          <input type="hidden" name="ratevalue3" value="${totalstar.star_servey2}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap3">
					            <div class="rating3">서비스
					                <div class="overlay3"></div>
					            </div>
					          </div>
								</div>
								<div class="star-ratings">
					          <input type="hidden" name="ratevalue4" value="${totalstar.star_servey3}" step="0.1" min="0" max="5" />
					          <div class="rating-wrap4">
					            <div class="rating4">시설
					                <div class="overlay4"></div>
					            </div>
					          </div>
								</div>
	                			<c:forEach items="${lists}" var="row">
									<div class="border mt-2 mb-2">
										<div class="media-body">
											<!--  -->
											<p class="star-ratings">
											${row.summary }
											</p>
											<p>
											${row.review }
											</p>
										</div>
									</div>
								</c:forEach>
	                		</div>
	                	</div>
	                </aside>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content" id="modal_content">
	    	</div>
	    </div>
    </div>
</body>
</html>
