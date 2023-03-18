<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 마이페이지 css -->
<link rel="stylesheet" href="../css/c_mylist.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>

.icon-text-field__icon-container .icon-text-field__icon-box {
    top: 0;
    left: 0;
    height: 100%;
    border-width: 0 1px 0 0;
 }
 
.roll{
background-color: white;
top: 345px;
right: 259px;
width: 790px;
height: 600px;
}

.icon{
width: 44px;
border: 1px solid #ccc;
background-color: #fafafa;
}

.icon_person{
background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.x1.20180801.png);
    background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.20180801.svg),none;
    background-size: 110px 110px;
    display: inline-block;
    overflow: hidden;
    width: 1px;
    vertical-align: middle;
    white-space: nowrap;
    text-indent: 1px;
    height: 20px;
    padding-left: 19px;
    background-position: -1px -1px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -10px;
    margin-top: -10px;
}


.icon_person{
    width: 45px;
    border: 5px solid #ccc;
    background-color: #fafafa;
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    border-width: 0 1px 0 0;
    margin: 0;
    padding: 0;
}

.iconpp{
    background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.20180801.svg),none;
    background-size: 110px 110px;
    display: inline-block;
    overflow: hidden;
    width: 1px;
    vertical-align: middle;
    white-space: nowrap;
    text-indent: 1px;
    height: 20px;
    padding-left: 19px;
    background-position: -1px -1px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -10px;
    margin-top: -10px;
    float: left;
}


.per{
position: relative;

}


/*  텍스트 박스  */
.textbox111{
cursor: pointer;
transition: background-color .15s ease;
margin: 12px 10px;
padding: 12px 0;
font-family: "맑은 고딕",malgun gothic,apple sd gothic neo,"나눔고딕",nanumgothic,"돋움",dotum,sans-serif;
background-color: #fff;   
border: 1px solid #ccc;
margin-top: 8px;
width: 100%;
padding-left: 0;
padding-right: 0;
margin-left: -1px;
margin-right: -1px;
font-weight: bold;
display: block;
line-height: 20px;
float: left;
}

.savebu{
    cursor: pointer;
    font-family: "맑은 고딕",malgun gothic,apple sd gothic neo,"나눔고딕",nanumgothic,"돋움",dotum,sans-serif;
    display: block;
    text-align: center;
    width: 100%;
    padding-left: 0;
    padding-right: 0;
    margin-left: -1px;
    margin-right: -1px;
    background-color: #0073e9;
    color: white;
    border: 1px solid #ccc;
    box-shadow: inset 0 -1px 0 rgb(0 0 0 / 15%);
    transition: box-shadow .25s ease;
    margin-top: 60px;
}


.savespa{
    cursor: pointer;
    font-size: 16px;
    height: 48px;
    line-height: 47px;
    color: white;
    display: inline-block;
    vertical-align: middle;
}

.delete{
cursor: pointer;
font-family: "맑은 고딕",malgun gothic,apple sd gothic neo,"나눔고딕",nanumgothic,"돋움",dotum,sans-serif;
display: block;
text-align: center;
width: 100%;
padding-left: 0;
padding-right: 0;
margin-left: -1px;
margin-right: -1px;
background-color: #fff;
color: #e52528;
border: 1px solid #ccc;
box-shadow: inset 0 -1px 0 rgb(0 0 0 / 15%);
transition: box-shadow .25s ease;
margin-top: 8px;
}

.delspan{
cursor: pointer;
font-size: 16px;
height: 48px;
line-height: 47px;
color: #e52528;
display: inline-block;
vertical-align: middle;
}





.ing-text {
    display: flex;
    align-items: center;
    padding: 15px 18px;
    font-size: 19px;
    font-weight: 400;
    line-height: 1.5;
    color: var(--bs-body-color);
    text-align: center;
    white-space: nowrap;
    background-color: var(--bs-tertiary-bg);
}

