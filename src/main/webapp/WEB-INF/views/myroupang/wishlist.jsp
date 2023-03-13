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
<link rel="stylesheet" href="../css/common.css" type="text/css">
<style>
.mainconcon{
	background-color: #ffff;
	width: 	auto;
	height: 1000px;
}
.mainconcon2{
	background-color: #ffff;
	width: 980px;
	height: 1000px;
    float: middle;
    margin:auto;
}

.zzim{
	width: 190px;
	margin: 45px 9px;
}
.zz{
	/* display :inline-block; */
	float: left;
	align: middle;
	height: 99px;
}

.witab {
    width: 100%;
    cursor: pointer;
    text-align: center;
    font-size: 16px;
    font-weight: normal;
    display: inline-block;
    line-height: 25px;
    margin-top: 30px;
  
}
.tabs{
    display: block;

}


.left{
    border: 1px solid #e2dfdf;
    color: #0073e9;
    width: 50%;
    border-top: 2px solid #0073e9;
    border-right: 2px solid #0073e9;
    border-bottom: 0px;
    border-left: 2px solid #0073e9;
    background: #ffffff;
}
.right{
    border-left: 0px;
    color: #111;
    border-bottom: 2px solid #0073e9;
    padding-bottom: 11px;
}
.witab a{
padding-top: 13px;
    padding-bottom: 12px;
    background: white;
    float: left;
    width: 49%;
    font-weight: bold;
}
.top{
	background: #fafafa;
/* 	background-color: #eee; */
    position: relative;
    margin: 21px 16px 30px -1px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    padding: 13px 0px;
}

.bottom {
    position: relative;
    margin: 36px 13px 34px -3px;
    border-top: 1px solid #eee;
    padding: 13px 0px;
}


.next-page{
margin-left: 5px;
    display: block;
    float: left;
    width: 30px;
    height: 30px;
    line-height: 10px;
    border: 1px solid #ccc;
    background: #fafafa;
    cursor: default;
}

.prev-page{
display: block;
    float: left;
    width: 30px;
    height: 30px;
    line-height: 10px;
    border: 1px solid #ccc;
    background: #fafafa;
    cursor: default;

}


.n-ico{
display: inline-block;
    width: 6px;
    height: 9px;
    background: url(//img1a.coupangcdn.com/image/wishlist/wishlist_sprite_160810.png) no-repeat;
    overflow: hidden;
    font-size: 0;
    background-position: -100px -60px;
}

.p-ico{
    display: inline-block;
    width: 6px;
    height: 9px;
    background: url(//img1a.coupangcdn.com/image/wishlist/wishlist_sprite_160810.png) no-repeat;
    overflow: hidden;
    font-size: 0;
    background-position: -80px -60px;
}
.selected-delete{
    border: 1px solid #ccc;
    border-radius: 2px;
    color: #0073e9;
    text-align: center;
    background: #fff;
    cursor: pointer;
    display: inline-block;
    margin-left: 10px;
    padding: 5px 8px 4px;
    letter-spacing: -0.5px;
    vertical-align: middle;
    
    font-size: 12px;
    font-weight: normal;
    line-height: 17px;
}
.all-select{
	margin-left:18px;
}
.select-txt{
	 font-size: 12px;
	 font-weight: normal;
	 line-height: 17px;
	 margin-top: 15px; 
}
.p-area{
    float: right;
    margin-right: 440px;
}
.table1{
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
	margin-bottom: 1px solid #eee;
}

.item-info {
    vertical-align: top;
    padding-left: 30px;
}
.delivery-info{
    margin-bottom: 7px;
    height: 13px;
    font-size: 13px;
    font-weight: normal;
    color: #888;
}

.item-name{
    font-size: 14px;
    font-weight: bold;
    color: #111;
}

.price-info{
    margin-top: 10px;
    font-weight: bold;
    font-size: 14px;
    color: #ae0000;
}

.item-delete{
    width: 116px;
    padding: 5px 3px 3px;
    font-size: 12px;
    letter-spacing: -1px;
    border-radius: 2px;
    color: #0073e9;
    text-align: center;
    background: #fff;
    cursor: pointer;
    border: 1px solid #ccc;
    margin-top: 10px;
}
.addcart_btn{
    width: 116px;
    padding: 5px 32px 3px;
    font-size: 12px;
    letter-spacing: -1px;
    border-radius: 2px;
    color: #0073e9;
    text-align: center;
    background: #fff;
    cursor: pointer;
    border: 1px solid #ccc;

} 
.t-edit{
	margin-left: 30px;
	position: absolute;
}

.nowish{
	padding: 140px 0;
    line-height: 26px;
    text-align: center;
    color: #111;
}

.nowish .probutton {
    display: inline-block;
    margin-top: 20px;
    padding: 16px 24px;
    border: 1px solid #0073e9;
    border-radius: 4px;
    font-size: 16px;
    font-weight: bold;
    color: #fff;
    text-align: center;
    background: #0073e9;
}

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
		<a href="/wishBrandList" class="right">브랜드 
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
<%-- <c:forEach items="${wishList is empty}" var="nowish" > --%>
<div colspan="4" class="nowish">
	<strong style="">찜한 상품이 없습니다.</strong>
	<div>상품정보 페이지에서 추가해 보세요.</div>
	<a href="  " class="probutton">오늘의 추천상품 보기 &gt;</a>
</div>
<%-- </c:forEach> --%>


<!-- ------테이블---------- -->

<table>

<%-- <colgroup>
<col width="15%">
<col width="15%">
<col width="45%">
<col width="25%">
</colgroup>
 --%>
	<%-- <c:forEach items="${wishList}" var="wish" varStatus="loop"> --%>
	<%-- 	<tr class="table1">   
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
		</tr> --%>
<%-- 	</c:forEach> --%>
</table>

	
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