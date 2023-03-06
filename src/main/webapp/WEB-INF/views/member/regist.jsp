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
	margin-bottom: 30px;
}
</style>
</head>

<body>
	<script>
		function checkYn(obj) {
			var checked = obj.checked;
			if (checked) {
				obj.value = "1";
			} else {
				obj.value = "0";
			}
		}
	</script>
	

	<script>
		$(function() {

			$('#email').focusout(
					function() {
						//var email = $('#email').val();
						if($("#email").val() != ""){
							$("#emailgo").hide();
							console.log("hide");
					     }
						else{
							$("emailgo").show();
							$('#emailgo').text('이메일을 입력하세요.').css('color','red');
							$("#email").focus();
							console.log("show");
					        return false;
						}
						
						$.ajax({
							url : "/checkemail.do",
							type : "post",
							data : {email : $('#email').val()},
							dataType : 'json',
							success : function(result) {

								if (result == 1) {
									$('#showtext1').show();
									$('#showtext1').css({
										'color' : 'red',
										'fontSize' : '15px',
										'fontWeight' : 'bold'
									});
								} else if (result == 0) {
									$('#showtext1').hide();
								}
							}
						});
						
					});
			$('#password').keyup(
					function(){
						if($("#password").val() == $("#email").val()){
							$('#passwordgo1').html('X 아이디(이메일) 제외').css('color',
							'red');
							$("#password").focus();
					        return false;
					     }
					
				});
			
			$('#password').keyup(
					function(){
						var pw = $(this).val();
						
						var SamePass_0 = 0; //동일문자 카운트
						  var SamePass_1 = 0; //연속성(+) 카운드
						  var SamePass_2 = 0; //연속성(-) 카운드
						 
						  for(var i=0; i < pw.length; i++) {
						    var chr_pass_0 = pw.charAt(i);
						    var chr_pass_1 = pw.charAt(i+1);
						    
						    //동일문자 카운트
						    if(chr_pass_0 == chr_pass_1) {
						      SamePass_0 = SamePass_0 + 1
						    }
						    
						    var chr_pass_2 = pw.charAt(i+2);

						    //연속성(+) 카운드
						    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
						      SamePass_1 = SamePass_1 + 1
						    }
						  //연속성(-) 카운드
						    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
						      SamePass_2 = SamePass_2 + 1
						    }

						    
						  }
						  if((SamePass_0 <= 1)&&(SamePass_1 <= 1 && SamePass_2 <= 1 )){
							 $('#passwordgo3').hide();
						    console.log("aa");
						  }
						  else{
							    $('#passwordgo3').show();
							  $('#passwordgo3').text('X 3개 이상 연속되거나 동일한 문자/숫자 제외').css('color', 'red');
							  $('#password').focus();  
							  console.log("bb");
						  } 
						 
						  
							
						
					});
			$('#password').focusout(
					function(){
						if($("#password").val() != ""){
							$("#passwordgo4").hide();
							console.log("hide");
					     }
						else{
							$("#password").show();
							$('#passwordgo4').text('비밀번호를 입력하세요.').css('color','red');
							$("#password").focus();
							console.log("show");
					        return false;
						}
					
				});
			$('#password_check').focusout(
					function(){
						if($("#password_check").val() != ""){
							$("#password_checkgo").hide();
							console.log("hide");
					     }
						else{
							$("#password_checkgo").show();
							$("#password_checkgo").text('비밀번호를 확인하세요.').css('color','red');
							$("#password_check").focus();
							console.log("show");
					        return false;
						}
					
				});
			$('#name').focusout(
				function(){
					if($("#name").val() != ""){
						$("#namego").hide();
						console.log("hide");
				     }
					else{
						$("#namego").show();
						$('#namego').text('이름을 입력하세요.').css('color','red');
						$("#name").focus();
						console.log("show");
				        return false;
					}
				
			});
			$('#phone_number').focusout(
					function(){
						if($("#phone_number").val() != ""){
							$("#phone_numbergo").hide();
							console.log("hide");
					     }
						else{
							$("#phone_numbergo").show();
							$('#phone_numbergo').text('정확한 휴대폰번호를 입력하세요.').css('color','red');
							$("#phone_number").focus();
							console.log("show");
					        return false;
						}
					
			});
			$('#jumin_num').focusout(
					function(){
						if($("#jumin_num").val() != ""){
							$("#jumin_numgo").hide();
							console.log("hide");
					     }
						else{
							$("#jumin_numgo").show();
							$('#jumin_numgo').text('정확한 주민번호를 입력하세요.').css('color','red');
							$("#jumin_num").focus();
							console.log("show");
					        return false;
						}
					
			});
		});
	</script>

	<script>
		$(function() {
			//패스워드 입력란에 입력후 키보드를 땠을때 함수를 실행한다. 
			$('#password')
					.keyup(
							
							function() {
								
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
									$('#confirm1').hide();

								} else {
									$('#confirm1').show();
									$('#confirm1').css({
										'color' : 'red',
										'fontSize' : '12px',
										'fontWeight' : 'bold'
									$('#password').focus();
									});
									
								}
							});
					
			$(".checkbox_group").on(
					"click",
					"#checkAll",
					function() {
						var checked = $(this).is(":checked");

						if (checked) {
							$(this).parents(".checkbox_group").find('input')
									.prop("checked", true);
						} else {
							$(this).parents(".checkbox_group").find('input')
									.prop("checked", false);
						}
					});

			//패스워드 확인을 입력한 후 키보드를 땠을때 검증한다.
			$('#password_check').focusout(
					function() {
						//패스워드입력과 확인 부분의 입력된값을 가져온다. 
						var p1 = $('#password').val();
						var p2 = $(this).val();
						//2개의 값이 일치하는지 확인하여 텍스트를 출력한다. 
						if (p1 == p2) {
							$('#passConfirm').html('패스워드가 일치합니다.').css('color',
									'red');
						} else {
							$('#passConfirm').html('패스워드가 틀렸습니다.').css('color',
									'black');
							$('#password_check').focus();
						}
					});
			
		});
	</script>
	<form action="regist.do" name="data" method="post"
		>

		<div class="container d-flex justify-content-center">
			<!-- 로고이미지 -->
			<a href="#"> <img src="/images/roupang.png"
				style="width: 350px; margin: 40px;">
			</a>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<p>회원정보를 입력해주세요</p>
					<!-- 정보 입력 -->
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-envelope"></i></span>
						<input type="text" name="email" id="email" class="form-control"
							placeholder="아이디(이메일)" required maxLength=50 />
					</div>
					<div id="emailgo"></div>
					<div style="padding-left: 20px;">
					<span id="showtext1" class="confirmChar" style="display: none"> 이미 가입된 이메일 주소입니다. 다른 이메일을 입력하여 주세요</span>
					</div>

					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
						<input type="password" name="password" id="password"
							class="form-control" placeholder="비밀번호" required maxLength=20 />

					</div>
					<div style="padding-left: 20px;">
						<span id="confirm1" class="confirmChar" style="display: none">
							X 영문/숫자/특수문자 2가지 이상 조합 (8~20자)</span> <br /> 
							<div id="passwordgo1"></div>
							<div id="passwordgo2"></div>
							<div id="passwordgo3"></div>
							<div id="passwordgo4"></div>
						<span id="confirm2" class="confirmChar" style="display: none">
							X 3개 이상 연속되거나 동일한 문자/숫자 제외</span> <br /> 
						
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
						<input type="text" name="phone_number" id="phone_number" class="form-control"
							placeholder="휴대폰 번호" required maxLength=20 />
					</div>
					<div id="phone_numbergo"></div>

					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-phone"></i></span>
						<input type="text" name="jumin_num" class="form-control"
							placeholder="주민등록번호(외국인등록번호)" required maxLength=20 />
					</div>
					<div id="jumin_numgo"></div>


					<div class="checkbox_group">
						<input type="checkbox" name="checkAll" id="checkAll" /> <label
							for="checkAll"> 모두 확인하였으며 동의합니다. <br />전체 동의에는 필수 및 선택
							정보에 대한 동의가 포함되어 있으며, 개별적으로 동의를 선택 하실 수 있습니다. 선택 항목에 대한 동의를 거부하시는
							경우에도 서비스 이용이 가능합니다
						</label> 
						<input type="checkbox" name="agreement" id="ageover"value="ageover" /> 
						<label for="ageover" class="required">[필수] 만 14세 이상입니다</label> 
						
						<input type="checkbox" name="agreement" id="termsOfService" value="termsOfService" /> 
						<label for="termsOfService" class="required"> [필수] 쿠팡 이용약관 동의</label> 
						
						<input type="checkbox" name="agreement" id="ebuis" value="ebuis" />
						 <label for="ebuis" class="required"> [필수] 전자금융거래 이용약관 동의</label> 
						 
						 <input type="checkbox" name="agreement" id="privacyPolicy" value="privacyPolicy" required /> 
						 <label for="privacyPolicy" class="required"> [필수] 개인정보 수집 및 이용 동의</label>
						  
						 <input type="checkbox" name="agreement" id="privacy" value="privacy" required /> 
						 <label for="privacy" class="required"> [필수] 개인정보 제3자 제공 동의</label> 
						 
						 <input type="checkbox" name="marketing_agreement"  onchange="checkYn(this);" /> 
						 
						 <input type="hidden" id="use_yn" name="use_yn" value="0">
						 <label for="marketing_agreement"> [선택] 마케팅 목적의 개인정보 수집 및 이용 동의</label> 
						 
						 <input type="checkbox" name="agreement" id="advertisment" value="advertisment" required /> 
						 <label for="advertisment" class="required"> [선택] 광고성 정보 수신 동의</label> 
						 
						 <input type="checkbox" name="agreement" id="email" value="email" required /> 
						 <label for="email" class="required"> [선택]이메일 수신 동의</label> 
						 
						 <input type="checkbox" name="agreement" id="socialmedia" value="socialmedia" required /> 
						 <label for="socialmedia" class="required"> [선택] SMS, SNS 수신 동의</label> 
						 
						 <input type="checkbox" name="agreement" id="apppush" value="apppush" required /> 
						 <label for="apppush" class="required"> [선택]앱 푸시 수신 동의</label>
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

</body>

</html>