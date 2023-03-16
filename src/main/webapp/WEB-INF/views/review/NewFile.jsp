<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<div class="star-ratings">
			<input type="hi dden" name="ratevalue1"
				value="${totalstar.star_rate}" step="0.1" min="0" max="5" />
			<div class="rating-wrap1">
				<div class="rating1">
					<div class="overlay1"></div>
				</div>
			</div>
		</div>

		<div class="text-right"></div>
		<!-- 방명록 반복 부분 s -->
		<s:authorize access="isAuthenticated()">
			<s:authentication property="name" var="name" />
			<c:forEach items="${lists }" var="row" varStatus="loop">
				<div class="border mt-2 mb-2">
					<!--  -->
					<ul class="comment">
						<li>
							<div class="score_info">
								<div>
									<div class="star-ratings">${row.star_rate }</div>
								</div>
							</div>
						</li>
					</ul>
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
						<!--  -->
						<h4 class="media-heading">제목:</h4>
						<p></p>
						<div class="media">
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
						<div class="media">
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
						<div class="media">
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
						<p>${row.summary }</p>
					</div>
					<div class="media-right"></div>
					<button class="btn btn-secondary"
						onclick="location.href='reviewModify.do?idx=${row.idx}';">수정</button>
					<button class="btn btn-secondary"
						onclick="javascript:deleteRow(${row.idx});">삭제</button>
				</div>
			</c:forEach>
		</s:authorize>
	</div>
</body>
</html>