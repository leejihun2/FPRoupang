<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>일반상품등록</title>
<style type="text/css">
.info_th{
	width: 200px;
}
.date_form{
	width: 150px;
	border-radius: 7px;
	border:solid 1px #dee2e6;
}
.insert_input{
	width: 300px;
}
.td_none{
	border: none;
}
</style>
<script>
/* 동적 셀렉트박스 생성 */
function setSelectBox(obj){
   var sub_idx = obj.value;
   var level = parseInt((obj.id).substr(-1,1));
   var next_level = '#'+(obj.id).slice(0,-1)+(level+1);
   var max_level = 3;
   
   $("#product_info_detail").css("display","none");
   $("#product_info").css("display","none");
   $(".product_intro").css("display","none");
   $('#detail_list').css("display","none");
   
   if(sub_idx!=''){
	   if(level <= 1){
	         $('#product_list').empty();
	         if(level == 1){
	            for(var now = level ; now<=max_level ; now++){
	               $('#'+(obj.id).slice(0,-1)+(now+1)).attr("disabled",true).find("option").remove().end()
	               .append("<option value=''>=분류=</option>");
	            }
	         }
	         service_list($(obj).val());
	         $.post(
	            "/category_list_p"
	            ,{level : $(obj).attr('id').substr(-1,1), sub_idx : $(obj).val(), company_name : $("#company_name").val()}
	            ,function(data){
	               $(next_level).attr("disabled",false).find("option").remove().end()
	                  .append("<option value=''>=분류=</option>");
	               $.each(data, function(i){
	                  $(next_level).append("<option value='"+data[i].idx+"'>"+data[i].title+"</option>");
	               });
	            }
	         );
	    }
		else if(level == 2) {
			$('#product_list').empty();
			if ($('#category1').val() >= 1 && $('#category1').val() <= 8) {
				$.post(
					"/category_list_p"
					,{level : $(obj).attr('id').substr(-1,1), sub_idx : $(obj).val(), company_name : $("#company_name").val()}
					,function(data){
						$.each(data, function(i){
							var tabletd='<tr>';
							tabletd+='<td class="td_none"><input type="checkbox" name="product_select" id="product_select'+ data[i].idx +'" value="'+data[i].idx+'"/>'
							tabletd+='<td class="td_none"><img src="/uploads/'+ data[i].p_title_image +'" />'
							tabletd+='<td class="td_none"><a href="javascript:;" onclick="simple_click('+data[i].idx+')">'+data[i].title+'</a></td>'
							tabletd+='</tr>'
							
							$('#product_list').append(tabletd);
						});
					}
				);
			}
		}
	}
    else{
	    $('#product_list').empty();
	    document.getElementById("form").reset();
	    for(var now = level ; now<=max_level ; now++){
	       $('#'+(obj.id).slice(0,-1)+(now+1)).attr("disabled",true).find("option").remove().end()
	       .append("<option value=''>=분류=</option>");
	    }
	}
   
}

