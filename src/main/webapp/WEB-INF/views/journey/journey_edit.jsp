<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		$(".service").click(function(){
			var total = [];
			$("input[name=t_conservice]:checked").each(function(){
				var chk =$(this).val();
				total.push(chk);
			});
			alert(total);
		});
		$("#submit").click(function(){
			if(!confirm("해당 정보로 수정하시겠습니까?")){
				if($("#j_intro").val()==""){
					alert("소개를 입력하세요");
					$("#j_intro").focus();
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
					alert("체크인/아웃 안내를 입력하세요");
					$("#check_io").focus();
					return false;
				}
				if($("#j_booking").val()==""){
					alert("예약 안내를 입력하세요");
					$("#j_booking").focus();
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
				return false;
			}
		});
	});
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.getElementById("main_thumbnail").innerHTML='';
			document.querySelector("div#main_thumbnail").appendChild(img);          
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}

	$(document).ready(function(){
		$("#nocommon").click(function(){
			if(this.checked){
				$(".common").prop('disabled',true).prop('checked',false);
			}else{
				$(".common").prop('disabled',false);
			}
		});
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
		
		
		var sel_files=[];
		$("#t_image").on("change",function(e){
			document.getElementById("sub_thumbnail").innerHTML='';
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				sel_files.push(f);
				var reader = new FileReader();
				reader.onload = function(e){
					var img = "<img src=\"" + e.target.result + "\" />";
					$("#sub_thumbnail").append(img);
				}
				
				reader.readAsDataURL(f);
			});
		});
	});
