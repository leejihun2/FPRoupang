<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="../css/Review.css" type="text/css">
<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/star_rating.css" type="text/css">
<link rel="stylesheet" href="../css/star_total.css" type="text/css">
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
	<%@include file="../myroupang/myroupang.jsp"%>
	<div class="roll">
		<h1 class="qwer">리뷰관리</h1>
		<div class="div1">
			<div class="div2" onclick="location.href='reviewable.do'">리뷰 작성</div>
			<div class="div3" onclick="location.href='reviewList.do'">작성한 리뷰</div>
		</div>
		

		<s:authorize access="isAuthenticated()">
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
										data-vendor-item-package-id="0" data-is-deal-product="false">${row.goods_title }</span> <span class="my-review__wrote__btn-wrap">
										<a href="javascript:void(0);"
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

										<span class="my-review__wrote__date">2020.07.02</span>
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
										<pre>${row.review } 안녕하세요 반가워요 하이룽 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</pre>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</s:authorize>
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