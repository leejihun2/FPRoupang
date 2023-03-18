<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/list.css" type="text/css">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function deleteRow(idx){
   if(confirm("정말로 삭제하시겠습니까?")){
	   //삭제 요청명으로 이동한다.
      location.href = "delete.do?idx="+idx;
   }
}
</script>
</head>
<style>
.krqLio {
	position: relative;
	margin-top: 50px;
	padding-left: 50px;
}

.ccRJnQ {
	font-size: 30px;
	letter-spacing: -0.8px;
	color: rgb(17, 17, 17);
	margin-bottom: 10px;
}

.ccRJnQ .mc-voc-bold-blue {
	color: rgb(0, 81, 245);
	font-weight: bold;
}

.CijJk {
	margin-top: 7px;
	font-size: 12px;
	letter-spacing: -0.2px;
	color: rgb(146, 146, 146);
}

.dBPfIJ {
	margin-top: 44px;
	font-size: 14px;
	line-height: 1.5;
	letter-spacing: -0.3px;
	color: rgb(17, 17, 17);
}
/* 하단내용 */
.fGSwLE {
	width: 100%;
	height: auto;
	background-color: rgb(248, 248, 248);
	padding: 20px 35px 40px;
	margin-top: 17px;
	border: 1px solid rgb(229, 229, 229);
}

.ycZdw {
	width: 100%;
	height: 50px;
	position: relative;
	margin-bottom: 10px;
}

.cfScjT {
	position: relative;
	display: inline-block;
	width: 290px;
	height: 100%;
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(170, 170, 170);
	padding: 12px 22px;
	margin-right: 6px;
	font-size: 14px;
	color: rgb(17, 17, 17);
	cursor: pointer;
}

.ljlKLR {
	position: relative;
	display: inline-block;
	width: 470px;
	height: 100%;
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(170, 170, 170);
	padding: 16px 22px;
	font-size: 14px;
	color: rgb(17, 17, 17);
	cursor: pointer;
}

.apQSA {
	display: inline-block;
	width: 130px;
	height: 50px;
	position: absolute;
	right: 0px;
	text-align: center;
}

.iSxnmm {
	width: 100%;
	height: auto;
	margin-bottom: 40px;
	border: 1px solid rgb(170, 170, 170);
	background-color: rgb(255, 255, 255);
}

.jOGUyo {
	width: 100%;
	height: 195px;
	background-color: rgb(255, 255, 255);
	border: none;
	padding: 20px 24px;
	font-size: 14px;
	color: rgb(17, 17, 17);
	resize: none;
}

.kbvUIN {
	width: 100%;
	height: 50px;
	text-align: center;
}

.jqrURU {
	text-align: center;
	height: 100%;
	border: none;
	border-radius: 2px;
	padding: 8px;
	background-color: rgb(61, 130, 247);
	cursor: pointer;
	overflow: visible;
	box-sizing: border-box;
	color: rgb(255, 255, 255);
	font-weight: bold;
	width: 180px;
}

.eaRLIr {
	border-top: 1px solid rgb(221, 221, 221);
	padding: 20px 24px;
}

.htfEmI {
	position: relative;
	padding-bottom: 20px;
}

.htfEmI>:nth-child(2) {
	padding-left: 24px;
	font-size: 13px;
	color: rgb(85, 85, 85);
}

.htfEmI>:nth-child(3) {
	padding-left: 4px;
	font-size: 11px;
	color: rgb(0, 81, 245);
}

.htfEmI>:nth-child(4) {
	font-size: 13px;
	float: right;
}

.htfEmI>:last-child {
	margin-top: 6px;
	font-size: 11px;
	color: rgb(85, 85, 85);
}

.dmFiKX {
	height: 80px;
	line-height: 80px;
	background-color: rgb(250, 250, 250);
	border: 1px dashed rgb(229, 229, 229);
	font-size: 13px;
	text-align: center;
	color: rgb(153, 153, 153);
	cursor: pointer;
}

.ddFwWo {
	position: absolute;
	height: 24px;
	top: 12px;
	right: 12px;
	padding: 3px;
	border: 1px solid rgb(170, 170, 170);
}

.dRiHfk {
	text-align: center;
	height: 100%;
	border: none;
	border-radius: 2px;
	padding: 8px;
	background-color: rgb(61, 130, 247);
	cursor: pointer;
	overflow: visible;
	box-sizing: border-box;
	color: rgb(255, 255, 255);
	font-weight: bold;
	width: inherit;
}
.gongback{
	border: 13px solid white;
}
</style>
<body style="background: white;">
	<script type="text/javascript">
