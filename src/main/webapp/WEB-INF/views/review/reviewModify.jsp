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
</head>
<body style="background-color: #ffffff">
	<%@include file="../myroupang/myroupang.jsp"%>
	<div class="roll">
		<h1 class="qwer">리뷰수정</h1>

		<div class="div1"></div>
		<div class="container">
			<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
			<form name="writeFrm" method="post"
				onsubmit="return writeValidate(this);"
				action="<c:url value="/review/reviewModifyAction.do" />">
				<input type="hidden" name="idx" value="${dto.idx }" />
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
									data-reference="{&quot;module&quot;:&quot;pcweb&quot;, &quot;controller&quot;:&quot;productreview/modify&quot;}">

									<div class="my-review__modify js_modifyContainer"
										data-product-review-id="118563038"
										data-completed-order-vendor-item-id=""
										data-product-id="1275397869" data-vendor-item-id="70278535334"
										data-item-id="2281416302" data-vendor-id="A00010028"
										data-completed-order-only="true">
										<div class="my-review__header">
											<span class="my-review__header_title">구매후기 쓰기</span> <span
												class="my-review__header_right"><a
												href="/review/reviewList.do"
												class="my-review__redirect_link">작성 가능 구매후기 보기</a></span>
										</div>
										<div class="my-review__writable__list">
											<div class="my-review__writable__image-wrap">
												<img class="my-review__writable__image"
													src="https://thumbnail10.coupangcdn.com/thumbnails/remote/250x250ex/image/vendor_inventory/f783/e827c88bb90dfeda35ddabba96d6d5c129565b6567f09fc3dc23e4da4346.jpg"
													title="도넛 휴대용 약통 랜덤발송, 2개" alt="도넛 휴대용 약통 랜덤발송, 2개">
											</div>
											<div class="my-review__writable__content-wrap">
												<div class="my-review__writable__content-title">도넛 휴대용
													약통 랜덤발송, 2개</div>
												<div class="my-review__writable__content">도넛 휴대용 약통
													랜덤발송, 2개</div>
												<div class="my-review__writable__date">2020.07.02 작성</div>
											</div>
										</div>


										<div
											class="my-review__modify__star js_reviewModifyStarContainer"
											data-star="5" data-text="최고">
											<div class="my-review__modify__field__title">별점</div>
											<div class="my-review__modify__star__content">

												<div class="mb-3" name="star_rate" id="star_rates">
													<fieldset>
														<span class="text-bold">필쥬</span> * <input type="radio"
															name="star_rate" value="5" id="star_rate1"
															name="star_rate1"> <label for="star_rate1">★</label>
														<input type="radio" name="star_rate" value="4"
															id="star_rate2" name="star_rate2"> <label
															for="star_rate2">★</label> <input type="radio"
															name="star_rate" value="3" id="star_rate3"
															name="star_rate3"> <label for="star_rate3">★</label>
														<input type="radio" name="star_rate" value="2"
															id="star_rate4" name="star_rate4"> <label
															for="star_rate4">★</label> <input type="radio"
															name="star_rate" value="1" id="star_rate5"
															name="star_rate5"> <label for="star_rate5">★</label>
													</fieldset>
												</div>



											</div>
										</div>




										<div class="my-review__modify__review">
											<div class="my-review__modify__field__title">구매후기</div>

											<div class="my-review__modify__review__content">

												<div class="my-review__modify__review__content__text-wrap">
													<textarea
														class="my-review__modify__review__content__text-area js_reviewModifyTextArea"
														placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 남겨주세요.
 															 (배송, 포장, 질문 응대, 상품 가격 등은 상품 품질에 해당하지 않습니다.)"
														rows="5" name="review">${dto.review }</textarea>
												</div>


												<div class="my-review__flip-write-tooltip"
													style="perspective: 28px; position: relative; transform-style: preserve-3d;">
													상품 품질과 관계 없는 내용은 비공개 처리될 수 있습니다.</div>

												<div class="my-review__modify__review__content__count">
													<span class="js_reviewModifyTextCount"></span>
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
														class="js_reviewModifyFileUploadCount">2</strong>&nbsp;/&nbsp;<span>10</span>
													</span> <span class="my-review__modify__file__guide">사진은 최대
														20MB 이하의 JPG, PNG, GIF 파일 10장까지 첨부 가능합니다.</span>
												</div>

												<div
													class="my-review__modify__file__list-wrap
									                      my-review__modify__file__list-wrap--active
									                      js_reviewModifyImageListContainer">
													<ul>


														<li
															class="js_reviewModifyImageList js_reviewModifyImageInput">
															<div class="my-review__attachment__thumbnail">
																<img
																	class="my-review__modify__file__list__image js_reviewFileListImage"
																	src="https://ts.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202007/2/8346521484181569649/f3f1036e-ae91-49ea-b92f-1e048a502eb8.jpg"
																	data-src="https://ts.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202007/2/8346521484181569649/f3f1036e-ae91-49ea-b92f-1e048a502eb8.jpg"
																	data-uploaded-file-path="image2/PRODUCTREVIEW/202007/2/8346521484181569649/f3f1036e-ae91-49ea-b92f-1e048a502eb8.jpg"
																	style="width: 100%; height: auto; margin-top: 0px; opacity: 1;">
															</div>
															<div class="attachment__caption__container">
																<textarea rows="3" class="caption__text"
																	placeholder="이 사진의 설명글을 작성해보세요." maxlength="150"></textarea>
															</div>
															<div class="attachment__caption__right">
																<span class="word__count"><span
																	class="word__count_data">0</span>/150</span> <a
																	class="caption__btn js_reviewFileListDeleteBtn"
																	href="javascript:void(0);">삭제</a>
															</div>
														</li>

														<li
															class="js_reviewModifyImageList js_reviewModifyImageInput">
															<div class="my-review__attachment__thumbnail">
																<img
																	class="my-review__modify__file__list__image js_reviewFileListImage"
																	src="https://ts.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202007/2/8346521484181569649/b77630eb-2151-465a-9685-d2f893a48a2d.jpg"
																	data-src="https://ts.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202007/2/8346521484181569649/b77630eb-2151-465a-9685-d2f893a48a2d.jpg"
																	data-uploaded-file-path="image2/PRODUCTREVIEW/202007/2/8346521484181569649/b77630eb-2151-465a-9685-d2f893a48a2d.jpg"
																	style="width: 100%; height: auto; margin-top: 0px; opacity: 1;">
															</div>
															<div class="attachment__caption__container">
																<textarea rows="3" class="caption__text"
																	placeholder="이 사진의 설명글을 작성해보세요." maxlength="150"></textarea>
															</div>
															<div class="attachment__caption__right">
																<span class="word__count"><span
																	class="word__count_data">0</span>/150</span> <a
																	class="caption__btn js_reviewFileListDeleteBtn"
																	href="javascript:void(0);">삭제</a>
															</div>
														</li>


													</ul>
												</div>


												<div
													class="my-review__modify__file__frame js_reviewModifyIframeContainer"
													data-token="d4e43445-6436-4147-b455-c8de8cd34336"
													data-url="//fileupload.coupang.com/fileupload?token=d4e43445-6436-4147-b455-c8de8cd34336&amp;serviceInfo=PRODUCTREVIEW&amp;resizeOrigin=true"
													data-param-name="files" data-serviceinfo=""
													data-thumbnail-path="https://ts.coupangcdn.com/thumbnails/local/320/">
													<iframe class="my-review__iframe js_reviewIframeContainer"
														src="//fileupload.coupang.com/fileupload?token=d4e43445-6436-4147-b455-c8de8cd34336&amp;serviceInfo=PRODUCTREVIEW&amp;resizeOrigin=true"></iframe>
												</div>
											</div>
										</div>








										<div class="my-review__modify__survey">
											<div class="my-review__modify__field__title">평가</div>
											<div class="my-review__modify__survey__content">
												<div class="mb-3" name="star_servey1" id="star_rates">
													<fieldset>
														<span class="text-bold">가격은 괜찮나요</span> <input
															type="radio" name="star_servey1" value="5"
															id="star_servey1_1" name="star_servey1_1"> <label
															for="star_servey1_1">★</label> <input type="radio"
															name="star_servey1" value="4" id="star_servey1_2"
															name="star_servey1_2"> <label
															for="star_servey1_2">★</label> <input type="radio"
															name="star_servey1" value="3" id="star_servey1_3"
															name="star_servey1_3"> <label
															for="star_servey1_3">★</label> <input type="radio"
															name="star_servey1" value="2" id="star_servey1_4"
															name="star_servey1_4"> <label
															for="star_servey1_4">★</label> <input type="radio"
															name="star_servey1" value="1" id="star_servey1_5"
															name="star_servey1_5"> <label
															for="star_servey1_5">★</label>
													</fieldset>
												</div>

												<div class="mb-3" name="star_servey2" id="star_rates">
													<fieldset>
														<span class="text-bold">서비스는 어떤가요</span> <input
															type="radio" name="star_servey2" value="5"
															id="star_servey2_1" name="star_servey2_1"> <label
															for="star_servey2_1">★</label> <input type="radio"
															name="star_servey2" value="4" id="star_servey2_2"
															name="star_servey2_2"> <label
															for="star_servey2_2">★</label> <input type="radio"
															name="star_servey2" value="3" id="star_servey2_3"
															name="star_servey2_3"> <label
															for="star_servey2_3">★</label> <input type="radio"
															name="star_servey2" value="2" id="star_servey2_4"
															name="star_servey2_4"> <label
															for="star_servey2_4">★</label> <input type="radio"
															name="star_servey2" value="1" id="star_servey2_5"
															name="star_servey2_5"> <label
															for="star_servey2_5">★</label>
													</fieldset>
												</div>
												<div class="mb-3" name="star_servey3" id="star_rates">
													<fieldset>
														<span class="text-bold">만족스럽나요</span> <input type="radio"
															name="star_servey3" value="5" id="star_servey3_1"
															name="star_servey3_1"> <label
															for="star_servey3_1">★</label> <input type="radio"
															name="star_servey3" value="4" id="star_servey3_2"
															name="star_servey3_2"> <label
															for="star_servey3_2">★</label> <input type="radio"
															name="star_servey3" value="3" id="star_servey3_3"
															name="star_servey3_3"> <label
															for="star_servey3_3">★</label> <input type="radio"
															name="star_servey3" value="2" id="star_servey3_4"
															name="star_servey3_4"> <label
															for="star_servey3_4">★</label> <input type="radio"
															name="star_servey3" value="1" id="star_servey3_5"
															name="star_servey3_5"> <label
															for="star_servey3_5">★</label>
													</fieldset>
												</div>
											</div>
										</div>



										<div class="my-review__modify__review">
											<div class="my-review__modify__field__title">한줄요약</div>

											<div class="my-review__field__content">
												<input name="summary"
													class="my-review__field__content__input summary js_reviewModifyHeadLine"
													type="text" placeholder="한 줄 요약을 입력해 주세요"
													value="${dto.summary }" maxlength="30">
												<div class="review__summary__wordcount"></div>
											</div>
										</div>




										<div class="my-review__modify__footer">
											<button
												class="my-review__modify__footer__cancel-btn js_reviewModifyCancelBtn"
												type="button" data-page="1">취소</button>
											<button
												class="my-review__modify__footer__submit-btn js_reviewModifySubmitBtn"
												type="submit">완료</button>
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

	<%-- <div id="copyright">
		<%@include file="../copyright.jsp"%>
		<!-- 원하는 파일 경로를 삽입하면 된다 -->
	</div> --%>
</body>
</html>