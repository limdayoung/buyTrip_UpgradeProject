<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<SCRIPT language=javascript>
   $(function(){
	   $("input[value=회원정보수정]").click(function(){
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/user/updateMemberAction");
		   $("#requestForm").submit();
	   })
	   
	   
	   $("input[value=탈퇴하기]").click(function(){
		   var pwd = prompt("비밀번호를 입력하세요.");
		   if(pwd){
	           $("#password").val(pwd);
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/user/withdraw");
			   $("#requestForm").submit();
		   }
	   })
   })
</script>

<sec:authorize access="isAuthenticated()">
 <form name="requestForm" method="post" id="requestForm">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		아이디 : <input type="text" name="memberId" value="<sec:authentication property="principal.memberId"/>" readonly>
		<br>패스워드 : <input type="text" id="password" name="memberPassword" >	
		<br>이름 : <input type="text" name="memberName" 
		value="<sec:authentication property="principal.memberName"/>" >	
		<br>Mobile : <input type="text" name="mobile" 
		value="<sec:authentication property="principal.mobile"/>" >	
		<br><input type="submit" value="회원정보수정">
		<br><input type="button" id="withdraw" value="탈퇴하기">
		</form>
</sec:authorize>
<h3>회원정보수정</h3>
		
