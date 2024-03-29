<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="../css/CustomerService.css" type="text/css">
<script src="../js/CustomerService.js"></script>
<link rel="stylesheet" href="../css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="../css/sb-admin-2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<head>
</head>
<script type="text/javascript">
	function writeValidate(f) {
		if (f.contents.value == "") {
			alert("내용을 입력하세요");
			f.contents.focus();
			return false;
		}
	}
</script>
<body id="page-top">
	<div id="wrapper">
		<%@include file="./sidebar.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<%@include file="./topbar.jsp"%>
			<div class="container">
				<form name="writeFrm" method="post"
					onsubmit="return writeValidate(this);"
					action="<c:url value="/admin/modifyAction.do" />">
					<input type="hidden" name="idx" value="${dto.idx }" />
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center" style="vertical-align: middle;">제목</th>
								<td><textarea rows="1" class="form-control" name="title">${dto.title }</textarea></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">내용</th>
								<td><textarea rows="10" class="form-control"
										name="contents">${dto.contents }</textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="row text-center" style="">
						<button type="submit" class="btn btn-secondary">수정하기</button>
						<button type="reset" class="btn btn-secondary">Reset</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/admin/admin${dto.contact}.do?categoryCode=ALL';">리스트보기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>