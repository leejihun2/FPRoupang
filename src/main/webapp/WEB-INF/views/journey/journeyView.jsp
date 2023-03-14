<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루팡!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./journeycss/bundle1.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle2.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/bundle3.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/travel.css" type="text/css" />
<link rel="stylesheet" href="./journeycss/journeyTop.css" type="text/css" />
<link rel="stylesheet" href="./css/common.css" type="text/css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="./js/journeyTop.js"></script>
<style type="text/css">
.category-section {
    width: 1300px;
    margin: 50px auto 0;
}
</style>
</head>

<body>
    <!-- top.html에서 인클루드 -->
    <div id="top" style="margin-bottom:0px;">
        <%@include file="../top.jsp" %>
    </div>
     	<%@include file="./searchbox.jsp" %>

	<section class="category-c2-banners category-section">
		<div class="grid-banner">
			<h2 class="grid-banner-title">카테고리 인기 상품</h2>
			<ul class="grid-banners">
				<li class="grid-banner-item">
					<a href="/journey_List?category=1&location=제주">
						<dl>
							<dt>
								<img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_704ebfec-4468-492d-baaf-cd7fbcb46e2b.jpg" class="banner-item-image">
							</dt>
							<dd>
								<span class="banner-item-title">국내여행 NO.1 핫플레이스</span><span class="banner-item-description">#가족여행 #인피니티풀 #오션뷰</span>
							</dd>
						</dl>
					</a>
				</li>
				<li class="grid-banner-item">
					<a href="/journey_List?category=1&location=강원">
						<dl>
							<dt>
								<img src="http://image7.coupangcdn.com/image/bannerunit/bannerunit_0f9489f4-eb33-46fb-ad13-96e17c00fbb0.jpg" class="banner-item-image">
							</dt>
							<dd>
								<span class="banner-item-title">청정 동해바다 힐링여행</span><span class="banner-item-description">#속초 #양양 #삼척 #홍천 #고성</span>
							</dd>
						</dl>
					</a>
				</li>
				<li class="grid-banner-item">
					<a a href="/journey_List?category=1&location=전라">
						<dl>
							<dt>
								<img src="http://image7.coupangcdn.com/image/bannerunit/bannerunit_e6a67865-fb4e-4c9c-89ad-c2bcbc71c669.jpg" class="banner-item-image">
							</dt>
							<dd>
								<span class="banner-item-title">다채로운 미식과 문화의 고장</span><span class="banner-item-description">#여수 #진도 #목포 #순천 #전주</span>
							</dd>
						</dl>
					</a>
				</li>
				<li class="grid-banner-item">
					<a href="/journey_List?category=1&location=부산">
						<dl>
							<dt>
								<img src="http://image6.coupangcdn.com/image/bannerunit/bannerunit_3ed60f56-fce6-4234-883b-a33b33133f7b.jpg" class="banner-item-image">
							</dt>
							<dd>
								<span class="banner-item-title">화려한 해변과 영화의 도시</span><span class="banner-item-description">#해운대 #사상 #동구 #중구</span>
							</dd>
						</dl>
					</a>
				</li>
				<li class="grid-banner-item">
					<a href="/journey_List?category=1&location=서울">
						<dl>
							<dt>
								<img src="http://image10.coupangcdn.com/image/bannerunit/bannerunit_c0a30210-813e-4f96-980b-f23316d0c1ea.jpg"class="banner-item-image">
							</dt>
							<dd>
								<span class="banner-item-title">서울 도심 힐링 호캉스</span><span class="banner-item-description">#강남 #마포 #종로 #서초 #중구</span>
							</dd>
						</dl>
					</a>
				</li>
				<li class="grid-banner-item">
					<a href="/journey_List?category=1&location=강릉">
						<dl>
							<dt>
								<img src="http://image9.coupangcdn.com/image/bannerunit/bannerunit_8c68a97b-1c43-4cb4-9012-c50dab1801c6.jpg" class="banner-item-image">
							</dt>
							<dd>
								<span class="banner-item-title">바다와 커피와 힐링의 도시</span><span
									class="banner-item-description">#경포대 #주문진 #정동진</span>
							</dd>
						</dl>
					</a>
				</li>
			</ul>
		</div>
	</section>
			</div>
         </div>
   </section>
</body>
</html>