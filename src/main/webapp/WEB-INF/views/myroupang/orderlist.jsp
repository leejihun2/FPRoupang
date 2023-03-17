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
<link rel="stylesheet" href="../css/common.css" type="text/css">
<style>
td, th {
	text-align: center;
	/* center checkbox horizontally */
	vertical-align: middle;
	/* center checkbox vertically */
}

.banner-image{
	width: 100px;
    height: 50px;
}
button{
	margin-right: 10px;
	float: right;
}
.roll{
background-color: white;
width: 780px;
height: 800px;
margin: 40px;

}
.tetete{
margin:20px;
}
.UxXQy {
margin: 1px 1px 1px 1px;
padding: 1px 1px 1px 1px;
background-color: rgb(243, 243, 243);
bottom: 0;

}
/* bottom */
.bboIjZ {font-size: 0.6875rem;color: rgb(136, 136, 136);}
/* bottom */
.fWZpfp {display: block;margin-top: 20px;font-size: 12px;}
/* bottom */
.lllist {
margin-top: 0px;margin-right: 0px;margin-bottom: 16px;margin-left: 0px;}

.list9 {
font-weight: bold;
font-size: 26px;
font-stretch: normal;
font-style: normal;
line-height: 1.4;
letter-spacing: -0.5px;
color: rgb(15, 15, 15);
}   


.dKPECc {
width: 20px;
margin-right: 5px;
display: flex;
-webkit-box-pack: center;
justify-content: center;
-webkit-box-align: center;
align-items: center;
cursor: pointer;
fill: #346AFF;
}

.conten99{height: 200px;}

.bRxIbf{position:relative;height:45px;display:block;width:100%;box-sizing:border-box;border-collapse:collapse;}

.ebMaZa{
	display:inline-block;
	vertical-align:middle;
	cursor:pointer;
	position:relative;
	height:38px;
	width:24.4%;
	text-align:center;font-size:16px;
	font-weight:bold;border-style:solid;
	border-width:1px;border-color:#d7d7d7;
	background-color:#f9f9f9;
	border-bottom:solid 2px #3d82f7;
	padding-top:10px;
	}
	