function simple_click(obj){
   const checkboxes = document.getElementsByName('product_select');
   checkboxes.forEach((checkbox) => {checkbox.checked = false;})
   let chk = document.getElementById("product_select"+obj);
   chk.checked = true;
   $(".product_intro").css("display","block");
   $('#detail_list').css("display","block");
   $('#product_info_list').empty();
   $('.product_intro').empty();
   $("#product_info_detail").css("display","block");
   $("#product_info").css("display","block");
   
 	
  	// 상품 상세 정보 출력
  	if($("#category1").val() >= 1 && $('#category1').val() <= 8) {
	    $.post(
	      "/productDetailInfo"
	      ,{bot_idx : obj}
	      ,function(data){
	         $.each(data, function(i){
	            var tabletd='<tr>';
	            tabletd+='<td><input type="checkbox" name="product_info_select" value="'+data[i].pi_idx+'"/>'
	            tabletd+='<td><a href="/product_edit?product_idx='+data[i].pi_idx+'">'+data[i].pi_title+'</a><br/>'
	               +'로켓배송여부 '+data[i].pi_isrocket+'<br/>'
	               +'배송비 '+data[i].pi_delifee+'원<br/>'
	            tabletd+='<td>'+data[i].pi_price+'</td>'
	            tabletd+='<td>'+data[i].pi_discount+'</td>'
	            tabletd+='</tr>'
	            $('#product_info_list').append(tabletd);
	         });
	      }
	      );
	  		// 상품 정보 출력
	       $.post(
	         "/productInfo"
	         ,{bot_idx : obj}
	         ,function(data){
	            var table = '<table class="table">';
	            if((data.p_image1)!=null){
	               table += '<tr><th class="info_th">서브이미지</th><td><img style="width:300px;" src="/uploads/'+data.p_image1+'"/>'
	               if((data.p_image2)!=null){
	                  table += '<img style="width:300px;" src="/uploads/'+data.p_image2+'" />'
	                  if((data.p_image3)!=null){
	                     table += '<img style="width:300px;" src="/uploads/'+data.p_image3+'" />'
	                     if((data.p_image4)!=null){
	                        table += '<img style="width:300px;" src="/uploads/'+data.p_image4+'" />'
	                     }
	                  }
	               }
	               table += '</td></tr>'
	            }
	            if (data.p_production != null) {
		            table += '<tr><th class="info_th">*제조사(판매사)</th><td><input class="form-control insert_input" type="text" id="p_production" name="p_production"/>'+data.p_production+'</td></tr>'
	            }
	            if (data.p_pro_country != null) {
	            	table += '<tr><th class="info_th">*제조국</th><td><input class="form-control insert_input" type="text" id="p_pro_country" name="p_pro_country"/>'+data.p_pro_country+'</td></tr>'
	            }
	            if (data.p_pro_date != null) {
	            	table += '<tr><th class="info_th">*제조일자</th><td><input type="date" class="date_form" id="p_pro_date" name="p_pro_date"/>'+data.p_pro_date+'<td></tr>'
	            }
	            if (data.p_callnum != null) {
	            	table += '<tr><th class="info_th">소비자관련 상담번호</th><td><input class="form-control insert_input" type="text" id="p_callnum" name="p_callnum"/>'+data.p_callnum+'</td></tr>'
	            }
	            if (data.p_useway != null) {
	            	table += '<tr><th class="info_th">사용방법</th><td><textarea id="p_useway" name="p_useway"/></textarea>'+data.p_useway+'</td></tr>'
	            }
	            if (data.p_size != null) {
	            	table += '<tr><th class="info_th">크기</th><td><input class="form-control insert_input" type="text" id="p_size" name="p_size"/>'+data.p_size+'</td></tr>'
	            }
	            if (data.p_as_info != null) {
	            	table += '<tr><th class="info_th">A/S관련정보</th><td><input class="form-control insert_input" type="text" class="date_form" id="p_as_info" name="p_as_info"/>'+data.p_as_info+'</td></tr>'
	            }
	            if (data.p_composition != null) {
	            	table += '<tr><th class="info_th">구성</th><td><input class="form-control insert_input" type="text" id="p_composition" name="p_composition"/>'+data.p_composition+'</td></tr>'
	            }
	            if (data.p_caution != null) {
	            	table += '<tr><th class="info_th">주의사항</th><td><textarea id="p_caution" name="p_caution"/></textarea>'+data.p_caution+'</td></tr>'
	            }
	            if (data.p_assurance != null) {
	            	table += '<tr><th class="info_th">품질보증사항</th><td><textarea id="p_assurance" name="p_assurance"/></textarea>'+data.p_assurance+'</td></tr>'
	            }
	            if (data.p_cup_num != null) {
	            	table += '<tr><th class="info_th">*쿠팡상품번호</th><td><input class="form-control insert_input" id="p_cup_num" name="p_cup_num"/>'+data.p_cup_num+'</td></tr>'
	            }
	            $('#product_intro').append(table);
	         }
    	);
  	}
}
//버튼 클릭시 발생 이벤트 정리
function btnclick(obj){
   var mode = $(obj).val();
   if(mode=="all"){
      $("#product_info_detail").css("display","block");
      $("#product_info").css("display","block");
      document.getElementById("form").reset();
   }
   else if(mode=="info"){
      $("#product_info_detail").css("display","block");
      $("#product_info").css("display","none");
      document.getElementById("form").reset();
   }
   else if(mode=="edit"){
      var value;
      $("[name=product_select]").each(function(idx){
         if($(this).is(":checked")==true){
            value = $(this).val()
         }
      });
      if($("#category1").val() >= 1 && $("#category1").val() <= 8){
         var ajaxOp = {
            url : "/editProduct?value="+value,
            type : "POST",
            dataType : "HTML",
            cache : false
         };
      }
      $.ajax(ajaxOp).done(function(data){
         $('#row').children().remove();
         $('#row').html(data);
      });
    }
   	else{
        return false;
    }
}