.ing-text1 {
    display: flex;
    align-items: center;
    padding: 40px 18px;
    font-size: 19px;
    font-weight: 400;
    line-height: 1.5;
    color: var(--bs-body-color);
    text-align: center;
    white-space: nowrap;
    background-color: var(--bs-tertiary-bg);
}

.inging {
width: 55px;
height: 55px;
position: left;
background-color: #fafafa;
border: 1px solid #ccc;
float: left; 

}

.ing99 {
float: left; 
width: 730px;
height: 55px;
margin-left: -1px;
margin-bottom: 20px;
background-color: white;
border: 1px solid #ccc;

}

.inging1 {
width: 55px;
height: 111px;
position: left;
background-color: #fafafa;
border: 1px solid #ccc;
float: left; 

}

.ing991 {
float: left; 
width: 730px;
height: 55px;
margin-left: -1px;
margin-bottom: -1px;
background-color: white;
border: 1px solid #ccc;

}

.ing {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    width: 100%;
}


.ing>.fcon, .ing>.form-select {
    position: relative;
    background-color:white;
    flex: 1 1 auto;
    width: 1%;
    min-width: 0;
    border: 2px solid #e9ecef;
    border-radius: 2px;
    margin: 15px 0%;
    
}

</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function zipclick(){
    new daum.Postcode({
        oncomplete: function(data) {
        	 document.getElementById("zipcode1").value = data.zonecode; // 주소 넣기
        	 document.getElementById("address1").value = data.address; // 주소 넣기
             document.querySelector("input[name=address1]").focus(); //상세입력 포커싱
        }
    }).open();
}
</script>

<%@include file="../myroupang/myroupang.jsp" %>

	<h2 style="margin-left:30px; margin:40px;">배송지 추가</h2>
	
	<div class="roll" style="margin:40px;">

	<form method="post">

		<div class="inging">
			<span class="ing-text"><i class="bi bi-person"></i></span>
		</div>
		
		<div>
			<input type="hidden" id="email" name="email" value="${dto.email}"/>
			<!-- ----------------------hidden 이메일 ---------------------- -->
			<input type="text" class="ing99" style="float:left" 
				placeholder="  받는사람" id="name" name="name" readonly value="  ${dto.name}">
		</div>
	
		
		<div class="inging1">
			<span class="ing-text1"><i class="bi bi-geo-alt"></i></span> 
		</div>
		
		<div>
			<input type="text" class="ing991" style="float:left; color:grey;" placeholder="   우편번호" 
				name="zipcode1" onclick="zipclick();" value="${dto.zipcode1}"  id="zipcode1">
		</div>
		
		<div>
			<input type="text" class="ing99" style="float:left; color:grey;" 
				placeholder="   상세주소" id="address1" name="address1" <c:if test="${dto.address1 ne null}">value="${dto.address1}"</c:if> />
		</div>
		
		
		
		<div class="inging">
			<span class="ing-text"><i class="bi bi-phone"></i></span> 
		</div>
		
		<div>
			<input type="text" class="ing99" style="float:left" 
				placeholder="  핸드폰 번호" id="phone_number" name="phone_number" value="  ${dto.phone_number}">
		</div>
		
		
		
	<%-- 	<div class="inging" style="margin-bottom: 65px;">
			<span class="ing-text"><i class="bi bi-chat-left-dots"></i></span> 
		</div>
		
		<div>
			<input type="text" class="ing99" style="float:left" 
				placeholder="  요청사항" name="adReq" value="  ${dto.adReq }">
		</div> --%>
		
	
		<button type="submit" class="savebu">
	        <span class="savespa" style="font-weight: bold; ">저장</span>
	    </button>
	    
	    
	</form>

	    <button class="delete" onclick="location.href='deliverylist.do'">
	        <span class="delspan" style="font-weight: bold;">이전</span>
	    </button>
	
</div>
	

	</div>
	</div>

<div>
	<%@include file="../copyright.jsp"%>
</div>
</body>
</html>