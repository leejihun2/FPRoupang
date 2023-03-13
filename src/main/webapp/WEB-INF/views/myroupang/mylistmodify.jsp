<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

function getCheckboxValue(event)  {
    if(event.target.checked)  {
      event.target.value='1';
      console.log(event.target.value);
      
    }
  
}
</script>
<script>
function delClick(){
	if(!confirm("정말 탈퇴하시겠습니까?")){
		
		alert("탈퇴를 취소합니다");
	}else{
		alert("회원을 탈퇴합니다");
	}
    /* var inputPass1 = alert("정말 탈퇴하시겠습니까?"); */
	var email = $("#email").val();
/* 	var password = $("#password").val(); */
	var param = {"email":email}  /* "password":inputPass1 */
	
    $.ajax({            
        async: true,
        type: 'POST',
        data: JSON.stringify(param),
        url: "/memberDelete",
        dataType: "text",
        contentType: "application/json; charset=UTF-8",
        success: function(data) {    
        
        	
            alert("탈퇴가 처리되었습니다. 이용해주셔서 감사합니다");
            location.href="/";
        },
        
        error: function(jqXHR, textStatus, errorThrown) {
            alert(textStatus + " : " + errorThrown);
        }            
    })
    

};
</script>
	
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

<form method="POST" id="submitlist">

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
                	<input type="text" name="name" id="name" value="${dto.name}" style="border:medium; color:grey;" />
                    <!-- <button type="button" class="uname-cname-btn">
                        개명하셨다면?
                    </button> -->
                </div>
            </td>
        </tr>
        <tr>
            <th scope="row">생년월일</th>
            <td>
                <div class="uname">
                	<input type="text" id="jumin_num" name="jumin_num" value="${dto.jumin_num}" style="border:medium; color:grey;" />
                </div>
            </td>
        </tr>
        <tr>
          <th scope="row">휴대폰 번호</th>
            <td>
                <div class="uphone">
                    <input type="text" name="phone_number" id="phone_number" id="oriPhone" value="${dto.phone_number}" style="border:medium; color:grey;"/> 
                   <!--  <button type="button" class="userphone">
                        휴대폰 번호 변경
                    </button> -->
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
                                <th>새 비밀번호</th>
                                <td>
                                    <input type="password" name="password" id="password" class="pass-n-tf">
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호 다시 입력</th>
                                <td>
                                    <input type="password" name="passwordchk" class="newpass ">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <!-- <button type="button" class="pass-sub">
                                        비밀번호 변경
                                    </button> -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
        <th scope="row">수신설정</th>
            <td>
                <div class="mr mr-sub">
                    <div class="mlw-ads">
                        <label class="mlw">
	                            <%-- <input type="checkbox" name="marketing_agreement" 
	                            	id="marketing_agreement" onclick="getCheckboxValue(event)"
	                            		value="${dto.marketing_agreement}"/>         --%>                  	
                        
                        	<c:if test="${dto.marketing_agreement eq 1}" >
	                            <input type="checkbox" name="marketing_agreement" 
	                            onclick="getCheckboxValue(event)" id="marketing_agreement" checked value="1" />	                            	
                           	 </c:if>
                           	<c:if test="${dto.marketing_agreement eq 0}" >
	                            <input type="checkbox" name="marketing_agreement" 
	                            	 onclick="getCheckboxValue(event)" id="marketing_agreement" value="0"/>	                            	
                           	</c:if>
                           	
                           	
                            <span>마케팅 및 이벤트 목적의 개인정보 수집 및 이용</span>
                        </label>
                    <div class="ml22">
                        <span class="b6"> 23.3.15</span>
                        <span>철회함</span>
                    </div>
						<!-- 박스 값 확인용 -->
						<input type="hidden" id='result' />
						
                    <div class="rdh mt18 marsns"></div>
                        <label class="mlw  g7">
                            <input  checked type="checkbox" class="box1" id="cbx_chkAll">
                            <span>광고성 정보 수신</span>
                        </label>
                            (

                        <label class="g7">
                            <input checked type="checkbox" class="box1-mail"  name="chk"> 
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
            탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.
        <a class="usess-btn" onclick="delClick()" >
            회원탈퇴
        </a>
    </div>
 
<!--  href="탈퇴버튼탈퇴버튼" -->
</form>
    <div class="uf">
       <button type="submit" id="submit" form="submitlist" class="p-cancel" onclick="location.href='mylist.do'" >
           수정완료
       </button>
       <button class="p-cancel" onclick="location.href='orderlist.do'">나가기</button>
   	</div>
	
	</section>
	</div>
	</section> 
	
   	
   	</div>
   	</div>
</body>
</html>