$(function() {
   /* 상품 등록 클릭시 이벤트 처리 */
    $("#submit").click(function(){
    	
	    if($("#pi_title").val()==""){
	       alert("상품상세명을 입력하세요");
	       $("#pi_title").focus();
	       return false;
	    }
	    if($("#pi_price").val()==""){
	       alert("판매가격을 입력하세요.");
	       $("#pi_price").focus();
	       return false;
	    }
	    if($("#pi_amount").val()==""){
	  	  alert("판매수량을 입력하세요.");
	  	  $("#pi_amount").focus();
	  	  return false;
	    }
	    if($("#pi_discount").val()==""){
	       alert("할인율을 입력하세요.");
	       $("#pi_discount").focus();
	       return false;
	    }
	    if($("#p_cup_num").val()!=""){
		   	if($("#p_title").val()==""){
			   alert("상세 상품명은 필수로 등록해야합니다.");
			   return false;
			} 
			if($("#main_image").val()==""){
			   alert("메인 이미지는 필수로 등록해야합니다.");
			   return false;
			}
			var sub_image=$("#sub_image")
			if(sub_image[0].files.length>=5){
			   alert("서브 이미지는 최대 4개까지 등록가능합니다.");
			   return false;
			}
			if($("#p_production").val()==""){
			   alert("제조사를 입력하세요");
			   $("#p_production").focus();
			   return false;
			}
			if($("#p_pro_country").val()==""){
			   alert("제조국을 입력하세요");
			   $("#p_pro_date").focus();
			   return false;
			}
			if($("#p_pro_date").val()==""){
			   alert("제조일자를 입력하세요");
			   $("#p_pro_date").focus();
			   return false;
			}
			if($("#p_duetime").val()==""){
			   alert("소비기한을 입력하세요");
			   $("#p_duetime").focus();
			   return false;
			}
			form.action="/productInsertAction?mid_category="+$("#category2").val()+"&value=0";
	    }
	    else {
		    var value;
		    $("[name=product_select]").each(function(idx){
		       if($(this).is(":checked")==true){
		          value = $(this).val()
		          console.log(value);
		       }
		    });
		    form.action="/productInsertAction?value="+value;
	    }
	});
	 /* 상세상품 삭제 실행시 발생 */
 	$("#info_delete").click(function(){
    	var delete_val1=[];
    	$("[name=product_info_select]").each(function(idx){
	       if($(this).is(":checked")==true){
	          delete_val1.push($(this).val());
	       }
   		});
	    if(delete_val1.length==0){
	       alert("삭제할 상품이 하나 이상 선택해주세요.");
	       return false;
	    }
	    if(confirm("선택한 "+delete_val1.length+"개의 상품을 삭제하시겠습니까?")){
	          form.action="/detail_delete_product?value="+delete_val1+"&company_name="+$("#company_name").val();
	    }
 	});
 	/* 전체 상품 삭제 발생시 이벤트 처리 */
 	$("#delete_all").click(function(){
    	var delete_val2=[];
	    $("[name=product_select]").each(function(idx){
	       if($(this).is(":checked")==true){
	          delete_val2.push($(this).val());
	       }
	    });
	    if(delete_val2.length==0){
	       alert("삭제할 상품을 하나 이상 선택해주세요.");
	       return false;
	    }
	    if(confirm("선택한 "+delete_val2.length+"개의 상품을 삭제하시겠습니까?")){
	    	if($("#category1").val() != null) {
	          form_product.action="/all_delete_product?value="+delete_val2+"&company_name="+$("#company_name").val();
	    	}
	    }
	});
});
	/* 이미지 선택시 미리보기 출력 (메인 이미지) 건들지 말자아 */
	function setThumbnail(event) {
	   var reader = new FileReader();
	   reader.onload = function(event) {
	      var img = document.createElement("img");
	      img.setAttribute("src", event.target.result);
	      img.setAttribute("style", "width:200px; heigth:200px;");
	      document.getElementById("title_image").innerHTML='';
	      document.querySelector("div#title_image").appendChild(img);          
	   };
	   
	   reader.readAsDataURL(event.target.files[0]);
	}

	function setSubThumnail(tag, event){
		var sel_files=[];
		var files = event.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var tag_id = tag.id;
		var div_id = tag_id.substr(0,tag_id.indexOf("image"));
		
		if(!(files.length>=5)){
		   document.getElementById(div_id+"thumbnail").innerHTML='';
		   filesArr.forEach(function(e){
		      sel_files.push(e);
		      var reader = new FileReader();
		      reader.onload = function(f){
		         var img = "<img style='width:200px; heigth:200px;' src=\"" + f.target.result + "\" /><br/><br/>";
		         $("#"+div_id+"thumbnail").append(img);
		      }
		      reader.readAsDataURL(e);
		   });
		}
		else{
		   alert("최대 4개의 이미지까지 등록 가능합니다.");
		}
	}
	
	function service_list(e) {
	   document.getElementById("briefinfo").innerHTML='';
	   document.getElementById("detailinfo").innerHTML='';
	   
	   var briefinfo='<tr><th class="info_th">*상품명</th><td><input class="form-control insert_input" type="text" id="p_title" name="p_title"/></td><tr><tr><th class="info_th">* 메인이미지</th><td><div id="title_image"></div><input class="form-control insert_input" type="file" name="p_title_image" id="title_image" onchange="setThumbnail(event)" /></td></tr><tr><th class="info_th">서브이미지</th><td><div id="sub_thumbnail"></div><input class="form-control insert_input" type="file" id="sub_image" name="sub_image" onchange="setSubThumnail(this,event)" multiple/></td></tr>';
	   
	   briefinfo += '<tr><th class="info_th">*제조사</th><td><input class="form-control insert_input" type="text" id="p_production" name="p_production"/></td></tr>'
        
	   briefinfo += '<tr><th class="info_th">*제조국</th><td><input class="form-control insert_input" type="text" id="p_pro_country" name="p_pro_country"/></td></tr>'
           
	   briefinfo += '<tr><th class="info_th">*제조일자</th><td><input type="date" class="date_form" id="p_pro_date" name="p_pro_date"/><td></tr>'
	   briefinfo += '<tr><th class="info_th">*소비기한</th><td><input type="date" class="date_form" id="p_duetime" name="p_duetime"/><td></tr>'
           
	   briefinfo += '<tr><th class="info_th">소비자관련 상담번호</th><td><input class="form-control insert_input" type="text" id="p_callnum" name="p_callnum"/></td></tr>'
          
	   briefinfo += '<tr><th class="info_th">사용방법</th><td><textarea id="p_useway" name="p_useway"/></textarea></td></tr>'
       briefinfo += '<tr><th class="info_th">크기</th><td><input class="form-control insert_input" type="text" id="p_size" name="p_size"/></td></tr>'
           
	   briefinfo += '<tr><th class="info_th">A/S관련정보</th><td><input class="form-control insert_input" type="text" class="date_form" id="p_as_info" name="p_as_info"/></td></tr>'
	   briefinfo += '<tr><th class="info_th">구성</th><td><input class="form-control insert_input" type="text" id="p_composition" name="p_composition"/></td></tr>'
	   briefinfo += '<tr><th class="info_th">주의사항</th><td><textarea id="p_caution" name="p_caution"/></textarea></td></tr>'
	   briefinfo += '<tr><th class="info_th">품질보증사항</th><td><textarea id="p_assurance" name="p_assurance"/></textarea></td></tr>'
	   briefinfo += '<tr><th class="info_th">*쿠팡상품번호</th><td><input class="form-control insert_input" id="p_cup_num" name="p_cup_num"/></td></tr>'
         
	   var detailinfo ='<tr><th class="info_th">* 상품상세명</th><td><input class="form-control" type="text" id="pi_title" name="pi_title" /></td></tr>';
	   
	   detailinfo += '<tr><th class="info_th">*가격</th><td><input class="form-control insert_input" type="text" id="pi_price" name="pi_price" placeholder="0"/></td></tr>'
	   detailinfo += '<tr><th class="info_th">*판매수량</th><td><input class="form-control insert_input" type="text" id="pi_amount" name="pi_amount" placeholder="0"/></td></tr>'
	   detailinfo += '<tr><th class="info_th">*할인율</th><td><input class="form-control insert_input" type="text" id="pi_discount" name="pi_discount" placeholder="0"/></td></tr>'
	   detailinfo += '<tr><th class="info_th" onchange="changeValue();")>*제품구분</th><td><label><input type="radio" id="pi_isrocket" name="pi_isrocket" value="1" checked/>로켓상품</label><label><input type="radio" id="pi_isnormal" name="pi_isrocket" value="0"/>일반상품</label></td></tr>'
	   detailinfo += '<tr id="pi_delicom_container"><th class="info_th">*택배유형</th><td onclick="updateDeliFee();"><label><input type="radio" id="pi_delicom_rk" name="pi_delicom" value="0" checked/>로켓배송</label>'
	   detailinfo += '<tr"><th class="info_th">*택배비</th><td><input type="text" id="pi_delifee" name="pi_delifee" value="0" readonly/>'
	   
	   $('#briefinfo').append(briefinfo);
	   $('#detailinfo').append(detailinfo);
	}
	
	
