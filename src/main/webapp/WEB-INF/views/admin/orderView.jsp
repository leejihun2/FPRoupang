<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>판매상품상세보기</title>

<!-- Custom fonts for this template-->
<link rel="stylesheet" href="../../css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="../../css/sb-admin-2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.banner-image{
	width: 300px;
    height: 150px;
}
</style>
<script>
$(function(){
	$("#release").click(function(){
		console.log(this.value);
		var release_val=this.value;
	
		if(confirm("해당 주문을 출고하시겠습니까?")){
				location.href="/orderRelease.do?value="+release_val;
			
		}
     

	});
	$("#completed").click(function(){
		console.log(this.value);
		var completed_val=this.value;
		
		if(confirm("해당 주문을 배송완료 처리하시겠습니까?")){
				location.href="/ordercompleted.do?value="+completed_val;	
		}
     

	});
	$("#approveCancel").click(function(){
		console.log(this.value);
		var approveCancel_val=this.value;
		
		if(confirm("해당 주문을 취소완료 처리하시겠습니까?")){
				location.href="/approveCancel.do?value="+approveCancel_val;	
		}
     

	});
});  

</script>
  
  
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
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
					
	
	<h3 class="text-center">판매상품 상세보기</h3>
	<c:forEach items="${view }" var="row">		
		
	 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		
		<tr>
		
			<td>상품이미지</td><td><a><img src="/uploads/${row.goods_image }" class="banner-image"/></a></td>
		</tr>
		<tr>
			<td>상품명</td><td>${row.top_title }</td>
		</tr>
		<tr>
			<td>주문금액</td><td>${row.price }</td>
		</tr>
		<tr>
			<td>수량</td><td>${row.amount }</td>
		</tr>
		<tr>
			<td>할인율</td><td>${row.discount }</td>
		</tr>
		<tr>
			<td>주문고객</td><td>${row.buyer_name }</td>
		</tr>
		<tr>
			<td>배송주소</td><td>${row.zipcode1 } ${row.address1 }</td>
		</tr>
		<tr>
			<td>배송여부</td>
			<td id="st">
				<c:if test="${row.order_status eq '0'}">
				미출발
				</c:if>
				<c:if test="${row.order_status eq '1'}">
				배송중
				</c:if>
				<c:if test="${row.order_status eq '2'}">
				배송완료
				</c:if>
				<c:if test="${row.order_status eq '3'}">
				취소요청중
				</c:if>
				<c:if test="${row.order_status eq '4'}">
				취소완료 
				</c:if>
			</td>
		</tr>
			
		
			
	</table>	
		<div class="button">	
	        <c:if test="${row.order_status eq '0'}">
				<button class="btn btn-outline-secondary" id="release" type="button" value="${row.order_idx }">출고</button>
			</c:if>
			<c:if test="${row.order_status eq '1'}">
				<button class="btn btn-outline-secondary" id="completed" type="button" value="${row.order_idx }">배송완료</button>
			</c:if>   	                                		
			<c:if test="${row.order_status eq '3'}">
				<button class="btn btn-outline-secondary" id="approveCancel" type="button" value="${row.order_idx }">취소승인</button>
			</c:if> 
			
			<button class="btn btn-outline-secondary" id="orderList" type="button"  onclick="location.href='orderlist.do' ">목록으로 돌아가기</button>
		</div> 
	</c:forEach>





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
	<!-- End of Page Wrapper -->

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