<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Chating</title>
<link rel="stylesheet" href="../chatcss/chat.css" type="text/css" />
</head>
<script type="text/javascript">
	var ws;
    onload = function (){
		$('#startBtn').trigger('click');
	} 
	function webClose(){
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#room_idx").val());
		ws.close();
		location.href = '/supports/room.do';
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
						$("#chating").append("<div class='me' style='margin-top:10px;'><div class='sender'>"+d.userName+"</div><div class='b'></div><div class='a'style='padding:6px 8px 0px 5px;'>" + d.msg + "</div></div>");	
					}else{
						$("#chating").append("<div class='others' style='margin-top:10px;'><div class='sender'>"+d.userName+"</div><div class='a'></div><div class='b'></div><div class='b'  style='padding:6px 8px 0px 5px;'>" + d.msg + "</div></div>");
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
		<div id="header">	
			<h3><img src="https://cdn-icons-png.flaticon.com/512/6718/6718168.png
			"style="width: 30px; border: 3px solid #2f7bed; border-radius: 30px; padding: 2px;" />
			<span style="position: absolute; left: 98px;top:48px;">1:1 채팅상담</span><button onclick="webClose()" id="closeBtn">상담 종료하기</button></h3>
		</div>	
		
		<input type="hidden" id="sessionId" value="${user_id }">
		<input type="hidden" id="room_idx" value="${room_idx}">
		<div id="chating" class="chating">
			<div style="justify-content: center; display: flex;">
				${start}
			</div>
			<br />
		<c:forEach items="${selectchat}" var="row">
				<!-- idx부분을 조인을 통해 이름값을 가져오게 수정 -->
				<%-- <span style="color: white;">${row.member_idx}:</span> --%>
				<c:if test="${row.member_idx ne 1 }">
				<div class='me' style='margin-top:10px;'>
				<div class='sender'>고객</div>
				<div class='b'></div>
			    <div class='a'style='padding:6px 8px 0px 5px;'>${row.chatting }</div></div>
				</c:if>
				<c:if test="${row.member_idx eq 1 }">
				<div class='others' style='margin-top:10px;'><div class='sender'>상담사</div>
				<div class='a'></div>
				<div class='b'></div>
				<div class='b'  style='padding:6px 8px 0px 5px;'>${row.chatting }</div></div>
				</c:if>
		</c:forEach>
		</div>
		<div id="yourName">
		
			<table class="inputTable">
				<tr>
					<th> 
						<input type="hidden" name="member_idx" id="member_idx"  value="${idx}"><br />
						<input type="hid den" name="userName" id="userName" value="${username }">
					</th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th><input id="chatting" placeholder="문의 사항을 입력해주세요."></th>
					<th>
						<button style="border : none;background-color: white;" onclick="send()" id="sendBtn">
							<img style="width: 35px; background-color: white;"
							src="https://cdn-icons-png.flaticon.com/512/4436/4436864.png" alt="" />
						</button>
					</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>