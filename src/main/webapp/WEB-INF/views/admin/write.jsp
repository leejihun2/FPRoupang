<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<script type="text/javascript">
function writeValidate(f)
{
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.contents.focus(); 
		return false;
	} 
}
</script>
<div class="container">
	<form name="writeFrm" method="post" 
		onsubmit="return writeValidate(this);"
		action="<c:url value="/admin/writeSupportsAction.do" />" >
	<table class="table table-bordered">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<select 
				name="contact" value="배송관련문의">
				<option value="faq">자주묻는 질문</option>
				<option value="notice">쿠팡 소식</option>
			</select>
		</tr>	
		<tr>
			<select 
				name="categorycode" value="배송관련문의">
				<option value="DELIVERY">배송문의</option>
				<option value="CANCEL">취소/교환/반품</option>
				<option value="REFUND">환불</option>
				<option value="MEMBER">회원서비스</option>
				<option value="CASH">쿠팡캐시</option>
				<option value="MOBILE">로켓모바일</option>
				<option value="NOTICE">공지</option>
				<option value="EVENT">이벤트</option>
				<option value="AIRTICKET">항공권</option>
			</select>
		</tr>	
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">제목</th>
			<td>
				<textarea rows="1" class="form-control" 
				name="title" placeholder="제목"></textarea>
			</td>
		</tr>	
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" class="form-control" 
				name="contents" placeholder="내용"></textarea>
			</td>
		</tr>	
	</tbody>
	</table>
	
	<div class="row text-center" style="">
		<!-- 각종 버튼 부분 -->
		
		<button type="submit" class="btn btn-secondary">작성하기</button>
		<button type="reset" class="btn btn-secondary">Reset</button>
		<button type="button" class="btn btn-secondary" 
			onclick="location.href='/admin/index.do';">리스트보기</button>
	</div>
	</form> 
</div>
</body>
</html>