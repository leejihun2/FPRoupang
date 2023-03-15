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
<link rel="stylesheet" href="../css/roll.css" type="text/css">
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
<script type="text/javascript">
	$(document).ready(function(){
		$('.div2').each(function(index){
			$(this).attr('div2-index', index);
		}).click(function(){
			var index = $(this).attr('div2-index');
			$('.div2[menu-index=' + index + ']').addClass('clicked');
			$('.div2[menu-index!=' + index + ']').removeClass('clicked');
		});

	});
</script>
</head>
<body style="background-color: #ffffff">
<%@include file="../myroupang/myroupang.jsp"%>
<div class="roll" >
<h1 class="qwer">리뷰수정</h1>

		<div class="div1">
			<div class="div2" onclick="location.href='review.do'">리뷰 작성</div>
			<div class="div3" onclick="location.href='reviewList.do'">작성한
				리뷰</div>
		</div>
<div class="container">
	<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
	<form name="writeFrm" method="post" 
		onsubmit="return writeValidate(this);"
		action="<c:url value="/review/reviewModifyAction.do" />" >
		<input type="hidden" name="idx" value="${dto.idx }" />
	<table class="table table-bordered">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
	
		
		<div class="mb-3" name="star_rate" id="star_rates"> 
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span> *필쥬
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
		
		<div class="mb-3" name="star_servey1" id="star_rates">
			<fieldset>
				<span class="text-bold">가격은 괜찮나요</span> 
				<input type="radio" name="star_servey1" value="5" id="star_servey1_1" name="star_servey1_1">
					<label for="star_servey1_1">★</label> 
				<input type="radio" name="star_servey1" value="4" id="star_servey1_2" name="star_servey1_2">
					<label for="star_servey1_2">★</label>
				<input type="radio" name="star_servey1" value="3" id="star_servey1_3" name="star_servey1_3">
					<label for="star_servey1_3">★</label> 
				<input type="radio" name="star_servey1" value="2" id="star_servey1_4" name="star_servey1_4">
					<label for="star_servey1_4">★</label> 
				<input type="radio" name="star_servey1" value="1" id="star_servey1_5" name="star_servey1_5">
					<label for="star_servey1_5">★</label>
			</fieldset>
		</div>
		
		<div class="mb-3" name="star_servey2" id="star_rates">
			<fieldset>
				<span class="text-bold">서비스는 어떤가요</span> 
				<input type="radio" name="star_servey2" value="5" id="star_servey2_1" name="star_servey2_1">
					<label for="star_servey2_1">★</label> 
				<input type="radio" name="star_servey2" value="4" id="star_servey2_2" name="star_servey2_2">
					<label for="star_servey2_2">★</label>
				<input type="radio" name="star_servey2" value="3" id="star_servey2_3" name="star_servey2_3">
					<label for="star_servey2_3">★</label> 
				<input type="radio" name="star_servey2" value="2" id="star_servey2_4" name="star_servey2_4">
					<label for="star_servey2_4">★</label> 
				<input type="radio" name="star_servey2" value="1" id="star_servey2_5" name="star_servey2_5">
					<label for="star_servey2_5">★</label>
			</fieldset>
		</div>
		<div class="mb-3" name="star_servey3" id="star_rates">
			<fieldset>
				<span class="text-bold">만족스럽나요</span> 
				<input type="radio" name="star_servey3" value="5" id="star_servey3_1" name="star_servey3_1">
					<label for="star_servey3_1">★</label> 
				<input type="radio" name="star_servey3" value="4" id="star_servey3_2" name="star_servey3_2">
					<label for="star_servey3_2">★</label>
				<input type="radio" name="star_servey3" value="3" id="star_servey3_3" name="star_servey3_3">
					<label for="star_servey3_3">★</label> 
				<input type="radio" name="star_servey3" value="2" id="star_servey3_4" name="star_servey3_4">
					<label for="star_servey3_4">★</label> 
				<input type="radio" name="star_servey3" value="1" id="star_servey3_5" name="star_servey3_5">
					<label for="star_servey3_5">★</label>
			</fieldset>
		</div>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" class="form-control" 
				name="review" placeholder="의견을 남겨주세요">${dto.review }</textarea>
			</td>
		</tr>	
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="1" class="form-control" 
				name="summary" placeholder="한줄평">${dto.summary }</textarea>
			</td>
		</tr>	
	</tbody>
	</table>
	
	<div class="row text-center" style="">
		
		<button type="submit" class="btn btn-secondary">작성하기</button>
	</div>
	</form> 
</div>
</div>
   <%--  <div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div> --%>
</body>
</html>