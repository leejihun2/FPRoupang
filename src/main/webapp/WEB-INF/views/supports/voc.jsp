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
<body>
<script type="text/javascript">
function writeValidate(f)
{
	if(f.name.value==""){
		alert("작성자 이름을 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.contents.focus(); 
		return false;
	} 
}
</script>
<div id="top">
    <%@include file="../top.jsp" %>
    </div>
<div class="container" style="background: white;">
	
	<%@include file="../category.jsp" %>
	<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
	<form name="writeFrm" method="post" 
		onsubmit="return writeValidate(this);"
		action="<c:url value="/supports/vocAction.do" />" >
		
	<table class="table table-bordered">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
	<s:authorize access="isAuthenticated()">
					<s:authentication property="name" var="name" />
	</s:authorize>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">작성자</th>
			<td>
				<!-- 쓰기 페이지는 로그인 후 접근할 수 있으므로 세션
				영역에 저장한 DTO객체에서 이름을 가져와 삽입한다. -->
				<input type="text" class="form-control" 
					style="width:130px;" name="name"
						value="${name }" />
			</td>
		</tr>
		<tr>
			<td>
				<select name="title" value="배송관련문의">
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
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<textarea rows="10" class="form-control" 
				name="contents" placeholder="의견을 남겨주세요"></textarea>
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