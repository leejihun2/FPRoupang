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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
$(function(){
    var chkbox = document.getElementsByName("RowCheck");
    var rowCount = chkbox.length;

    $("input[name='allCheck']").click(function(){
        var chklistArr = $("input[name='RowCheck']");
        for (var i=0; i<chklistArr.length; i++){
        	chklistArr[i].checked = this.checked;
        }
    });
    $("input[name='RowCheck']").click(function(){
        if($("input[name='RowCheck']:checked").length == rowCount){
            $("input[name='allCheck']")[0].checked = true;
        }
        else{
            $("input[name='allCheck']")[0].checked = false;
        }
    });
});

function deleteBtn(){
    var url ="/deletewish";    //controller로 보내고자하는 url
    var vaArr = new Array();
    var wishList = $("input[name='RowCheck']");
    for(var i =0; i<wishList.length; i++){ //선택되어 있으면 배열에 값을 저장한다.
        if(wishList[i].checked){
        	vaArr.push(wishList[i].value);
        }
    }
    if(vaArr.length == 0){
        alert("삭제할 게시물을 선택하세여");
    }
    else{
    	var chk = confirm("정말 삭제?");
        $.ajax({
            url : "/wishlish",
            type: 'POST',
            trandional : true,
            data : {
            	vaArr : vaArr   //보내고자하는 data 변수
            },
            success: function(jdata){
                if(jdata = 1){
                    alert("삭제성공");
                    location.replace("wishlist") //wishlist로 새로고침한다.
                }
                else{
                    alert("삭제실패")
                }
            }
        });
    }
}

</script>

<body>
<s:authorize access="isAnonymous()">
		<%@include file="../auth/login.jsp" %>
</s:authorize>
 <s:authorize access="isAuthenticated()">
<%@include file="../top.jsp" %>


<!-- 상품 찜 기능 -->
    
<%-- <c:choose>
    prdct_like 테이블을 가져와 비교후 예전에 찜하기를 했었다면 찜취소로 활성화가 된다
    <c:when test="${(prdLikeVal.prdct_id eq prdct.prdct_id) and (prdLikeVal.mbr_id eq mbr.mbr_id)}">
        <i id="prdct_like_ena" class="fa fa-heart fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜취소</i>
    </c:when>
    
    prdct_like 테이블을 가져와 비교후 예전에 찜하기를 안했다면(혹은 찜취소를 했었다면) 찜하기로 활성화가 된다
    <c:otherwise>
    
        <i id="prdct_like_dis" class="fa fa-heart-o fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜하기</i>
    </c:otherwise>
</c:choose> --%>



<div class="mainconcon">
<div class="mainconcon2">
 
<div class="zz">
	<span>
		<img class="zzim" src="../images/wish.png" alt="찜 리스트" />
	</span>
	<span style="line-height:155px; display:inline-block; color:gray;">
		총 <%-- ${totalCount} --%>개
	</span>
</div>
<div class="witab">
	<div class="tabs">
	    <a href="/myroupang/wishlist.do" class="left">상품
	    	<span class="number">  </span>  <%-- ${totalCount} --%>
	    </a>
	</div>
</div>

<!-- ------상단 바---------- -->
<div class="top">
	<input type="checkbox" id="allCheck" name="allCheck" class="all-select">
    <span class="select-txt">
	    전체선택 
	    <a class="selected-delete" onclick="deleteBtn();">삭제</a>
     </span>
</div>


<table>

<colgroup>
<col width="15%">
<col width="15%">
<col width="45%">
<col width="25%">
</colgroup>
	<c:choose>
	
	
	<c:when test="${not empty wishList}">
	<c:forEach items="${wishList}" var ="wishList" varStatus= "loop">
		<tr class="table1">   
			<td style="width:100px;">
				<input type="checkbox" name="RowCheck" class="all-select"
					value="${wishList.ti_idx}">
			</td>
			
			<td class="item-img" style="width:100px;">
		    	<a href="" class="item-link">
		    		<img src="890890890890.jpg" 
		    			width="100" height="100" class="img" alt="사진">
		    	</a>
		    </td>
			<td class="item-info" style="width:500px;">
	         	<div class="delivery-info">무료배송</div>
	         		<a href="" 
         		class="item-name">${wishList.ti_title}</a>
	       		<div class="price-info">
	       			<span class="item-price">${wishList.ti_price}</span>
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
	        	<div class="item-delete" >삭제</div>
	        </td>
		</tr>
		</c:forEach>
	</c:when > 
		<c:otherwise>
			<div colspan="4" class="nowish">
				<strong style="">찜한 상품이 없습니다.</strong>
				<div>상품정보 페이지에서 추가해 보세요.</div>
				<a href="  " class="probutton">오늘의 추천상품 보기 &gt;</a>
			</div>
		</c:otherwise> 
	</c:choose>
</table>

	
	<%-- <!-- ------하단 바---------- -->
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
	</div> --%>
	    
</div>
</div>



<%@include file="../copyright.jsp" %>
 </s:authorize>
</body>
</html>