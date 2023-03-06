<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/category.css"> 
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/star_rate.css" type="text/css">
  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function deleteRow(idx){
   if(confirm("정말로 삭제하시겠습니까?")){
	   //삭제 요청명으로 이동한다.
      location.href = "delete.do?idx="+idx;
   }
}
</script>
</head>
<body style="background-color: white;">

<div class="container">
	
	<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
	<form name="writeFrm" method="post" 
		onsubmit="return writeValidate(this);"
		action="<c:url value="/review/reviewAction.do" />" >
		
	<table class="table table-bordered">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
	
		<tr>
			<td>
				<select name="goods_title" value="상품문의">
					<option value="유형을 선택해주세요">유형을 선택해주세요</option>
					<option value="주문 상품 문의">주문 상품 문의</option>
					<option value="주문 상품 문의">주문 상품 문의</option>
					<option value="쿠팡 서비스 칭찬">쿠팡 서비스 칭찬</option>
					<option value="시스템 개선 의견">시스템 개선 의견</option>
					<option value="시스템(PC/Mobile) 오류 제보">시스템(PC/Mobile) 오류 제보</option>
					<option value="시스템(PC/Mobile) 오류 제보">시스템(PC/Mobile) 오류 제보</option>
					<option value="프레시백 반납 신청">프레시백 반납 신청</option>
					<option value="회수 지연 문의">회수 지연 문의</option>
				</select>
			</td>
		</tr>	
		<div class="mb-3" name="star_rate" id="star_rates">
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span> 
				<input type="radio" name="star_rate" value="5" id="star_rate1" name="star_rate1">
					<label for="star_rate1">★</label> 
				<input type="radio" name="star_rate" value="4" id="star_rate2" name="star_rate2">
					<label for="star_rate2">★</label>
				<input type="radio" name="star_rate" value="3" id="star_rate3" name="star_rate3">
					<label for="star_rate3">★</label> 
				<input type="radio" name="star_rate" value="2" id="star_rate4" name="star_rate4">
					<label for="star_rate4">★</label> 
				<input type="radio" name="star_rate" value="1" id="star_rate5" name="star_rate5">
					<label for="star_rate5">★</label>
			</fieldset>
		</div>
		<dl id="servey1" name="servey1">
			<dt>상품의 품질은 어떤가요</dt>
			
				
					<dd><label><input type="radio" name="servey1"  value="1">예상보다 좋아요</label></dd>
				
					<dd><label><input type="radio" name="servey1"  value="1">설명과 비슷해요</label></dd>
				
					<dd><label><input type="radio" name="servey1"  value="1">예상보다 떨어져요</label></dd>
				
			
		</dl>
	
		<dl id="servey2" name="servey2">
			<dt>배송은 어떠셨나요?</dt>
			
				
					<dd><label><input type="radio" name="servey2" value="1">자극이 없어요</label></dd>
				
					<dd><label><input type="radio" name="servey2" value="1">조금 따끔거려요</label></dd>
				
					<dd><label><input type="radio" name="servey2" value="1">자극이 있어요</label></dd>
				
			
		</dl>
	
		<dl id="servey3" name="servey3">
			<dt>기사님은 친절했나요?</dt>
			
				
					<dd><label><input type="radio" name="servey3" value="1">자극이 없어요</label></dd>
				
					<dd><label><input type="radio" name="servey3" value="1">조금 따끔거려요</label></dd>
				
					<dd><label><input type="radio" name="servey3" value="1">자극이 있어요</label></dd>
				
			
		</dl>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" class="form-control" 
				name="ccomment" placeholder="의견을 남겨주세요"></textarea>
			</td>
		</tr>	
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" class="form-control" 
				name="summary" placeholder="한줄평"></textarea>
			</td>
		</tr>	
	</tbody>
	</table>
	
	<div class="row text-center" style="">
		
		<button type="submit" class="btn btn-secondary">작성하기</button>
	</div>
	</form> 
</div>
    <div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>
</body>
</html>