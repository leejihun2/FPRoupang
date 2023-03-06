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
<link rel="stylesheet" href="../css/star_rate.css" type="text/css">
<link rel="stylesheet" href="../css/star_rating.css" type="text/css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
        input[type=number]{
            margin-bottom: 0;
            margin-left: 8px;
            padding: 6px 8px;
            font-size: 1em;
            border: none;
            border-radius: 4px;
        }
        .rating-wrap{
            padding: 10px;
            display: flex;
        }
        .rating {
            display: flex;
            align-items: center;
            position: relative;
        }
        .star {
            width: 30px;
            height: 30px;
            margin-right: 2px;
        }
        .starcolor{
            fill: #ff8844;
        }
        .star:last-of-type {
            margin-right: 0;
        }
        .overlay {
            background-color: #000;
            opacity: 0.5;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            z-index: 1;
            transition: all 0.3s ease-in-out;
        }
        @supports (mix-blend-mode: color) {
            .overlay{
                mix-blend-mode: color;
                opacity: unset;
            }
        }
</style>
<script>
    const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
    let maskMax = 0; //오버레이 마스크 최대 너비
    window.addEventListener('DOMContentLoaded',()=>{
        for(let i = 0;i < maxStar;i++){
            let el = document.createElement('div');
            el.style.width = starSize + 'px';
            el.style.height = starSize + 'px';
            el.style.marginRight = gutter + 'px';
            el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
            document.querySelector('.rating').appendChild(el);
        }
        
        maskMax = parseInt(starSize * maxStar + gutter * (maxStar-1));//최대 마스크 너비 계산
        document.querySelector('input[name=ratevalue]').max = maxStar;//입력 필드 최대값 재설정
        setRating(document.querySelector('input[name=ratevalue]').value);//초기 별점 마킹

        function setRating(val = 0){
            document.querySelector('.overlay').style.width = parseInt(maskMax - val * starSize - Math.floor(val) * gutter) + 'px';//마스크 크기 변경해서 별점 마킹
        }
        
    })
</script>
<script>
ratingToPercent() {
	const totalstar = +this.restaurant.averageScore * 20;return
	totalstar + 1.5;
	
}
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
          <input type="number" name="ratevalue" value="${star.star_rate}" step="0.1" min="0" max="5" />
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