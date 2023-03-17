<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/CustomerService.css" type="text/css">
<script src="../js/CustomerService.js"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Blank</title>
<link rel="stylesheet" href="../css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="../css/sb-admin-2.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
img{
	width:400px; 
	height: 300px;
}
</style>
<body id="page-top">
	<div id="wrapper">
		<%@include file="./sidebar.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@include file="./topbar.jsp"%>
			
			<h2>Main Image</h2>
		<form action="/admin/mainImageUpdateAct.do?idx=1" method="POST" enctype="multipart/form-data">
			<table>
			<tr>	
				<td>
						
					<c:if test="${not empty dto.image1 }">
						<img src="/uploads/${dto.image1}" />
					</c:if>
						
					<c:if test="${not empty dto.image2 }">
						<img src="/uploads/${dto.image2}" />
					</c:if>
						
					<c:if test="${not empty dto.image3 }">
						<img src="/uploads/${dto.image3}" />
					</c:if>				
				</td>
				<td>
					<c:if test="${not empty dto.image4 }">
						<img src="/uploads/${dto.image4}" />
					</c:if>
					<c:if test="${not empty dto.image5 }">
						<img src="/uploads/${dto.image5}" />
					</c:if>
					<c:if test="${not empty dto.image6 }">
						<img src="/uploads/${dto.image6}" />
					</c:if>	
					<input type="file" class="form-control" name="image1"/>
					<input type="file" class="form-control" name="image2"/>
					<input type="file" class="form-control" name="image3"/>
						<input type="file" class="form-control" name="image4"/>
						<input type="file" class="form-control" name="image5"/>
						<input type="file" class="form-control" name="image6"/>
				</td>			
			</tr>
			</table>
			<button class="btn btn-primary" style="width: 200px;">수정하기</button>
		</form>
			</div>
		</div>
	</div>
</body>

</html>