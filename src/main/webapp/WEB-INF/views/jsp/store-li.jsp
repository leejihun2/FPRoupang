<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>


<li>
	<%-- <a href="${store_admin }/detail/${storeList.id }"> --%>

	<div class="img_box">
		<a href="${store_admin }/detail/${storeList.id }"><img
			src="${storeList.storeImg }" alt="이미지"></a>
	</div>

	<div class="info_box">

		<h2>
			<a href="${store_admin }/detail/${storeList.id }">${storeList.storeName }</a>
		</h2>

		<a href="${store_admin }/detail/${storeList.id }"> <span> <span>평점
					${storeList.score }</span> <span class="score_box"> <c:forEach
						begin="0" end="4" var="i">
						<c:if test="${Math.round(storeList.score) > i }">
							<i class="far fas fa-star"></i>
						</c:if>
						<c:if test="${Math.round(storeList.score) <= i }">
							<i class="far fa-star"></i>
						</c:if>
					</c:forEach>
			</span>
		</span> <span> <span>리뷰 ${storeList.reviewCount }</span> <span>사장님
					댓글 ${storeList.bossCommentCount }</span>
		</span>

			<li>
				<div class="score_info">
					<div>
						<div class="score">${info.score }</div>

						<div>
							<c:forEach begin="0" end="4" var="i">
								<c:choose>
									<c:when test="${Math.round(info.score) > i }">
										<i class="far fas fa-star"></i>
									</c:when>
									<c:otherwise>
										<i class="far fa-star"></i>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>

					<div class="score_count">
						<div>
							<div>5점</div>

							<div class="graph_box">
								<div class="graph_background"></div>
								<div class="graph score5" data-score5="${info.score5 }"></div>
							</div>

							<div class="review_count">${info.score5 }</div>
						</div>

						<div>
							<div>4점</div>
							<div class="graph_box">
								<div class="graph_background"></div>
								<div class="graph score4" data-score4="${info.score4 }"></div>
							</div>
							<div class="review_count">${info.score4 }</div>
						</div>

						<div>
							<div>3점</div>
							<div class="graph_box">
								<div class="graph_background"></div>
								<div class="graph score3" data-score3="${info.score3 }"></div>
							</div>
							<div class="review_count">${info.score3 }</div>
						</div>

						<div>
							<div>2점</div>
							<div class="graph_box">
								<div class="graph_background"></div>
								<div class="graph score2" data-score2="${info.score2 }"></div>
							</div>
							<div class="review_count">${info.score2 }</div>
						</div>

						<div>
							<div>1점</div>
							<div class="graph_box">
								<div class="graph_background"></div>
								<div class="graph score1" data-score1="${info.score1 }"></div>
							</div>
							<div class="review_count">${info.score1 }</div>
						</div>
					</div>

				</div>
		</li> <c:forEach items="${store.reviewList }" var="reviewList">
				<li>
					<div class="client">

						<div class="review_header">
							<div>
								<div class="nickname">${reviewList.nickname }</div>
								<div>

									<c:forEach begin="0" end="4" var="i">
										<c:choose>
											<c:when test="${Math.round(reviewList.score) > i }">
												<i class="far fas fa-star"></i>
											</c:when>
											<c:otherwise>
												<i class="far fa-star"></i>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<span><fm:formatDate value="${reviewList.regiDate }"
											pattern="yyyy-MM-dd" /> </span>
								</div>
							</div>
						</div>

						<div>
							<c:if test="${!empty reviewList.reviewImg }">
								<div>
									<img src="${reviewList.reviewImg }" alt="이미지"
										class="review_img">
								</div>
							</c:if>
							<div>${reviewList.reviewContent }</div>
						</div>
					</div>


					<div class="boss">
						<c:if test="${!empty reviewList.bossComment }">
							<div class="boss_comment_box">
								<div class="nickname">사장님</div>
								<div class="boss_comment">${reviewList.bossComment }</div>
							</div>
						</c:if>
					</div>


					<div class="boss input">
						<div class="boss_comment_box">
							<div class="nickname">사장님</div>
							<div class="boss_comment">
								<textarea class="comment_area" spellcheck="false"></textarea>
							</div>

							<div>
								<button class="boss_comment_btn reply">댓글 달기</button>
								<input type="hidden" value="${reviewList.orderNum }"
									class="order_num">
							</div>
						</div>
					</div>
				</li>
			</c:forEach> <span> <span>최소주문금액 <fm:formatNumber
						value="${storeList.minDelevery }" pattern="###,###" />원
			</span> <span>배달팁 <fm:formatNumber value="${storeList.deleveryTip }"
						pattern="###,###" />원
			</span>
		</span> <span>배달시간 ${storeList.deleveryTime }분</span>
		</a>
	</div> <c:if test="${!storeList.isOpen}">
		<div class="is_open">
			<a href="/store/detail/${storeList.id }">지금은 준비중입니다</a>
		</div>
	</c:if>
</li>