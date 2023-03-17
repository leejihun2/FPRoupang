<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roupang</title>
</head>
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
    <title>roupang</title>
    <!-- 쿠팡 타이틀 이미지 -->
    <link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon" />
    <!-- 쿠팡 css폴더에서 링크드 -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/common.css" type="text/css">
    <link rel="stylesheet" href="../css/ddp.css" type="text/css">
    <link rel="stylesheet" href="../css/list.css" type="text/css">
    <link rel="stylesheet" href="../css/productReview.css" type="text/css">
    <link rel="stylesheet" href="../css/side.css" type="text/css">
    <link rel="stylesheet" href="../css/main.css" type="text/css">
    <!-- 마이페이지 css -->
    <link rel="stylesheet" href="../css/c_mylist.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<!-- id에 입력받은 아이디를 post로 넘겨준다.  -->
<script type="text/javascript">
</script>
<style>

.conconcon{
    background-color: white;
    width: 980px;
    height: 1000px;
}

.concon{
    background-color: white;
    width: 830px;
    height: 850px;
    float: right;
}
</style>

<s:authorize access="isAuthenticated()">
   <s:authentication property="principal" var="principal" />
</s:authorize>

<body>
<%@include file="../top.jsp" %>

<div class="mainconcon">
<div class="mainconcon2">	
<section id="contents" class="contents">
<div class="member-container" >
<section class="usermodify">

<h1 class="titlett">회원정보 수정</h1>
   <h1 class="utitle"></h1>
   <table class="edtable">
    <tbody>
        <tr>
            <th scope="row">아이디(이메일)</th>
                <td>
                   <strong>
                   		<input type="text" id="email" name="email" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
                   			readonly value="${dto.email}"/>
                   </strong>
                  <!--  <button type="button" class="uemail-c-btn">
                       이메일 변경
                   </button> -->
        <tr>
            <th scope="row">이름</th>
            <td>
                <div class="uname">
                	<input type="text" id="name" IsReadOnly="True" value="${dto.name}" style="border:medium;" />
                     <button type="button" class="uname-cname-btn" onclick="location.href='mylistmodify.do'">
                        개명하셨다면?
                    </button> 
                </div>
            </td>
        </tr>
        <tr>
            <th scope="row">생년월일</th>
            <td>
                <div class="uname">
                	<input type="text" id="jumin_num" readonly value="${dto.jumin_num}" style="border:medium;" />
                </div>
            </td>
        </tr>
        <tr>
            <th scope="row">휴대폰 번호</th>
            <td>
                <div class="uphone">
                    <input type="text" id="phone_number" id="oriPhone" readonly value="${dto.phone_number}" style="border:medium;" /> 
                     <button type="button" class="userphone" onclick="location.href='mylistmodify.do'">
                        휴대폰 번호 변경
                    </button>
                </div>
            </td>
        </tr>
 	 	<tr>
	       <th scope="row">비밀번호변경</th>
	           <td>
	               <div class="userpass">
	                   <table class="uinputtb">
	                       <tbody>
	                           <tr>
	                             <!--   <th>현재 비밀번호</th> -->
	                               <td>
	                                   <input type="hidden" value="${dto.password }" class="uct">
	                               </td>
	                           </tr>
	                           <tr>
	                               <td></td>
	                               <td>
	                                   <button type="button" class="pass-sub" onclick="location.href='mylistmodify.do'">
	                                       비밀번호 변경
	                                   </button> 
	                               </td>
	                           </tr>
	                       </tbody>
	                   </table>
	               </div>
	           </td>
        	</tr>
	        <tr>
	            <th scope="row">배송지</th>
	            <td>
	                <form id="myForm" name="myForm">
	            	<strong>${dto.address1}</strong>
	            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            		배송지 주소 관리는 
	                <a href="javascript:;" onclick="location.href='deliverylist.do'">
	                    <strong>[배송지 관리]</strong>
					<input type="hidden" name="sample" id="deliverylist" value="deliverylist.do" />
	                </a>에서 수정, 등록 합니다.
	                
					</form>
	            </td>
	        </tr>
	     <tr>
	        <th scope="row">수신설정</th>
	            <td>
	                <div class="mr mr-sub">
	                    <div class="mlw-ads">
	                        <label class="mlw">
	                        
                            	<c:if test="${dto.marketing_agreement eq 1}" >
		                            <input type="checkbox"  disabled name="marketing_agreement" id="marketing_agreement" checked />	                            	
                            	 </c:if>
                            	<c:if test="${dto.marketing_agreement eq 0}" >
		                            <input type="checkbox" disabled name="marketing_agreement" id="marketing_agreement"/>	                            	
                            	</c:if>
	                            
	                            <span>마케팅 및 이벤트 목적의 개인정보 수집 및 이용</span>
	                             <%--    <span>철회함</span>
	                            </span>
	                            <span class="b6"> 21.12.16</span> --%>
	                            &nbsp;&nbsp;&nbsp;<button type="button" class="userphone" onclick="location.href='mylistmodify.do'">
			                       마케팅 수신 변경
			                    </button>
	                        </label>
	                    
	                    <div class="rdh mt18 marsns"></div>
	                        <label class="mlw  g7">
	                            <input checked type="checkbox" class="box1" id="cbx_chkAll" >
	                            <span>광고성 정보 수신 
	                                <span>철회함</span>
	                            </span>
	                        </label>
	                            (
	                        <label class="g7">
	                            <input readonly checked type="checkbox" class="box1-mail" name="chk"> 
	                                이메일
	                        </label>
	
	                            )
	                    </div>
	                    <div class="ml22">
	                        <section class="texb texb--xs g8">
	                            <button>
	                                <span>전문보기</span>
	                            </button>
	                        </section>
	                    </div>
	                </div>
	            <div class="mr g5 ml22">
	                <div>
	                    *푸시 알림을 받으려면 고객님 기기에서 알림을 허용해주세요.
	                </div>
	                    *위 항목을 모두 동의하셔야 쿠팡의 맞춤평 쇼핑혜택(광고)을 받으실 수 있습니다.
	            </div>
	        </td>
	    </tr>
    </tbody>
    	<tr>
    	</tr>
    </table>
    <div class="usess">
            탈퇴를 원하시는 고객은 하단의 회원정보 수정을 눌러주신 후 회원 탈퇴 버튼을 눌러주세요.
       <!--  <a class="usess-btn" href="./logoutAction.do">
            회원탈퇴
        </a> -->
    </div>
 
    <div class="uf">
       <button class="p-cancel" id="submit" onclick="location.href='mylistmodify.do'">회원정보수정</button>
       <button class="p-cancel" onclick="location.href='orderlist.do'">나가기</button>
   	</div>
	
	</section>
	</div>
	</section> 
	
   	
   	</div>
   	
   	</div>
   	
</body>
</html>