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

		var isEmailDuplicated = null;

		function validateAllFields() {
			if (isEmailDuplicated != false) {
				alert("이메일 입력이 잘못되었습니다.");
				return false;
			} 

			var isEmailValid = validateEmail();
			var isPasswordValid = validatePassword();
			var isPasswordCheckValid = validatePasswordCheck();
			var isNameValid = validateName();
			var isPhoneNumberValid = validatePhoneNumber();
			var isJuminNumValid = validateJuminNum();
			var isCheckboxValid = validateCheckbox();
			var validationResults = [isEmailValid, isPasswordValid, isPasswordValid, isNameValid, isPhoneNumberValid, isJuminNumValid, isCheckboxValid];
			
			if(validationResults.includes(false)) {
				alert("정보입력이 잘못되었습니다.");
			
				return false;
			}
			alert("회원가입이 완료되었습니다.");
	
		} 
	
		$(function initialize() {
			$('#email').focusout(function() {
				checkEmailDuplication();
				validateEmail();
			});

			$('#password').bind("keyup focusout",function() {
				validatePassword();
			});

			$('#password_check').bind("keyup focusout",function() {
				validatePasswordCheck();
			});

			$('#name').focusout(function() {
				validateName();
			});

			$('#phone_number').focusout(function() {
				validatePhoneNumber();
			});

			$('#jumin_num').focusout(function() {
				validateJuminNum();
			});
			$('input:checkbox[name="must"]:checked').each(function() {
				validateCheckbox();	
			});
		
		});

		function validateEmail() {
			var email = $("#email").val();

			if(email == "") {
				$("emailgo").show();
				$('#emailgo').text('이메일을 입력하세요.').css('color', 'red');
				emailCheck = false;
				
				return false;
			}

			return true;
		}

		function checkEmailDuplication() {
			var email = $("#email").val();

			if(email == "") { 
				return false; 
		
			}
			

			$("#emailgo").hide(); 

			
			$.ajax({
				url : "/checkemail.do",
				type : "post",
				data : {
					email : $('#email').val()
				},
				dataType : 'json',
				success : function (result) {
					if (result == 0) {
						$("#search").hide();
						$('#emailgo1').hide();
					
						isEmailDuplicated = false;
					} else {
						$("#search").show();
						$("emailgo1").show();
						$('#emailgo1').text('이미 가입된 이메일 주소입니다. 다른 이메일을 입력하여 주세요.')
						.css('color', 'red');
						$('#input-id').css("margin-bottom","5px");
					
						isEmailDuplicated = true;
					}	
				}
			});
			
		}

		function validatePassword() {
			var pw = $("#password").val();

			var SamePass_0 = 0; 
			var SamePass_1 = 0; 
			var SamePass_2 = 0; 

			for (var i = 0; i < pw.length; i++) {
				var chr_pass_0 = pw.charAt(i);
				var chr_pass_1 = pw.charAt(i + 1);

				if (chr_pass_0 == chr_pass_1) {
					SamePass_0 = SamePass_0 + 1
				}

				var chr_pass_2 = pw.charAt(i + 2);

				if (chr_pass_0.charCodeAt(0)
					- chr_pass_1.charCodeAt(0) == 1
					&& chr_pass_1.charCodeAt(0)
					- chr_pass_2.charCodeAt(0) == 1) {
					SamePass_1 = SamePass_1 + 1
				}

				if (chr_pass_0.charCodeAt(0)
					- chr_pass_1.charCodeAt(0) == -1
					&& chr_pass_1.charCodeAt(0)
					- chr_pass_2.charCodeAt(0) == -1) {
					SamePass_2 = SamePass_2 + 1
				}
			}
		
			if ((SamePass_0 < 1)
				&& (SamePass_1 < 1 && SamePass_2 < 1)) {
				$('#passwordgo3').hide();
			
			} else {
				$('#passwordgo3').show();
				$('#passwordgo3').text('X 3개 이상 연속되거나 동일한 문자/숫자 제외').css('color', 'red');
				
				return false;
			}

			var strUpper = false, strLower = false, strNumber = false;

		
			
			for (var i = 0; i < pw.length; i++) {
				
				if (pw[i].charCodeAt(0) >= 65 && pw[i].charCodeAt(0) <= 90) {
					strUpper = true;
				}
				
			
				if (pw[i].charCodeAt(0) >= 97 && pw[i].charCodeAt(0) <= 122) {
					strLower = true;
				}

				if (pw[i].charCodeAt(0) >= 48 && pw[i].charCodeAt(0) <= 57) {
					strNumber = true;
				}
			}

			if ((pw.length >= 8 && pw.length < 20)
				&& (strUpper == true)
				&& (strLower == true)
				&& (strNumber == true)) {
				$('#passwordgo5').hide();
			} else {
				$('#passwordgo5').text('X 영문/숫자/대소문자 3가지 이상 조합 (8~20자)').css('color', 'red');
				return false;
			}

			if (pw != "") {
				$("#passwordgo4").hide();
			
				if (pw == $("#email").val()) {
					$('#passwordgo1').html('X 아이디(이메일) 제외').css('color', 'red');
				
					return false;
				}
				else{
					$("#passwordgo1").hide();
				}
				
				
			} else {
				$("#passwordgo4").show();
				$('#passwordgo4').text('비밀번호를 입력하세요.').css('color', 'red');
				return false;
			}
			return true;
			
		}

		function validatePasswordCheck() {
			var p1 = $('#password').val();
			var p2 = $('#password_check').val();

			if (p2 != "") {
				$("#password_checkgo").hide();
			
				if (p1 == p2) {
					$('#passConfirm').html('패스워드가 일치합니다.').css('color',
						'red');
					
				} else {
					$('#passConfirm').html('패스워드가 틀렸습니다.').css('color',
						'black');
					return false;
				}
			} else {
				$("#password_checkgo").show();
				$("#password_checkgo").text('비밀번호를 확인하세요.').css(
					'color', 'red');
		
				return false;
			}
			
			
			return true;
		}

		
		function validateName() {
			var name = $('#name').val();
			strNumber = false;

			for (var i = 0; i < name.length; i++) {

				if (name[i].charCodeAt(0) >= 48
					&& name[i].charCodeAt(0) <= 57) {
					strNumber = true;
				}
			}	

			if(name != ""){
				$("#namego").hide();

				if(strNumber == true){
					$("#namego1").show();
					$('#namego1').text('정확한 이름을 입력하세요.(숫자입력됨)').css('color', 'red');
					return false;		
					
				} else {
					$("#namego1").hide();
				}
			} else if(name == "") {	
				$("#namego").show();
				$('#namego').text('이름을 입력하세요.').css('color', 'red');

				return false;	
			}
			return true;
			
		}

		
		function validatePhoneNumber() {
			var phone_number = $('#phone_number').val();
		
			strNumber = false;

		
			for (var i = 0; i < phone_number.length; i++) {
	
				if (phone_number[i].charCodeAt(0) < 48
					|| phone_number[i].charCodeAt(0) > 57) {
					strNumber = true;
				}
			}	

			if (phone_number != "") {
				$("#phone_numbergo").hide();
		
				if(strNumber == true) {
					$("#phone_numbergo1").show();
					$('#phone_numbergo1').text('휴대폰번호를 숫자로만 입력하세요.').css('color', 'red');
					
					return false;
				}
				 else{
					$("#phone_numbergo1").hide();
				} 
			} else {
				$("#phone_numbergo").show();
				$('#phone_numbergo').text('정확한 휴대폰번호를 입력하세요.').css(
					'color', 'red');

				
				return false;
			}

			
			return true;
		}

	
		function validateJuminNum() {
			var jumin_num = $('#jumin_num').val();
	
			strNumber = false;
			for (var i = 0; i < jumin_num.length; i++) {
		
				if (jumin_num[i].charCodeAt(0) < 48
					|| jumin_num[i].charCodeAt(0) > 57) {
					strNumber = true;
				}
			}	

			if (jumin_num != "") {
				$("#jumin_numgo").hide();
		
				if(strNumber == true){
					$("#jumin_numgo1").show();
					$('#jumin_numgo1').text('생년월일을 숫자로만 입력하세요.').css('color', 'red');
					
					return false;
				}
				else if(strNumber == false){
					$("#jumin_numgo1").hide();
				}
			} else {
				$("#jumin_numgo").show();
				$('#jumin_numgo').text('생년월일을 입력하세요.').css('color', 'red');
				
				return false;
			}

			
			return true;
		}
	
		$(document).on('click', '#checkAll', function() {
		
				var checked = $(this).is(":checked");

			
			if ($('#checkAll').is(':checked')) {
				$('.form-check-input').prop('checked', true);
			} else {
				$('.form-check-input').prop('checked', false);
			}

				if (checked) {
					$(this).parents(".checkbox_group").find('input')
							.prop("checked", true);
				} 
				else {
					$(this).parents(".checkbox_group").find('input')
							.prop("checked", false);
				} 
			 

		});

			
		function checkYn(obj) {
			
			var checked = obj.checked;
			if (checked) {
				marketing_agreement.value = 1;
			} else {
				marketing_agreement.value = 0;
			}

		}
		
		function validateCheckbox(){
			var checkbox = $('input:checkbox[name="must"]:checked').length;

		   	if(checkbox==5){

		   	}
		   	else{
	
		 		return false;
		   	}

			return true;
			
		} 
		

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

		<form action="regist.do" name="registForm" method="post"
			onsubmit="return validateAllFields();">

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
								placeholder="아이디(이메일)"  maxLength=50 />
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
								class="form-control" placeholder="비밀번호"  maxLength=20 />
	
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
								placeholder="비밀번호 확인"  maxLength=20 /> <br />
						</div>
						<div id="password_checkgo"></div>
						<div id="passConfirm"></div>
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person"></i></span>
							<input type="text" name="name" id="name" class="form-control"
								placeholder="이름"  maxLength=20 />
						</div>
						<div id="namego"></div>
						<div id="namego1"></div>
						
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-phone"></i></span>
							<input type="text" name="phone_number" id="phone_number"
								class="form-control" placeholder="휴대폰 번호 ( - 없이 입력)" maxLength=20 />
						</div>
						<div id="phone_numbergo"></div>
						<div id="phone_numbergo1"></div>
	
						<div class="input-group">
							<span class="input-group-text"><i class="bi bi-person-check"></i></span>
							<input type="text" name="jumin_num" id="jumin_num"
								class="form-control" placeholder="생년월일(숫자로만 입력)" 
								maxLength=20 />
						</div>
						<div id="jumin_numgo"></div>
						<div id="jumin_numgo1"></div>
					
						
					<div class="wrap">
						<div class="checkbox_group">
							<div class="form-check">
								
								<input class="form-check-input" type="checkbox" name="checkAll" id="checkAll" onchange="checkYn(this); validateCheckbox();" />
								<label for="checkAll">
								<p>모두 확인하였으며 동의합니다.</p> 
								전체 동의에는 필수 및 선택 정보에 대한 동의가 포함되어 있으며, 개별적으로
									동의를 선택 하실 수 있습니다. 선택 항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다
								</label> 
									
							</div>
							<div class="contents" style="border: solid lightgray 1px;">
							
							<div class="form-check">		
								<input class="form-check-input" type="checkbox" name="must" onchange="validateCheckbox();" id="ageover"  /> 
								<label for="ageover" >
								[필수] 만 14세 이상입니다
								</label> 
							</div>	
							<div class="form-check" >	
								<input class="form-check-input" type="checkbox" name="must" onchange="validateCheckbox();" id="agree" /> 
									<label for="termsOfService" >[필수] 루팡 이용약관 동의 </label>
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
								<input class="form-check-input" type="checkbox" name="must" onchange="validateCheckbox();" id="ebiz"  /> 
									<label for="ebuis" "> [필수] 전자금융거래 이용약관 동의</label> 
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
								<input class="form-check-input" type="checkbox" name="must" onchange="validateCheckbox();"id="privacy" /> 
								<label for="privacyPolicy"> [필수] 개인정보 수집 및 이용 동의</label> 
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
									<input class="form-check-input" type="checkbox" name="must" onchange="validateCheckbox();" id="third"  /> 
									<label for="privacy" > [필수] 개인정보 제3자 제공 동의</label> 
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
								<input class="form-check-input" type="checkbox" name="marketing_agreement" id="marketing_agreement" value="1" onchange="checkYn(this);" />
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
								<input class="form-check-input" type="checkbox" name="agreement" id="advertisment" value="advertisment" /> 
								<label for="advertisment" > [선택] 광고성 정보 수신 동의</label> 
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
								<input class="form-check-input" type="checkbox" name="agreement" id="emailsend" value="email"/> 
								<label for="email"> [선택]이메일 수신 동의</label> 
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