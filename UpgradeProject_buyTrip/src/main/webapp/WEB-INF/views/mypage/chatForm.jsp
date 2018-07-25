<%@page import="org.apache.catalina.ha.tcp.SendMessageData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<head>

<style type="text/css">
body {
	background: #F1F3FA;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
	background: #fff;
}

.profile-userpic img {
	float: none;
	margin: 0 auto;
	width: 50%;
	height: 50%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
}

.profile-usertitle-name {
	color: #5a7391;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-userbuttons {
	text-align: center;
	margin-top: 10px;
}

.profile-userbuttons .btn {
	text-transform: uppercase;
	font-size: 11px;
	font-weight: 600;
	padding: 6px 15px;
	margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
	margin-right: 0px;
}

.profile-usermenu {
	margin-top: 30px;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #93a3b5;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	background-color: #f6f9fb;
	border-left: 2px solid #5b9bd1;
	margin-left: -2px;
}

/* Profile Content */
.profile-content {
	padding: 20px;
	background: #fff;
	min-height: 800px;
}

* {
	box-sizing: border-box;
}

body {
	background-color: #edeff2;
	font-family: "Calibri", "Roboto", sans-serif;
}

.chat_window {
	position: absolute;
	width: calc(100% - 20px);
	max-width: 800px;
	height: 90%;
	border-radius: 10px;
	background-color: #fff;
	left: 50%;
	top: 50%;
	transform: translateX(-50%) translateY(-50%);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
	background-color: #f8f8f8;
	overflow: hidden;
}

.top_menu {
	background-color: #fff;
	width: 100%;
	padding: 20px 0 15px;
	box-shadow: 0 1px 30px rgba(0, 0, 0, 0.1);
}

.top_menu .buttons {
	margin: 3px 0 0 20px;
	position: absolute;
}

.top_menu .buttons .button {
	width: 16px;
	height: 16px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 10px;
	position: relative;
}

.top_menu .buttons .button.close {
	background-color: #f5886e;
}

.top_menu .buttons .button.minimize {
	background-color: #fdbf68;
}

.top_menu .buttons .button.maximize {
	background-color: #a3d063;
}

.top_menu .title {
	text-align: center;
	color: #bcbdc0;
	font-size: 20px;
}

.messages {
	position: relative;
	list-style: none;
	padding: 20px 10px 0 10px;
	margin: 0;
	height: 80%;
	overflow: scroll;
}

.messages .message {
	clear: both;
	overflow: hidden;
	margin-bottom: 20px;
	transition: all 0.5s linear;
	opacity: 0;
}

.messages .message.left .avatar {
	background-color: #f5886e;
	float: left;
}

.messages .message.left .text_wrapper {
	background-color: #ffe6cb;
	margin-left: 20px;
}

.messages .message.left .text_wrapper::after, .messages .message.left .text_wrapper::before
	{
	right: 100%;
	border-right-color: #ffe6cb;
}

.messages .message.left .text {
	color: #c48843;
}

.messages .message.right .avatar {
	background-color: #fdbf68;
	float: right;
}

.messages .message.right .text_wrapper {
	background-color: #c7eafc;
	margin-right: 20px;
	float: right;
}

.messages .message.right .text_wrapper::after, .messages .message.right .text_wrapper::before
	{
	left: 100%;
	border-left-color: #c7eafc;
}

.messages .message.right .text {
	color: #45829b;
}

.messages .message.appeared {
	opacity: 1;
}

.messages .message .avatar {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: inline-block;
}

.messages .message .text_wrapper {
	display: inline-block;
	padding: 20px;
	border-radius: 6px;
	width: calc(100% - 85px);
	min-width: 100px;
	position: relative;
}

