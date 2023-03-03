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
<style>
#star_rate fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#star_rate fieldset legend{
    text-align: right;
}
#star_rate input[type=radio]{
    display: none;
}
#star_rate label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#star_rate label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#star_rate label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#star_rate input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>
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
		<div class="mb-3" name="star_rate" id="star_rate">
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span> 
				<input type="radio" name="reviewStar" value="5" id="star_rate1">
					<label for="star_rate1">★</label> 
				<input type="radio" name="reviewStar" value="4" id="star_rate2">
					<label for="star_rate2">★</label>
				<input type="radio" name="reviewStar" value="3" id="star_rate3">
					<label for="star_rate3">★</label> 
				<input type="radio" name="reviewStar" value="2" id="star_rate4">
					<label for="star_rate4">★</label> 
				<input type="radio" name="reviewStar" value="1" id="star_rate5">
					<label for="star_rate5">★</label>
			</fieldset>
		</div>
		<dl name="myform" id="myform">
			<dt>상품의 품질은 어떤가요</dt>
			
				
					<dd><label><input type="radio" name="group_22" class="_survey-answer" data-question="세척력은 어느 정도인가요?" data-question-id="22" data-answer-id="59" data-answer="예상보다 좋아요">예상보다 좋아요</label></dd>
				
					<dd><label><input type="radio" name="group_22" class="_survey-answer" data-question="세척력은 어느 정도인가요?" data-question-id="22" data-answer-id="60" data-answer="설명과 비슷해요">설명과 비슷해요</label></dd>
				
					<dd><label><input type="radio" name="group_22" class="_survey-answer" data-question="세척력은 어느 정도인가요?" data-question-id="22" data-answer-id="61" data-answer="예상보다 떨어져요">예상보다 떨어져요</label></dd>
				
			
		</dl>
	
		<dl class="radio-survey">
			<dt>배송은 어떠셨나요?</dt>
			
				
					<dd><label><input type="radio" name="group_18" class="_survey-answer" data-question="사용 시 피부로 전해지는 자극은 어느 정도였나요?" data-question-id="18" data-answer-id="38" data-answer="자극이 없어요">자극이 없어요</label></dd>
				
					<dd><label><input type="radio" name="group_18" class="_survey-answer" data-question="사용 시 피부로 전해지는 자극은 어느 정도였나요?" data-question-id="18" data-answer-id="39" data-answer="조금 따끔거려요">조금 따끔거려요</label></dd>
				
					<dd><label><input type="radio" name="group_18" class="_survey-answer" data-question="사용 시 피부로 전해지는 자극은 어느 정도였나요?" data-question-id="18" data-answer-id="40" data-answer="자극이 있어요">자극이 있어요</label></dd>
				
			
		</dl>
	
		<dl class="radio-survey">
			<dt>기사님은 친절했나요?</dt>
			
				
					<dd><label><input type="radio" name="group_24" class="_survey-answer" data-question="사용해보시니 느껴지는 촉촉함은 어땠나요? " data-question-id="24" data-answer-id="62" data-answer="기대보다 촉촉해요">기대보다 촉촉해요</label></dd>
				
					<dd><label><input type="radio" name="group_24" class="_survey-answer" data-question="사용해보시니 느껴지는 촉촉함은 어땠나요? " data-question-id="24" data-answer-id="63" data-answer="설명과 비슷해요">설명과 비슷해요</label></dd>
				
					<dd><label><input type="radio" name="group_24" class="_survey-answer" data-question="사용해보시니 느껴지는 촉촉함은 어땠나요? " data-question-id="24" data-answer-id="64" data-answer="기대보다 건조해요">기대보다 건조해요</label></dd>
				
			
		</dl>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" class="form-control" 
				name="ccomment" placeholder="의견을 남겨주세요"></textarea>
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