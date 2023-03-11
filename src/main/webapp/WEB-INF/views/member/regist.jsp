<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<head>
<meta charset="UTF-8">
<title>join</title>
<style>
p {
	font-weight: bold;
	font-size: 18px;
}

body {
	font-family: dotum, sans-serif;
}

input {
	width: 450px;
	height: 60px;
}

.input-group {
	width: 450px;
	margin-bottom: 30px;
}
.checkbox_group {
	padding-top: 20px;
	border-top: solid 1px lightgray; 
	width: 450px;
	margin-bottom: 30px;
	
}
.contents{
	margin-top: 30px;
	padding-top: 20px;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}
label {
 
  font-size: 14px;
}
table {
font-size: 12px;


</style>
</head>

<body>
	<script>
		var kcheck = true;

		function chkcheck() {

			alert(kcheck);
			if (kcheck == false) {
				console.log("회원가입불가");
				alert('회원가입불가');
				return false;
			} else {

				console.log("회원가입완료");
				alert('회원가입 완료되었습니다.');
			}

		}

		$(function() {

			$('#email').on("blur", function() {
				//var email = $('#email').val();
				if ($("#email").val() != "") {
					$("#emailgo").hide();
					console.log("이메일입력됨");
				} else {
					$("emailgo").show();
					$('#emailgo').text('이메일을 입력하세요.').css('color', 'red');

					console.log("이메일 미입력");
					kcheck = false;
					return false;
				}
				kcheck = true;
				console.log(kcheck);

				$.ajax({
					url : "/checkemail.do",
					type : "post",
					data : {
						email : $('#email').val()
					},
					dataType : 'json',
					success : sucCallBack,
				});

			});
			function sucCallBack(result) {

				if (result == 0) {
					$("#search").hide();
					$('#emailgo1').hide();
					console.log("이메일사용가능");
				} else {
					$("#search").show();
					$("emailgo1").show();
					$('#emailgo1').text('이미 가입된 이메일 주소입니다. 다른 이메일을 입력하여 주세요.')
							.css('color', 'red');
					$('#input-id').css("margin-bottom","5px");
					console.log("이메일 중복에러");
					kcheck = false;
					return false;
				}
				kcheck = true;
				console.log(kcheck);

			}

			/* let aaa = 1;
			$('#password').focus(function(){
				console.log("aaaa");
				if(aaa==1){
					$("#email").focus();
				}
			}); */

			$('#password')
					.bind(
							"keyup focusout",
							function() {
								var pw = $(this).val();

								var SamePass_0 = 0; //동일문자 카운트
								var SamePass_1 = 0; //연속성(+) 카운드
								var SamePass_2 = 0; //연속성(-) 카운드

								for (var i = 0; i < pw.length; i++) {
									var chr_pass_0 = pw.charAt(i);
									var chr_pass_1 = pw.charAt(i + 1);

									//동일문자 카운트
									if (chr_pass_0 == chr_pass_1) {
										SamePass_0 = SamePass_0 + 1
									}

									var chr_pass_2 = pw.charAt(i + 2);

									//연속성(+) 카운드
									if (chr_pass_0.charCodeAt(0)
											- chr_pass_1.charCodeAt(0) == 1
											&& chr_pass_1.charCodeAt(0)
													- chr_pass_2.charCodeAt(0) == 1) {
										SamePass_1 = SamePass_1 + 1
									}
									//연속성(-) 카운드
									if (chr_pass_0.charCodeAt(0)
											- chr_pass_1.charCodeAt(0) == -1
											&& chr_pass_1.charCodeAt(0)
													- chr_pass_2.charCodeAt(0) == -1) {
										SamePass_2 = SamePass_2 + 1
									}
								}
								if ((SamePass_0 <= 1)
										&& (SamePass_1 <= 1 && SamePass_2 <= 1)) {
									$('#passwordgo3').hide();
									console.log("동일한 문자 3개이하");
								} else {
									$('#passwordgo3').show();
									$('#passwordgo3').text(
											'X 3개 이상 연속되거나 동일한 문자/숫자 제외').css(
											'color', 'red');
									console.log("3개 이상 연속되거나 동일한 문자/숫자 ");
									kcheck = false;
									console.log(kcheck);
									return false;
								}
								kcheck = true;
								console.log(kcheck);

								var inputVal = $(this).val();
								console.log("입력", inputVal);
								var strUpper = false, strLower = false, strNumber = false;

								//입력한 패스워드의 길이만큼 반복하여 모든 문자를 검사한다. 
								for (var i = 0; i < inputVal.length; i++) {
									//입력값의 아스키코드를 확인해본다.
									console.log("아스키코드값", inputVal[i]
											.charCodeAt(0));

									//입력한 문자열 중에 아래조건에 맞는 문자가 하나라도 존재하면 true로 
									//변경해준다.

									//대문자인지 확인
									if (inputVal[i].charCodeAt(0) >= 65
											&& inputVal[i].charCodeAt(0) <= 90) {
										strUpper = true;
									}
									//소문자인지 확인
									if (inputVal[i].charCodeAt(0) >= 97
											&& inputVal[i].charCodeAt(0) <= 122) {
										strLower = true;
									}
									//숫자인지 확인
									if (inputVal[i].charCodeAt(0) >= 48
											&& inputVal[i].charCodeAt(0) <= 57) {
										strNumber = true;
									}
								}
								if ((inputVal.length >= 8 && inputVal.length < 20)
										&& (strUpper == true)
										&& (strLower == true)
										&& (strNumber == true)) {
									$('#passwordgo5').hide();
								} else {

									$('#passwordgo5').text(
											'X 영문/숫자/특문자 2가지 이상 조합 (8~20자)')
											.css('color', 'red');
									kcheck = false;
									console.log(kcheck);
									return false;

								}
								kcheck = true;
								console.log(kcheck);

								if ($("#password").val() != "") {
									$("#passwordgo4").hide();
									console.log("hide");

									if ($("#password").val() == $("#email")
											.val()) {
										$('#passwordgo1').html('X 아이디(이메일) 제외')
												.css('color', 'red');
										kcheck = false;
										console.log(kcheck);
										return false;
									}
									kcheck = true;
									console.log(kcheck);
								} else {
									$("#password").show();
									$('#passwordgo4').text('비밀번호를 입력하세요.').css(
											'color', 'red');

									console.log("비밀번호 미입력");
									kcheck = false;
									console.log(kcheck);
									return false;
								}
								kcheck = true;
								console.log(kcheck);

							});

			$('#password_check').bind(
					"keyup focusout",
					function() {

						var p1 = $('#password').val();
						var p2 = $(this).val();

						if (p1 == p2) {
							$('#passConfirm').html('패스워드가 일치합니다.').css('color',
									'red');
						} else {
							$('#passConfirm').html('패스워드가 틀렸습니다.').css('color',
									'black');
							kcheck = false;
							return false;

						}
						kcheck = true;
						console.log(kcheck);

						if ($("#password_check").val() != "") {
							$("#password_checkgo").hide();
							console.log("비밀번호확인 입력완료");
						} else {
							$("#password_checkgo").show();
							$("#password_checkgo").text('비밀번호를 확인하세요.').css(
									'color', 'red');

							console.log("비밀번호확인 미입");
							kcheck = false;
							return false;

						}
						kcheck = true;
						console.log(kcheck);
					});

			$('#name').focusout(function() {
				if ($("#name").val() != "") {
					$("#namego").hide();
					console.log("이름입력완료");
				} else {
					$("#namego").show();
					$('#namego').text('이름을 입력하세요.').css('color', 'red');

					console.log("이름미입력");
					kcheck = false;
					return false;
				}
				kcheck = true;
				console.log(kcheck);

			});
			$('#phone_number').focusout(
					function() {
						if ($("#phone_number").val() != "") {
							$("#phone_numbergo").hide();
							console.log("휴대폰번호 입력완료");
						} else {
							$("#phone_numbergo").show();
							$('#phone_numbergo').text('정확한 휴대폰번호를 입력하세요.').css(
									'color', 'red');

							console.log("휴대폰번호 미입력");
							kcheck = false;
							return false;
						}
						kcheck = true;
						console.log(kcheck);

					});
			$('#jumin_num').focusout(
					function() {
						if ($("#jumin_num").val() != "") {
							$("#jumin_numgo").hide();
							console.log("주민번호 입력완료");
						} else {
							$("#jumin_numgo").show();
							$('#jumin_numgo').text('정확한 주민번호를 입력하세요.').css(
									'color', 'red');

							console.log("주민번호 미입력");
							kcheck = false;
							return false;
						}
						kcheck = true;
						console.log(kcheck);
					});
		});
	</script>

	<script>
		function checkYn(obj) {
			var checked = obj.checked;
			if (checked) {
				obj.value = 1;

			} else {
				obj.value = 0;
			}
			console.log(obj.value);
		}

		$(function() {

			$(".checkbox_group").on("click","#checkAll",function(){
				var checked = $(this).is(":checked");

				if (checked) {
					$(this).parents(".checkbox_group").find('input')
							.prop("checked", true);
				} 
				else {
					$(this).parents(".checkbox_group").find('input')
							.prop("checked", false);
				}
			});
		});
		$(function(){ 
			
			$('#loadUseBtn').click(function(){
				$('#loadUse').load('./txt/roupangUse1');
				
			});	
		});	
		$(function(){ 
			
			$('#ebizUseBtn').click(function(){
				$('#ebizUse').load('./txt/ebizUse');
				
			});	
		});
		
	</script>
	<div class="container d-flex justify-content-center">
		<form action="/regist.do" name="registForm" method="post" onsubmit="return chkcheck();">
	
			<div class="container d-flex justify-content-center">
				<!-- 로고이미지 -->
				<a href="/"> <img src="/images/roupang.png"
					style="width: 350px; margin: 40px;">
				</a>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-3"></div>
					<div class="col-6">
						<p>회원정보를 입력해주세요</p>
						<!-- 정보 입력 -->
						<div class="input-group" id="input-id">
							<span class="input-group-text"><i class="bi bi-envelope"></i></span>
							<input type="text" name="email" id="email" class="form-control"
								placeholder="아이디(이메일)" required maxLength=50 />
						</div>
						<span style="font-size: 14px;" id="text"></span>
						<div class="mb-2 ms-4" style="display: none" id="search">
							<button class="hidden-btn" onclick="location.href='/myLogin.do'">
								<span class="hidden-text">로그인</span>
							</button>
							<button class="hidden-btn">
								<span class="hidden-text">비밀번호 찾기</span>
							</button>
						</div>
						<div id="emailgo"></div>
						<div id="emailgo1"></div>
						<div style="padding-left: 20px;"></div>
	
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
							<input type="password" name="password" id="password"
								class="form-control" placeholder="비밀번호" required maxLength=20 />
	
						</div>
						<div style="padding-left: 20px;">
							<span id="confirm1" class="confirmChar" style="display: none">
								X 영문/숫자/특수문자 2가지 이상 조합 (8~20자)</span> 
							<div id="passwordgo1"></div>
							<div id="passwordgo2"></div>
							<div id="passwordgo3"></div>
							<div id="passwordgo4"></div>
							<div id="passwordgo5"></div>
	
						</div>
	
						<div class="input-group">
							<span class="input-group-text"><i
								class="bi bi-shield-check"></i></span> <input type="password"
								name="password_check" id="password_check" class="form-control"
								placeholder="비밀번호 확인" required maxLength=20 /> <br />
						</div>
						<div id="password_checkgo"></div>
						<div id="passConfirm"></div>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person"></i></span>
							<input type="text" name="name" id="name" class="form-control"
								placeholder="이름" required maxLength=20 />
						</div>
						<div id="namego"></div>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-phone"></i></span>
							<input type="text" name="phone_number" id="phone_number"
								class="form-control" placeholder="휴대폰 번호" required maxLength=20 />
						</div>
						<div id="phone_numbergo"></div>
	
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person-check"></i></span>
							<input type="text" name="jumin_num" id="jumin_num"
								class="form-control" placeholder="주민등록번호(외국인등록번호)" required
								maxLength=20 />
						</div>
						<div id="jumin_numgo"></div>
					
						
					<div class="wrap">
						<div class="checkbox_group">
							<div class="form-check">
								
								<input class="form-check-input" type="checkbox" name="checkAll" id="checkAll" onchange="checkYn(this);" />
								<label for="checkAll" class="required">
								<p>모두 확인하였으며 동의합니다.</p> 
								전체 동의에는 필수 및 선택 정보에 대한 동의가 포함되어 있으며, 개별적으로
									동의를 선택 하실 수 있습니다. 선택 항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다
								</label> 
									
							</div>
							<div class="contents" style="border: solid lightgray 1px;">
							
							
							
							<div class="form-check">		
								<input class="form-check-input" type="checkbox" name="agreement" id="ageover" value="ageover" /> 
								<label for="ageover" class="required">
								[필수] 만 14세 이상입니다
								</label> 
							</div>	
							<div class="form-check" >	
								<input class="form-check-input" type="checkbox" name="agreement" id="termsOfService" value="termsOfService" /> 
									<label for="termsOfService" class="required">[필수] 루팡 이용약관 동의 </label>
									<span style="float:right" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
										 <i class="bi bi-chevron-right" id="loadUseBtn"></i>
									</span>
							</div>	
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel1">루팡 이용약관 동의</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div id="loadUse" class="modal-body">
							       
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="agreement" id="ebuis" value="ebuis" /> 
									<label for="ebuis" class="required"> [필수] 전자금융거래 이용약관 동의</label> 
									<span style="float:right" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
										 <i class="bi bi-chevron-right" id="ebizUseBtn"></i>
									</span>
							</div>	
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel2">전자금융거래 이용약관 동의</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div id="ebizUse" class="modal-body">
							       
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="agreement" id="privacyPolicy" value="privacyPolicy" required /> 
								<label for="privacyPolicy" class="required"> [필수] 개인정보 수집 및 이용 동의</label> 
									<span style="float:right" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">
											 <i class="bi bi-chevron-right" id="personInfo"></i>
									</span>
							</div>	
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel3" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel3">개인정보 수집 및 이용 동의</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div id="personInfo" class="modal-body">
							      <div class="join__terms-box join__terms-box--text-area _joinTermsTarget" 
						             id="join-terms-privacy-collect-use">
						    			[필수] 개인정보 수집 및 이용 동의약관
						    		</div>
							      	<table class="table table-bordered">
									    <thead>
									    <tr>
									        <th>항목</th>
									        <th>목적</th>
									        <th>보유 및 이용 기간</th>
									    </tr>
									    </thead>
									    <tbody>
									    <tr>
									        <td>아이디(이메일), 이름, 휴대폰번호, 비밀번호</td>
									        <td >회원 가입 및 이용자 식별, 회원관리</td>
									        <td rowspan="2"><span class="emphasis">회원탈퇴 시 90일간 보관 후 파기</span></td>
									    </tr>
									    <tr>
									        <td>아이디(이메일), 이름, 휴대폰번호, 서비스 이용기록, 연령 및 성별</td>
									        <td>개인화 서비스 제공</td>
									    </tr>
									    <tr>
									        <td>부정행위 탐지된 아이디(이메일), 이름, 휴대폰번호, 부정행위 기록</td>
									        <td>부정행위 방지</td>
									        <td><span class="emphasis">회원탈퇴 시 180일간 보관 후 파기</span></td>
									    </tr>
									    </tbody>
										</table>
										<div style="font-size:12px;">연령 및 성별 정보는 회원 가입 이후 본인 확인을 진행한 이용자에 한해 활용됩니다.</div>
										<div style="font-size:12px;">동의를 거부할 수 있으나 동의 거부 시 서비스 이용이 제한됩니다.</div>
									
									</div>
							      </div>
							      
							    </div>
							  </div>
							
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="agreement" id="privacy" value="privacy" required /> 
								<label for="privacy" class="required"> [필수] 개인정보 제3자 제공 동의</label> 
									<span style="float:right" data-bs-toggle="modal" data-bs-target="#staticBackdrop4">
											 <i class="bi bi-chevron-right" id="infoUse"></i>
									</span>
							</div>	
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop4" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel4" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel4">개인정보 제3자 제공 동의</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div id="infoUse" class="modal-body">
							       <div class="join__terms-box join__terms-box--text-area _joinTermsTarget" id="agree-to-collect-third-part-information">
	    								[필수] 개인정보 제 3자 제공 동의에 대한 약관
									</div>
									<table class="table table-bordered">
									    <thead>
									    <tr>
									        <th>개인정보</br>제공 받는 자</th>
									        <th>개인정보</br>제공 항목</th>
									        <th>개인정보</br>제공 목적</th>
									        <th>개인정보</br>이용 기간</th>
									    </tr>
									    </thead>
									    <tbody>
									    <tr>
									        <td><b>루팡페이 주식회사</b></td>
									        <td>루팡 아이디</td>
									        <td><b>루팡캐시 서비스 제공</b></td>
									        <td><b>전자상거래법에 의해 5년간 보관 후 파기</b></td>
									    </tr>
									    </tbody>
									</table>
									<div style="font-size:12px;">제공에 동의하지 않을 수 있으나, 동의하지 않으면 회원 가입에 제한이 됩니다.</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="marketing_agreement" id="marketing_agreement" value="" onchange="checkYn(this);" />
								<label for="marketing_agreement"> [선택] 마케팅 목적의 개인정보 수집 및 이용 동의</label> 
									<span style="float:right" data-bs-toggle="modal" data-bs-target="#staticBackdrop5">
											 <i class="bi bi-chevron-right" id="marketing"></i>
									</span>
							</div>	
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop5" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel5" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel5">마케팅 목적의 개인정보 수집 및 이용 동의</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div id="marketing" class="modal-body">
								      <div class="join__terms-box join__terms-box--text-area _joinTermsTarget" id="POLICY_AGREE_COLLECT">
										[선택] 마케팅 목적의 개인정보 수집 및 이용 동의
										</div>
										<table class="table table-bordered">
										    <thead>
										    <tr>
										        <th>항목</th>
										        <th>목적</th>
										        <th>보유 및 이용 기간</th>
										    </tr>
										    </thead>
										    <tbody>
										    <tr>
										        <td>서비스 이용기록, 연령 및 성별</td>
										        <td><span class="emphasis">인구통계학적 특성과 이용자의 관심 및 성향의 추정을 통한 맞춤형 광고에 활용</span></td>
										        <td><span class="emphasis">동의 철회 시 맞춤형 광고 차단, 회원 탈퇴 시 파기 </span></td>
										    </tr>
										    <tr>
									            <td>아이디(이메일), 휴대폰번호</td>
									            <td><span class="emphasis">루팡 아이디를 이용하는 서비스의 마케팅 및 프로모션 </span></td>
									            <td><span class="emphasis">회원 탈퇴 시 파기</span></td>
									        </tr>
										    </tbody>
										</table>
										<div style="font-size:12px;">연령 및 성별 정보는 회원 가입 이후 본인 확인을 진행한 이용자에 한해 활용됩니다.</div>
										<div style="font-size:12px;">동의를 거부할 수 있으며, 동의를 거부하셔도 서비스를 이용하실 수 있습니다.</div> 
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="agreement" id="advertisment" value="advertisment" required /> 
								<label for="advertisment" class="required"> [선택] 광고성 정보 수신 동의</label> 
									<span style="float:right" data-bs-toggle="modal" data-bs-target="#staticBackdrop6">
												 <i class="bi bi-chevron-right" id="adInfo"></i>
									</span>
							</div>	
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop6" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel6" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel6">광고성 정보 수신 동의</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div id="adInfo" class="modal-body">
							       <div class="join__terms-box join__terms-box--text-area _joinTermsTarget" id="agree-to-receive-ads">
	    								[선택] 광고성 정보 수신 동의
									</div><br />
									<div style="font-size:14px;">
									루팡은 회원님이 수집 및 이용에 동의한 개인정보를 이용하여 SMS(MMS), SNS 메시지, 이메일, 푸시 알림 등 다양한 전자적 전송 매체를 통해 오전 8시부터 오후 9시까지 개인 맞춤형 광고 및 정보를 전송할 수 있습니다.
									</div>
									<div style="font-size:14px;">
									    본 동의는 거부하실 수 있으나, 거부 시 이벤트 및 프로모션 안내, 유용한 광고를 받아보실 수 없습니다.
									</div>
									<div style="font-size:14px;">
									    광고성정보수신의 변경은
									</div>
									<div style="font-size:14px;">
									    1) 루팡 고객센터(1577-7011, <a href="mailto:help@roupang.com">help@roupang.com</a>)로 요청하거나<br/>
									    2) SMS, 이메일: 웹 브라우저에서 루팡에 로그인 > 마이루팡 > MY정보(개인정보확인/수정) > 수신설정<br/>
									    3) SNS: 각 SNS의 설정 내 수신 차단 메뉴<br/>
									    4) 푸시알림: 루팡 앱 로그인> 마이루팡> 이름 선택(내정보관리) > 푸시 설정에서 언제든지 변경할 수 있습니다.
									</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="agreement" id="email" value="email" required /> 
								<label for="email" class="required"> [선택]이메일 수신 동의</label> 
							</div>	
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="agreement" id="socialmedia" value="socialmedia" required /> 
								<label for="socialmedia" class="required"> [선택] SMS, SNS 수신 동의</label> 
							</div>	
							<div class="form-check">	
								<input class="form-check-input" type="checkbox" name="agreement" id="apppush" value="apppush" required /> 
								<label for="apppush" class="required"> [선택]앱 푸시 수신 동의</label>
							</div>
						</div>
					</div>	
					</div>	
	
						<button type="submit" class="btn btn-primary"
							style="width: 470px; height: 60px;">
							<span style="font-weight: bold; font-size: 20px;">동의하고 가입하기</span>
						</button>
	
						<!-- </form>-->
					</div>
					<div class="input-group"></div>
				</div>
	
				<div class="col-3"></div>
			</div>
		</form>
	</div>
</body>

</html>