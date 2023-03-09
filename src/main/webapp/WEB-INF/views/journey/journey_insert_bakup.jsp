<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>여행(숙소)등록</title>
<style type="text/css">
.info_th{
	width: 150px;
}
.date_form{
	width: 150px;
	border-radius: 7px;
	border:solid 1px #dee2e6;
}
.insert_input{
	width: 400px;
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
   console.log(level);
   var next_level = '#'+(obj.id).slice(0,-1)+(level+1);

   var max_level = 3;
   
   $("#journey_info_detail").css("display","none");
   $("#journey_info").css("display","none");
   $(".journey_intro").css("display","none");
   $('#detail_list').css("display","none");
   if(sub_idx!=''){
      if(level <= 1){
         
         if(level == 1){
            for(var now = level ; now<=max_level ; now++){
               $('#'+(obj.id).slice(0,-1)+(now+1)).attr("disabled",true).find("option").remove().end()
               .append("<option value=''>분류</option>");
            }
         }
         $.post(
            "/category_list.j"
            ,{level : $(obj).attr('id').substr(-1,1), sub_idx : $(obj).val(), company_name : $("#company_name").val()}
            ,function(data){
               $(next_level).attr("disabled",false).find("option").remove().end()
                  .append("<option value=''>분류</option>");
               $.each(data, function(i){
                  $(next_level).append("<option value='"+data[i].idx+"'>"+data[i].title+"</option>");
               });
               if(level==2){
                  $(next_level).append("<option value='0'>신규등록</option>");
               }
            }
         );
      }
      else if(level == 2){
          $('#journey_list').empty();
          $.post(
             "/category_list.j"
             ,{level : $(obj).attr('id').substr(-1,1), sub_idx : $(obj).val(), company_name : $("#company_name").val()}
             ,function(data){
                $.each(data, function(i){
                   var tabletd='<tr>';
                   tabletd+='<td class="td_none"><input type="checkbox" name="journey_select" id="journey_select'+data[i].idx+'" value="'+data[i].idx+'"/>'
                   tabletd+='<td class="td_none"><img style="width:300px;" src="/uploads/'+data[i].j_title_image+'" />'
                   tabletd+='<td class="td_none"><a href="javascript:;" onclick="simple_click('+data[i].idx+')">'+data[i].title+'</a></td>'
                   tabletd+='</tr>'
                   
                   $('#journey_list').append(tabletd);
                });
             }
          );
          
       }
   }else{
   /* --분류--를 선택할 경우 초기화 */
      $('#journey_list').empty();
      document.getElementById("form").reset();
      for(var now = level ; now<=max_level ; now++){
         $('#'+(obj.id).slice(0,-1)+(now+1)).attr("disabled",true).find("option").remove().end()
         .append("<option value=''>=분류=</option>");
      }
   }
}
function simple_click(obj){
    const checkboxes = document.getElementsByName('journey_select');
    checkboxes.forEach((checkbox) => {checkbox.checked = false;})
    let chk = document.getElementById("journey_select"+obj);
    chk.checked = true;
    $(".journey_intro").css("display","block");
    $('#detail_list').css("display","block");
    $('#journey_info_list').empty();
    $('.journey_intro').empty();
    $("#journey_info_detail").css("display","none");
    $("#journey_info").css("display","none");
    
    //티켓 상세 정보 출력
    $.post(
       "/journeyDetailInfo"
       ,{bot_idx : obj}
       ,function(data){
          $.each(data, function(i){
             var tabletd='<tr>';
             tabletd+='<td><input type="checkbox" name="journey_info_select" value="'+data[i].ji_idx+'"/>'
             tabletd+='<td><a href="/journey_edit?product_idx='+data[i].ji_idx+'">'+data[i].ji_title+'</a><br/>'
                +'유효기간'+data[i].ji_duetime1+'~'+data[i].ji_duetime2+'<br/>'
                
             if(data[i].ji_intro==null){
                tabletd+='</td>'
             }else{
                tabletd+=data[i].ji_intro+'</td>'
             }
                
             tabletd+='<td>'+data[i].ji_price+'</td>'
             tabletd+='<td>'+data[i].ji_discount+'</td>'
             tabletd+='</tr>'
             
             $('#journey_info_list').append(tabletd);
          });
       }
    );
  //티켓 정보 출력
    $.post(
       "/journeyInfo"
       ,{bot_idx : obj}
       ,function(data){
          var list = data.j_conservice
          var table = '<table class="table">';
          if((data.j_image1)!=null){
             table += '<tr><th class="info_th">서브이미지</th><td><img style="width:300px;"src="/uploads/'+data.j_image1+'" />'
             if((data.t_image2)!=null){
                table += '<img style="width:300px;"src="/uploads/'+data.j_image2+'" />'
                if((data.t_image3)!=null){
                   table += '<img style="width:300px;"src="/uploads/'+data.j_image3+'" />'
                   if((data.t_image4)!=null){
                      table += '<img style="width:300px;"src="/uploads/'+data.j_image4+'" />'
                   }
                }
             }
             table += '</td></tr>'
          }
          table += '<tr><th class="info_th">소개글</th><td>'+data.j_intro+'</td></tr>'
          if(data.notice!=null){
             table += '<tr><th class="info_th">알려드리는말</th><td>'+data.notice+'</td></tr>'
          }
          if(data.j_conservice!=null){
             table += '<tr><th class="info_th">편의서비스</th><td>'
             table += list
             table += '</td></tr>'
          }
             
          var confacility = data.j_confacility;
          if(data.j_confacility!=null){
             table += '<tr><th class="info_th">편의시설</th><td>'
             table += confacility
             table += '</td></tr>'
          }
             
          
          if(data.traffic_info != null){
             table += '<tr><th class="info_th">교통 정보</th><td>'+data.traffic_info+'</td></tr>'
          }
          if(data.j_notice != null){
             table += '<tr><th>유의사항</th><td>'+data.j_notice+'</td></tr>'
          }
          table += '<tr><th class="info_th">예약안내</th><td>'+data.j_booking+'</td></tr>'
          table += '<tr><th class="info_th">취소수수료안내</th><td>'+data.j_cancelfee+'</td></tr>'
          table += '<tr><th class="info_th">취소유의사항안내</th><td>'+data.j_cancelnoti+'</td></tr>'
          table += '</table>'
          $('.journey_intro').append(table);
       }
    );
 }
