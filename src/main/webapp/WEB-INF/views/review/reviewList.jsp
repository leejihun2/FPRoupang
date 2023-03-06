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

<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/star_rating.css" type="text/css">
<link rel="stylesheet" href="../css/star_total.css" type="text/css">
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
	<%@include file="../top.jsp"%>
	<div id="top"></div>
	<div class="container">
		<c:forEach items="${totalstar }" var="star">
			<div class="star-ratings">
          <input type="hidden" name="ratevalue" value="${star.star_rate}" step="0.1" min="0" max="5" />
          <div class="rating-wrap">
            <div class="rating">
                <div class="overlay"></div>
            </div>
          </div>
			</div>
			<div class="star-ratings">1점 :${star.star_rate1 }</div>
			<div class="star-ratings">2점 :${star.star_rate2 }</div>
			<div class="star-ratings">3점 :${star.star_rate3 }</div>
			<div class="star-ratings">4점 :${star.star_rate4 }</div>
			<div class="star-ratings">5점 :${star.star_rate5 }</div>
			<div class="star-ratings">짱인가요? :${star.servey1_1 }</div>
			<div class="star-ratings">짱인가요? :${star.servey1_2 }</div>
			<div class="star-ratings">짱인가요? :${star.servey1_3 }</div>
			<div class="star-ratings">짱인가요? :${star.servey2_1 }</div>
			<div class="star-ratings">짱인가요? :${star.servey2_2 }</div>
			<div class="star-ratings">짱인가요? :${star.servey2_3 }</div>
			<div class="star-ratings">짱인가요? :${star.servey3_1 }</div>
			<div class="star-ratings">짱인가요? :${star.servey3_2 }</div>
			<div class="star-ratings">짱인가요? :${star.servey3_3 }</div>
				
		</c:forEach>

		<div class="text-right"></div>
		<!-- 방명록 반복 부분 s -->
		<c:forEach items="${lists }" var="row">
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
					<!--  -->
					<h4 class="media-heading">제목:${row.goods_title }</h4>
					<p>${row.ccomment }</p>
					<p>${row.servey1 }</p>
					<p>${row.servey2 }</p>
					<p>${row.servey3 }</p>
					<p>${row.summary }</p>
				</div>
				<div class="media-right"></div>
				<%-- 							<c:if test="${sessionScope.siteUserInfo.id eq row.id }">
								<button class="btn btn-secondary"
									onclick="location.href='modify.do?idx=${row.idx}';">
									수정</button>
								<button class="btn btn-secondary"
									onclick="javascript:deleteRow(${row.idx});">삭제</button>
							</c:if>
 --%>
			</div>
		</c:forEach>
	</div>
	<div id="copyright">
		<%@include file="../copyright.jsp"%>
		<!-- 원하는 파일 경로를 삽입하면 된다 -->
	</div>
</body>
</html>