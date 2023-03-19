<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<style>
.my-review__wrote__list {
	padding-bottom: 47px
}

.my-review__wrote__top-wrap {
	display: table;
	width: 100%;
	padding: 4px 5px;
	border-bottom: 1px solid #eee;
	border-top: 1px solid #eee;
	margin-left: 67px;
}

.my-review__wrote__second-wrap {
	margin: 20px 0px 10px;
	display: table
}

.my-review__wrote__main-wrap {
	padding-left: 100px;
	width: 702px;
}

.my-review__wrote__main-wrap .survey__answer_container {
	display: table-row
}

.my-review__wrote__main-wrap .survey__question {
	display: table-cell;
	text-align: left;
	white-space: nowrap
}

.my-review__wrote__main-wrap .survey__answer {
	display: table-cell;
	text-align: left;
	padding-left: 15px;
	white-space: nowrap
}

.my-review__wrote__main-wrap .survey__simple_answer {
	margin-top: 8px
}

.my-review__wrote__main-wrap .my-review__wrote__content pre,
	.my-review__wrote__main-wrap span.survey__answer {
	letter-spacing: 0px;
	font-family: Dotum, "돋움", Helvetica, AppleSDGothicNeo, sans-serif;
	white-space: pre-wrap
}

.my-review__wrote__image {
	width: 40px;
	height: 40px;
	vertical-align: middle;
	margin-right: 20px
}

.my-review__wrote__item_name {
	font-size: 14px;
	color: #346aff;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	display: inline-block;
	vertical-align: middle;
	cursor: pointer
}

.my-review__wrote__date {
	margin-top: 32px;
	font-size: 12px;
	font-weight: normal;
	color: #888;
	line-height: 15px;
	white-space: nowrap;
	text-overflow: ellipsis;
	letter-spacing: 0px;
	vertical-align: bottom;
	margin-left: 6px;
	overflow: hidden
}

.my-review__wrote__btn-wrap {
	text-align: right;
	display: table-cell;
	vertical-align: middle
}

.my-review__wrote__modify-btn {
	vertical-align: middle;
	cursor: pointer;
	outline: none;
	font-size: 12px;
	line-height: 14px;
	color: #346aff;
	letter-spacing: -0.5px;
	border-right: 1px solid #d5d5d5;
	padding-right: 10px;
	margin-right: 5px
}

.delimiter {
	display: none
}

.my-review__wrote__delete-btn {
	vertical-align: middle;
	outline: none;
	cursor: pointer;
	font-size: 12px;
	line-height: 14px;
	color: #346aff;
	letter-spacing: -0.5px
}

.my-review__wrote__modify-btn-text, .my-review__wrote__delete-btn-text {
	display: inline-block;
	font-size: 12px;
	letter-spacing: 0px;
	color: #346aff
}

.my-review__wrote__rating-wrap {
	margin-top: 10px;
	height: 14px;
	font-size: 0px;
	display: table-cell;
	vertical-align: middle
}

