<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roupang</title>
</head>
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/wishlist.css" type="text/css">
<style>


</style>
<script>
$(document).ready(function() {
	  
    // 체크 박스 모두 체크
    $("#checkAll").click(function() {
        $("input[name=box]:checkbox").each(function() {
            $(this).attr("checked", true);
        });
    });
    
    // 체크 박스 모두 해제
    $("#uncheckAll").click(function() {
        $("input[name=box]:checkbox").each(function() {
            $(this).attr("checked", false);
        });
    });
    // test case
    test1();

});
</script>

<body>
<s:authorize access="isAnonymous()">
		<%@include file="../auth/login.jsp" %>
</s:authorize>
 <s:authorize access="isAuthenticated()">
<%@include file="../top.jsp" %>


<!-- 상품 찜 기능 -->
<%-- <div class="icon" style="float: left; padding-left: 20px; padding-top: 10px;">
   
    <!-- 찜하기 했을 경우 해당 정보 가져오기 -->
    <span id="prd_like_num" style="display: none;">${prdLikeVal.prdct_like_number}</span>
    
    찜하기 기능은 고객(MEMBER 권한)만 이용할 수 있게 설정     
    <sec:authorize access="isAnonymous()">
        로그인 상태가 아니므로 자동으로 로그인 comfirm창이 뜨게 설정
        <i id="prdct_like_dis" class="fa fa-heart-o fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜하기</i>
    </sec:authorize>
    <sec:authorize access="hasAuthority('ADMIN')">
        <i class="fa fa-heart-o fa-2x">찜불가</i>
    </sec:authorize>
    <sec:authorize access="hasAuthority('SELLER')">
        <i class="fa fa-heart-o fa-2x">찜불가</i>    
    </sec:authorize>  
               
    <sec:authorize access="hasAuthority('MEMBER')">
        <c:choose>
            prdct_like 테이블을 가져와 비교후 예전에 찜하기를 했었다면 찜취소로 활성화가 된다
            <c:when test="${(prdLikeVal.prdct_id eq prdct.prdct_id) and (prdLikeVal.mbr_id eq mbr.mbr_id)}">
                <i id="prdct_like_ena" class="fa fa-heart fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜취소</i>
            </c:when>
            prdct_like 테이블을 가져와 비교후 예전에 찜하기를 안했다면(혹은 찜취소를 했었다면) 찜하기로 활성화가 된다
            <c:otherwise>
                <i id="prdct_like_dis" class="fa fa-heart-o fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜하기</i>
            </c:otherwise>
        </c:choose>
    </sec:authorize>
</div> --%>



<div class="mainconcon">
<div class="mainconcon2">
 
<div class="zz">
	<span>
		<img class="zzim" src="../images/wish.png" alt="찜 리스트" />
	</span>
	<span style="line-height:155px; display:inline-block; color:gray;">
		총 ${totalCount}개
	</span>
</div>
<div class="witab">
	<div class="tabs">
	    <a href="/myroupang/wishlist.do" class="left">상품
	    	<span class="number">(${totalCount})</span>
	    </a>
	</div>
</div>

<!-- ------상단 바---------- -->
<div class="top">
	<input type="checkbox" checked="checked" class="all-select">
    <span class="select-txt">
         전체선택 <a href="#" class="selected-delete">삭제</a>
     </span>
</div>


<!-------   찜 상품 없을 때 ----------->
<%-- <c:if test="${wishList is empty}" var="nowish"> --%>
	<div colspan="4" class="nowish">
		<strong style="">찜한 상품이 없습니다.</strong>
		<div>상품정보 페이지에서 추가해 보세요.</div>
		<a href="  " class="probutton">오늘의 추천상품 보기 &gt;</a>
	</div>
<%-- </c:if> --%>


<!-- ------테이블---------- -->

<%-- <c:if test="${wishList}" var="wish" varStatus="loop"> --%>
<table>

<colgroup>
<col width="15%">
<col width="15%">
<col width="45%">
<col width="25%">
</colgroup>
		<tr class="table1">   
			<td style="width:100px;">
				<input type="checkbox" checked="checked" class="all-select">
			</td>
			<td class="item-img" style="width:100px;">
		    	<a href="  " class="item-link">
		    		<img src="890890890890.jpg" 
		    			width="100" height="100" class="img" alt="사진">
		    	</a>
		    </td>
			<td class="item-info" style="width:500px;">
	         	<div class="delivery-info">무료배송</div>
	         	<a href="{상품 링크 가져오기  상품 링크 가져오기  상품 링크 가져오기}" 
         		class="item-name">${wish.t_title} 국내산 달달구리 딸기 [5kg] 산지직송~ 야미~~~~</a>
	       		<div class="price-info">
	       			<span class="item-price">${wish.p_price} 대충24,500원</span>
	       		</div>
	         </td>
	         <td class="t-edit" style="width:150px;">
	        	<div class="add-cart" data-test="SDP">
	       			<div class="add-cart">
	       				<a class="addcart_btn" onclick="">장바구니 담기</a>
	       				<!--장바구니 담기 완료 팝업-->
	       				<div class="add-to-cart-pop"></div>
	       			</div>
	       		</div>
	        	<div class="item-delete" onclick="delete.do">삭제</div>
	        </td>
		</tr>
</table>
<%-- </c:if> --%>

	
	<!-- ------하단 바---------- -->
	<div class="bottom">
		<input type="checkbox" checked="checked" class="all-select">
	    <span class="select-txt">
	         전체선택 <a href="#" class="selected-delete">삭제</a>
	     </span>
	     <div class="p-area">
	        <button type="button" class="prev-page" disabled="">
	        	<span class="p-ico">이전페이지</span>
	        </button>
			<button type="button" class="next-page" disabled="">
				<span class="n-ico">다음페이지</span>
			</button>
	     </div>
	</div>
	    
</div>
</div>

 </s:authorize>
</body>
</html>