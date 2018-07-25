<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" id="bootstrap-css" type="text/css" media="all"/>

</head>
<body>
<div class="container">
  <div class="row">
  	</p></p></p>
    <div class="col-md-4">
    </div>
    <div class="col-md-4">
			<div class="login-box well">
        <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
            <legend>로그인</legend>
            <div class="form-group">
                <label for="username-email">아이디</label>
                <input value='' name="memberId" id="memberId"  placeholder="E-mail address" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input id="memberPassword"  name="memberPassword" value='' placeholder="Password" type="password" class="form-control" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="로그인" />
            </div>
            <span class='text-center'><a href="${pageContext.request.contextPath}/user/updatePassword" class="text-sm">비밀번호를 잃어버렸나요?</a></span><p>
            <div  style="margin-top: 30px;"/>
            <div class="form-group">
                <p class="text-center m-t-xs text-sm">아직 계정이 없나요?</p> 
                <a href="${pageContext.request.contextPath}/user/signupForm" class="btn btn-default btn-block m-t-md">회원가입</a>
            </div>
        </form>
          </div>
    </div>
    <div class="col-md-4" style="margin-bottom: 20px;">
    </div>    
  </div>
</div>
</body>
</html>