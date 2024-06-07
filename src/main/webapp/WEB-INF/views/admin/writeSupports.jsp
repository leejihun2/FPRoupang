<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
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
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Blank</title>

<!-- Custom fonts for this template-->
<link rel="stylesheet" href="../css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="../css/sb-admin-2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function writeValidate(f) {
		if (f.contents.value == "") {
			alert("내용을 입력하세요");
			f.contents.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
	}
	  $(document).ready(function() {
	    $('#contact').change(function() {
	      var contact = $(this).val();
	      
	      var categoryOptions = [];
	      
	      if (contact == 'faq') {
	        categoryOptions = [
	          {"value": "DELIVERY", "text": "배송문의"},
	          {"value": "CANCEL", "text": "취소"},
	          {"value": "REFUND", "text": "환불"},
	          {"value": "MEMBER", "text": "회원서비스"},
	          {"value": "CASH", "text": "쿠팡캐시"},
	          {"value": "MOBILE", "text": "로켓모바일"}
	        ];
	      } else if (contact == 'notice') {
	        categoryOptions = [
	          {"value": "NOTICE", "text": "공지"},
	          {"value": "EVENT", "text": "이벤트"},
	          {"value": "AIRTICKET", "text": "항공권"}
	        ];
	      }
	      var options = '';
	      for (var i = 0; i < categoryOptions.length; i++) {
	        options += '<option value="' + categoryOptions[i].value + '">' + categoryOptions[i].text + '</option>';
	      }
	      $('#categorycode').html(options);
	    });
	  });
</script>
<body id="page-top">
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
				<form name="writeFrm" method="post"
					onsubmit="return writeValidate(this);"
					action="<c:url value="/admin/writeSupportsAction.do" />">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<select name="contact" id="contact">
									<option value="">카테고리</option>
									<option value="faq">자주묻는 질문</option>
									<option value="notice">쿠팡 소식</option>
								</select>
							</tr>
							<tr>
								<select name="categorycode" id="categorycode">
									<option value="">카테고리를 선택하세요</option>
								</select>
							</tr>

							<tr>
								<th class="text-center" style="vertical-align: middle;">제목</th>
								<td><textarea rows="1" class="form-control" name="title"
										placeholder="제목"></textarea></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">내용</th>
								<td><textarea rows="10" class="form-control"
										name="contents" placeholder="내용"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="row text-center" style="">
						<button type="submit" class="btn btn-secondary">작성하기</button>
						<button type="reset" class="btn btn-secondary">Reset</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/admin/index.do';">리스트보기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>