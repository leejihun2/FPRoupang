<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.date_form{
	width: 150px;
	border-radius: 7px;
	border:solid 1px #dee2e6;
}
.insert_input{
	width: 300px;
}
</style>
<body>
	<form action="/journeyinfo_editAction?product_idx=${journeyDetail.ji_idx }" method="post" enctype="multipart/form-data">
	<div class="container">
		<table class="table">
			<tr>
				<th>* 상품상세명</th>
				<td colspan="3"><input type="text" class="form-control insert_input" id="ji_title" name="ji_title" value="${journeyDetail.ji_title }"/></td>
			</tr>
			<tr>
				<th>* 성인</th>
				<td>
				<select class="form-select insert_input" id="ji_adult" name="ji_adult">
						<option style="active">${journeyDetail.ji_adult}</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>	
				</td>
			</tr>
			<tr>
				<th>* 소인</th>
				<td>
				<select class="form-select insert_input" id="ji_kid" name="ji_kid">
						<option style="active">${journeyDetail.ji_kid}</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>	
				</td>
			</tr>
			<tr>
				<th>* 가격</th>
				<td><input type="text" class="form-control insert_input id="ji_price" name="ji_price" value="${journeyDetail.ji_price }" /></td>
			</tr>
			<tr>
				<th>&nbsp&nbsp할인율(%)</th>
				<td><input type="text" class="form-control insert_input id="ji_discount" name="ji_discount" value="${journeyDetail.ji_discount}" /></td>
			</tr>
			<tr>
				<th>* 개장기간</th>
				<td><input type="date" class="date_form" id="ji_duetime1" name="ji_duetime1" value="${duetime1 }"/>~<input type="date" class="date_form" id="ji_duetime2" name="ji_duetime2"  value="${duetime2 }" /></td>
			</tr>
			<tr>
				<th>* 잔여객실수</th>
				<td>
					<select class="form-select insert_input" id="ji_roomnum" name="ji_roomnum">
						<option style="active">${journeyDetail.ji_roomnum}</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>	
				</td>
			</tr>
			<tr>
				<th>&nbsp&nbsp객실소개</th>
				<td colspan="3">
					<c:choose>
						<c:when test="${not empty journeyDetail.ji_intro }">
							<textarea id="ji_intro" style="height: 100px" class="form-control insert_input" name="ji_intro">${journeyDetail.ji_intro }</textarea>
						</c:when>
						<c:otherwise>
							<textarea id="ji_intro" style="height: 100px" class="form-control insert_input" name="ji_intro" ></textarea>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
			<th>* 객실이미지</th>
				<td>
					<div id="sub_thumbnail2">
						<c:if test="${not empty dto.ji_image1 }">
							<img src="/uploads/${dto.ji_image1 }" />
							<c:if test="${not empty dto.ji_image2 }">
								<img src="/uploads/${dto.ji_image2 }" />
								<c:if test="${not empty dto.ji_image3 }">
									<img src="/uploads/${dto.ji_image3 }" />
									<c:if test="${not empty dto.ji_image4 }">
										<img src="/uploads/${dto.ji_image4 }" />
									</c:if>
								</c:if>
							</c:if>
						</c:if>
					</div>
					<input type="file" class="form-control insert_input" id="ji_image" name="sub_ji_image" multiple/>
				</td>
			</tr>
		</table>
		<button class="btn btn-primary" type="submit" id="submit">수정하기</button>
		<button class="btn btn-primary" type="reset">다시작성</button>
		</div>
	</form>
</body>
</html>