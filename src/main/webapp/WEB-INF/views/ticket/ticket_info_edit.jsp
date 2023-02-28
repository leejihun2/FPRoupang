<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ticketinfo_editAction?product_idx=${ticketDetail.ti_idx }" method="post">
		<table>
			<tr>
				<th>* 상품상세명</th>
				<td colspan="3"><input type="text" id="ti_title" name="ti_title" value="${ticketDetail.ti_title }"/></td>
			</tr>
			<tr>
				<th>* 유효기간</th>
				<td colspan="3"><input type="date" id="ti_duetime1" name="ti_duetime1" value="${duetime1 }"/>~<input type="date" id="ti_duetime2" name="ti_duetime2"  value="${duetime2 }" /></td>
			</tr>
			<tr>
				<th>* 가격</th>
				<td><input type="text" id="ti_price" name="ti_price" value="${ticketDetail.ti_price }" /></td>
				<th>할인율</th>
				<td><input type="text" id="ti_discount" name="ti_discount" value="${ticketDetail.ti_discount}" />%</td>
			</tr>
			<tr>
				<th>상품소개</th>
				<td colspan="3">
					<c:choose>
						<c:when test="${not empty ticketDetail.ti_intro }">
							<textarea id="ti_intro" name="ti_intro" cols="30" rows="10">${ticketDetail.ti_intro }</textarea>
						</c:when>
						<c:otherwise>
							<textarea id="ti_intro" name="ti_intro" cols="30" rows="10"></textarea>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<button class="btn-primary" type="submit" id="submit">수정하기</button>
		<button class="btn-primary" type="reset">다시작성</button>
	</form>
</body>
</html>