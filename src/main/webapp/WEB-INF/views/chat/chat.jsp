<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating .me{
			color: #F6F6F6;
			text-align: right;
		}
		.chating .others{
			color: #FFE400;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	onload = function (){
		$('#startBtn').trigger('click');
	}
	var webSocket = new WebSocket();
	function webClose(){
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#room_idx").val());
		ws.close;
		location.href = 'login';
	}
	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#room_idx").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	/* 채팅이름을 입력하는 부분 트리거를 통해 벨류값으로 준 email값이 들어가게됨 */
    function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}
	function send() {
		var option ={
			type: "message",
			room_idx: $("#room_idx").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val(),
			member_idx : $('#member_idx').val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>
<body>
	<div id="container" class="container">
		<h1>채팅상담</h1>
		<input type="hidden" id="sessionId" value="${user_id }">
		<input type="hidden" id="room_idx" value="${room_idx}">
			<div id="chating" class="chating">
		<c:forEach items="${selectchat}" var="row">
				<!-- idx부분을 조인을 통해 이름값을 가져오게 수정 -->
				<span style="color: white;">${row.member_idx}:</span>
				<p style="color: white;">${row.chatting }</p>
		</c:forEach>
			</div>
		<div id="yourName">
		
			<table class="inputTable">
				<tr>
					<th>
						<input type="hidden" name="member_idx" id="member_idx"  value="${idx}"><br />
						<input type="hidden" name="userName" id="userName" value="${siteUserInfo }">
					</th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
					<th><button onclick="webClose()" id="closeBtn">종료하기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>