</script>
</head>
<body>
	<form action="/editJourneyAction?value=${dto.bot_idx }" method="POST" enctype="multipart/form-data">
		<div class="col-12" id="ticket">
			<table>
				<tr>
					<th>* 메인이미지</th>
					<td>
						<div id="main_thumbnail">
							<img src="/uploads/${dto.j_title_image }"  />
						</div>
						<input type="file" name="title_image" onchange="setThumbnail(event);" />
					</td>
				</tr>
				<tr>
					<th>서브이미지</th>
					<td>
						<div id="sub_thumbnail">
							<c:if test="${not empty dto.j_image1 }">
								<img src="/uploads/${dto.j_image1 }"/>
								<c:if test="${not empty dto.j_image2 }">
									<img src="/uploads/${dto.j_image2 }"/>
									<c:if test="${not empty dto.j_image3 }">
										<img src="/uploads/${dto.j_image3 }"/>
										<c:if test="${not empty dto.j_image4 }">
											<img src="/uploads/${dto.j_image4 }"/>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
						</div>
						<input type="file" id="j_image" name="sub_image" multiple/>
					</td>
				</tr>
				<tr>
					<th>* 객실공통 구비항목</th>
					<td>
						<input type="checkbox" name="common_items" value="" <c:if test="${dto.common_items eq null }"> checked</c:if> id="nocommon" />없음
						<input type="checkbox" name="common_items" <c:if test="${fn:contains(dto.common_items,'에어컨') }"> checked</c:if> value="에어컨" class="common"/>에어컨
						<input type="checkbox" name="common_items" <c:if test="${fn:contains(dto.common_items,'TV') }"> checked</c:if> value="TV" class="common"/>TV
						<input type="checkbox" name="common_items" <c:if test="${fn:contains(dto.common_items,'전화기') }"> checked</c:if> value="전화기" class="common"/>전화기
						<input type="checkbox" name="common_items" <c:if test="${fn:contains(dto.common_items,'세탁기') }"> checked</c:if> value="세탁기" class="common"/>세탁기
						<input type="checkbox" name="common_items" <c:if test="${fn:contains(dto.common_items,'짐운반') }"> checked</c:if> value="짐운반" class="common"/>짐운반
						<input type="checkbox" name="common_items" <c:if test="${fn:contains(dto.common_items,'금연') }"> checked</c:if> value="금연" class="common"/>금연
				</tr>
				<tr>
				<tr>
					<th>* 편의서비스</th>
					<td>
						<input type="checkbox" name="j_conservice" value="" <c:if test="${dto.j_conservice eq null }"> checked</c:if> id="noservice" />없음
						<input type="checkbox" name="j_conservice" <c:if test="${fn:contains(dto.j_conservice,'수하물보관') }"> checked</c:if> value="수하물보관" class="service"/>수하물보관
						<input type="checkbox" name="j_conservice" <c:if test="${fn:contains(dto.j_conservice,'인터넷/WIFI') }"> checked</c:if> value="인터넷/WIFI" class="service"/>인터넷/WIFI
						<input type="checkbox" name="j_conservice" <c:if test="${fn:contains(dto.j_conservice,'장애인 편의') }"> checked</c:if> value="장애인 편의" class="service"/>장애인 편의
						<input type="checkbox" name="j_conservice" <c:if test="${fn:contains(dto.j_conservice,'어린이동반가능') }"> checked</c:if> value="어린이동반가능" class="service"/>어린이동반가능
						<input type="checkbox" name="j_conservice" <c:if test="${fn:contains(dto.j_conservice,'짐운반') }"> checked</c:if> value="짐운반" class="service"/>짐운반
						<input type="checkbox" name="j_conservice" <c:if test="${fn:contains(dto.j_conservice,'24시간 프론트 데스크') }"> checked</c:if> value="24시간 프론트 데스크" class="service"/>24시간 프론트 데스크
				</tr>
				<tr>
					<th>* 편의시설</th>
					<td>
						<input type="checkbox" name="j_confacility"<c:if test="${dto.j_confacility eq null }"> checked</c:if> id="nofac"/>없음
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'엘리베이터') }"> checked</c:if> value="엘리베이터" class="fac"/>엘리베이터
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'주차장') }"> checked</c:if> value="주차장" class="fac"/>주차장
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'수영장') }"> checked</c:if> value="수영장" class="fac"/>수영장
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'워터파크') }"> checked</c:if> value="워터파크" class="fac"/>워터파크
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'키즈풀') }"> checked</c:if> value="키즈풀" class="fac"/>키즈풀
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'온천/스파/사우나') }"> checked</c:if> value="온천/스파/사우나" class="fac"/>온천/스파/사우나
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'피트니스') }"> checked</c:if> value="피트니스" class="fac"/>피트니스
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'레저시설') }"> checked</c:if> value="레저시설" class="fac"/>레저시설
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'오락실') }"> checked</c:if> value="오락실" class="fac"/>오락실
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'카페') }"> checked</c:if> value="카페" class="fac"/>카페
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'식당') }"> checked</c:if> value="식당" class="fac"/>식당
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'편의점') }"> checked</c:if> value="편의점" class="fac"/>편의점
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'의무실') }"> checked</c:if> value="의무실" class="fac"/>의무실
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'회의실(세미나실)') }"> checked</c:if> value="회의실(세미나실)" class="fac"/>회의실(세미나실)
						<input type="checkbox" name="j_confacility"<c:if test="${fn:contains(dto.j_confacility,'연회장') }"> checked</c:if> value="연회장" class="fac"/>연회장
					</td>
				</tr>
				<tr>
					<th>*지역</th>
					<td><input type="text" id="location" name="location" value="${dto.location }"/></td>
				</tr>
				<tr>
					<th>*소개</th>
					<td><textarea id="j_intro" name="j_intro" >${dto.j_intro }</textarea></td>
				</tr>
				<tr>
					<th>알려드리는 말</th>
					<td><textarea id="notice" name="notice" >${dto.notice }</textarea></td>
				</tr>
				<tr>
					<th>*교통 정보</th>
					<td><textarea id="traffic_info" name="traffic_info" >${dto.traffic_info}</textarea></td>
				</tr>
				<tr>
					<th>*숙소 정책</th>
					<td><textarea id="loging_policy" name="loging_policy" >${dto.loging_policy}</textarea></td>
				</tr>
				<tr>
					<th>*체크인/체크아웃</th>
					<td><textarea id="check_io" name="check_io" >${dto.check_io}</textarea></td>
				</tr>
				<tr>
					<th>*예약안내</th>
					<td><textarea id="j_booking" name="j_booking" >${dto.j_booking}</textarea></td>
				</tr>
				<tr>
					<th>유의사항</th>
					<td><textarea id="j_notice" name="j_notice" >${dto.j_notice}</textarea></td>
				</tr>
				<tr>
					<th>인원 및 추가요금 </th>
					<td><textarea id="add_fare" name="add_fare" >${dto.add_fare}</textarea></td>
				</tr>
				<tr>
					<th>침구류 추가요금</th>
					<td><textarea id="add_bed" name="add_bed" >${dto.add_bed}</textarea></td>
				</tr>
				<tr>
					<th>조식 유의 사항</th>
					<td><textarea id="breakfast_noti" name="breakfast_noti" >${dto.breakfast_noti}</textarea></td>
				</tr>
				<tr>
				<tr>
					<th>*취소수수료안내</th>
					<td><textarea id="j_cancelfee" name="j_cancelfee" >${dto.j_cancelfee}</textarea></td>
				</tr>
				<tr>
					<th>*취소유의사항</th>
					<td><textarea id="j_cancelnoti" name="j_cancelnoti" >${dto.j_cancelnoti}</textarea></td>
				</tr>
			</table>
			<button class="btn btn-primary" type="submit" id="submit">수정완료</button>
			<button class="btn btn-primary" type="reset">다시작성</button>
			<button class="btn btn-primary" type="button">목록가기</button>
		</div>
	</form>
</body>
</html>