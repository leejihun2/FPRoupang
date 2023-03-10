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
<style type="text/css">
.__next-wrap * {
    box-sizing: border-box;
}
.hJRjhk {
    width: 100%;
    height: 840px;
    margin-top: 30px;
    border: 1px solid rgb(230, 230, 230);
}
.jjNgdj {
    float: left;
    width: 340px;
    height: 100%;
    overflow-y: hidden;
    border-right: 1px solid rgb(194, 194, 194);
}
.fDCDqR {
    display: table;
    width: 100%;
    height: 90px;
    border-bottom: 1px solid rgb(238, 238, 238);
}
.cuahcY {
    display: table-cell;
    vertical-align: middle;
    padding-left: 24px;
    font-size: 13px;
}
.cuahcY button {
    height: 40px;
    float: left;
    padding: 10px 14px;
}
.bXaaqE {
    position: relative;
    width: 100%;
    padding: 30px;
    text-align: center;
}
.cvpLIN {
    font-size: 0.9375rem;
    font-weight: bold;
    line-height: 1.13;
    letter-spacing: normal;
    color: rgb(17, 17, 17);
}
.lpuyPp {
    margin-top: 8px;
    font-size: 0.8125rem;
    font-weight: 500;
    line-height: 1.31;
    letter-spacing: normal;
    color: rgb(51, 51, 51);
}
.hwgKvp {
    display: block;
    height: 90px;
    padding-left: 32px;
    width: auto;
    background-color: rgb(255, 255, 255);
    box-shadow: rgb(0 0 0 / 4%) 0px 1px 0px 0px;
    overflow: hidden;
}
.hTYEBQ {
    float: right;
    width: 638px;
    height: 100%;
    background-color: rgb(250, 250, 250);
}
.byqNSx {
    display: block;
    width: auto;
    height: calc(100% - 90px);
    overflow-y: scroll;
    position: relative;
}
.ldyR {
    font-size: 18px;
    letter-spacing: -0.5px;
    text-align: left;
    color: rgb(136, 136, 136);
    margin-left: 12px;
    line-height: 90px;
}
.dRiHfk {
    text-align: center;
    height: 100%;
    border: none;
    border-radius: 2px;
    padding: 8px;
    background-color: rgb(61, 130, 247);
    cursor: pointer;
    overflow: visible;
    box-sizing: border-box;
    color: rgb(255, 255, 255);
    font-weight: bold;
    width: inherit;
}
.dbIcid {
    display: table-cell;
    vertical-align: middle;
    padding-right: 24px;
    text-align: right;
}
.eoBoAw {
    line-height: 26px;
    font-size: 13px;
    color: rgb(0, 81, 245);
    cursor: pointer;
}
</style>
</head>
<body style="background-color: #ffffff">
    <%@include file="../top.jsp" %>
 <div id="top">
    </div>
<div class="container">
	<%@include file="../category.jsp" %>
		<div class="sc-1pgb0b5-1 hJRjhk">
			<div class="sc-r1vows-0 jjNgdj">
				<div class="sc-1bmxn32-0 fDCDqR">
					<div class="sc-1bmxn32-1 cuahcY">
						<button class="sc-1vm0jpx-4 dRiHfk">
							<svg width="20" height="20" focusable="false" viewBox="0 0 20 20"
								aria-hidden="true" role="presentation" style="fill: #ffffff">
								<g fill="#ffffff" fill-rule="evenodd">
								<path fill-rule="nonzero"
									d="M.42 9.17v8.81a.83.83 0 001.3.69l2.86-2h5.84c1.23 0 2.3-.67 2.88-1.67h-1.02a2.5 2.5 0 01-1.86.83h-6.1l-3.07 2.15V9.17c0-1.1.7-2.02 1.67-2.36v-.87a3.33 3.33 0 00-2.5 3.23z"></path>
								<path fill-rule="nonzero"
									d="M19.58 15.03a.83.83 0 01-1.32.67L15 13.33H8.75a4.17 4.17 0 01-4.17-4.16V5.83c0-2.3 1.87-4.16 4.17-4.16h6.67c2.3 0 4.16 1.86 4.16 4.16v9.2zm-.83-9.2c0-1.84-1.5-3.33-3.33-3.33H8.75a3.33 3.33 0 00-3.33 3.33v3.34c0 1.84 1.49 3.33 3.33 3.33h6.52l3.48 2.53v-9.2z"></path>
								<path
									d="M8.75 6.67a.83.83 0 110 1.66.83.83 0 010-1.66zm3.33 0a.83.83 0 110 1.66.83.83 0 010-1.66zm3.34 0a.83.83 0 110 1.66.83.83 0 010-1.66z"></path></g></svg>
							<span class="sc-1bmxn32-2 dnSKbZ">채팅 상담하기</span>
						</button>
					</div>
					<div class="sc-1bmxn32-3 dbIcid">
						<a class="sc-1bmxn32-4 eoBoAw">편집</a>
					</div>
				</div>
				<div class="sc-r1vows-1 hQgEoq">
				
					<div class="sc-1udhlwu-0 ufAFw">
						<c:forEach items="${lists }" var="row">		
							<div class="media">
									<div class="media-body">
										<p>${row.title }</p>
										<h4 class="media-heading">(${row.email })</h4>
										<p>${row.contents }</p>
									</div>	  
								<!--  수정,삭제버튼 -->
								<div class="media-right">
									<!-- 수정/삭제 버튼은작성자 본인에게만 보여야 하므로 세션영역에 저장된
									아이디와 게시물을 작성한 아이디가 같을때만 버튼을 출력한다. 
									EL에서는 영역을 지정하는 내장객체를 생략할 수 있다. 따라서 sessionScope
									는 삭제해도 무방하다.-->
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="sc-1udhlwu-0 ufAFw">
					</div>
					<div class="sc-10d7xix-0 bXaaqE">
						<p class="sc-10d7xix-1 cvpLIN">최근 문의내역을 모두 확인하셨습니다.</p>
						<p class="sc-10d7xix-2 lpuyPp">이전 문의내역이 필요하시면 고객센터에 문의해주세요.</p>
					</div>
				</div>
			</div>
			<div class="sc-4clfj5-0 hTYEBQ">
				<div class="sc-4clfj5-1 hwgKvp">
					<span class="sc-4clfj5-5 ldyR">고객센터 문의</span>
				</div>
				<div class="sc-4clfj5-6 byqNSx"></div>
			</div>
		</div>
		</section>
</div>
    <div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>
</body>
</html>