.messages .message .text_wrapper::after, .messages .message .text_wrapper:before
	{
	top: 18px;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.messages .message .text_wrapper::after {
	border-width: 13px;
	margin-top: 0px;
}

.messages .message .text_wrapper::before {
	border-width: 15px;
	margin-top: -2px;
}

.messages .message .text_wrapper .text {
	font-size: 18px;
	font-weight: 300;
}

.bottom_wrapper {
	position: relative;
	width: 100%;
	background-color: #fff;
	padding: 20px 20px;
	position: absolute;
	bottom: 0;
}

.bottom_wrapper .message_input_wrapper {
	display: inline-block;
	height: 50px;
	border-radius: 25px;
	border: 1px solid #bcbdc0;
	width: calc(100% - 160px);
	position: relative;
	padding: 0 20px;
}

.bottom_wrapper .message_input_wrapper .message_input {
	border: none;
	height: 100%;
	box-sizing: border-box;
	width: calc(100% - 40px);
	position: absolute;
	outline-width: 0;
	color: gray;
}

.bottom_wrapper .send_message {
	width: 140px;
	height: 50px;
	display: inline-block;
	border-radius: 50px;
	background-color: #a3d063;
	border: 2px solid #a3d063;
	color: #fff;
	cursor: pointer;
	transition: all 0.2s linear;
	text-align: center;
	float: right;
}

.bottom_wrapper .send_message:hover {
	color: #a3d063;
	background-color: #fff;
}

.bottom_wrapper .send_message .text {
	font-size: 18px;
	font-weight: 300;
	display: inline-block;
	line-height: 48px;
}

.message_template {
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {
		
	// 채팅치면 DB에 바로 insert
		$('#btn').click(
				function(e) {
					$.ajax({
						url : "insertMessage",
						type : "post",
						data : $('#inForm').serialize(),//폼전송(name=value) 
						dataType : "text",
						success : function(result) {
							//alert(result);
							$('#messageContent').val("");
							
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
					
					


				});
	


		// 채팅치면 DB에 바로 insert
		$('#messageContent').keyup(function(e) {
					if (e.which===13) {
						$.ajax({
							url : "insertMessage",
							type : "post",
							data : $('#inForm').serialize(),//폼전송(name=value) 
							dataType : "text",
							success : function(result) {
								//alert(result);
								$('#messageContent').val("");
								
							},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n" + "message:"
										+ request.responseText + "\n" + "error:"
										+ error);
							}
						})
					}

				});


	 
	
	});
	
	$(function () {
	    var Message;
	    Message = function (arg) {
	        this.text = arg.text, this.message_side = arg.message_side;
	        this.draw = function (_this) {
	            return function () {
	                var $message;
	                $message = $($('.message_template').clone().html());
	                $message.addClass(_this.message_side).find('.text').html(_this.text);
	                $('.messages').append($message);
	                return setTimeout(function () {
	                    return $message.addClass('appeared');
	                }, 0);
	            };
	        }(this);
	        return this;
	    };
	    $(function () {
	        var getMessageText, message_side, sendMessage;
	        message_side = 'right';
	        getMessageText = function () {
	            var $message_input;
	            $message_input = $('.message_input');
	            return $message_input.val();
	        };
	        sendMessage = function (text) {
	            var $messages, message;
	            if (text.trim() === '') {
	                return;
	            }
	            $('.message_input').val('');
	            $messages = $('.messages');
	            message_side = message_side === 'right' ? 'right' : 'right';
	            message = new Message({
	                text: text,
	                message_side: message_side
	            });
	            message.draw();
	            return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
	        };
	        $('.send_message').click(function (e) {
	            return sendMessage(getMessageText());
	        });
	        $('.message_input').keyup(function (e) {
	            if (e.which === 13) {
	                return sendMessage(getMessageText());
	            }
	        });
	    })
	})
	        
	        
</script>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberId" var="memberId" />
		<sec:authentication property="principal.memberName" var="memberNameC" />
		<sec:authentication property="principal.memberImg" var="memberImgC" />
	</sec:authorize>
	<!-- projects -->
	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">

					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="${memberImgC}" class="img-circle" alt="Cinque Terre">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${memberNameC}</div>

					</div>
					<!-- END SIDEBAR USER TITLE -->

					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="#"> <i
									class="glyphicon glyphicon-home"></i> 회원 수정
							</a></li>
							<li><a href="travelList"> <i
									class="glyphicon glyphicon-user"></i> 여행 관리
							</a></li>
							<li><a href="mypageProductList"> <i
									class="glyphicon glyphicon-ok"></i> 주문 관리
							</a></li>
							<li><a href="chatList"> <i
									class="glyphicon glyphicon-flag"></i> 메세지
							</a></li>
							<li><a href="#"> <i class="glyphicon glyphicon-flag"></i>
									알림
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->

				</div>


			</div>
			<div class="col-md-9">
				<div class="profile-content">

					<!-- content부분 -->

					<div class="chat_window">
						<div class="top_menu">
							<div class="buttons">
								<div class="button close"></div>
								<div class="button minimize"></div>
								<div class="button maximize"></div>
							</div>
							<div class="title">${userId } 님과의 메세지</div>
						</div>

						<ul class="messages">
							
							<c:forEach items="${list}" var="MessageDTO">
								<c:if test="${MessageDTO.senderId == memberId}">
									<li class="message right appeared"><div class="avatar"
											src="https://scontent-lht6-1.cdninstagram.com/vp/92601a3bb3cbd3fcb97cf8187a6c9a49/5BB79A18/t51.2885-19/s150x150/23417198_467133683687359_9147387558513082368_n.jpg"></div>
										<div class="text_wrapper">
											<div class="text">${MessageDTO.messageContent}</div>
										</div>
								</c:if>

								<c:if test="${MessageDTO.receiverId == memberId}">
									<li class="message left appeared"><div class="avatar"></div>
										<div class="text_wrapper">
											<div class="text">${MessageDTO.messageContent}</div>
										</div>
								</c:if>

							</c:forEach>
							

						</ul>

						<form name="insertMessage" method="post" id="inForm">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"> <input type="hidden"
								name="userId" value="${userId}">
							<div class="bottom_wrapper clearfix">
								<div class="message_input_wrapper">
									<input type="text" id="messageContent" class="message_input"
										placeholder="Type your message here..." name="messageContent" />
								</div>
								<div class="send_message" id="btn">
									<div class="icon"></div>
									<div class="text"></div>
								</div>
								<div class="text"></div>
							</div>

							<div class="message_template">
								<li class="message">
									<div class="avatar">
									
									</div>
									<div class="text_wrapper">

										<div class="text">111</div>
									</div>
								</li>
							</div>


						</form>
					</div>


				</div>
			</div>
		</div>
	</div>


	</div>
	<!-- //projects -->

	<!-- //projects -->


</body>
</html>