//버튼 클릭시 발생 이벤트 정리
function btnclick(obj){
   var mode = $(obj).val();
   if(mode=="all"){
      $("#journey_info_detail").css("display","block");
      $("#journey_info").css("display","block");
      document.getElementById("form").reset();
   }else if(mode=="info"){
      $("#journey_info_detail").css("display","block");
      $("#journey_info").css("display","none");
      document.getElementById("form").reset();
   }else if(mode=="edit"){
      var value;
      $("[name=journey_select]").each(function(idx){
         if($(this).is(":checked")==true){
            value = $(this).val()
         }
      });
      var ajaxOp = {
         url : "/editJourney?value="+value,
         type : "POST",
         dataType : "HTML",
         cache : false
      };
      
      $.ajax(ajaxOp).done(function(data){
         $('#row').children().remove();
         $('#row').html(data);
      });
   }else{
      return false;
   }
}

$(function(){
   /* 상품 등록 클릭시 이벤트 처리 */
   $("#submit").click(function(){
      
      if($("#ji_title").val()==""){
         alert("상품상세명을 입력하세요");
         $("#ji_title").focus();
         return false;
      }
      if($("#ji_duetime1").val()=="" || $("ji_duetime2").val()=="" ){
         alert("유효기간이 입력되지 않았습니다.");
         return false;
      }
      if($("#ji_price").val()==""){
         alert("가격을 입력하세요");
         $("#ji_price").focus();
         return false;
      }
      var sub_ji_image=$("#ji_image")
      if(sub_ji_image[0].files.length>=5){
         alert("객실 이미지는 최대 4개까지 등록가능합니다.");
         return false;
      }
      if($("#j_intro").val()!=""){
         if($("#main_image").val()==""){
            alert("메인 이미지는 필수로 등록해야합니다.");
            return false;
         }
         var sub_image=$("#j_image")
         if(sub_image[0].files.length>=5){
            alert("서브 이미지는 최대 4개까지 등록가능합니다.");
            return false;
         }
         if($("#bot_title").val()==""){
            alert("상품명를 입력하세요");
            $("#bot_title").focus();
            return false;
         }
         if($("#traffic_info").val()==""){
            alert("교통정보 안내를 입력하세요");
            $("#traffic_info").focus();
            return false;
         }
         if($("#loging_policy").val()==""){
            alert("숙소 정책 안내를 입력하세요");
            $("#loging_policy").focus();
            return false;
         }
         if($("#check_io").val()==""){
            alert("체크인 안내를 입력하세요");
            $("#check_io").focus();
            return false;
         }
         if($("#j_booking").val()==""){
            alert("예약 안내를 입력하세요");
            $("#j_booking").focus();
            return false;
         }
         if($("#j_intro").val()==""){
             alert("소개를 입력하세요");
             $("#j_intro").focus();
             return false;
          }
         if($("#j_cancelfee").val()==""){
            alert("취소수수료안내를 입력하세요");
            $("#j_cancelfee").focus();
            return false;
         }
         if($("#j_cancelnoti").val()==""){
            alert("취소유의사항을 입력하세요");
            $("#j_cancelnoti").focus();
            return false;
         }
         form.action="/journeyInsertAction?mid_category="+$("#category2").val()+"&value=0";
      }else{
         var value;
         $("[name=journey_select]").each(function(idx){
            if($(this).is(":checked")==true){
               value = $(this).val()
            }
         });
          form.action="/journeyInsertAction?value="+value;
      }
   });
   /* 상세상품 삭제 실행시 발생 */
   $("#info_delete").click(function(){
      var delete_val1=[];
      $("[name=journey_info_select]").each(function(idx){
         if($(this).is(":checked")==true){
            delete_val1.push($(this).val());
         }
      });
      if(delete_val1.length==0){
         alert("삭제할 상품이 하나 이상 선택해주세요.");
         return false;
      }
      if(confirm("선택한 "+delete_val1.length+"개의 상품을 삭제하시겠습니까?")){
         form.action="/detail_delete_journey?value="+delete_val1+"&company_name="+$("#company_name").val();
      }
   });
   /* 전체 상품 삭제 발생시 이벤트 처리 */
   $("#delete_all").click(function(){
      var delete_val2=[];
      $("[name=journey_select]").each(function(idx){
         if($(this).is(":checked")==true){
            delete_val2.push($(this).val());
         }
      });
      if(delete_val2.length==0){
         alert("삭제할 상품이 하나 이상 선택해주세요.");
         return false;
      }
      if(confirm("선택한 "+delete_val2.length+"개의 상품을 삭제하시겠습니까?")){
         form_journey.action="/all_delete_journey?value="+delete_val2+"&company_name="+$("#company_name").val();
      }
   });
});
$(document).ready(function(){
   /* chkbox 없음 클릭시 이벤트 처리 */
   $("#noservice").click(function(){
      if(this.checked){
         $(".service").prop('disabled',true).prop('checked',false);
      }else{
         $(".service").prop('disabled',false);
      }
   });
   /* 위와 동일 */
   $("#nofac").click(function(){
      if(this.checked){
         $(".fac").prop('disabled',true).prop('checked',false);
      }else{
         $(".fac").prop('disabled',false);
      }
   });
   $("#nocommon").click(function(){
      if(this.checked){
         $(".common").prop('disabled',true).prop('checked',false);
      }else{
         $(".common").prop('disabled',false);
      }
   });
   
   /* 이미지 선택시 미리보기 출력 (서브 이미지) */
   var sel_files=[];
   $("#j_image").on("change",function(e){
      document.getElementById("sub_thumbnail").innerHTML='';
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);

      if(!(files.length>=5)){
         
         filesArr.forEach(function(f){
            sel_files.push(f);
            var reader = new FileReader();
            reader.onload = function(e){
               var img = "<img src=\"" + e.target.result + "\" />";
               $("#sub_thumbnail").append(img);
            }
            
            reader.readAsDataURL(f);
         });
      }else{
         alert("최대 4개의 이미지까지 등록 가능합니다.");
      }
   });
   $("#ji_image").on("change",function(e){
      document.getElementById("sub_thumbnail2").innerHTML='';
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);

      if(!(files.length>=5)){
         
         filesArr.forEach(function(f){
            sel_files.push(f);
            var reader = new FileReader();
            reader.onload = function(e){
               var img = "<img src=\"" + e.target.result + "\" />";
               $("#sub_thumbnail2").append(img);
            }
            
            reader.readAsDataURL(f);
         });
      }else{
         alert("최대 4개의 이미지까지 등록 가능합니다.");
      }
   });
});
/* 이미지 선택시 미리보기 출력 (메인 이미지) */
function setThumbnail(event) {
   var reader = new FileReader();
   reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.getElementById("title_image").innerHTML='';
      document.querySelector("div#title_image").appendChild(img);          
   };
   
   reader.readAsDataURL(event.target.files[0]);
}
</script>
</head>
<body>
	<div class="container">
		<div class="row" id="row">
			<a href="./ticketView">상품(티켓)보기</a>
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
			
			<form method="POST" id="form_journey" class="mt-3">
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
							<tbody id="journey_list" style="border:none"></tbody>
						</table>
						<button class="btn btn-primary" type="button" value="all" onclick="btnclick(this)">상품추가</button>
						<button class="btn btn-primary" type="button" value="edit" onclick="btnclick(this)">상품수정</button>
						<button class="btn btn-primary" type="submit" id="delete_all" onclick="btnclick(this)">상품삭제</button>
				</div>
						<div class="journey_intro col-12" style="display:none;"></div>
			</form>
			<form method="POST" id="form" enctype="multipart/form-data">
				
				<input type="text" class="form-control ms-3 mb-3" style="width: 200px;"
					id="company_name" name="company_name" value="함덕제주비치호텔"/>
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
						<tbody id="journey_info_list">
						</tbody>
					</table>
					<button class="btn btn-primary mt-2" type="button" value="info" onclick="btnclick(this)">상품상세추가</button>
					<button class="btn btn-primary mt-2" type="submit" id="info_delete" onclick="btnclick(this)">상품삭제</button>
				</div>
			
				<div class="col-5" id="journey_info" style="display:none;">
					<table class="table" id="briefinfo">
						<tr>
							<th class="info_th">* 상품명</th>
							<td>
								<input class="form-control insert_input" type="text" id="bot_title" name="bot_title" />
							</td>
						</tr>
						<tr>
							<th class="info_th">* 메인이미지</th>
							<td>
								<div id="title_image">
								</div>
								<input class="form-control insert_input" type="file" name="title_image" id="main_image" onchange="setThumbnail(event)" />
							</td>
						</tr>
						<tr>
							<th class="info_th">서브이미지</th>
							<td>
								<div id="sub_thumbnail insert_input">
								</div>
								<input class="form-control insert_input" type="file" id="j_image" name="sub_image" multiple/>
							</td>
						</tr>
						<tr>
							<th class="info_th">* 객실공통 구비항목</th>
							<td>
								<input type="checkbox" name="common_items" value="" id="nocommon" />없음
								<input type="checkbox" name="common_items" value="에어컨" class="common"/>에어컨
								<input type="checkbox" name="common_items" value="TV" class="common"/>TV
								<input type="checkbox" name="common_items" value="전화기" class="common"/>전화기
								<input type="checkbox" name="common_items" value="세탁기" class="common"/>세탁기
								<input type="checkbox" name="common_items" value="짐운반" class="common"/>짐운반
								<input type="checkbox" name="common_items" value="금연" class="common"/>금연
							</td>
						</tr>
						<tr>
							<th class="info_th">* 편의서비스</th>
							<td>
								<input type="checkbox" name="j_conservice" value="" id="noservice" />없음
								<input type="checkbox" name="j_conservice" value="수하물보관" class="service"/>수하물보관
								<input type="checkbox" name="j_conservice" value="인터넷/WIFI" class="service"/>인터넷/WIFI
								<input type="checkbox" name="j_conservice" value="장애인 편의" class="service"/>장애인 편의
								<input type="checkbox" name="j_conservice" value="어린이동반가능" class="service"/>어린이동반가능
								<input type="checkbox" name="j_conservice" value="짐운반" class="service"/>짐운반
								<input type="checkbox" name="j_conservice" value="24시간 프론트 데스크" class="service"/>24시간 프론트 데스크
							</td>
						</tr>
						<tr>
							<th class="info_th">* 편의시설</th>
							<td>
								<input type="checkbox" name="j_confacility" value="" id="nofac"/>없음
								<input type="checkbox" name="j_confacility" value="엘리베이터" class="fac"/>엘리베이터
								<input type="checkbox" name="j_confacility" value="주차장" class="fac"/>주차장
								<input type="checkbox" name="j_confacility" value="수영장" class="fac"/>수영장
								<input type="checkbox" name="j_confacility" value="워터파크" class="fac"/>워터파크
								<input type="checkbox" name="j_confacility" value="키즈풀" class="fac"/>키즈풀
								<input type="checkbox" name="j_confacility" value="키즈룸" class="fac"/>키즈룸
								<input type="checkbox" name="j_confacility" value="온천/스파/사우나" class="fac"/>온천/스파/사우나
								<input type="checkbox" name="j_confacility" value="피트니스" class="fac"/>피트니스
								<input type="checkbox" name="j_confacility" value="레저시설" class="fac"/>레저시설
								<input type="checkbox" name="j_confacility" value="오락실" class="fac"/>오락실
								<input type="checkbox" name="j_confacility" value="카페" class="fac"/>카페
								<input type="checkbox" name="j_confacility" value="식당" class="fac"/>식당
								<input type="checkbox" name="j_confacility" value="편의점" class="fac"/>편의점
								<input type="checkbox" name="j_confacility" value="의무실" class="fac"/>의무실
								<input type="checkbox" name="j_confacility" value="회의실(세미나실)" class="fac"/>회의실(세미나실)
								<input type="checkbox" name="j_confacility" value="연회장" class="fac"/>연회장
							</td>
						</tr>
						<tr>
							<th class="info_th">*지역</th>
							<td><input class="form-control insert_input" type="text" id="location" name="location"/></td>
						</tr>
						<tr>
							<th class="info_th">*소개</th>
							<td><textarea class="form-control insert_input" id="j_intro" name="j_intro"/></textarea></td>
						</tr>
						<tr>
							<th class="info_th">알려드리는 말</th>
							<td><textarea class="form-control insert_input" id="notice" name="notice"/></textarea></td>
						</tr>
						<tr>
							<th class="info_th">*교통 정보</th>
							<td><textarea class="form-control insert_input" id="traffic_info" name="traffic_info"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">*숙소 정책</th>
							<td><textarea class="form-control insert_input" id="loging_policy" name="loging_policy"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">*체크인/체크아웃</th>
							<td><textarea class="form-control insert_input" id="check_io" name="check_io"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">*예약안내</th>
							<td><textarea class="form-control insert_input" id="j_booking" name="j_booking"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">유의사항</th>
							<td><textarea class="form-control insert_input" id="j_notice" name="j_notice"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">인원 및 추가요금 </th>
							<td><textarea class="form-control insert_input" id="add_fare" name="add_fare"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">침구류 추가요금</th>
							<td><textarea class="form-control insert_input" id="add_bed" name="add_bed"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">조식 유의 사항</th>
							<td><textarea class="form-control insert_input" id="breakfast_noti" name="breakfast_noti"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">*취소수수료안내</th>
							<td><textarea class="form-control insert_input" id="j_cancelfee" name="j_cancelfee"  /></textarea></td>
						</tr>
						<tr>
							<th class="info_th">*취소유의사항</th>
							<td><textarea class="form-control insert_input" id="j_cancelnoti" name="j_cancelnoti"  /></textarea></td>
						</tr>
					</table>
				</div>
				<div class="col-5" id="journey_info_detail" style="display:none; margin: 0px">
					<table id="detailInfo">
						<tr>
							<th class="info_th">* 상품상세명</th>
							<td><input class="form-control" type="text" id="ji_title" name="ji_title" /></td>
						</tr>
						<tr>
							<th class="info_th">* 성인</th>
							<td>
							<select class="form-select" id="ji_adult" name="ji_adult">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>	
							</td>
						</tr>
						<tr>
							<th class="info_th">* 소인</th>
							<td>
							<select class="form-select" id="ji_kid" name="ji_kid">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>	
							</td>
						</tr>
						<tr>
							<th class="info_th">*객실이미지</th>
							<td>
								<div id="sub_thumbnail2">
								</div>
								<input class="form-control" type="file" id="ji_image" name="sub_ji_image" multiple/>
							</td>
						</tr>
						<tr>
							<th class="info_th">*잔여객실수</th>
							<td>
								<select class="form-select" id="ji_roomnum" name="ji_roomnum">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>	
							</td>
						</tr>
						<tr>
							<th class="info_th">* 개장기간</th>
							<td>
							<input type="date" class="date_form" id="ji_duetime1" name="ji_duetime1" />~<input type="date" class="date_form" id="ji_duetime2" name="ji_duetime2" />
							</td>
						</tr>
						<tr>
							<th class="info_th">* 가격</th>
							<td><input class="form-control" type="text" id="ji_price" name="ji_price" /></td>
						</tr>
						<tr>
							<th class="info_th">*객실소개</th>
							<td>
								<textarea class="form-control" id="ji_intro" name="ji_intro" cols="30" rows="10"></textarea>
							</td>
						</tr>
					</table>
					<button class="btn-primary" type="submit" id="submit">등록하기</button>
					<button class="btn-primary" type="reset">다시작성</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>