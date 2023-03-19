<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom styles for this template-->
<link rel="stylesheet" href="../css/sb-admin-2.min.css">
<style type="text/css">
</style>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<!-- 슬리이드바 -->
		<%@include file="./sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@include file="./topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Content Row -->
					<div class="row" style="width: 1766px;">
						<!-- Area Chart -->
						<div style="width: 533px;">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">상품 갬색 많이 된 순</h6>
								</div>
								<div class="card-body"
									style="height: 300px; text-align: center;">
									<img style="width: 390px;" class="li-img-min"
										src="../images/Search Count.png" alt="">
								</div>
							</div>
						</div>
						<!-- Pie Chart -->
						<div style="width: 433px;">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">여행지역 시간대별 검색</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body" style="height:300px;">
									<div id="carouselExampleControls" class="carousel slide"
										data-bs-ride="">
										<div class="carousel-inner">
											<div class="carousel-item active" style="height: 280px;">
												<img src="../images/Search Count by Hour for 가평.png"
													class="d-block w-100 h-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 강릉.png"
													class="d-block w-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 강원.png"
													class="d-block w-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 경기.png"
													class="d-block w-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 부산.png"
													class="d-block w-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 서울.png"
													class="d-block w-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 속초.png"
													class="d-block w-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 전주.png"
													class="d-block w-100" alt="Search Count">
											</div>
											<div class="carousel-item" style="height: 280px;">
												<img src="../images/Search Count by Hour for 제주.png"
													class="d-block w-100" alt="Search Count">
											</div>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleControls"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleControls"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="width: 1766px;">
						<%@include file="orderListIclued.jsp"%>
					</div>
				</div>
			</div>
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="../css/vendor/jquery/jquery.min.js"></script>
	<script src="../css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="../css/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="../css/vendor/chart.js/Chart.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="../js/demo/chart-area-demo.js"></script>
	<script src="../js/demo/chart-pie-demo.js"></script>
</body>

</html>