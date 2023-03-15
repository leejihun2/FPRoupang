<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>      
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>판매목록</title>

<!-- Custom fonts for this template-->
<link rel="stylesheet" href="../../css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="../../css/sb-admin-2.min.css">

<!-- Custom styles for this page -->
<link href="../css/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
td, th {
	text-align: center;
	/* center checkbox horizontally */
	vertical-align: middle;
	/* center checkbox vertically */
}


</style>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="../admin/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->

		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@include file="../admin/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				
				<div class="container-fluid">
					
					    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">판매목록</h1>
                    

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tables </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form id="block" method="post">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>주문번호</th>
	                                            <th>상품</th>
	                                            <th>주문날짜</th>
	                                            <th>도착일</th>
	                                            <th>배송여부</th>
	                                            
	                                        </tr>
	                                    </thead>
	                                     <tbody>
	                                     	<c:forEach items="${lists }" var="row" varStatus="loop">
		                                        <tr>
		                                            <td>${row.idx }</td>
													<td>${row.name }</td>
													<td>${row.company_name }</td>
													<td>${row.regidate }</td>
													<td><a href="appView.do?member_idx=${row.member_idx }">상세보기</a>
													</td>
													<td><input style='zoom: 1.5;' class="checkbox_group1" name="public1"
														type="checkbox" value="${row.member_idx }"
														id="flexCheckDefault"></td>
													
		                                        </tr>
	                                        </c:forEach>
                                         </tbody>
	                                </table>	      
	                                <div class="button">	                                  		
										<button class="btn btn-outline-secondary" id="approveSell" type="button">승인하기</button>
											<div class="space"></div>	
										<button class="btn btn-outline-secondary" id="blockSell" type="button">차단하기</button>
									</div>				
												
                                </form>	        
                               <a href="/admin/index.do">판매자 홈으로가기</a>                       
                            </div>
                        </div>
                    </div>
		
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
			
		</div>
		<!-- End of Content Wrapper -->

	</div>
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript-->
	<script src="../../css/vendor/jquery/jquery.min.js"></script>
	<script src="../../css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../css/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../js/sb-admin-2.min.js"></script>
</body>
</html>