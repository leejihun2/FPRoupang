<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charSet="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <meta name="next-head-count" content="2" />
    <meta charSet="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="csrf-token" content="jogZeNtZ-fo2pNeObBtP3lGvZilgWPxm4M2g" />
    <meta charSet="utf-8" />
    <meta name="google-site-verification" content="zaNrGtrOLMjglkziY2IvmL8dOXyCWHGArDHqFazJQVI" />
    <meta http-equiv="x-dns-prefetch-control" content="on" />
    <title>루팡!</title>
    <!-- 쿠팡 타이틀 이미지 -->
    <link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon" />
    <!-- 쿠팡 css폴더에서 링크드 -->
    <link rel="stylesheet" href="./css/common.css" type="text/css" />
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/common.css" type="text/css">
    <link rel="stylesheet" href="./css/ddp.css" type="text/css">
    <link rel="stylesheet" href="./css/list.css" type="text/css">
    <link rel="stylesheet" href="./css/productReview.css" type="text/css">
    <link rel="stylesheet" href="./css/side.css" type="text/css">
    <link rel="stylesheet" href="./css/main.css" type="text/css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>계정정보 찾기</title>
<style>
	body {
	    -webkit-text-size-adjust: none;
	    font-family: dotum,sans-serif;
	    font-size: 12px;
	    line-height: 1.6;
	    color: #969696;
	}
	.member-container {
	    min-height: 900px;
	    padding: 50px;
	    background-color: #fff;
	    border-left: 1px solid #eeeeee;
	    border-right: 1px solid #eeeeee;
	    bottom: 900px;
	}
	.find-account-title {
	    margin: 0 0 10px;
	    font-size: 30px;
	    font-family: "맑은 고딕",malgun gothic,sans-serif;
	    font-weight: bold;
	    color: #333;
	    letter-spacing: -1px;
	}
	.find-account-tab-link { 
	    display: block;
	    width: 170px;
	    padding-top: 10px;
	    padding-bottom: 11px;
	    border-width: 1px 1px 1px;
	    border-style: solid;
	    border-color: #d6d6d6;
	    background-color: #f8f8f8;
	    color: #777;
	    font-size: 14px;
	    text-align: center;
	    text-decoration: none;
	    font-family: "맑은 고딕",malgun gothic,sans-serif;
	    font-weight: bold;
	    color: #333;
	    letter-spacing: -1px;
	}
	.find-account-tab{
	    margin: 0;
	    padding: 0;
	    list-style: none;
	}
	.find-password-table {
	    width: 100%;
	    border-top: 2px solid #969696;
	    border-collapse: collapse;
	}
	tbody {
	    display: table-row-group;
	    vertical-align: middle;
	    border-color: inherit;
	}
	.find-password-table th{
	    background-color: #eef1f8;
	    text-align: left;
	    white-space: nowrap;
	    padding: 14px 30px;
	    border-bottom: 1px solid #ddd;
	    border-left: 1px solid #ddd;
	    width: 111px;
	}
	.find-password-table td{
		padding: 14px 30px;
		border-bottom: 1px solid #ddd;
		border-right: 1px solid #ddd;
		
	}
	.find-password-name-tf {
		width: 200px;
		height: 22px;
    	padding: 2px 5px;
    	line-height: 22px;
    	border: 1px solid #ccc;
    	vertical-align: middle;
	}
	.find-password-email-tf{
		width: 200px;
		height: 22px;
    	padding: 2px 5px;
    	line-height: 22px;
    	border: 1px solid #ccc;
    	vertical-align: middle;
	}
	.find-password-type-box {
	    padding: 20px 30px;
	    border: 1px solid #dcdce4;
	    background-color: #fafbfd;
	}
	.find-password-foot {
	    margin-top: 30px;
	    text-align: center;
	}
	.find-password-selecttype-submit-btn{
		border-color: #0085da;
	    color: #fff;
	    background-color: #0c97e7;
	    background-image: linear-gradient(#41bef9,#0c97e7,#007ed0);
	    box-shadow: inset 0 0 2px #fff;
        padding: 15px 40px 17px;
	    border-radius: 4px;
	    font-size: 22px;
	    line-height: 24px;
	    text-shadow: -1px -1px 0 rgb(0 0 0 / 40%);
	    box-sizing: border-box;
	    border: 1px solid #0085da;
	    text-decoration: none;
	    vertical-align: middle;
	    text-align: center;
	}
	.find-password{
    	padding-top: 60px;
	}
	.find-password-notice{
		display: flex;
		align-content: flex-start;
		flex-direction: column;
		flex-wrap: wrap;
		overflow: auto;
	}
</style>
</head>
<script type="text/javascript">
$(function(){
	$('#submitBtn').click(function(){
		
	  if(username.value==""){
	      alert("이름을 입력하세요.");
	      console.log("이름 미입력");
	      username.focus();
	      return false;
	   }
	   if(email.value==""){
	      alert("이메일을 입력하세요.");
	      console.log("이메일 미입력");
	      email.focus(); 
	      return false;
	   } 
	   $.ajax({
		   type : 'POST',
		   url : '/search_pw.do',
		   data : {
				email:$('#email').val(),name:$('#username').val()
		   },
		   success : function(data){
			   if(data === "no_member_info"){
			       alert("해당 회원 정보가 없습니다.");
		           console.log("해당 회원 정보가 없습니다.");
		           username.focus();
		       } 
			   else {
					$.ajax({
							type : 'POST',
							url : '/search_pw.do',
							data : {
								email : $('#email').val(),
								name : $('#username').val()
							},
							success : function successCall(resp) {
								$('#inputInfo').css("display", "none");
								$('#noticeTemp').css("display", "none");
								$('#submitBtn').css("display", "none");
								$('#tempResult').css("display", "block");
								$('#showLogin').css("display", "block");
							}
						});
					}
				}

			});
		});
	});
	/* $(function sendEmailAjax(){
	
	 }); */
</script>
<body style="background-color: white;">
	<div id="top">
        <%@include file="../top.jsp" %>
    </div>
    <section id="contents" class="contents home">
		<div class="member-container">

			<section id="contents" class="contents">


				<section class="find-account-content">
					<h1 class="find-account-title">계정정보 찾기</h1>
					<nav class="find-account-tab">
					<c:if test="${not empty message}">
					    <div class="alert alert-danger">${requestScope.message}</div>
					</c:if>
						<ul>
						  <li>
			                    <a class="find-account-tab-link " href="/search_id.do">아이디(이메일)찾기</a>
			                </li>
			                <li>
			                    <a class="find-account-tab-link " href="/search_pw.do">비밀번호 찾기</a>
			                </li>
						</ul>
					</nav>
					<section class="find-password">
						<section class="find-password-selecttype">
							<ul class="find-password-notice">
								<li>※ 비밀번호의 경우 <strong>암호화</strong> 저장되어 분실 시 찾아드릴 수 없는 정보
									입니다.
								</li>
								<li>※ <strong>본인 확인</strong>을 통해 비밀번호를 재설정 하실 수 있습니다.
								</li>
							</ul>
							<form style="width: 870px;"> <!-- method="post" action="/search_pw.do"  --> 
								<table class="find-password-table" id="inputInfo" >
									<tr>
										<th scope="row">이름</th>
										<td>
										<input type="text" class="find-password-name-tf" name="name" id="username"> 
										</td>
									</tr>
									<tr>
										<th scope="row">아이디(이메일)</th>
										<td><input
											class="find-password-email-tf ui-autocomplete-input"  name="email" id="email" type="text">
											
											<p style="font-size: 11px;">루팡에 가입된 계정 이메일을 정확히 기입해주시길 바랍니다.</p></td>
									</tr>
								</table>
								<table  id="tempResult" style="display:none;">
									<tr>
										<td>
										 <h3 style="font-weight: bold; margin-left: 160px; text-decoration: underline 2px;"
										 >"고객님의 이메일로 임시비밀번호가 전송되었습니다."</h3>
										</td>
									</tr>
								</table>
								<section class="find-password-type">
									<div class="find-password-type-box" id="noticeTemp">
										<span style="font-size: 12px;">※이메일 주소로 임시비밀번호가 전송됩니다.</span>
									</div>
								</section>
								<div class="find-password-foot" style="display: ;">
									<button type="button" class="find-password-selecttype-submit-btn" id="submitBtn"
									 >비밀번호 찾기
									</button>
								<a href="/myLogin.do" style="position:absolute;left:360px">
									<button class="find-password-selecttype-submit-btn" id="showLogin" style="display:none;">로그인</button>
								</a>
								</div>
							</form>
						</section>
					</section>
				</section>
			</section>
		</div>
		<div id="cartnav">
         <%@include file="../cartnav.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
        </div>
	</section>
	<div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>
</body>
</html>