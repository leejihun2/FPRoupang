<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
	<link href="../css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<ul
	class="navbar-nav bg-gradient-secondary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/admin/index.do">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">관리자 페이지</div>
	</a>


	<!-- Heading -->
	<div class="sidebar-heading">Seller Menu</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fa fa-shopping-cart"></i> <span>상품등록/관리</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Components:</h6>
				<a class="collapse-item" href="/admin/buttons.do">상품</a> 
				<a class="collapse-item" href="/productInsert">여행/티켓</a>
			</div>
		</div></li>
	<li class="nav-item"><a class="nav-link collapsed" href="#">
	<s:authorize access="hasRole('seller')">
		<i class="fa fa-shopping-cart"></i> <span onclick="location.href=' '">판매목록확인</span>
	</s:authorize>
	</a></li>
	<s:authorize access="hasRole('admin')">
	
		<!-- Heading -->
		<div class="sidebar-heading">Administrator Menu</div>
	
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-folder"></i> <span>판매자관리</span>
		</a>
			<div id="collapsePages" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">판매자관리:</h6>
					<a class="collapse-item" href="/applicationList.do">판매권한신청리스트</a> 
					<a class="collapse-item" href="/sellerList.do">판매자리스트</a>
					<a class="collapse-item" href="/blockList.do">판매차단리스트</a>
				</div>
			</div></li>
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"> <i
				class="fas fa-fw fa-wrench"></i> <span>고객센터</span>
		</a>
			<div id="collapseUtilities" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">고객센터:</h6>
					<a class="collapse-item" href="/admin/writeSupports.do">글 작성</a>
					<a class="collapse-item" href="/admin/mainImageUpdate.do">메인이미지 수정</a>
					<a class="collapse-item" href="/admin/adminFaq.do?categoryCode=ALL">자주 묻는 질문</a>
					<a class="collapse-item" href="/admin/adminNotice.do?categoryCode=ALL">쿠팡소식</a>
				</div>
			</div></li>
		
		<li class="nav-item"><a class="nav-link collapsed" href="charts.do"
			data-toggle="collapse" data-target="#collapse"
			aria-expanded="true" aria-controls="collapse"> <i
				class="fas fa-fw fa-chart-area"></i> <span>최근 기록</span>
		</a>
			<div id="collapse" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="/admin/adminFaq.do?categoryCode=ALL">검색 목록</a>
					<a class="collapse-item" href="/admin/adminNotice.do?categoryCode=ALL">판매 목록</a>
					<a class="collapse-item" href="/admin/adminNotice.do?categoryCode=ALL"></a>
	
				</div>
		</div></li>
		
		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link" href="tables.do"> <i
				class="fas fa-fw fa-table"></i> <span>Tables</span></a></li>
	
	</s:authorize>
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