.my-review__wrote__rating {
	display: inline-block;
	width: 16px;
	height: 16px;
	margin-right: 2px;
	background:
		url(//img1a.coupangcdn.com/image/coupang/review/web/mycoupang/star-writing-s@2x.png)
		0 0px no-repeat;
	background-size: 16px 16px
}

.my-review__wrote__rating.wrote-list-rating-active {
	display: inline-block;
	width: 16px;
	height: 16px;
	margin-right: 2px;
	background:
		url(//img1a.coupangcdn.com/image/coupang/review/web/mycoupang/rate-star-s@2x.png)
		0 0px no-repeat;
	background-size: 16px 16px
}

.my-review__wrote__blind {
	display: -webkit-box;
	margin-bottom: -11px;
	margin-top: 20px;
	height: 36px;
	font-size: 11px;
	line-height: 18px;
	color: #ee0000;
	text-overflow: ellipsis;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	overflow: hidden
}

.my-review__wrote__attachments, .my-review__wrote__content__title,
	.my-review__wrote__content, .my-review__wrote__survey,
	.my-review__wrote__helpful_content {
	margin-top: 20px
}

.thumbnail_container {
	height: 80px;
	width: 80px;
	display: inline-block;
	overflow: hidden;
	float: left
}

.thumbnail_container img {
	height: 100%;
	width: 100%;
	object-fit: cover;
	font-family: 'object-fit: cover;'
}

.my-review__wrote__content__title span, .my-review__wrote__survey .survey__question,
	span.helpful_count {
	font-size: 12px;
	font-weight: bold;
	color: #111
}

.my-review__caption_tip {
	position: absolute;
	left: 63px;
	top: 65px;
	right: 0px;
	bottom: 0px;
	opacity: 0.7;
	width: 12px;
	height: 12px;
	display: none
}

.my-review__caption_tip:before {
	content: "";
	display: inline-block;
	width: 12px;
	height: 12px;
	background:
		url(//img1a.coupangcdn.com/image/coupang/review/web/sdp/captions/icon-caption2x.png)
		no-repeat;
	background-size: 12px 12px
}

.attachment__container {
	display: inline-block;
	position: relative;
	margin-right: -1px;
	margin-top: -3px
}

.attachment__container img {
	cursor: pointer
}
</style>
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
<link rel="stylesheet" href="../css/Review.css" type="text/css">
<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/roll.css" type="text/css">
<script src="../js/star.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function deleteRow(idx){
   if(confirm("정말로 삭제하시겠습니까?")){
	   //삭제 요청명으로 이동한다.
      location.href = "delete.do?idx="+idx;
   }
}
</script>
</head>
<body style="background-color: #ffffff">
	<s:authorize access="isAuthenticated()">
		<%@include file="../myroupang/myroumenu.jsp"%>
		<div class="roll">
		<%@include file="../star.jsp"%>
			<h1 class="qwer">&nbsp;&nbsp;&nbsp;&nbsp;리뷰관리</h1>
			<div class="div1">
				<div class="div2" onclick="location.href='reviewable.do'">리뷰
					작성</div>
				<div class="div3" onclick="location.href='reviewList.do'">작성한
					리뷰</div>
			</div>


			<s:authentication property="name" var="name" />
			<c:forEach items="${lists }" var="row" varStatus="loop">
				<div class="my-review__wrote js_reviewWroteListContainer">
					<div class="my-review__wrote__list-container" data-total-wrote="4">
						<ul id="review_wrote_list" data-has-more="false"
							data-current-page="1">

							<li class="my-review__wrote__list">
								<div
									class="my-review__wrote__top-wrap js_reviewWroteListProductImage"
									data-product-review-id="118563038" data-page="1">
									<img class="my-review__wrote__image"
										src="https://thumbnail10.coupangcdn.com/thumbnails/remote/250x250ex/image/vendor_inventory/f783/e827c88bb90dfeda35ddabba96d6d5c129565b6567f09fc3dc23e4da4346.jpg"
										title="도넛 휴대용 약통 랜덤발송, 2개" alt="도넛 휴대용 약통 랜덤발송, 2개"> <span
										class="my-review__wrote__item_name js_reviewWroteListProductTitle"
										data-vendor-item-id="70278535334" data-product-id="1275397869"
										data-vendor-item-package-id="0" data-is-deal-product="false">${row.goods_title }</span>
									<span class="my-review__wrote__btn-wrap"> <a
										href="javascript:void(0);"
										class="my-review__wrote__modify-btn js_reviewWroteListModifyBtn"
										data-reviewid="118563038"
										onclick="location.href='reviewModify.do?idx=${row.idx}';">수정</a>
										<span class="delimiter">|</span> <a href="javascript:void(0);"
										class="my-review__wrote__delete-btn js_reviewWroteListDeleteBtn"
										data-reviewid="118563038"
										onclick="javascript:deleteRow(${row.idx});">삭제</a>
									</span>
								</div>
								<div class="my-review__wrote__main-wrap">
									<div class="my-review__wrote__second-wrap"
										data-product-review-id="118563038" data-page="1">
										<div class="element-rating">${row.name }
											<div class="rating-wrap">
												<input type="hidden" name="ratevalue"
													value="${row.star_rate}" step="0.1" min="0" max="5" />
												<div class="rating">
													<div class="overlay"></div>
												</div>${row.star_rate}
											</div>
						
											<span class="my-review__wrote__date">${row.regiDate }</span>
										</div>
										<div class="my-review__wrote__attachments" data-page="1">


											<div class="attachment__container">
												<span class="thumbnail_container"> <img
													src="https://ts.coupangcdn.com/thumbnails/local/org/image2/PRODUCTREVIEW/202007/2/8346521484181569649/f3f1036e-ae91-49ea-b92f-1e048a502eb8.jpg">
												</span> <span class="my-review__caption_tip"
													data-has-caption="false"></span>
											</div>

											<div class="attachment__container">
												<span class="thumbnail_container"> <img
													src="https://ts.coupangcdn.com/thumbnails/local/org/image2/PRODUCTREVIEW/202007/2/8346521484181569649/b77630eb-2151-465a-9685-d2f893a48a2d.jpg">
												</span> <span class="my-review__caption_tip"
													data-has-caption="false"></span>
											</div>

										</div>

										<div class="my-review__wrote__content__title">
											<span>${row.summary }</span>
										</div>
										<div class="my-review__wrote__content">
											<pre>${row.review }</pre>
										</div>
									</div>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
		</div>
		</div>
		<div id="copyright">
			<%@include file="../copyright.jsp"%>
			<!-- 원하는 파일 경로를 삽입하면 된다 -->
		</div>
	</s:authorize>
</body>
</html>