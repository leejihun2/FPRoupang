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
.banner-image{
	width: 100px;
    height: 50px;
}
</style>
</head>
<body id="page-top">
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
	                                            <s:authorize access="hasRole('admin')">
	                                            <th>판매자</th>
	                                            <th>구매자</th>
	                                            </s:authorize>
	                                            <th>상품이미지</th>	                                            
	                                            <th>상품</th>
	                                            <th>주문날짜</th>
	                                            <th>배송여부</th>
	                                            <s:authorize access="hasRole('seller')">
	                                            <th>상세보기</th>
	                                            <th>취소여부</th>
	                                            </s:authorize>
	                                        </tr>
	                                    </thead>
	                                     <tbody id="list">
	                                		<c:forEach items="${lists }" var="row"  begin="0" end="30" varStatus="loop">
		                                            	
		                                        <tr>
		                                            <td>${row.order_num }
		                                            <input type="hidden" name="status" value="${row.order_item_idx }"/>
		                                            </td>
		                                            <s:authorize access="hasRole('admin')">
		                                           	<td>${row.company_name }</td>
		                                           	<td>${row.buyer_name }</td>
		                                           	</s:authorize>
		                                            <td><a><img src="/uploads/${row.goods_image }" class="banner-image"/></a></td>
													<td>${row.top_title }</td>
													<td>${row.order_date }</td>
													<td id="st">
													<input type="hidden" name="status" value="${row.order_status }"/>
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
													<s:authorize access="hasRole('seller')">
													<td><a href="orderView.do?order_item_idx=${row.order_item_idx }">상세보기</a>
													</td>
													<td>
													<div class="button">	
					                                	<c:if test="${row.order_status eq '0'}">
															<button class="btn btn-outline-secondary release" id="release" name="public1" value="${row.idx }" type="button">출고</button>
														</c:if>                  		
														<c:if test="${row.order_status eq '1'}">
														<button class="btn btn-outline-secondary completed" id="completed" name="public1" value="${row.idx }" type="button">배송완료</button>
														</c:if>
														<c:if test="${row.order_status eq '2'}">
																	배송완료
														</c:if>
														<c:if test="${row.order_status eq '3'}">
														<button class="btn btn-outline-secondary approveCancel" id="approveCancel" name="public1" value="${row.idx }" type="button">취소승인</button>
														</c:if>
														<c:if test="${row.order_status eq '4'}">
														취소완료
														</c:if>
													</div> 
													</td>
													</s:authorize>
		                                        </tr>
                                    		</c:forEach>
                                         </tbody>
	                                </table>	      					
                                </form>	        
                               <a href="/admin/index.do">관리 홈으로가기</a>                       
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