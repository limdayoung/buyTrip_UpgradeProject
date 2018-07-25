<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<SCRIPT language=javascript>
   $(function(){
	       $("input[value=회원정보수정]").click(function(){
	    	   
	    	   if($("#requestForm :input[id=password]").val().trim()==""){
	   			alert("현재비밀번호를 입력하세요");				
	   			return false;
	   		}
	   		if($("#requestForm :input[id=newPassword]").val().trim()==""){
	   			alert("새로운 비밀번호를 입력하세요");				
	   			return false;
	   		}
	   		if($("#requestForm :input[id=CheckNewPassword]").val().trim()==""){
	   			alert("비밀번호확인을 입력하세요");				
	   			return false;
	   		}
	   		if(chkPass<0){
	        alert("패스워드를 확인하세요");
	   			return false;
	   		}
	   		if($("#requestForm :input[name=memberName]").val().trim()==""){
	   			alert("이름을 입력하세요");				
	   			return false;
	   		}
	   		if($("#requestForm :input[name=mobile]").val().trim()==""){
	   			alert("전화번호를 입력하세요");				
	   			return false;
	   		}
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/user/updateMemberAction?${_csrf.parameterName}=${_csrf.token}");
		   $("#requestForm").submit();
	   })
	   
	    $("input[value=탈퇴하기]").click(function(){
			   var pwd = prompt("정말 탈퇴하시겠습니까? \n비밀번호를 입력해주세요.");
			   if(pwd){
		           $("#memberPassword").val(pwd);
				   $("#requestForm").attr("action", "${pageContext.request.contextPath}/user/withdraw");
				   $("#requestForm").submit();
			   }
		   })
		   
		   
	//비밀번호 확인 일치여부
	$("#CheckNewPassword").keyup(function() {
		if($("#newPassword").val()==$("#CheckNewPassword").val()){
			$("#passCheckView").html("비밀번호 일치!").css("color", "blue");
			chkPass=1;
		}else{
			$("#passCheckView").html("비밀번호 불일치!").css("color", "red");
			chkPass=-1;
		}profile-userpic
	})
   })
</script>

					<div class="profile-content">
						<h1 class="page-header">회원 정보 수정</h1>

						<c:if test="${not empty userdto.memberImg}">
							<div class="text-center">
								<img
									src="${pageContext.request.contextPath}/resources/member/${userdto.memberImg}"
									class="avatar img-circle" alt="" style="width: 150px; height: 150px;">
									<img
									src="${userdto.memberImg}"
									class="avatar img-circle" alt="" style="width: 150px; height: 150px;">
							</div>
						</c:if>
						
						<br><br>
						<!-- edit form column -->
						<div>
						<sec:authorize access="isAuthenticated()">
							<form class="form-horizontal" name="requestForm" method="post" id="requestForm" role="form" enctype="multipart/form-data">
								<input type="file" name="file" class="text-center center-block well well-sm">
								<div class="form-group">
									<label class="col-md-3 control-label">사용자  아이디 :</label>
									<div class="col-md-8">
										<input id="memberId" name="memberId" class="form-control" value="<sec:authentication property="principal.memberId"/>" type="email" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">현재 비밀 번호:</label>
									<div class="col-md-8">
										<input class="form-control" id="password" name="password" value="" type="password">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">새로운 비밀 번호:</label>
									<div class="col-md-8">
										<input class="form-control" id="newPassword" name="memberPassword" value="" type="password">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">비밀 번호 확인:</label>
									<div class="col-md-8">
										<input class="form-control" id="CheckNewPassword" value="" type="password">
									</div>
									
								</div>
								<div class="form-group">
									<div class="col-md-8" margin>
										<div id="passCheckView"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">이           름:</label>
									<div class="col-md-8">
										<input class="form-control" name="memberName" value="<sec:authentication property="principal.memberName"/>" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">전화        번호:</label>
									<div class="col-md-8">
										<input class="form-control" name="mobile" value="<sec:authentication property="principal.mobile"/>" type="text">
									</div>
								</div>
								
								<div class="form-group" align="center">
									<div class="row">
										<input class="btn btn-primary" value="회원정보수정"
											type="submit"> <span></span> <span></span><input
											class="btn btn-default" value="Cancel" type="reset">
									</div>
									
									<div class="row">
									<input type="button" class="btn btn-danger btn-sm" id="withdraw" style="margin:30px; width:25%" value="탈퇴하기"/>
									  
									  </div>
									
								</div>
							</form>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //projects -->
