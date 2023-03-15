<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Room</title>
<link rel="stylesheet" href="../chatcss/room.css" type="text/css" />
</head>
<script type="text/javascript">
	var ws; 
	window.onload = function(){
		getRoom();
		createRoom();
	}
	function getRoom(){
		commonAjax('/getRoom', "", 'post', function(result){
			createChatingRoom(result);
		});
	}
	function createRoom(){
		$("#createRoom").click(function(){
			
			var msg = {	roomName : $('#roomName').val()	};
			var msg2 = {member_idx : $('#member_idx').val()};
			console.log(msg, msg2);
			commonAjax(
			'/createRoom',
			{roomName : $('#roomName').val(),member_idx : $('#member_idx').val()}, 
			'post', 
			function(result){
				createChatingRoom(result);
			 	$("#gobutton").trigger('click');
			});

			$("#roomName").val("");
			
		});
		
	}
	function goRoom(number, name){
		location.href="/moveChating?roomName="+name+"&"+"room_idx="+number;
	}
	function gotoRoom(number, name){
		location.href="/moveChating?roomName="+name+"&room_idx="+number;
		console.log(name, number);
	}
	function createChatingRoom(res){
		
		if(res != null){
			var tag = "<tr><th class='room'>방 이름</th><th class='go'></th></tr>";
			Array.from(res).forEach(function(d, idx){
				var rn = d.roomName.trim();
				var room_idx = d.room_idx;
				tag += "<tr>"+
							"<th class='room'>${username}님의 채팅방</th>"+
							"<th class='go'><button type='button'id='gobutton' onclick='goRoom(\""+room_idx+"\", \""+rn+"\")'>참여</button></th>" +
						"</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}
	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>
	<div class="container">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList">
			</table>
			<table id="selectList" class="selectList" >
	<!-- member_idx부분을 멤버 이름으로 가져오게 추후 수정 -->
	<c:forEach items="${selectList}" var="row">
				<tr>
					<th class='room' id="roomNamee">${username}님의 채팅방<th>
					<th class='go'>
					<button type="button" onclick="gotoRoom(${row.room_idx},${row.member_idx})" id='gobutton2'>확인하기</button><th>
				</tr>
	</c:forEach> 
			</table>
		</div>
		<div> 
			<table class="inputTable">
				<tr>
			<c:if test="${siteUserInfo ne 'admin' }">
				    <th><input type="hidden" name="member_idx" id="member_idx" value="${idx}"></th>
				    <!-- 멤버 idx는 현재 방 이름을 표현하는중 후에 고객이름으로 변경 -->
				    <th><input type="hidden" name="roomName" id="roomName" value="${idx}"></th>
					<th><button type="button" class="btn btn-primary" id="createRoom">새로운채팅</button></th>
            </c:if>
				</tr>
			</table> 
		</div>
	</div>
</body>
</html>