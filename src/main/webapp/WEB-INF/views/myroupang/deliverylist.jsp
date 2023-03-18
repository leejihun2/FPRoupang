<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roupang</title>
</head>

<style>
.addressbook__button--new, .addressbook__button--new * {
cursor: pointer;
}

.__next-wrap * {
box-sizing: border-box;
}

.roll{
background-color: white;
width: 780px;
height: 500px;
margin: 50px;
}

.input{
box-sizing: border-box;

}

new:546:10470.__next-wrap button, .__next-wrap input, .__next-wrap select, .__next-wrap table, .__next-wrap textarea, body .__next-wrap {
font-family: "맑은 고딕",malgun gothic,apple sd gothic neo,"나눔고딕",nanumgothic,"돋움",dotum,sans-serif;
}
new:546:8765.__next-wrap * {
box-sizing: border-box;
}
style.min.ko_KR.css:1:52330.addressbook__button--save, .addressbook__button--save * {
cursor: pointer;
}
.addressbook__button--save {
-webkit-filter: chroma(color=#000);
filter: chroma(color=#000);
overflow: visible;
display: inline-block;
overflow: hidden;
margin: 0;
padding: 0;
border: 0;
border-radius: 0;
-webkit-border-radius: 2px;
-moz-border-radius: 2px;
vertical-align: middle;
box-sizing: content-box;
font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
background-color: #0073e9;
color: #fff;
border: 0;
box-shadow: inset 0 -2px 0 rgba(0,0,0,0.38);
transition: box-shadow .25s ease;
display: block;
text-align: center;
width: 100%;
padding-left: 0;
padding-right: 0;
font-weight: bold;
}

input{

}
.delbox{
height: 157px; 
width: 100%; 
border:1px solid rgb(191 191 191);"
border-radius: 2px;
}

.subutton{
height: 28px; 
width: 8%; 
border:1px solid rgb(191 191 191);"
background-color: #fff;
color: #0073e9;
margin: 1em;
text-align : center;
padding: 6px 1px 1px 1px;
cursor: pointer;

}

.addressbook__button-fixer {
margin: 10px 0;
padding: 1px 1px 1px 1px;
height: 50px; 
width: 100%; 
background-color:white;"
cursor: pointer;
border: 1px solid #ccc;
box-shadow: inset 0 -1px 0 rgb(0 0 0 / 15%);
transition: box-shadow .25s ease;
color: #0073e9;
text-align : center;
text-shadow: none;

}
.pp{
padding: 11px 1px 1px 1px;
cursor: pointer;
}
.maaaa{
margin: 1em;
}
.icon-text-field__frame-box.icon-text-field__frame-box--error {
border-color: #e52528;
z-index: 10;
}
style.min.ko_KR.css:1:10761.icon-text-field .icon-text-field__frame-box {
margin: 0;
}
new:546:8765.__next-wrap * {
box-sizing: border-box;
}

</style>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/c_mylist.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/ddp.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<link rel="stylesheet" href="../css/productReview.css" type="text/css">
<link rel="stylesheet" href="../css/side.css" type="text/css">
<link rel="stylesheet" href="../css/main.css" type="text/css">

<s:authorize access="isAuthenticated()">
   <s:authentication property="principal" var="principal" />

<body>
<%-- <%@include file="../mycoupang/mycoupang.jsp" %> --%>
<%@include file="../myroupang/myroupang.jsp" %>
	
	<div class="roll" >
	
	<!-- <!-- 등록폼에서 post로 전송이 컨트롤러에서 insert 처리를 한다. -->
	<form action="myroupang/deliverylist.do" method="post" id="regform">
		
		<div class="delbox">
			<table class="maaaa">
				<tr>
					<td>
						<input type="text" name="name" value="${dto.name }"
							style="font-weight:bold;"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type=text name="zipcode1" value="[ ${dto.zipcode1} ]"/></td>
							
					<td>
						<input type=text name="adress1" style="margin-left: -100px; width: 408px;" 
							value="${dto.address1 }"/></td>
				</tr>
				<tr>
					<td>
						<input type="text" name="phone_number" readonly value="${dto.phone_number}"/>
					</td>
				</tr>
				<!-- <tr>
					<th>배송 요청사항</th>
					<td><input type="text" name="" value=""/></td>
					
					기본배송지로 선택
				</tr> -->
				
			</table>
		 <div class="subutton" onclick="location.href='adeditAction.do'">
	          수정
   		</div>
		</div>
	</form>
	
	
	<form action="myroupang/deliverylist.do" method="post" id="regform" 
		style="margin-top:18px; margin-bottom: 31px;">
		
		<div class="delbox">
			<table class="maaaa">
				<tr>
					<td>
						<input type="text" name="name" value="${dto.name }"
							style="font-weight:bold;"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type=text name="zipcode2" value="[ ${dto.zipcode2} ]"/></td>
							
					<td>
						<input type=text name="adress2" style="margin-left: -100px; width: 408px;"  
							value="${dto.address2 }"/></td>
				</tr>
				<tr>
					<td>
						<input type="text" name="phone_number" readonly value="${dto.phone_number}"/>
					</td>
				</tr>
				<!-- <tr>
					<th>배송 요청사항</th>
					<td><input type="text" name="" value=""/></td>
					
					기본배송지로 선택
				</tr> -->
			</table>
		 <div class="subutton" onclick="location.href='adregist.do'">
	          수정
   		</div>
		</div>
	</form>
</div>

</div>
</div>

 
 </s:authorize>
 	<div>
		<%@include file="../copyright.jsp"%>
	</div>
</body>
</html>