<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>Insert title here</title>
<script>
	$(function(){
		$("#submit").click(function(){
			if(confirm("해당 정보로 수정하시겠습니까?")){
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
			}
		});
	});
</script>
</head>
<body>
	<form action="/editTicketAction?value=${dto.bot_idx }" method="POST">
		<div class="col-12" id="ticket">
			<table>
				<tr>
					<th>* 편의시설</th>
					<td>
						<input type="checkbox" name="t_conservice" value=""
						<c:if test="${dto.t_conservice eq null }"> checked</c:if>
						 id="noservice" />없음
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'무료셔틀버스') }"> checked</c:if>
						 value="무료셔틀버스" class="service"/>무료셔틀버스
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'안전장치') }"> checked</c:if>
						 value="안전장치(장비,요원 등)" class="service"/>안전장치(장비,요원 등)
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'수유실') }"> checked</c:if>
						 value="수유실" class="service"/>수유실
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'흡연실') }"> checked</c:if>
						 value="흡연실" class="service"/>흡연실
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'의무실') }"> checked</c:if>
						 value="의무실" class="service"/>의무실
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'물품보관소') }"> checked</c:if>
						 value="물품보관소" class="service"/>물품보관소
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'유실물센터') }"> checked</c:if>
						 value="유실물센터" class="service"/>유실물센터
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'장애인') }"> checked</c:if>
						 value="장애인 편의 시설" class="service"/>장애인 편의 시설
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'미아보호소') }"> checked</c:if>
						 value="미아보호소" class="service"/>미아보호소
						<input type="checkbox" name="t_conservice"
						<c:if test="${fn:contains(dto.t_conservice,'유아전용시설') }"> checked</c:if>
						 value="유아전용시설" class="service"/>유아전용시설
						<input type="checkbox" name="t_conservice"
						 value="주차장"
						<c:if test="${fn:contains(dto.t_conservice,'주차장') }"> checked</c:if>
						 class="service"/>주차장
					</td>
				</tr>
				<tr>
					<th>* 이용시설</th>
					<td>
						<input type="checkbox" name="t_fac"
						<c:if test="${dto.t_fac eq null }"> checked</c:if>
						 value="" id="nofac"/>없음
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'안내데스크') }"> checked</c:if>
						 value="안내데스크" class="fac"/>안내데스크
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'매표소') }"> checked</c:if>
						 value="매표소" class="fac"/>매표소
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'식음시설') }"> checked</c:if>
						 value="식음시설" class="fac"/>식음시설
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'페스티벌') }"> checked</c:if>
						 value="페스티벌" class="fac"/>페스티벌
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'놀이기구') }"> checked</c:if>
						 value="놀이기구" class="fac"/>놀이기구
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'공연') }"> checked</c:if>
						 value="공연" class="fac"/>공연
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'기프트샵') }"> checked</c:if>
						 value="기프트샵" class="fac"/>기프트샵
						<input type="checkbox" name="t_fac"
						<c:if test="${fn:contains(dto.t_fac,'체험존') }"> checked</c:if>
						 value="체험존" class="fac"/>체험존
					</td>
				</tr>
				<tr>
					<th>*소개</th>
					<td><input type="text" id="t_intro" name="t_intro" value="${dto.t_intro }"/></td>
				</tr>
				<tr>
					<th>알려드리는 말</th>
					<td><input type="text" id="notice" name="notice" value="${dto.notice }" /></td>
				</tr>
				<tr>
					<th>포함사항</th>
					<td><textarea id="t_incmatters" name="t_incmatters">${dto.t_incmatters}</textarea></td>
				</tr>
				<tr>
					<th>유의사항</th>
					<td><textarea id="t_notice" name="t_notice" >${dto.t_notice}</textarea></td>
				</tr>
				<tr>
					<th>*예약안내</th>
					<td><textarea id="t_booking" name="t_booking" >${dto.t_booking}</textarea></td>
				</tr>
				<tr>
					<th>*취소수수료안내</th>
					<td><textarea id="t_cancelfee" name="t_cancelfee" >${dto.t_cancelfee}</textarea></td>
				</tr>
				<tr>
					<th>*취소유의사항</th>
					<td><textarea id="t_cancelnoti" name="t_cancelnoti" >${dto.t_cancelnoti}</textarea></td>
				</tr>
			</table>
			<button class="btn btn-primary" type="submit">수정완료</button>
			<button class="btn btn-primary" type="reset">다시작성</button>
			<button class="btn btn-primary" type="button">목록가기</button>
		</div>
	</form>
</body>
</html>