function writeValidate(f)
{
	if(f.name.value==""){
		alert("작성자 이름을 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.contents.focus(); 
		return false;
	} 
}
</script>

	<div id="top">
		<%@include file="../top.jsp"%>
	</div>
	<div class="gongback"></div>
	<div class="container">

		<%@include file="../category.jsp"%>
		<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
		<form name="writeFrm" method="post"
			onsubmit="return writeValidate(this);"
			action="<c:url value="/supports/vocAction.do" />">

			<table class="table">
				<s:authorize access="isAuthenticated()">
					<s:authentication property="name" var="name" />
				</s:authorize>
				<div class="sc-so9ho9-0 krqLio">
					<div class="sc-so9ho9-1 ccRJnQ">
						<span class="i18n-wrapper"><strong>루팡의 중심</strong>은 항상 <strong
							class="mc-voc-bold-blue">고객님</strong>입니다.</span>
					</div>
					<div>
						<span class="i18n-wrapper">루팡을 이용하면서 느끼신 불편사항이나 바라는 점을
							알려주세요.<br>고객님의 소중한 의견으로 한 뼘 더 자라는 쿠팡이 되겠습니다.
						</span>
					</div>
					<div class="sc-so9ho9-2 CijJk">ceo@roupang.com</div>
					<div class="sc-so9ho9-3 dBPfIJ">문의량이 많아 답변은 24시간 이상 소요될 수
						있습니다.</div>
				</div>
					<div class="sc-1uwr20l-0 fGSwLE">
						<div class="sc-2u5cmp-0 ycZdw">
							<select class="sc-46148w-0 cfScjT" class="sc-46148w-1 kplpza"
								name="title" value="배송관련문의">
								<option value="유형을 선택해주세요">유형을 선택해주세요</option>
								<option value="주문 상품 문의">주문 상품 문의</option>
								<option value="쿠팡 서비스 칭찬">쿠팡 서비스 칭찬</option>
								<option value="시스템 개선 의견">시스템 개선 의견</option>
								<option value="시스템(PC/Mobile) 오류 제보">시스템(PC/Mobile) 오류
									제보</option>
								<option value="프레시백 반납 신청">프레시백 반납 신청</option>
								<option value="회수 지연 문의">회수 지연 문의</option>
							</select>
							<div class="sc-1dq8ai8-0 ljlKLR">
								주문내역을 선택하세요
								<div class="sc-1dq8ai8-1 ddFwWo">
									<svg width="16" height="16" focusable="false"
										viewBox="0 0 20 20" aria-hidden="true" role="presentation"
										style="fill: #aaaaaa">
							<path class="xxxxx" fill="#aaaaaa"
											d="M16.667 2.155l1.178 1.178L11.178 10l6.078 6.077.59.59-1.18 1.178-.589-.59L10 11.179l-6.667 6.667-1.178-1.178L8.82 10 2.744 3.923l-.59-.59 1.18-1.178.589.59L10 8.82l6.667-6.666z"></path></svg>
								</div>
							</div>
							<div class="sc-2u5cmp-1 apQSA">
								<button type="button" class="sc-1vm0jpx-4 dRiHfk">주문상품 선택</button>
							</div>
						</div>
						<div class="sc-1wpxynf-0 iSxnmm">
							<textarea name="contents"
								placeholder="의견을 남겨주세요 ※ 문의 답변은 이메일 또는 고객센터>문의내역에서 확인 가능합니다. 전화 연락이 필요하실 경우 [전화필요]를 입력해주세요. ※ 내용 본문과 이미지에 고객님의 개인정보(주민번호 등)가 포함되지 않도록 주의해주세요."
								class="sc-1wpxynf-1 jOGUyo"></textarea>
							<div class="sc-1ov8bm8-0 eaRLIr">
								<div class="sc-1ov8bm8-1 htfEmI">
									<svg width="20" height="20" focusable="false"
										viewBox="0 0 18 18" aria-hidden="true" role="presentation"
										style="fill: rgb(85, 85, 85);">
								<g fill="none" fill-rule="evenodd">
								<path d="M18 18H0V0h18z"></path>
								<path fill="#555555"
											d="M2.25 3V.75h1.5V3H6v1.5H3.75v2.25h-1.5V4.5H0V3h2.25zM4.5 7.5V5.25h2.25V3H12l1.373 1.5h2.377c.825 0 1.5.675 1.5 1.5v9c0 .825-.675 1.5-1.5 1.5h-12c-.825 0-1.5-.675-1.5-1.5V7.5H4.5zm5.25 6.75c2.07 0 3.75-1.68 3.75-3.75 0-2.07-1.68-3.75-3.75-3.75C7.68 6.75 6 8.43 6 10.5c0 2.07 1.68 3.75 3.75 3.75zm-2.4-3.75c0 1.328 1.072 2.4 2.4 2.4 1.328 0 2.4-1.072 2.4-2.4 0-1.328-1.072-2.4-2.4-2.4a2.397 2.397 0 0 0-2.4 2.4z"></path></g></svg>
									<span>이미지 첨부</span><span>20Mb이내 / jpg, png, bmp, gif 만
										가능</span><span>0개 / 최대 3개</span>
									<div>이미지 내 개인정보가 포함되지 않도록 주의 (주민번호, 전화번호 등)</div>
								</div>
								<div class="sc-1ov8bm8-2 dmFiKX">이미지를 여기로 끌어다 놓거나, 여기를 눌러
									파일을 선택하세요.</div>
								<input type="file" accept="image/*" multiple="" />
							</div>
						</div>
						<div class="sc-1uwr20l-1 kbvUIN">
							<button width="180px" class="sc-1vm0jpx-4 jqrURU">보내기</button>
						</div>
					</div>
			</table>
		</form>
		</div>
	<div id="copyright">
		<%@include file="../copyright.jsp"%>
		<!-- 원하는 파일 경로를 삽입하면 된다 -->
	</div>
</body>
</html>