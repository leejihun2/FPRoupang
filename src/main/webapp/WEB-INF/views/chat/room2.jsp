<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Room</title>
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
		.roomContainer{
			background-color: #F6F6F6;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.roomList{
			border: none;
		}
		.roomList th{
			border: 1px solid #FFBB00;
			background-color: #fff;
			color: #FFBB00;
		}
		.roomList td{
			border: 1px solid #FFBB00;
			background-color: #fff;
			text-align: left;
			color: #FFBB00;
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 350px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
		}
		.selectList{
			border: none;
		}
		.selectList th{
			background-color: #fff;
			color: #FFBB00;
		}
		.selectList td{
			border: 1px solid #FFBB00;
			background-color: #fff;
			text-align: left;
			color: #FFBB00;
		}
		.selectList .num{
			width: 75px;
			text-align: center;
		}
		.selectList .room{
			width: 350px;
		}
		.selectList .go{
			width: 71px;
			text-align: center;
		}
		button{
			background-color: #0099ff;
			font-size: 14px;
			color: white;
			border: 1px solid #0099ff;
			border-radius: 5px;
			padding: 3px;
			margin: 3px;
		}
		.inputTable th{
			padding: 5px;
		}
		.inputTable input{
			width: 330px;
			height: 25px;
		}
	</style>
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
			var tag = "<tr><th class='num'>고객명</th><th class='room'>방 이름</th><th class='go'></th></tr>";
			Array.from(res).forEach(function(d, idx){
				var rn = d.roomName.trim();
				var room_idx = d.room_idx;
				tag += "<tr>"+
							"<th class='num'>"+(idx+1)+"</th>"+
							"<th class='room'>"+ rn +"</th>"+
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
			<table id="roomList" class="roomList"></table>
			<table id="selectList" class="selectList">
	<!-- member_idx부분을 멤버 이름으로 가져오게 추후 수정 -->
	<c:forEach items="${selectList}" var="row">
				<tr>
					<th class='num' id="member_idxx">${row.member_idx}<th>
					<th class='room' id="roomNamee">${row.room_idx}<th>
					<th class='go'>
				<button type="button" onclick="gotoRoom(${row.room_idx},${row.member_idx})" id='gobutton2'>참여</button><th>
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
					<th><button class="btn btn-primary" id="createRoom">새로운채팅</button></th>
            </c:if>

				</tr>
			</table>
		</div>
	</div>
</body>
</html>