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
	font-family: "Calibri", "Roboto", sans-serif; . user_name { font-size :
	14px;
	font-weight: bold;
}

.comments-list .media {
	border-bottom: 1px dotted #ccc;
}
</style>
<script type="text/javascript">
	
	function getChatFormIndex(x) {
		var chatFormIndex = document.getElementById("chatForm"+x);
		chatFormIndex.submit();
	}
	

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
						<div class="profile-usertitle-name">${memberNameC }</div>

					</div>

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

					<div class="container">
						<div class="row">
							<div class="col-md-8">
								<div class="page-header">
									<h1>
										<small class="pull-right">읽지 않은 메세지 : ${count }</small> 메세지
									</h1>
								</div>
								
								<c:forEach items="${list}" var="list" varStatus="state">
									<form action="${pageContext.request.contextPath }/chatForm" id="chatForm${state.index}" method="post" >
										<input type="hidden" name="userId" value="${list.userId}">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />


										<div class="comments-list">


											<div class="media">

												<p class="pull-right">
													<c:if test="${list.unread != 0}">
													<span class='badgeAlert'>
													
													${list.unread}
													
													</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</c:if>
													<small> ${list.sendTime }  </small>
												</p>
												<a class="media-left"  style="width: 10%;"> <img
													src="${list.memberImg}" class="img-circle">
												</a>
												<div class="media-body" onclick="getChatFormIndex(${state.index})">
												
												<h4 class="media-heading user_name">${list.memberName}</h4>
													${list.messageContent }
													
												</div>
												<hr>

											</div>



										</div>
										

									</form>
								</c:forEach>
							</div>
						</div>

					</div>




				</div>
			</div>
		</div>

	</div>
	<!-- //projects -->

	<!-- //projects -->
	<script type="text/javascript">
		
	</script>

</body>
</html>