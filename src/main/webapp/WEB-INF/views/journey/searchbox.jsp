<link rel="stylesheet" href="./journeycss/bundle1.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle2.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle3.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/travel.css" type="text/css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
													<form action="/journey_List">
														<input type="hidden" id="sub_idx" name="category" value="2"/> 
														<input type="text" class="search-keyword-text" onclick="recommend_j()" id="jSearchBox" name="title"
															placeholder="국내외 지역명, 숙소명으로 검색" value="">
															<button class="wizard-search-btn" id="searchIcon" type="submit" style="border: none;">
																<i class="travel-icon icon-search-blue">icon</i></button>	
													 </form>
												</div>
												<div class="best-keyword-group-layer" id="recommendSelect_j" style="display: none; height: 150px; width: 455px;">
													<div class="best-keyword-group-values-layer">
													<h5 class="best-keyword-title" style="">주요검색어 바로선택</h5>
														<ul class="best-keyword-group-value" style="width: 450px;">
															<li style="width: 80px"><a href="/journey_List?category=2&location=제주" class="best-keyword-group-item">제주</a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=강원" class="best-keyword-group-item">강원</a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=부산" class="best-keyword-group-item">부산</a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=가평" class="best-keyword-group-item">가평</a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=경주" class="best-keyword-group-item">경주</a></li>
														</ul>
														<ul class="best-keyword-group-value" style="width: 450px;">
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=서울" class="best-keyword-group-item">서울</a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=전주" class="best-keyword-group-item">전주 </a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=강릉" class="best-keyword-group-item">강릉</a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=경기" class="best-keyword-group-item">경기</a></li>
															<li style="width: 80px"><a href="/journey_List?sub_idx=2&location=속초" class="best-keyword-group-item">속초</a></li>
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
															<button class="spinner-minus" type="button" onclick="countDown2();"
																style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-left-radius: 16px; border-bottom-left-radius: 16px;">
																<i class="spinner-minus-icon"
																	style="width: 8px; height: 8px; margin-top: 14px; margin-left: 11px; border-top-color: rgb(204, 204, 204);"></i>
															</button>
															<div class="spinner-number result"
																style="width: 44px; height: 30px; line-height: 30px; font-size: 14px; font-weight: bold; color: rgb(74, 74, 74); border-left-color: rgb(52, 106, 255); border-right-color: rgb(52, 106, 255);">
																<span id="ji_kid">0</span>
															</div>
															<button class="spinner-plus" type="button" onclick="countUp2();"
																style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-right-radius: 16px; border-bottom-right-radius: 16px;">
																<i class="spinner-plus-icon" 
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
                                                 <form action="/ticket_List">
                                                    <input type="hidden" id="sub_idx" name="category" value="1"/>
                                                    <input type="text" class="search-keyword-text" onclick="recommend_t()"  name="title" id="tSearchBox" placeholder="국내외 지역명, 숙소명으로 검색" value="">
                                                	<button class="wizard-search-btn" id="searchIcon" type="submit" style="border: none;">
														<i class="travel-icon icon-search-blue">icon</i></button>
												</form>
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
                            </div>
                        </div>
                    </div>
                </section>