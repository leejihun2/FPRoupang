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
<style>
a{text-decoration:none; color: purple;}
a:hover {text-decoration: underline; color: purple;}
</style>
</head>
<body>
<div class="container">
	<h3 class="text-center">방명록(한줄게시판)</h3>
	
	<!-- 검색어를 입력할 수 있는 <form>태그 추가. 전송방식은 get이고
	action속성은 없으므로 현재 페이지로 폼값이 전송된다. -->
	<div class="text-center">
	<form method="get">
		<select name="searchField">
			<option value="contents">내용</option>
			<option value="name">작성자</option>
		</select>
		<input type="text" name="searchTxt" />
		<input type="submit" value="검색" />
	</form>
	</div>
	
	<!-- 로그인/아웃 및 글쓰기 버튼 -->
	<div class="text-right">
			<!-- EL에서는 영역 설정이 겹치는게 없다면 영역을 지정하는 내장객체를 생략할 수 있다 
			sessionScope지워도됨.
			세션영역에 해당 속성이 있다면, 로그인 상태이므로 '로그아웃'
			버튼을 출력한다. -->
		<s:authorize access="isAuthenticated()">
			<s:authentication property="name" var="name" />
		</s:authorize>
		<c:choose>
			<c:when test="${not empty name }">
				<button class="btn btn-secondary"
					onclick="location.href='/myLogout.do';">
					로그아웃
				</button>
				<button class="btn btn-secondary"
					onclick="location.href='';">
					회원정보수정
				</button>
			</c:when>
			<c:otherwise>
				<!-- 로그아웃 상태일때는 '로그인'버튼을 출력한다. -->
				<button class="btn btn-secondary"
					onclick="location.href='/myLogin.do';">
					로그인
				</button>
				<button class="btn btn-secondary"
					onclick="location.href='';">
					회원가입
				</button>
			</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<button class="btn btn-secondary"
			onclick="location.href='write.do';">
			방명록쓰기
		</button>
	</div>
		<div class="container d-flex justified-content-center">
			<ul class="nav nav-justified" style="width: 1500px;">
				<li class="nav-item">
					<a class="nav-link" href="./contact.do?categoryCode=ALL"> 
					<span class="text">문의내역</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./contact.do?categoryCode=ALL"> 
					<span class="text">자주 묻는 질문</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./contact.do?categoryCode=ALL"> 
					<span class="text">고객의 소리</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./contact.do?categoryCode=ALL"> 
					<span class="text">쿠팡소식</span>
					</a>
				</li>
			</ul>
		</div>
		<div class="container d-flex justified-content-center">
			<ul class="nav nav-justified" style="width: 1500px;">
				<li class="nav-item"><a class="nav-link"
					href="./contact.do?categoryCode=ALL"> <span class="text">젠부</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./contact.do?categoryCode=DELIVERY"> <span class="text">배송문의</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./contact.do?categoryCode=CANCEL"> <span class="text">취소/교환/반품</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./contact.do?categoryCode=REFUND"> <span class="text">환불</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./contact.do?categoryCode=MEMBER"> <span class="text">회원서비스</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./contact.do?categoryCode=CASH"> <span class="text">쿠팡캐시</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./contact.do?categoryCode=MOBILE"> <span class="text">로켓모바일</span>
				</a></li>
			</ul>
		</div>
		<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row" varStatus="roop">		
		<div class="d-grid gap-2">
			<button type="button" class="btn"  data-bs-toggle="collapse" data-bs-target="#a${row.idx}">
		      ${row.title }<br /> </button>
		    <div id="a${row.idx}" class="collapse" style="background-color: rgb(250,250,250);">
		    	${row.contents }
		    </div>
			<!--  수정,삭제버튼 -->
			<div class="media-right">
				<!-- 수정/삭제 버튼은작성자 본인에게만 보여야 하므로 세션영역에 저장된
				아이디와 게시물을 작성한 아이디가 같을때만 버튼을 출력한다. 
				EL에서는 영역을 지정하는 내장객체를 생략할 수 있다. 따라서 sessionScope
				는 삭제해도 무방하다.-->
				<c:if test="${name eq row.email }">
					<button class="btn btn-secondary"
						onclick="location.href='modify.do?idx=${row.idx}';">
						수정
					</button>
					<button class="btn btn-secondary"
						onclick="javascript:deleteRow(${row.idx});">
						삭제
					</button>
				</c:if>
			</div>
		</div>
	</c:forEach>
	
	<!-- 방명록 반복 부분 e -->
	<ul class="pagination justify-content-center">
		<li>${pagingImg }</li>
	</ul>
</div>

</body>
</html>