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
	/* 동적 셀렉트박스 생성 */
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
				service_list(level);
				$.post(
					"/category_list.do"
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
		/* --분류--를 선택할 경우 초기화 */
			$('#ticket_list').empty();
			document.getElementById("form").reset();
			for(var now = level ; now<=max_level ; now++){
				$('#'+(obj.id).slice(0,-1)+(now+1)).attr("disabled",true).find("option").remove().end()
				.append("<option value=''>=분류=</option>");
			}
		}
	}
	
	/* 티켓을 클릭할 경우 해당 티켓 정보 가져오는 메소드 */
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
		//티켓 상세 정보 출력
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
		//티켓 정보 출력
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
	
	//버튼 클릭시 발생 이벤트 정리
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
		/* 상품 등록 클릭시 이벤트 처리 */
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
				if($("#main_image").val()==""){
					alert("메인 이미지는 필수로 등록해야합니다.");
					return false;
				}
				var sub_image=$("#t_image")
				if(sub_image[0].files.length>=5){
					alert("서브 이미지는 최대 4개까지 등록가능합니다.");
					return false;
				}
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
		/* 상세상품 삭제 실행시 발생 */
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
		/* 전체 상품 삭제 발생시 이벤트 처리 */
		$("#delete_all").click(function(){
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
		
		/* 이미지 선택시 미리보기 출력 (서브 이미지) */
		var sel_files=[];
		$("#t_image").on("change",function(e){
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


	function service_list(e){

		const ticket_service = ['무료셔틀버스', '안전장치(장비,요원 등)', '수유실', '흡연실', '의무실', '물품보관소', '유실물센터', '장애인 편의 시설', '미아보호소', '유아전용시설', '주차장'];
		const ticket_fac = ['안내데스크', '매표소', '식음시설', '페스티벌', '놀이기구', '공연', '기프트샵', '체험존'];
		
		const journey_service = ["수하물보관","인터넷/WIFI", "장애인 편의", "어린이동반가능", "짐운반", "24시간 프론트 데스크"];
		const journey_fac = ["엘리베이터", "주차장", "수영장", "워터파크", '키즈풀', '키즈룸', '온천/스파/사우나', '피트니스', '레저시설', '오락실', '카페', '식당', '편의점', '의무실', '회의실(세미나실)', '연회장'];
		
		document.getElementById("service_select").innerHTML='';
		document.getElementById("fac_select").innerHTML='';
		
		if(e==1){
			service=ticket_service;
			fac = ticket_fac;
			
			$(".ticket_table").css("display","block");
			$(".journey_table").css("display","none");
			
	    	for(property in service){
		    	var chkbox1 = document.createElement("input")
				chkbox1.setAttribute("type","checkbox");
				chkbox1.value=service[property];
				chkbox1.className='service';
				chkbox1.name='t_conservice';
				document.getElementById("service_select").appendChild(chkbox1);
				document.getElementById("service_select").innerHTML+=service[property];
				if(property%4 == 3){
		        	document.getElementById("service_select").innerHTML+="<br>";
		        }
			}
	    	
	    	for(property in fac){
		    	var chkbox2 = document.createElement("input")
				chkbox2.setAttribute("type","checkbox");
				chkbox2.value=fac[property];
				chkbox2.className='fac';
				chkbox2.name='t_fac';
				document.getElementById("fac_select").appendChild(chkbox2);
				document.getElementById("fac_select").innerHTML+=fac[property];
				if(property%4 == 3){
		        	document.getElementById("fac_select").innerHTML+="<br>";
		        }
			}
		}else if(e==3){
			service = journey_service;
			fac = journey_fac;
			
			$(".journey_table").css("display","block");
			$(".ticket_table").css("display","none");
			
	    	for(property in service){
	    		var chkbox1 = document.createElement("input")
				chkbox1.setAttribute("type","checkbox");
				chkbox1.value=service[property];
				chkbox1.className='service';
				chkbox1.name='j_conservice';
				document.getElementById("service_select").appendChild(chkbox1);
				document.getElementById("service_select").innerHTML+=service[property];
				if(property%4 == 3){
					document.getElementById("service_select").innerHTML+="<br>";
				}
			}
	    	
	    	for(property in fac){
	    		var chkbox2 = document.createElement("input")
				chkbox2.setAttribute("type","checkbox");
				chkbox2.value=fac[property];
				chkbox2.className='fac';
				chkbox2.name='j_confacility';
				document.getElementById("fac_select").appendChild(chkbox2);
				document.getElementById("fac_select").innerHTML+=fac[property];
				if(property%4 == 3){
					document.getElementById("service_select").innerHTML+="<br>";
				}
			}
	   }
	   var chkbox1 = document.createElement("input")
	   chkbox1.setAttribute("type","checkbox");
	   chkbox1.value='';
	   chkbox1.className='service';
	   chkbox1.id='noservice';
	   document.getElementById("service_select").appendChild(chkbox1);
	   document.getElementById("service_select").innerHTML+='없음';
	   
	   var chkbox2 = document.createElement("input")
	   chkbox2.setAttribute("type","checkbox");
	   chkbox2.value='';
	   chkbox2.className='fac';
	   chkbox2.id='nofac';
	   document.getElementById("fac_select").appendChild(chkbox2);
	   document.getElementById("fac_select").innerHTML+='없음';
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row" id="row">
			<a href="./ticketView">상품(티켓)보기</a>
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
								<input type="file" name="title_image" id="main_image" onchange="setThumbnail(event)" />
							</td>
						</tr>
						<tr>
							<th>서브이미지</th>
							<td>
								<div id="sub_thumbnail">
								</div>
								<input type="file" id="t_image" name="sub_image" multiple/>
							</td>
						</tr>
						<tr class="journey_table">
							<th>* 객실공통 구비항목</th>
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
							<th>
								<div class="ticket_table">* 편의시설</div>
								<div class="journey_table">* 편의서비스</div>
							</th>
							<td>
								<div id="service_select">
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<div class="ticket_table">* 이용시설</div>
								<div class="journey_table">* 편의시설</div>
							</th>
							<td>
								<div id="fac_select">
								</div>
							</td>
						</tr>
						<tr class="journey_table">
							<th class="info_th">* 지역</th>
							<td><input class="form-control insert_input" type="text" id="location" name="location"/></td>
						</tr>
						<tr>
							<th>*소개</th>
							<td><input type="text" id="t_intro" name="t_intro"/></td>
						</tr>
						<tr>
							<th>알려드리는 말</th>
							<td><input type="text" id="notice" name="notice" /></td>
						</tr>
						<tr class="ticket_table">
							<th>포함사항</th>
							<td><textarea id="t_incmatters" name="t_incmatters"></textarea></td>
						</tr>
						<tr>
							<table class="journey_table">
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
							</table>
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