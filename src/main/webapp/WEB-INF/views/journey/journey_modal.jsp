<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6076fe794faf6e2a97f29c6ebfadce5&libraries=services"></script>
<style type="text/css">
.modal-dialog {
	width: 956px px;
	height: 600px;
	margin: 100px auto;
	margin-left: 450px;
}
.modal-content {
	width: 800px;
}

.modal-body {
	
}

.room-detail {
	background: #fafafa;
	padding: 0 20px 5px;
}

.room-detail>dt {
	padding: 10px 0 15px;
	border-bottom: 1px solid #ddd;
}

.lodging-room-detail .room-title {
    float: left;
    font-size: 16px;
    letter-spacing: -.9px;
    padding-top: 10px;
}

h3 {
	display: block;
	font-size: 1.17em;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}
.room-detail>dd {
	padding: 20px 15px;
}
ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	box-sizing: border-box;
}

.lodging-room-detail {
    position: relative;
    background: #fafafa;
}
.lodging-room-detail .room-detail-close {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 1;
    margin: 20px 20px 0 0;
    cursor: pointer;
}
.lodging-room-detail .room-detail-facilities li h4 {
    font-size: 14px;
    padding-bottom: 5px;
}
.travel-carousel.use-background {
    background-color: #555;
}

.travel-carousel {
    position: relative;
    overflow: hidden;
    margin-bottom: 10px;
}
.lodging-room-detail .room-detail-close {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 1;
    margin: 20px 20px 0 0;
    cursor: pointer;
}
.travel-carousel .carousel-nav.prev {
    left: 0;
    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNDMiIGhlaWdodD0iODAiIHZpZXdCb3g9IjAgMCA0MyA4MCI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTQgMGgzOXY4MEg0YTQgNCAwIDAgMS00LTRWNGE0IDQgMCAwIDEgNC00eiIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8ZyB0cmFuc2Zvcm09InJvdGF0ZSgtMTgwIDIxLjUgNDApIj4KICAgICAgICAgICAgPHVzZSBmaWxsPSIjRkZGIiB4bGluazpocmVmPSIjYSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNFRUUiIGQ9Ik00Mi41IDc5LjVWLjVINEEzLjUgMy41IDAgMCAwIC41IDR2NzJBMy41IDMuNSAwIDAgMCA0IDc5LjVoMzguNXoiLz4KICAgICAgICA8L2c+CiAgICAgICAgPHBhdGggZmlsbD0iIzMzMyIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNMTguMjI4IDM5Ljk3OGw1LjQyMi01LjA0NC0xLjA1MS0uOTc4LTYuNDc0IDYuMDIyTDIyLjU5OSA0NmwxLjA1MS0uOTc4eiIvPgogICAgPC9nPgo8L3N2Zz4K) no-repeat;
    background-size: 43px 80px;
}
.travel-carousel .carousel-nav {
    display: block;
    position: absolute;
    top: 0;
    width: 43px;
    height: 80px;
    text-indent: -9999em;
    cursor: pointer;
}
.travel-carousel .carousel-nav.next {
    right: 0;
    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNDMiIGhlaWdodD0iODAiIHZpZXdCb3g9IjAgMCA0MyA4MCI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTQgMGgzOXY4MEg0YTQgNCAwIDAgMS00LTRWNGE0IDQgMCAwIDEgNC00eiIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8Zz4KICAgICAgICAgICAgPHVzZSBmaWxsPSIjRkZGIiB4bGluazpocmVmPSIjYSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNFRUUiIGQ9Ik00Mi41IDc5LjVWLjVINEEzLjUgMy41IDAgMCAwIC41IDR2NzJBMy41IDMuNSAwIDAgMCA0IDc5LjVoMzguNXoiLz4KICAgICAgICA8L2c+CiAgICAgICAgPHBhdGggZmlsbD0iIzMzMyIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNMjQuNzcyIDQwLjAyMmwtNS40MjIgNS4wNDQgMS4wNTEuOTc4IDYuNDc0LTYuMDIyTDIwLjQwMSAzNGwtMS4wNTEuOTc4eiIvPgogICAgPC9nPgo8L3N2Zz4K) no-repeat;
    background-size: 43px 80px;
}
.travel-carousel .carousel-nav {
    display: block;
    position: absolute;
    top: 0;
    width: 43px;
    height: 80px;
    text-indent: -9999em;
    cursor: pointer;
}
</style>
		<c:forEach items="${Total_Journey_info}" var="row" varStatus="loop">
			<div class="lodging-room-detail">
				<a class="room-detail-close"><i class="travel-icon icon-close-white">icon</i></a>
				<div class="travel-carousel-container">
					<div class="travel-carousel use-background"
						style="width: 100%; height: 512px;">
				<div id="demo" class="carousel slide carousel-fade" data-bs-ride="carousel">	
					<div class="carousel-inner">
						<div class="carousel-item active">
							<c:if test="${not empty row.ji_image1}">
								<img class="carousel-image" class="d-block" src="/uploads/${row.ji_image1}"
										style="height: 512px; width: 100%;">
							</c:if>
						</div>
						<div class="carousel-item">
								<c:if test="${not empty row.ji_image2}">
									<img class="carousel-image" class="d-block" src="/uploads/${row.ji_image2}"
										style="height: 512px; width: 100%;">
								</c:if>
						</div>
						<div class="carousel-item">
								<c:if test="${not empty row.ji_image3}">
									<img class="carousel-image" class="d-block" src="/uploads/${row.ji_image3}"
										style="height: 512px; width: 100%;" >
								</c:if>
						</div>
						<div class="carousel-item">
								<c:if test="${not empty row.ji_image4}">
									<img class="carousel-image" class="d-block" src="/uploads/${row.ji_image4}"
										style="height: 512px; width: 100%;">
								</c:if>
						</div>
					</div>
						<button class="carousel-control-prev carousel-nav prev" data-bs-target="#demo" data-bs-slide="prev"
							style="top: 216px;">이전</button> 
						<button class="carousel-control-next carousel-nav next" data-bs-target="#demo" data-bs-slide="next" 
							style="top: 216px;">다음</button>
				</div>
					</div>
				</div>
			</div>
		<h3 class="room-title" style="padding: 12px;">${row.ji_title }</h3>
		</c:forEach>
		<c:if test="${Total_Journey != ''}">
			<p style="border-top: solid 1px #E1E1E1; padding: 12px;">
				<strong style="font-size: 14px;">공통 구비품목</strong></p>
			<p style="padding-left: 20px; font-size: 12px;">
				${Total_Journey.common_items}
			</p>
			<p style="padding: 12px;">
				<strong style="font-size: 14px;">서비스&기타</strong></p>
			<p style="padding-left: 20px; font-size: 12px;">
				${Total_Journey.j_conservice}
			</p>
		</c:if>