.jekmPy{
	border:solid 2px #3d82f7;
	background-color:#fff;
	border-bottom-color:transparent;
	color:#3d82f7;}

.se-btn{
	width: 20px;
    margin-left: 341px;
    margin-top: 10px;
    cursor: pointer;
}


.list3{
	width:411px; 
	height:36px;
	margin-bottom: 40px;
	
}

.s-box {
	width: 370px;
	height: 36px;
	border: solid 1px rgb(204, 204, 204);
	border-radius: 4px;
	margin-bottom: 24px;
	padding: 1px;
	font-size: 14px;
}

</style>

<style>
.sel-btn{
background-color: blue;
background-size: 32px;
margin: 1px -9px 15px -4px;
padding: 11px;
border-radius: 5px;
border-color: 3px grey;
color: white;
box-shadow: 10px 10px 10px;
align-content: right;
cursor: pointer;
hover:
}

.sel-btn:hover{
	background-color: orange;
	blur: 20px;
	
}

</style>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/myroupang.css">
<script>
$(function(){
	$("#release").click(function(){
		console.log(this.value);
		var release_val=this.value;
	
		if(confirm("해당 주문을 출고하시겠습니까?")){
				location.href="/orderRelease.do?value="+release_val;
			
		}
     

	});
	$("#completed").click(function(){
		console.log(this.value);
		var completed_val=this.value;
		
		if(confirm("해당 주문을 배송완료 처리하시겠습니까?")){
				location.href="/ordercompleted.do?value="+completed_val;	
		}
     

	});
});  



</script>

<body>
<s:authorize access="isAnonymous()">
	<%@include file="../auth/login.jsp" %>
</s:authorize>

<s:authorize access="isAuthenticated()">


<%@include file="../myroupang/myroupang.jsp" %>

<div class="roll" >


	<div class="lllist">
		<span class="list9">주문목록</span>
	</div>
	
	<!-- <div class="list3">
		<img class="se-btn" src="../images/searchbtn.png" 
			onclick="location.href:'';" style="position:absolute;" alt="검색버튼"  />
		<input type="text" placeholder="  주문한 상품을 검색할 수 있어요!" class="s-box"/>
	</div> -->

 
	<div class="list45">
		<div class="bRxIbf">
		<div class="ebMaZa jekmPy">
			전체</div><div class="ebMaZa">
			배송상품</div><div class="ebMaZa">
			여행상품</div><div class="ebMaZa">
			티켓상품
			</div>
		</div>
	</div>
	
				<div class="container-fluid">
					
				

                    <!-- DataTales Example -->
                   
                            <div class="table-responsive">
                            	<form id="block" method="post">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>주문번호</th>
	                                            <s:authorize access="hasRole('admin')">
	                                            <th>판매자</th>
	                                            <th>구매자</th>
	                                            </s:authorize>
	                                            <th>상품이미지</th>	                                            
	                                            <th>상품</th>
	                                            <th>주문날짜</th>
	                                            <th>배송여부</th>
	                                            <s:authorize access="hasRole('seller')">
	                                            <th>상세보기</th>
	                                            <th>전체선택</th>
	                                            </s:authorize>
	                                        </tr>
	                                    </thead>
	                                     <tbody id="list">
	                                		<c:forEach items="${lists }" var="row"  begin="0" end="30" varStatus="loop">
		                                            	
		                                        <tr>
		                                            <td>${row.order_num }
		                                            <input type="hidden" name="status" value="${row.order_item_idx }"/>
		                                            </td>
		                                            <s:authorize access="hasRole('admin')">
		                                           	<td>${row.company_name }</td>
		                                           	<td>${row.buyer_name }</td>
		                                           	</s:authorize>
		                                            <td><a><img src="/uploads/${row.goods_image }" class="banner-image"/></a></td>
													<td>${row.top_title }</td>
													<td>${row.order_date }</td>
													<td id="st">
													<input type="hidden" name="status" value="${row.order_status }"/>
													<c:if test="${row.order_status eq '0'}">
													미출발
													</c:if>
													<c:if test="${row.order_status eq '1'}">
													배송중
													</c:if>
													<c:if test="${row.order_status eq '2'}">
													배송완료
													</c:if>
													</td>
													<s:authorize access="hasRole('seller')">
													<td><a href="orderView.do?order_item_idx=${row.order_item_idx }">상세보기</a>
													</td>
													<td>
													<div class="button">	
					                                	<c:if test="${row.order_status eq '0'}">
															<button class="btn btn-outline-secondary" id="release" name="public1" value="${row.idx }" type="button">출고</button>
														</c:if>                  		
															<c:if test="${row.order_status eq '1'}">
														<button class="btn btn-outline-secondary" id="completed" name="public1" value="${row.idx }" type="button">배송완료</button>
														</c:if>
														<c:if test="${row.order_status eq '2'}">
																	완료
														</c:if>
													</div> 
													</td>
													</s:authorize>
		                                        </tr>
                                    		</c:forEach>
                                         </tbody>
	                                </table>	      
	                               
	                                
	                               
												
                                </form>	        
                               <a href="/admin/index.do">관리 홈으로가기</a>                       

                            </div>
                        
		
				</div>
				<!-- /.container-fluid -->
			</div>


	<div class="conten99">
	
	<!-- 주문 목록 loop 주문 목록 loop 주문 목록 loop 주문 목록 loop 주문 목록 loop--> 
	
	</div>


<!-- footer -->
	<div class="box17 UxXQy">
		<div class="tetete">
			<div class="sc-178zqvr-12 fQDbaW">
				<b><i class="sc-178zqvr-13 bQUraS"></i>
					<span class="i18n-wrapper">
					<span style="color: #e52628;">취소/반품/교환 신청</span>전 확인해주세요!</span>
				</b>
			</div>
			<div class="sc-178zqvr-14 bboIjZ">
				<strong class="sc-178zqvr-15 fWZpfp">취소</strong>
			</div>
			<div class="sc-178zqvr-14 bboIjZ"> - <span class="i18n-wrapper">여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,<br>
				<span style="margin-left:7px;">취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 처리결과를 문자로 안내해드립니다.
				</span>
				</span>(<!-- -->당일 접수 기준, 마감시간 오후 4시<!-- -->)</div>
			<div class="sc-178zqvr-14 bboIjZ">- <!-- -->문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다.</div>
			<div class="sc-178zqvr-14 bboIjZ"><strong class="sc-178zqvr-15 fWZpfp">환불</strong></div>
			<div class="sc-178zqvr-14 bboIjZ">- <!-- -->상품 수령 후 7일 이내 신청하여 주세요.</div>
			<div class="sc-178zqvr-14 bboIjZ">-<!-- --> <!-- -->상품이 출고된 이후에는 배송 완료 후, 환불 상품을 회수합니다.</div>
			<div class="sc-178zqvr-14 bboIjZ">-<!-- --> <!-- -->설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 신청이 가능합니다.<!-- --> 
				<a href="/ssr/desktop/contact/inquiry" target="_blank" class="sc-178zqvr-16 jgRggD">1:1문의하기</a></div>
			<div class="sc-178zqvr-14 bboIjZ"><strong class="sc-178zqvr-15 fWZpfp">교환</strong></div>
			<div class="sc-178zqvr-14 bboIjZ">-<!-- --> <!-- -->상품의 교환 신청은 고객센터로 문의하여 주세요.
				<a href="/ssr/desktop/contact/inquiry" target="_blank" class="sc-178zqvr-16 jgRggD">1:1문의하기</a>
			</div>
		</div>
	</div>
<!-- footer end-->



</div>
</div>
</div>
</s:authorize>
<div>
	<%@include file="../copyright.jsp" %>
</div>
</body>
</html>