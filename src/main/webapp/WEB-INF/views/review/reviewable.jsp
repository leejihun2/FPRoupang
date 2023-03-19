<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/star_rate.css" type="text/css">
<link rel="stylesheet" href="../css/roll.css" type="text/css">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.my-review__writable__notice {
	font-size: 11px;
	word-spacing: -1px;
	color: #888;
	padding: 15px 0 0 10px;
	background: url(../images/myreply_dot.gif) no-repeat 2px 20px
}

.my-review__writable__list {
	padding: 30px 30px 30px 30px;
	margin: 5px;
	border-bottom: 1px solid #ddd;
	margin-left: 53px;
}

.my-review__writable__image-wrap {
	display: inline-block;
	vertical-align: top\0

}

.my-review__writable__image {
	width: 100px;
	height: 100px
}

.my-review__writable__content-wrap {
	display: inline-block;
	width: 430px;
	margin: 5px 20px 0px;
	vertical-align: top;
	position: relative
}

.my-review__writable__content-wrap .adv-product-sign {
	font-size: 11px;
	font-weight: bold;
	letter-spacing: -0.5px;
	text-align: left;
	color: #4fbedc;
	display: inline-block
}

.my-review__writable__content-title {
	font-size: 14px;
	color: #111111;
	overflow: hidden;
	font-weight: bold;
	line-height: 17px;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2
}

.my-review__writable__content {
	margin-top: 5px;
	font-size: 12px;
	line-height: 15px;
	font-weight: normal;
	color: #111;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden
}

.my-review__writable__date {
	margin-top: 32px;
	font-size: 12px;
	font-weight: normal;
	color: #888;
	line-height: 15px;
	letter-spacing: 0px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden
}

.my-review__writable__btn-wrap {
	text-align: center;
	display: inline-block;
	margin-top: 16px;
	float: right
}

.my-review__writable__review-hide-btn {
	color: #346aff;
	display: block;
	margin-top: 20px
}

.my-review__writable__write-btn {
	width: 100px;
	height: 36px;
	vertical-align: middle;
	padding: 0;
	background-color: #FBFBFB;
	border: 1px solid #346aff;
	font-size: 14px;
	font-weight: bold;
	letter-spacing: -1px;
	color: #346aff;
	outline: none;
	cursor: pointer
}
</style>
</head>
<body>
	<%@include file="../myroupang/myroumenu.jsp"%>
	<div class="roll">
		<h1 class="qwer">&nbsp;&nbsp;&nbsp;&nbsp;리뷰관리</h1>

		<div class="div1">
			<div class="div2" onclick="location.href='/review/reviewable.do'">리뷰 작성</div>
			<div class="div3" onclick="location.href='/review/reviewList.do'">작성한
				리뷰
			</div>
		</div>



		<div class="container">
			<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
			<form name="writeFrm" method="post"
				onsubmit="return writeValidate(this);"
				action="<c:url value="/review/reviewAction.do" />">

				<div class="my-review__writable js_reviewWritableListContainer">

					<div class="my-review__writable__list-container"
						data-total-writable="48">
						<ul id="writable_reviews" data-current-page="1">
							<c:forEach items="${buyerOrderlists }" var="review" begin="0"
								end="30" varStatus="loop">
								<li class="my-review__writable__list">
									<div class="my-review__writable__image-wrap">
										<img class="my-review__writable__image"
											src="/uploads/${review.goods_image }">
									</div>
									<div class="my-review__writable__content-wrap">${review.top_title }
										<div class="my-review__writable__content-title"></div>
										<div class="my-review__writable__content">${review.top_title }</div>
										<div class="my-review__writable__date">${review.order_date }</div>
									</div>
									<div class="my-review__writable__btn-wrap">
										<button
											class="my-review__writable__write-btn js_reviewWritableWriteBtn"
											type="button"
											data-reference="{&quot;completedOrderVendorItemId&quot; : &quot;7857969893&quot;,
						                       &quot;productId&quot; : &quot;4683535861&quot;,
						                       &quot;deliveryDate&quot; : &quot;2023-03-16&quot;,
						                       &quot;vendorItemId&quot; : &quot;72921550416&quot;}"
											onclick="location.href='review.do'">
											<span class="my-review__writable__write-btn-text">리뷰
												작성하기</span>
										</button>
										<a href="javascript:void(0);"
											class="my-review__writable__review-hide-btn js_reviewWritableHideBtn"
											data-completed-order-vendor-item-id="7857969893">숨기기</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>
	<div id="copyright">
		<%@include file="../copyright.jsp"%>
		<!-- 원하는 파일 경로를 삽입하면 된다 -->
	</div>
</body>
</html>