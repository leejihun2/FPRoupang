<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6076fe794faf6e2a97f29c6ebfadce5&libraries=services"></script>
<style type="text/css">
.modal-dialog{
    overflow: hidden;
    position: fixed;
    top: 0;
    right: 0;
    width: 600px;
    height: 100%;
    margin-top: 0;
    margin-right: 0;
    padding: 0;
    border-left: 1px solid #000;
    background-color: #fff;
    min-height: 100%;
}
.modal-content{
    height: 100%;
}
.modal-body{
    max-height: calc(100vh - 150px);
    overflow-y: auto;
}
/* 바디에 스크롤 막는 방법 */
.not_scroll{
    position: fixed;
    overflow: hidden;
    width: 100%;
    height: 100%
}
.not_scroll .cont {
    position: relative;
    top: 0;
}
.select-button {
    position: relative;
    display: inline-block;
    width: 100%;
    background-color: #fff;
    border-radius: 2px;
    cursor: pointer;
}
.travel-select-item{
	display: block;
    width: 100%;
}
.button-text{
    float: left;
    text-align: left;
    letter-spacing: -.9px;
    overflow: hidden;
    white-space: nowrap;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
}
.select-option{
    position: relative;
    width: 100%;
    border-radius: 2px;
    background-color: #f1faf3;
    padding: 15px;
    box-sizing: border-box;
    margin-bottom: 10px;
}
.selected-option-table{
	width:100%;
}
.product-price{
    text-align: right;
    width:100%;
}
.option-handler{
    text-align: right;
    padding: 15px;
}
.cell-button{
    float: right;
    margin-left: 19px;
    background-color: #346aff;
    color: #fff;
    border: 1px solid transparent;
}
.reservation-total{
	float:right;
}
.total-count .total-price{
    font-size: 17px;
    letter-spacing: -.4px;
}
.total-price {
    font-family: Tahoma,sans-serif;
    font-weight: 700;
    font-size: 28px;
}
.total-count {
    font-weight: 700;
}
.selected_title{
    vertical-align: top;
}
.cashback-area{
		margin-top: 10px;
}
.search-item-cash-back {
    position: relative;
    display: inline-block;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    height: 20px;
    padding: 0 8px 0 8px;
    border-radius: 10px;
    border: 1px solid #ccc;
    background-color: #fff;
    font-size: 12px;
    line-height: 20px;
    color: #333;
}
.selected-option-count {
    float: right;
    vertical-align: top;
}
.travel-spinner button {
    display: block;
    position: relative;
    float: left;
    cursor: pointer;
    outline: none;
    padding: 0;
    border: 0;
}
.spinner-number {
    float: left;
    text-align: center;
    border-left-width: 1px;
    border-left-style: solid;
    border-right-width: 1px;
    border-right-style: solid;
    letter-spacing: -.9px;
    background: #fff;
}
.spinner-number>input[type=text] {
    border: none;
    text-align: center;
    outline: none;
}
</style>
<script>
$(function(){
    $(".bnt_close").on("click", function(){
        $("html, body").removeClass("not_scroll");
    });
    
    
    //구매로 이동하는 함수 호출
    $(".cell-button").click(function(){
    	$("[name=selectCnt]").each(function(){
    		if($(this).val()!=0){

    			var id = $(this).attr("id");
    			var ti_idx = id.substr(id.indexOf("_")+1);
    			$.post(
    				"/cellProduct",
    				{bot_idx : $("[name=bot"+ti_idx+"]").val(),
    				 ti_idx : ti_idx,
    				 top_title : $("#myModalLabel").text(),
    				 main_title : $("[name=sub_title"+ti_idx+"]").text(),
    				 price : $("[name=total"+ti_idx+"]").val(),
    				 amount : $(this).val(),
    				 goods_image : $("#goods_image").val(),
    				 seller_idx : $("#seller_idx").val(),
    				 table_sort: $("#table_sort").val()
    				 },
    				 function(data){
    					 close()
    					 location.href=data;
    				 }
				)
    		}
    	})
    })
});

function close(){
	$(".bnt_close").trigger("click");
}

function cnt(target, mode, ori_price, discount){
	var count = Number($("#select_"+target).val());
	var discount = (100-Number(discount))/100;
	
	if(mode=="plus"){
		if(count < 10){
			$("#select_"+target).val(count+1);
			
			var price = ori_price * (count+1);			
			var dis_price = price*discount;
			var point = dis_price * 0.05;
			$("input[name=total"+target+"]").val(dis_price);
		}else{
			alert("최대 10개까지 구매 가능합니다.");
			return false;
		}
	}else if(mode=="minus"){
		if(count > 0){
			$("#select_"+target).val(count-1);
			
			var price = ori_price * (count-1);
			var dis_price = price*discount;
			var point = dis_price * 0.05;
			
		}else{
			alert("최소 0개이상 구매해야합니다.");
			return false;
		}
	}
	
	$("#ticket_discount"+target).empty().append(comma(price));
	$("#ticket_price"+target).empty().append(comma(dis_price));
	$("#ticket_point"+target).empty().append(comma(Math.round(point)));
	
	
	var sum_cnt = 0;
		
	$("input.selectCnt").each(function(){
		if(!isNaN($(this).val())){
			sum_cnt += parseInt($(this).val());
		}
	})
	
	var sum_price = 0;
	$("input[name*=total]").each(function(){
		sum_price += Number($(this).val());
		
	})
	
	$("#total-count").empty().append(sum_cnt);
	$("#total-price").empty().append(comma(sum_price));
}


