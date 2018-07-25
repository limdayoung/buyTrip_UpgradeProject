<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>


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

</style>
<body style="background-color: #F1F3FA; ">


	<!-- projects -->
					<div class="profile-sidebar">
						<!-- SIDEBAR USERPIC -->
						<c:if test="${not empty userdto.memberImg}">
							<div class="profile-userpic">
								<img
									src="${pageContext.request.contextPath}/resources/member/${userdto.memberImg}"
									class="img-responsive" alt="Cinque Terre">
							</div>
						</c:if>
						<!-- END SIDEBAR USERPIC -->
						<!-- SIDEBAR USER TITLE -->
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">${userdto.memberName}</div>
							<div class="profile-usertitle-job">${userdto.memberId}</div>
						</div>
						<!-- END SIDEBAR USER TITLE -->
						<!-- SIDEBAR BUTTONS -->
						<div class="profile-userbuttons">
							<button type="button" class="btn btn-success btn-sm">Follow</button>
							
						</div>
						<!-- END SIDEBAR BUTTONS -->
						
						<!-- SIDEBAR MENU -->
						
						<div class="profile-usermenu">

							<ul class="nav">
								<li ><a href="${pageContext.request.contextPath}/user/mypage" > <i
										class="glyphicon glyphicon-home"></i> 회원 수정
								</a></li>
								<li><a href="${pageContext.request.contextPath}/order/readOrders" >
								 <i class="glyphicon glyphicon-ok"></i>
								 		주문 내역
								</a></li>
								<li><a href="${pageContext.request.contextPath}/travel/select"> <i class="glyphicon glyphicon-user"></i>
										여행 관리
								</a></li>
								<li><a href="${pageContext.request.contextPath}/deal/readDeals" > <i
										class="glyphicon glyphicon-ok"></i> 배달 관리
								</a></li>
								<li><a href="${pageContext.request.contextPath}/chatList"> <i class="glyphicon glyphicon-flag"></i>
										메세지
								</a></li>
								
							</ul>
							
						</div>
						<!-- END MENU -->
					</div>

