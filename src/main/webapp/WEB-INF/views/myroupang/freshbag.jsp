<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roupang</title>
<link rel="stylesheet" href="../css/common.css" type="text/css">
</head>
<style>

.roll{
	background-color: white;
	width: 780px;
	margin: 40px; 
}

.fretop{
	padding: 30px;
	margin-left: 167px;
	width: 430px;
	
}
.moveImage{
	padding: 30px;
	margin-left: 32px;
	width:700px;
	
}
.fretop12{
	width: 800px;

}



/*슬라이드에 직접 적용되는 스타일*/

[name="slide"] { display: none; } /*클래스 slidebox 내 name="slide"부분 */
.slidebox { 
    max-width: 1000px; 
    width: 100%;
    margin: 0 auto;    
}
.slidebox img { /*자신의 넓이 이상으로 커지지 않도록 함, 반응형 사용 가능*/
    max-width: 100%;
}
.slidebox .slidelist {
    white-space: nowrap;
    font-size:0; /*빈공간을 없애기 위함*/
    overflow: hidden; /*초과해서 이미지가 나올 경우 나오지 않게 함*/
}
.slidebox .slideitem {
    position: relative;
    display: inline-block; /*세로 정렬을 가운데 맞추기 위함*/
    vertical-align: middle;
    width: 100%;
    transition: all .100s; /*자연스러운 전환 속성을 위함*/
}
.slidebox .slideitem label {
    position: absolute; /*자율 배치하는 값*/
    z-index: 1; /*기본값 1*/
    top: 50%;
    transform: translateY(-50%); /*가운데 지정*/
    padding: 20px;
    border-radius: 50%; /*둥근 버튼 모양*/
    cursor: pointer; /*마우스가 올라가면 커서가 포인터로 바뀌도록 함*/
}
[id="slide01"]:checked ~ .slidelist .slideitem {transform:translateX(0); animation:slide01 17s infinite}
 
@keyframes slide01 {
    0% {left: 0%;} /*첫 번째 스크린*/
    50% {left: -90%;} /*두 번째로 위치 이동, 두 번쨰 스크린*/
    100% {left:0%} /*첫 번째 스크린 이동*/
}
</style>
<body>
<s:authorize access="isAnonymous()">
		<%@include file="../auth/login.jsp" %>
</s:authorize>
 <s:authorize access="isAuthenticated()">
<div class="con">
<%@include file="../myroupang/myroupang.jsp" %>

  
<div class="roll" >	
	<div class="Top">
		<img src="../images/freshTop.png" alt="상단 사진" class="fretop"/>
	</div>
	

	
	<div class="slidebox">
	    <input type="radio" name="slide" id="slide01" checked>
	    <ul class="slidelist">
	        <li class="slideitem">
	            <div>
	                <label for="slide02" class="right"></label>
					<img src="../images/fre1.png" alt="사진 디테일" class="moveImage"/>
					<img src="../images/fre2.png" alt="사진 디테일" class="moveImage"/>
	            </div>
	        </li>
	    </ul>
	</div>

	
	<div class="Top">
		<img src="../images/freshDetail.png" alt="사진 디테일" class="fretop12"/>
	</div>




</div>
</div>

</div>
</div>
</div>
</s:authorize>
<div>
	<%@include file="../copyright.jsp" %>
</div>
</body>
</html>