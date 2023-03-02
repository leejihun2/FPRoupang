<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Roupang</title>
<script>
	function setSelectBox(obj){
		var sub_idx = obj.value;
		var level = parseInt((obj.id).substr(-1,1));
		
		var next_level = '#'+(obj.id).slice(0,-1)+(level+1);

		var max_level = 3;
		
		$("#ticket_info_detail").css("display","none");
		$("#ticket_info").css("display","none");
		$(".ticket_intro").css("display","none");
		$('#detail_list').css("display","none");
		if(sub_idx!=''){
			if(level <= 1){
				
				if(level == 1){
					for(var now = level ; now<=max_level ; now++){
						$('#'+(obj.id).slice(0,-1)+(now+1)).attr("disabled",true).find("option").remove().end()
						.append("<option value=''>=분류=</option>");
					}
				}
				
				$.post(
					"/category_list.do"
					,{level : $(obj).attr('id').substr(-1,1), sub_idx : $(obj).val(), company_name : $("#company_name").val()}
					,function(data){
						$(next_level).attr("disabled",false).find("option").remove().end()
							.append("<option value=''>=분류=</option>");
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
				$('#ticket_list').empty();
				$.post(
					"/category_list.do"
					,{level : $(obj).attr('id').substr(-1,1), sub_idx : $(obj).val(), company_name : $("#company_name").val()}
					,function(data){
						$.each(data, function(i){
							var tabletd='<tr>';
							tabletd+='<td><input type="checkbox" name="ticket_select" id="ticket_select'+data[i].idx+'" value="'+data[i].idx+'"/>'
							tabletd+='<td><img src="/uploads/'+data[i].t_title_image+'" />'
							tabletd+='<td><a href="javascript:;" onclick="simple_click('+data[i].idx+')">'+data[i].title+'</a></td>'
							tabletd+='</tr>'
							
							$('#ticket_list').append(tabletd);
						});
					}
				);
				
			}
		}else{
			$('#ticket_list').empty();
			document.getElementById("form").reset();
			for(var now = level ; now<=max_level ; now++){
				$('#'+(obj.id).slice(0,-1)+(now+1)).attr("disabled",true).find("option").remove().end()
				.append("<option value=''>=분류=</option>");
			}
		}
	}
	function simple_click(obj){
		const checkboxes = document.getElementsByName('ticket_select');
		checkboxes.forEach((checkbox) => {checkbox.checked = false;})
		let chk = document.getElementById("ticket_select"+obj);
		chk.checked = true;
		$(".ticket_intro").css("display","block");
		$('#detail_list').css("display","block");
		$('#ticket_info_list').empty();
		$('.ticket_intro').empty();
		$("#ticket_info_detail").css("display","none");
		$("#ticket_info").css("display","none");
		$.post(
			"/ticketDetailInfo"
			,{bot_idx : obj}
			,function(data){
				$.each(data, function(i){
					var tabletd='<tr>';
					tabletd+='<td><input type="checkbox" name="ticket_info_select" value="'+data[i].ti_idx+'"/>'
					tabletd+='<td><a href="/ticket_edit?product_idx='+data[i].ti_idx+'">'+data[i].ti_title+'</a><br/>'
						+'유효기간'+data[i].ti_duetime1+'~'+data[i].ti_duetime2+'<br/>'
						
					if(data[i].ti_intro==null){
						tabletd+='</td>'
					}else{
						tabletd+=data[i].ti_intro+'</td>'
					}
						
					tabletd+='<td>'+data[i].ti_price+'</td>'
					tabletd+='<td>'+data[i].ti_discount+'</td>'
					tabletd+='</tr>'
					
					$('#ticket_info_list').append(tabletd);
				});
			}
		);
		$.post(
			"/ticketInfo"
			,{bot_idx : obj}
			,function(data){
				var list = data.t_conservice
				var table = '<table>';
				if((data.t_image1)!=null){
					table += '<tr><th>서브이미지</th><td><img src="/uploads/'+data.t_image1+'" />'
					if((data.t_image2)!=null){
						table += '<img src="/uploads/'+data.t_image2+'" />'
						if((data.t_image3)!=null){
							table += '<img src="/uploads/'+data.t_image3+'" />'
							if((data.t_image4)!=null){
								table += '<img src="/uploads/'+data.t_image4+'" />'
							}
						}
					}
					table += '</td></tr>'
				}
				table += '<tr><th>소개글</th><td>'+data.t_intro+'</td></tr>'
				if(data.notice!=null){
					table += '<tr><th>알려드리는말</th><td>'+data.notice+'</td></tr>'
				}
				if(data.t_conservice!=null){
					table += '<tr><th>편의시설</th><td>'
					table += list
					table += '</td></tr>'
				}
					
				var service = data.t_fac;
				if(data.t_fac!=null){
					table += '<tr><th>이용시설</th><td>'
					table += service
					table += '</td></tr>'
				}
					
				
				if(data.t_incmatters != null){
					table += '<tr><th>포함사항</th><td>'+data.t_incmatters+'</td></tr>'
				}
				if(data.t_notice != null){
					table += '<tr><th>유의사항</th><td>'+data.t_notice+'</td></tr>'
				}
				table += '<tr><th>예약안내</th><td>'+data.t_booking+'</td></tr>'
				table += '<tr><th>취소수수료안내</th><td>'+data.t_cancelfee+'</td></tr>'
				table += '<tr><th>취소유의사항안내</th><td>'+data.t_cancelnoti+'</td></tr>'
				table += '</table>'
				$('.ticket_intro').append(table);
			}
		);
	}
	function btnclick(obj){
		var mode = $(obj).val();
		if(mode=="all"){
			$("#ticket_info_detail").css("display","block");
			$("#ticket_info").css("display","block");
			document.getElementById("form").reset();
		}else if(mode=="info"){
			$("#ticket_info_detail").css("display","block");
			$("#ticket_info").css("display","none");
			document.getElementById("form").reset();
		}else if(mode=="edit"){
			var value;
			$("[name=ticket_select]").each(function(idx){
				if($(this).is(":checked")==true){
					value = $(this).val()
				}
			});
			var ajaxOp = {
				url : "/editTicket?value="+value,
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
		$("#submit").click(function(){
			if($("#ti_title").val()==""){
				alert("상품상세명을 입력하세요");
				$("#ti_title").focus();
				return false;
			}
			if($("#ti_duetime1").val()=="" || $("ti_duetime2").val()=="" ){
				alert("유효기간이 입력되지 않았습니다.");
				return false;
			}
			if($("#ti_price").val()==""){
				alert("가격을 입력하세요");
				$("#ti_price").focus();
				return false;
			}
			
			if($("#t_intro").val()!=""){
				if($("#bot_title").val()==""){
					alert("상품명를 입력하세요");
					$("#bot_title").focus();
					return false;
				}
				if($("#t_intro").val()==""){
					alert("소개를 입력하세요");
					$("#t_intro").focus();
					return false;
				}
				if($("#t_booking").val()==""){
					alert("예약 안내를 입력하세요");
					$("#t_booking").focus();
					return false;
				}
				if($("#t_cancelfee").val()==""){
					alert("취소수수료안내를 입력하세요");
					$("#t_cancelfee").focus();
					return false;
				}
				if($("#t_cancelnoti").val()==""){
					alert("취소유의사항을 입력하세요");
					$("#t_cancelnoti").focus();
					return false;
				}
				form.action="/ticketInsertAction?mid_category="+$("#category2").val()+"&value=0";
			}else{
				var value;
				$("[name=ticket_select]").each(function(idx){
					if($(this).is(":checked")==true){
						value = $(this).val()
					}
				});
			 	form.action="/ticketInsertAction?value="+value;
			}
			
		});
		$("#info_delete").click(function(){
			var delete_val1=[];
			$("[name=ticket_info_select]").each(function(idx){
				if($(this).is(":checked")==true){
					delete_val1.push($(this).val());
				}
			});
			if(delete_val1.length==0){
				alert("삭제할 상품이 하나 이상 선택해주세요.");
				return false;
			}
			if(confirm("선택한 "+delete_val1.length+"개의 상품을 삭제하시겠습니까?")){
				form.action="/detail_delete_ticket?value="+delete_val1+"&company_name="+$("#company_name").val();
			}
		});
		$("#delete_all").click(function(){
			alert("동작!");
			var delete_val2=[];
			$("[name=ticket_select]").each(function(idx){
				if($(this).is(":checked")==true){
					delete_val2.push($(this).val());
				}
			});
			if(delete_val2.length==0){
				alert("삭제할 상품이 하나 이상 선택해주세요.");
				return false;
			}
			if(confirm("선택한 "+delete_val2.length+"개의 상품을 삭제하시겠습니까?")){
				form_ticket.action="/all_delete_ticket?value="+delete_val2+"&company_name="+$("#company_name").val();
			}
		});
	});
	$(document).ready(function(){
		$("#noservice").click(function(){
			if(this.checked){
				$(".service").prop('disabled',true).prop('checked',false);
			}else{
				$(".service").prop('disabled',false);
			}
		});
		$("#nofac").click(function(){
			if(this.checked){
				$(".fac").prop('disabled',true).prop('checked',false);
			}else{
				$(".fac").prop('disabled',false);
			}
		});
		$(".service").click(function(){
			var total = [];
			$("input[name=t_conservice]:checked").each(function(){
				var chk =$(this).val();
				total.push(chk);
			});
		});
	});
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

	function setSubThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.getElementById("sub_image").innerHTML='';
			document.querySelector("div#sub_image").appendChild(img);          
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row" id="row">
				<div class="col-12">
					분류1
					<select name="top_category" id="category1" onchange="setSelectBox(this)">
						<option value="">=분류=</option>
						<c:forEach items="${cate }" var="top" varStatus="loop">
							<option value="${top.idx }">${top.title }</option>
						</c:forEach>
					</select>
					분류2
					<select name="mid_category" id="category2" onchange="setSelectBox(this)" disabled>
						<option value="">=분류=</option>
					</select>
				</div>
			<form method="POST" id="form_ticket">
				<div class="col-12" id="simple_list">
					<table style="border:1px;">
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="*%" />
							</colgroup>
							<thead>
								<tr>
									<th>선택</th>
									<th>이미지</th>
									<th>상품명</th>
								</tr>
							</thead>
							<tbody id="ticket_list">
							</tbody>
						</table>
						<button class="btn btn-primary" type="button" value="all" onclick="btnclick(this)">상품추가</button>
						<button class="btn btn-primary" type="button" value="edit" onclick="btnclick(this)">상품수정</button>
						<button class="btn btn-primary" type="submit" id="delete_all" onclick="btnclick(this)">상품삭제</button>
						<div class="ticket_intro" style="display:none;">
						</div>
				</div>
			</form>
			<form method="POST" id="form" enctype="multipart/form-data">
				회사명
				<input type="text" id="company_name" name="company_name" value="아쿠아리움" />
				<div class="col-12" id="detail_list" style="width:90%; display:none;">
					<table style="border:1px;">
						<colgroup>
							<col width="10%" />
							<col width="50%" />
							<col width="30%" />
							<col width="*%" />
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>상품상세명</th>
								<th>요금</th>
								<th>할인율</th>
							</tr>
						</thead>
						<tbody id="ticket_info_list">
						</tbody>
					</table>
					<button class="btn btn-primary" type="button" value="info" onclick="btnclick(this)">상품상세추가</button>
					<button class="btn btn-primary" type="submit" id="info_delete" onclick="btnclick(this)">상품삭제</button>
				</div>
			
				<div class="col-12" id="ticket_info" style="display:none;">
					<table>
						<tr>
							<th>* 상품명</th>
							<td>
								<input type="text" id="bot_title" name="bot_title" />
							</td>
						</tr>
						<tr>
							<th>* 메인이미지</th>
							<td>
								<div id="title_image">
								</div>
								<input type="file" name="t_title_image" onchange="setThumbnail(event)" />
							</td>
						</tr>
						<tr>
							<th>서브이미지</th>
							<td>
								<div id="sub_image">
								</div>
								<div id="sub_image_select">
									<input type="file" name="t_image1" id="t_image_insert1" onchange="setSubThumbnail(event)" />
									<input type="file" name="t_image2" id="t_image_insert2" onchange="setSubThumbnail(event)" />
									<input type="file" name="t_image3" id="t_image_insert3" onchange="setSubThumbnail(event)" />
									<input type="file" name="t_image4" id="t_image_insert4" onchange="setSubThumbnail(event)" />
								</div>
							</td>
						</tr>
						<tr>
							<th>* 편의시설</th>
							<td>
								<input type="checkbox" name="t_conservice" value="" id="noservice" />없음
								<input type="checkbox" name="t_conservice" value="무료셔틀버스" class="service"/>무료셔틀버스
								<input type="checkbox" name="t_conservice" value="안전장치(장비,요원 등)" class="service"/>안전장치(장비,요원 등)
								<input type="checkbox" name="t_conservice" value="수유실" class="service"/>수유실
								<input type="checkbox" name="t_conservice" value="흡연실" class="service"/>흡연실
								<input type="checkbox" name="t_conservice" value="의무실" class="service"/>의무실
								<input type="checkbox" name="t_conservice" value="물품보관소" class="service"/>물품보관소
								<input type="checkbox" name="t_conservice" value="유실물센터" class="service"/>유실물센터
								<input type="checkbox" name="t_conservice" value="장애인 편의 시설" class="service"/>장애인 편의 시설
								<input type="checkbox" name="t_conservice" value="미아보호소" class="service"/>미아보호소
								<input type="checkbox" name="t_conservice" value="유아전용시설" class="service"/>유아전용시설
								<input type="checkbox" name="t_conservice" value="주차장" class="service"/>주차장
							</td>
						</tr>
						<tr>
							<th>* 이용시설</th>
							<td>
								<input type="checkbox" name="t_fac" value="" id="nofac"/>없음
								<input type="checkbox" name="t_fac" value="안내데스크" class="fac"/>안내데스크
								<input type="checkbox" name="t_fac" value="매표소" class="fac"/>매표소
								<input type="checkbox" name="t_fac" value="식음시설" class="fac"/>식음시설
								<input type="checkbox" name="t_fac" value="페스티벌" class="fac"/>페스티벌
								<input type="checkbox" name="t_fac" value="놀이기구" class="fac"/>놀이기구
								<input type="checkbox" name="t_fac" value="공연" class="fac"/>공연
								<input type="checkbox" name="t_fac" value="기프트샵" class="fac"/>기프트샵
								<input type="checkbox" name="t_fac" value="체험존" class="fac"/>체험존
							</td>
						</tr>
						<tr>
							<th>*소개</th>
							<td><input type="text" id="t_intro" name="t_intro"/></td>
						</tr>
						<tr>
							<th>알려드리는 말</th>
							<td><input type="text" id="notice" name="notice" /></td>
						</tr>
						<tr>
							<th>포함사항</th>
							<td><textarea id="t_incmatters" name="t_incmatters"></textarea></td>
						</tr>
						<tr>
							<th>유의사항</th>
							<td><textarea id="t_notice" name="t_notice" /></textarea></td>
						</tr>
						<tr>
							<th>*예약안내</th>
							<td><textarea id="t_booking" name="t_booking" /></textarea></td>
						</tr>
						<tr>
							<th>*취소수수료안내</th>
							<td><textarea id="t_cancelfee" name="t_cancelfee" /></textarea></td>
						</tr>
						<tr>
							<th>*취소유의사항</th>
							<td><textarea id="t_cancelnoti" name="t_cancelnoti" /></textarea></td>
						</tr>
					</table>
				</div>
				<div class="col-12" id="ticket_info_detail" style="display:none;">
					<table>
						<tr>
							<th>* 상품상세명</th>
							<td><input type="text" id="ti_title" name="ti_title" /></td>
						</tr>
						<tr>
							<th>* 유효기간</th>
							<td><input type="date" id="ti_duetime1" name="ti_duetime1" />~<input type="date" id="ti_duetime2" name="ti_duetime2" /></td>
						</tr>
						<tr>
							<th>* 가격</th>
							<td><input type="text" id="ti_price" name="ti_price" /></td>
						</tr>
						<tr>
							<th>상품소개</th>
							<td>
								<textarea id="ti_intro" name="ti_intro" cols="30" rows="10"></textarea>
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