</script>
</head>
<body>
	<div class="container-fluid">
    	<div class="row" id="row">
            <div class="col-1 mt-2 ms-3" style="width: 110px;">
               <select class="form-select" style="width: 100px;"
                  name="top_category" id="category1" onchange="setSelectBox(this)">
                  <option value="">분류</option>
                  <c:forEach items="${cate }" var="top" varStatus="loop">
                     <option value="${top.idx }">${top.title }</option>
                  </c:forEach>
               </select>
            </div>
            <div class="col-1 mt-2" style="width: 110px;">
               <select class="form-select" style="width: 100px;"
                  name="mid_category" id="category2" onchange="setSelectBox(this)" disabled>
                  <option value="">분류</option>
               </select>
            </div>
         <!-- 소분류 테이블에 등록되어 있는 것을 보여주는 list 부분 -->
         <form method="POST" id=""form_product"" class="mt-3">
	         <div class="col-12" id="simple_list">
	            <table class="table" style="border:1px;">
	                  <colgroup>
	                     <col width="11%" />
	                     <col width="40%" />
	                     <col width="40%" />
	                  </colgroup>
	                  <thead>
	                     <tr>
	                        <th> 선택 </th>
	                        <th> 이미지 </th>
	                        <th> 상품명 </th>
	                     </tr>
	                  </thead>
	                  <tbody id="product_list" style="border:none"></tbody>
	               </table>
	               <button class="btn btn-primary" type="button" value="all" onclick="btnclick(this)">상품추가</button>
	               <button class="btn btn-primary" type="button" value="edit" onclick="btnclick(this)">상품수정</button>
	               <button class="btn btn-primary" type="submit" id="delete_all" onclick="btnclick(this)">상품삭제</button>
	         </div>
	         <div class="product_intro col-12" style="display:none;"></div>
	      </form>
	      <form method="POST" id="form" enctype="multipart/form-data">
	      <input type="text" class="form-control ms-3 mb-3" style="width: 200px;"
			               id="company_name" name="company_name" value=""/>
	         <div class="col-12 ms-3" id="detail_list" style="width:100%; display:none; padding: 0px;">
	            <table style="border:1px;">
	               <colgroup>
	                  <col width="15%" />
	                  <col width="*%" />
	                  <col width="20%" />
	                  <col width="15%" />
	               </colgroup>
	               <thead>
	                  <tr>
	                     <th>선택</th>
	                     <th>상품상세명</th>
	                     <th>요금</th>
	                     <th>할인율</th>
	                  </tr>
	               </thead>
	               <tbody id="product_info_list">
	               </tbody>
	            </table>
	            <button class="btn btn-primary mt-2" type="button" value="info" onclick="btnclick(this)">상품상세추가</button>
	            <button class="btn btn-primary mt-2" type="submit" id="info_delete" onclick="btnclick(this)">상품삭제</button>
	         </div>
	         <div class="col-5" id="product_info" style="display:none;">
	            <table class="table" id="briefinfo">
	            </table>
	         </div>
	         <div class="col-5" id="product_info_detail" style="display:none; margin: 0px">
	            <table id="detailinfo">
	            </table>
	            <button class="btn btn-primary" type="submit" id="submit">등록하기</button>
	            <button class="btn btn-primary" type="reset">다시작성</button>
	         </div>
	      </form>
      </div>
	</div>
</body>
</html>