function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
</script>
<div class="modal-header">
    <button type="button" class="bnt_close modal-close btn-close" data-dismiss="modal" aria-label="Close">
    </button>
    <div style="margin-left:25px;">
        <h4 class="modal-title" id="myModalLabel">${title}</h4>
    </div>
</div>
<div class="modal-body">
	<input type="hidden" id="goods_image" value="${goods_image }"/>
	<input type="hidden" id="seller_idx" value="${seller_idx}"/>
	<input type="hidden" id="table_sort" value="10"/>
	<ul class="option-selected-options">
		<c:forEach items="${Total_Ticket_info}" var="row" varStatus="loop">
			<li class="select-option" style="font-size: 14px; padding: 12px 20px;">
				<input type="hidden" name="total${row.ti_idx }" value="0"/>
				<input type="hidden" name="bot${row.ti_idx }" value="${row.bot_idx }"/>
				<input type="hidden" name="ti${row.ti_idx }" value="${row.ti_idx }"/>
				<table class="selected-option-table">
					<tbody>
						<tr>
							<td class="selected_left" colspan='2' name="sub_title${row.ti_idx}">${row.ti_title }</td>
						</tr>
						<tr>
							<td class="selected_left">
								<c:choose>
									<c:when test="${row.ti_discount ne 0 }">
				  						<div class="ticket_discount">
				  							<del><span id="ticket_discount${row.ti_idx }">0</span></del>원 ${row.ti_discount }%
				  						</div>
				  						<div class="ticket_price" style="color:rgb(174,0,0);">
				   							<em><b><span id="ticket_price${row.ti_idx }" class="price_ticket${row.ti_idx }">
				   							0
				   							</span></b></em> 원 	
				  						</div>
				  					</c:when>
				  					<c:otherwise>
				  						<div class="ticket_price">
				   							<em><b><span id="ticket_price${row.ti_idx }" class="price_ticket${row.ti_idx }">
				   								0
				   							</span></b></em> 원 	 	
				  						</div>
				  					</c:otherwise>
			  					</c:choose>
			  					<div class="cashback-area">
           							<div class="search-item-cash-back">
	             						<div class="cash-text">
	             							<em>최대 <em><b><span id="ticket_point${row.ti_idx }">
				   								0
				   							</span></b></em> 원 적립</em>
	             						</div>
            						</div>
           						</div>
							</td>
							<td class="vertical-align:top;">
								<div class="selected-option-count">
									<div class="travel-spinner" style="width: 106px; height: 32px; border-radius: 17px; border: 1px solid rgb(52, 106, 255);">
										<button class="spinner-minus" style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-left-radius: 16px; border-bottom-left-radius: 16px;" onclick="cnt(${row.ti_idx},'minus',${row.ti_price },${row.ti_discount });">
											<span style="font-size: 16px;">-</span>
										</button>
										<div class="spinner-number" style="width: 44px; height: 30px; line-height: 30px; font-size: 13px; font-weight: bold; color: rgb(74, 74, 74); border-left-color: rgb(52, 106, 255); border-right-color: rgb(52, 106, 255);">
											<input type="text" class="selectCnt" name="selectCnt" id="select_${row.ti_idx }" readonly value="0" style="width: 42px; height: 30px; line-height: 30px; font-size: 13px; font-weight: bold; color: rgb(74, 74, 74); border-left-color: rgb(52, 106, 255); border-right-color: rgb(52, 106, 255);" />
										</div>
										<button class="spinner-plus" style="width: 30px; height: 30px; background: rgb(255, 255, 255); border-top-right-radius: 16px; border-bottom-right-radius: 16px;" onclick="cnt(${row.ti_idx},'plus',${row.ti_price },${row.ti_discount });">
											<span style="font-size: 16px;">+</span>
										</button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</li>
		</c:forEach>
	</ul>
</div>
<div class="modal-footer">
	<div class="option-handler">
		<button class="cell-button button" style="width: 158px; height: 44px; line-height: 42px; font-size: 16px;">
			구매하기
		</button>
		<div class="reservation-total">
			<div class="reservation-total-price">
				총 <em><span class="total-count" id="total-count">0</span></em>개의 상품
				<em><span class="total-price" id="total-price">0</span></em>원
			</div>
		</div>
	</div>
</div>