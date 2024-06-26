<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link href="/chatcss/chatStyle.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/CustomerService.css" type="text/css">
<script src="../js/CustomerService.js"></script>
<!-- Custom fonts for this template-->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link rel="stylesheet" href="../css/sb-admin-2.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Blank</title>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
	<div class="container">
		<div class="row clearfix">
			<div class="col-lg-12">
				<div class="card chat-app">
					<div id="plist" class="people-list">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search...">
						</div>
						<ul id="online-user" class="list-unstyled chat-list mt-2 mb-0">
							<!-- master status -->
							<li class="clearfix" onclick="activeToggle(this)" id="master">
							<div class="about">
							<div id="master" class="name">master</div>
								<div id="master-status" class="status">
										<i id="master-status-icon" class="fa fa-circle offline"> </i>
										<span id="master-status-content">offline </span>
								</div>
							</div>
							</li>
						</ul>
					</div>
					<!-- chat section -->
					<div class="chat">
						<div class="chat-header clearfix">
							<div class="row">
								<div class="col-lg-6">
									<a href="javascript:void(0);" data-toggle="modal" data-target="#view_info"></a>
									<div class="chat-about">
										<span id="myId" class="m-b-0" th:text="${session.sessionId}"></span>
									</div>
								</div>
								
							</div>
						</div>
						<div class="chat-history" style="height: 500px;">
							<ul style="overflow-y: scroll; height: 100%;" id="chat-content" class="m-b-0">

							</ul>
						</div>
						<div class="chat-message clearfix">
							<div class="input-group-prepend d-flex mb-0">
								<input id="msg" type="text"
									onkeydown="if(event.keyCode==13){send()}" class="form-control"
									placeholder="Enter text here...">
								<button id="button-send" type="button" class="input-group-text"
									data-toggle="tooltip" data-placement="top" title="send a message">
									<i class="fas fa-paper-plane"></i>
								</button>&nbsp
								<button id="disconn" type="button" class="input-group-text"
									data-toggle="tooltip" data-placement="top" title="Out from chat">
									<i class="fas fa-sign-out-alt"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
			</div>
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2023</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script type="text/javascript" th:inline="javascript">
		 var myId = document.getElementById('myId').textContent;
		 var receiverId;
	     var preOnlineList;
	     var masterStatusContent;  
   		 var preMasterStatus;
	   	 var masterStatus;
		
	   	 if(myId != 'master') {
	   		 receiverId = 'master';
	   	 } else {
		   	 document.getElementById('myImg').src = "starboot/assets/img/user-astronaut-solid.svg";
	   	 }
	   	 
         document.querySelector("#disconn").addEventListener("click", (e) => {
        	// location.href = "/";
        	window.close();
         })
         
         document.querySelector("#button-send").addEventListener("click", (e) => {
	        	send();
         });

         const websocket = new WebSocket("ws://localhost:8586/ws/chat");
	         websocket.onmessage = onMessage;
	         websocket.onopen = onOpen;
	         websocket.onclose = onClose;

         // send a message
         function send(){
            var message = document.getElementById("msg").value;
			// don't send when content is empty
            if(message != "") {			
	        	 let msg = {
	        		 'receiverId' : receiverId,
	        		 'message' : message
	        	 }
	        	 
	             if(message != null) {
	             	websocket.send(JSON.stringify(msg));
	             }
	             document.getElementById("msg").value = '';
	         }
         }
         
         //on exit chat room
         function onClose(evt) {
        	 console.log("close event : " + evt);
         }
         
         //on entering chat room
         function onOpen(evt) {
        	 console.log("open event : " + evt);
         }
	
         // on message controller
         function onMessage(msg) {
        	 masterStatusContent = document.getElementById('master-status-content');     
        	 preMasterStatus = masterStatusContent.innerHTML;
        	 
        	 console.log('msg.data >>> ', msg.data);
        	 var data = JSON.parse(msg.data);
        	 
        	 var onlineList = data.onlineList;
        	 console.log('onlineList >>>> ', onlineList);
        	 
             var senderId = data.senderId;
             console.log('senderId >>> ', senderId)
             // var receiverId = data.receiverId;
             // console.log('receiverId >>> ', receiverId)
             var message = data.message;
             console.log('message >>> ', message)
             var time = data.time;
             console.log('time >>> ', time)
             masterStatus = data.masterStatus;
             console.log('preMasterStatus >>> ', preMasterStatus)
             console.log('masterStatus >>> ', masterStatus)
             var newOne = data.newOne;
             console.log('newOne >>> ', newOne);
             var outOne = data.outOne;
             console.log('outOne >>> ', outOne);
            
            
             
             // when user login
             // first login master -> get all onlined user list
             if(newOne != null) {
            	 console.log("new One is not null");
				if(myId == 'master' && newOne == "master") {
					getOnlineList(onlineList);
				} else if(myId == "master" && newOne != "master") {
					console.log("new one login >>>> " , newOne);
					insertOnlineList(newOne);
				}
             }
             // when user disconnect
             if(outOne != null && myId == 'master') {
            	 console.log("user disconnect >>> ", outOne);
            	 deleteOnlieList(outOne);
             }
             
             // save or show message
             if(myId=='master' && senderId != 'master' && receiverId != senderId) {
            	addStagingMessage(senderId, time, message);
             } else {
			 	insertMessage(senderId, time, message);
             }
			
	         
             // update master status
             updateMasterStatus();
             // scroll down
             scrollDown();
       	 }
         
         // insert a message
         function insertMessage(senderId, time, message) {
        	  var chatContent =  document.querySelector("#chat-content");
              if(senderId == myId) {
             	// insert a message into chat content to myself
                  var li = document.createElement('li');
                  li.classList.add('message-li', 'clearfix', 'float-right');
                  var infoDiv = document.createElement('div');
                  infoDiv.classList.add('message-data');
                  li.appendChild(infoDiv);
                  var timeSpan = document.createElement('span');
                  timeSpan.classList.add('message-data-time');
                  timeSpan.textContent = time;
                  infoDiv.appendChild(timeSpan);
                  var msgDiv = document.createElement('div');
                  msgDiv.classList.add('message', 'my-message');
                  msgDiv.textContent = message;
                  li.appendChild(msgDiv);

                  chatContent.appendChild(li);
              } else {
 				// insert a message into chat content to other
 	            var li = document.createElement('li');
                 li.classList.add('message-li', 'clearfix');
                 var infoDiv = document.createElement('div');
                 infoDiv.classList.add('message-data');
                 li.appendChild(infoDiv);
                 var timeSpan = document.createElement('span');
                 timeSpan.classList.add('message-data-time');
                 timeSpan.textContent = time;
                 infoDiv.appendChild(timeSpan);
                 var msgDiv = document.createElement('div');
                 msgDiv.classList.add('message', 'other-message');
                 msgDiv.textContent = message;
                 li.appendChild(msgDiv);

                 chatContent.appendChild(li);
              }
         }
         
         // save staging messages
         function addStagingMessage(senderId, time, message) {
        	
        	 var container = [];
      		 var data = {
      				 "time":time,
      				 "message":message,
      				 "senderId":senderId
      		 		}
      		 console.log('staging message data >>> ', data)
        	 if(sessionStorage.getItem(senderId) != null) {
        	 	 container = JSON.parse(sessionStorage.getItem(senderId));
        	 	 console.log('stagine message container >>> ', container);
				 container.push(data);
        	 } else {
        		 container.push(data);
        	 }
			 sessionStorage.setItem(senderId, JSON.stringify(container));
			 
			 if(document.getElementById(senderId) != null) {
				 var circle = document.getElementById(senderId).querySelector('.circle');
				 var count = document.getElementById(senderId).querySelector('.circle > .staging-count');
				 var n = count.textContent;
				 if(n == ""){
					 n = 0
				 }
				 n ++;
				 circle.classList.remove('d-none');
				 count.textContent = n;
			 }
         }
         
         // onclick onlined user icon
         function activeToggle(element){
        	 if(!element.classList.contains('active')){
        		 element.classList.add('active');
        	 } else {
        		 element.classList.remove('active');
        	 };
        	 var preReceiverId = receiverId;
        	 receiverId = element.querySelector('.about > .name').textContent;
        	 console.log('<<<< toggleAction >>>>>')
        	 console.log('receiverId >>> ', receiverId);
        	 console.log('preReceiverId >>> ', preReceiverId);
			
        	 if(receiverId != preReceiverId && preReceiverId != null)
	        	 document.getElementById(preReceiverId).classList.remove('active');
        	 
        	 setChatHistory(preReceiverId);
        	 document.getElementById('chat-content').innerHTML = "";
        	 getChatHistory(receiverId);
        	 divideChatSection(receiverId);
        	 if(document.getElementById(receiverId).querySelector('.circle') != null) {
	        	 document.getElementById(receiverId).querySelector('.circle > .staging-count').textContent = "";
	        	 document.getElementById(receiverId).querySelector('.circle').classList.add('d-none');
        	 }
         }
         
	      // insert all users into online list
         function getOnlineList(onlineList){
	        var onlineUser =  document.querySelector("#online-user");
        	onlineUser.innerHTML = "";
			onlineList.forEach(user => {
	        	insertOnlineList(user);
			});        	 
         }
         
         // insert online user list
         function insertOnlineList(user) {
	       	    
        	 if(document.getElementById(user) == null) {
	        	var onlineUser =  document.querySelector("#online-user");
	 	            
	       		var li = document.createElement('li');
	            li.classList.add('clearfix');
	            li.setAttribute('onclick', 'activeToggle(this)');
	            li.setAttribute('id', user);
	            
	            var img = document.createElement('img');
	            var src = "starboot/assets/img/reddit-alien-brands.svg";
	            img.setAttribute('src', src);
	            img.setAttribute('alt', 'guest');
	            
	            var aboutDiv = document.createElement('div');
	            aboutDiv.classList.add('about');
	            var name = document.createElement('div');
	            name.classList.add('name');
	            name.textContent = user;
	            aboutDiv.appendChild(name);
	            
	            var statusDiv = document.createElement('div');
	            statusDiv.classList.add('status');
	            var icon = document.createElement('i');
	            icon.setAttribute('id', 'master-status-icon');
	            icon.classList.add('fa', 'fa-circle', 'online');
	            var span = document.createElement('span');
	            span.setAttribute('id', 'master-status-content');
	            span.textContent = 'online';
	            statusDiv.appendChild(icon);
	            statusDiv.appendChild(span);
	            
	            aboutDiv.appendChild(statusDiv);
	            
	            li.appendChild(img);
	            li.appendChild(aboutDiv);
	         
	            var alertDiv = document.createElement('div');
	            alertDiv.classList.add('circle', 'd-flex', 'align-items-center', 'justify-content-center', 'd-none');
	            aspan = document.createElement('span');
	            aspan.classList.add('staging-count');
	            alertDiv.appendChild(aspan);
	            li.appendChild(alertDiv);
	            
	            onlineUser.appendChild(li);
        	 }
         };
         
         // delete outOne from onlineList
         function deleteOnlieList(outOne) {
	     	var element =  document.getElementById(outOne);
			element.parentNode.removeChild(element);
         }
         
         // insert division of receiver
         function divideChatSection(receiverId){
        	  var div = document.createElement('div');
              div.classList.add('clearfix');
              var str = receiverId + '님과의 대화 시작 ';
              var hr = document.createElement('hr');
           
              div.textContent = str;
              div.appendChild(hr);
              var chatContent =  document.querySelector("#chat-content");
              chatContent.appendChild(div);
              
              scrollDown();
         };
         
         // update master status
         function updateMasterStatus(){
        	 if(preMasterStatus != masterStatus) {
 				var icon = document.getElementById('master-status-icon');
 	            
 				if(masterStatus == "online") {
 	            	 icon.classList.remove('offline');
 	            	 icon.classList.add('online');
 	             } else {
 	            	 icon.classList.remove('online');
 	            	 icon.classList.add('offline');
 	             }
 				masterStatusContent.innerHTML = masterStatus;
 			}
         };
         
         // save chat history
         function setChatHistory(name){
        	 var value =[];
        	 document.querySelectorAll('.message-li').forEach(item => {
        		 
        		 var time = item.querySelector('.message-data > .message-data-time').textContent;
        		 var message = item.querySelector('.message').textContent;
        		 var senderId;
        		 var type = item.querySelector('.message').classList[1];
        		 if(type == 'my-message'){
        			 senderId = myId;
        		 } else {
        			 senderId = name;
        		 }
        		 
        		 data = {
        				 "time":time,
        				 "message":message,
        				 "senderId":senderId
        		 }
        		 value.push(data);
        		 
        	 })
        	 
        	 sessionStorage.setItem(name, JSON.stringify(value));
         };
         
         // insert pre chat history
         function getChatHistory(name){
        	 var data = JSON.parse(sessionStorage.getItem(name));
        	 
        	 if(data != null) {
	        	 data.forEach(item => {
	        		 var time = item.time;
	        		 var message = item.message;
	        		 var senderId = item.senderId;
	        		 
	        		 insertMessage(senderId, time, message);
	        	 })
        	 }
         };
         
         // scroll down event
         function scrollDown() {
             var chatContent =  document.querySelector("#chat-content");
             chatContent.scrollTop = chatContent.scrollHeight;
         };
	</script>
	
	<!-- bootstrap function -->
	<script type="text/javascript">
		$(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<script src="../css/vendor/jquery/jquery.min.js"></script>
	<script src="../css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../css/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="../js/sb-admin-2.min.js"></script>
</body>
</html>