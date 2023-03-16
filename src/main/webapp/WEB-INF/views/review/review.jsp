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
<link rel="stylesheet" href="../css/Review.css" type="text/css">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function deleteRow(idx) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			//삭제 요청명으로 이동한다.
			location.href = "delete.do?idx=" + idx;
		}
	}
	function checkStarRating() {
		var stars = document.getElementsByName('star_rate');
		var checked = false;
		for (var i = 0; i < stars.length; i++) {
			if (stars[i].checked) {
				checked = true;
				break;
			}
		}
		if (!checked) {
			alert('별점을 선택해주세요');
			return;
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.div2').each(function(index) {
			$(this).attr('div2-index', index);
		}).click(function() {
			var index = $(this).attr('div2-index');
			$('.div2[menu-index=' + index + ']').addClass('clicked');
			$('.div2[menu-index!=' + index + ']').removeClass('clicked');
		});

	});
</script>
<style>
</style>
</head>
<body style="overflow-x: hidden; overflow-y: hidden;">>
	<%@include file="../myroupang/myroupang.jsp"%>
	<div class="roll">
		<h1 class="qwer">리뷰관리</h1>
		<div class="container">
			<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
			<form name="writeFrm" method="post"
				onsubmit="return writeValidate(this);"
				action="<c:url value="/review/reviewAction.do" />">

				<table class="table table-bordered">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<div class="my-area-body">
							<div class="my-area-contents">
								<div id="my__container"
									class="my__content my-review js_reviewContainer"
									data-reference="{&quot;module&quot;:&quot;pcweb&quot;, &quot;controller&quot;:&quot;productreview/register-new&quot;}">

									<div class="my-review__title">
										<span class="my-review__main__header">리뷰관리</span>
									</div>
									<div class="review-form _weblog-data"
										data-vendor-item-id="72921550416" data-vendor-id="A00010028"
										data-service-type="ROCKET_DELIVERY"
										data-product-id="4683535861" data-item-id="5622377053"
										data-is-seller="true" data-is-review-template="true">


										<div class="seller-review _seller-review-container"
											data-product-id="4683535861"
											data-completed-order-vendor-item-id="7857969893"
											data-category-id="1493">
											<div class="review-intake-form">


												<div
													class="review-intake-form__detail-review _seller_detail_review">
													<div class="review-table">
														<div class="review-table__cell title">상세리뷰</div>
														<div class="review-table__cell description">
															<div class="answer-list _answer-list">
																<span class="_seller_survey" data-question-id="5"
																	data-answer-id=""
																	data-question-type="MULTIPLE_CHOICE_MULTI_SELECT">


																</span>
															</div>

															<div
																class="review-textarea-wrap _satisfaction-review-textarea"
																data-thumb-up-content-guide="판매자의 어떤 점이 마음에 드셨나요?
  (상품 품질이 아닌 배송, 포장, 질문 응대, 상품 가격 등 판매자에 대한 만족도를 평가해주세요.)"
																data-thumb-down-content-guide="어떤 점이 불편하셨나요? (상품 품질이 아닌 배송, 포장, 질문 응대, 상품 가격 등 판매자에 대한 만족도를 평가해주세요.)">
																<textarea
																	class="review-textarea-wrap__input _seller-review-textarea"
																	rows="4" placeholder=""></textarea>
															</div>
															<div class="textarea-count _seller-review-textarea-count">0</div>
														</div>
													</div>
												</div>

												<div
													class="review-intake-form__image-attach seller-image-attach _seller_detail_review">
													<!-- 새로운 템플릿과 js 가 필요함 -->


													<div class="my-review__modify__file">
														<div class="my-review__modify__field__title">사진첨부</div>
														<div
															class="my-review__modify__file__content _image-attachment-container"
															data-attachment-max-size="10">
															<div>
																<button
																	class="my-review__modify__file__upload-btn _image-attach-upload-button"
																	type="button">사진 첨부하기</button>
																<span class="my-review__modify__file__count"> <strong
																	class="_image-attach-upload-count">0</strong>&nbsp;/&nbsp;<span>10</span>
																</span> <span class="my-review__modify__file__guide">사진은
																	최대 20MB 이하의 JPG, PNG, GIF 파일 10장까지 첨부 가능합니다.</span>
															</div>
															<div
																class="my-review__modify__file__list-wrap
                      _image-attach-list-container">
																<ul>
																</ul>
															</div>
															<div
																class="my-review__modify__file__frame _image-attach-modify-iframe-container"
																data-token="0969c50f-7fc5-4e6a-b02e-1bb0af92acac"
																data-url="//fileupload.coupang.com/fileupload?token=0969c50f-7fc5-4e6a-b02e-1bb0af92acac&amp;serviceInfo=PRODUCTREVIEW&amp;resizeOrigin=true"
																data-param-name="files" data-serviceinfo=""
																data-thumbnail-path="https://ts.coupangcdn.com/thumbnails/local/320/">
																<iframe
																	class="my-review__iframe js_reviewIframeContainer"
																	src="//fileupload.coupang.com/fileupload?token=0969c50f-7fc5-4e6a-b02e-1bb0af92acac&amp;serviceInfo=PRODUCTREVIEW&amp;resizeOrigin=true"></iframe>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="product-review _product-review-container"
											data-product-id="4683535861"
											data-completed-order-vendor-item-id="7857969893"
											data-vendor-item-id="72921550416" data-category-id="1493">
											<div class="my-review__modify js_registerContainer">
												<div class="review-intake-form">
													<div class="review-intake-form__head">
														<div class="review-intake-form__title">
															<img
																src="https://image6.coupangcdn.com/image/productreview/badge/review/write/product/product_icon-xxhdpi.png"
																class="review-intake-form__logo"><span
																class="review-intake-form__text">상품 품질 리뷰</span>
														</div>
														<div class="review-intake-form__subtitle">
															<span class="review-intake-form__sub-text">이 상품의
																품질에 대해서 얼마나 만족하시나요?</span>
														</div>
													</div>
													<div class="review-intake-form__rating">
														<div class="review-table">
															<div class="review-table__cell review-intake-head title">
																<img
																	src="https://thumbnail6.coupangcdn.com/thumbnails/remote/250x250ex/image/retail/images/8232508872667180-9619be42-39ca-404f-8981-19b314c1e170.jpg"
																	width="100" height="100" title="몽베스트 생수, 2L, 24개"
																	alt="몽베스트 생수, 2L, 24개">
															</div>
															<div class="review-table__cell description">
																<div class="review-intake-form__product-title">몽베스트
																	생수, 2L, 24개</div>

																<div
																	class="my-review__modify__star js_reviewModifyStarContainer"
																	data-star="" data-text="최고">
																	<div class="my-review__modify__star__content">

																		<div>
																			<button
																				class="my-review__modify__star__content__value js_reviewModifyStarBtn"
																				type="button" value="1" data-text="나쁨"></button>
																			<button
																				class="my-review__modify__star__content__value js_reviewModifyStarBtn"
																				type="button" value="2" data-text="별로"></button>
																			<button
																				class="my-review__modify__star__content__value js_reviewModifyStarBtn"
																				type="button" value="3" data-text="보통"></button>
																			<button
																				class="my-review__modify__star__content__value js_reviewModifyStarBtn"
																				type="button" value="4" data-text="좋음"></button>
																			<button
																				class="my-review__modify__star__content__value js_reviewModifyStarBtn"
																				type="button" value="5" data-text="최고"></button>
																			<span
																				class="my-review__modify__star__content__status js_reviewModifyStatus default-review-star">(필수)<em>*</em></span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="review-intake-form__check-options">
														<div class="review-table">
															<div class="review-table__cell title">리뷰</div>
															<div class="review-table__cell description">
																<div class="radio-survey-wrap _survey-answer-wrap">

																	<dl class="radio-survey">
																		<dt>담겨 있는 병의 견고함은 어떠한가요?</dt>


																		<dd>
																			<label><input type="radio" name="group_102"
																				class="_survey-answer"
																				data-question="담겨 있는 병의 견고함은 어떠한가요?"
																				data-question-id="102" data-answer-id="337"
																				data-answer="잘 찌그러져요">잘 찌그러져요</label>
																		</dd>

																		<dd>
																			<label><input type="radio" name="group_102"
																				class="_survey-answer"
																				data-question="담겨 있는 병의 견고함은 어떠한가요?"
																				data-question-id="102" data-answer-id="338"
																				data-answer="적당히 튼튼해요">적당히 튼튼해요</label>
																		</dd>

																		<dd>
																			<label><input type="radio" name="group_102"
																				class="_survey-answer"
																				data-question="담겨 있는 병의 견고함은 어떠한가요?"
																				data-question-id="102" data-answer-id="339"
																				data-answer="아주 딱딱해요">아주 딱딱해요</label>
																		</dd>


																	</dl>

																	<dl class="radio-survey">
																		<dt>생산지 및 수원지가 잘 표기되어 있나요?</dt>


																		<dd>
																			<label><input type="radio" name="group_101"
																				class="_survey-answer"
																				data-question="생산지 및 수원지가 잘 표기되어 있나요?"
																				data-question-id="101" data-answer-id="334"
																				data-answer="명확해요">명확해요</label>
																		</dd>

																		<dd>
																			<label><input type="radio" name="group_101"
																				class="_survey-answer"
																				data-question="생산지 및 수원지가 잘 표기되어 있나요?"
																				data-question-id="101" data-answer-id="346"
																				data-answer="찾기 어려워요">찾기 어려워요</label>
																		</dd>

																		<dd>
																			<label><input type="radio" name="group_101"
																				class="_survey-answer"
																				data-question="생산지 및 수원지가 잘 표기되어 있나요?"
																				data-question-id="101" data-answer-id="347"
																				data-answer="안 적혀있어요">안 적혀있어요</label>
																		</dd>


																	</dl>

																</div>
															</div>
														</div>
													</div>


													<div class="review-intake-form__detail-review">


														<div class="my-review__modify__review">
															<div class="my-review__modify__field__title">상세리뷰</div>

															<div class="my-review__modify__review__content">

																<div
																	class="my-review__modify__review__content__text-wrap">
																	<textarea
																		class="my-review__modify__review__content__text-area js_reviewModifyTextArea"
																		placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요. 
  (상품 품질과 관계 없는 배송, 포장, 질문 응대, 상품 가격 등은 판매자 서비스 평가에 남겨주세요.)"
																		name="review" rows="5"></textarea>
																</div>


																<div class="my-review__flip-write-tooltip"
																	style="perspective: 28px; position: relative; transform-style: preserve-3d;">
																	상품 품질과 관계 없는 내용은 비공개 처리될 수 있습니다.</div>

																<div class="my-review__modify__review__content__count">
																	<span class="js_reviewModifyTextCount">0</span>
																</div>
															</div>
														</div>



														<div class="my-review__modify__file">
															<div class="my-review__modify__field__title">사진첨부</div>
															<div
																class="my-review__modify__file__content js_reviewModifyFileContainer"
																data-attachment-max-size="10">
																<div>
																	<button
																		class="my-review__modify__file__upload-btn  js_reviewModifyFileUploadBtn"
																		type="button">사진 첨부하기</button>
																	<span class="my-review__modify__file__count"> <strong
																		class="js_reviewModifyFileUploadCount">0</strong>&nbsp;/&nbsp;<span>10</span>
																	</span> <span class="my-review__modify__file__guide">사진은
																		최대 20MB 이하의 JPG, PNG, GIF 파일 10장까지 첨부 가능합니다.</span>
																</div>

																<div
																	class="my-review__modify__file__list-wrap
                      														js_reviewModifyImageListContainer">
																	<ul>

																	</ul>
																</div>


																<div
																	class="my-review__modify__file__frame js_reviewModifyIframeContainer"
																	data-token="0969c50f-7fc5-4e6a-b02e-1bb0af92acac"
																	data-url="//fileupload.coupang.com/fileupload?token=0969c50f-7fc5-4e6a-b02e-1bb0af92acac&amp;serviceInfo=PRODUCTREVIEW&amp;resizeOrigin=true"
																	data-param-name="files" data-serviceinfo=""
																	data-thumbnail-path="https://ts.coupangcdn.com/thumbnails/local/320/">
																	<iframe
																		class="my-review__iframe js_reviewIframeContainer"
																		src="//fileupload.coupang.com/fileupload?token=0969c50f-7fc5-4e6a-b02e-1bb0af92acac&amp;serviceInfo=PRODUCTREVIEW&amp;resizeOrigin=true"></iframe>
																</div>
															</div>
														</div>




													</div>

													<div class="review-intake-form__summary">

														<div class="my-review__modify__review">
															<div class="my-review__modify__field__title">한줄요약</div>

															<div class="my-review__field__content">
																<input
																	class="my-review__field__content__input summary js_reviewModifyHeadLine"
																	type="text" placeholder="한 줄 요약을 입력해 주세요"
																	name="summary" maxlength="30">
																<div class="review__summary__wordcount">
																	<span class="word__count"><span
																		class="word__count_data">0</span>/30</span>
																</div>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
										<div class="review-intake-register">
											<button class="cancel-button _review-cancel" type="button"
												onclick="location.href='reviewable.do'">취소하기</button>
											<button class="submit-button _review-submit" type="submit"
												onclick="checkStarRating()">등록하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>

	<div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>
</body>
</html>