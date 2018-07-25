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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- /css -->
   <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function() {
	  
	//아이디 중복체크
	 $("#passWord").click(function() {
// 		alert(1);
		var data =  $("#memberId").val();
// 		var data=$(this).val().trim();
      	$.ajax({
  			type:"POST",
  			url:"${pageContext.request.contextPath}/user/idcheckAjax",				
  			data:"${_csrf.parameterName}=${_csrf.token}&&memberId="+data,	
  			success:function(data){						
  				if(data=="fail"){
  					var data1 =  {"email": $("#memberId").val()}
  					alert("가입한 메일을 확인해 보세요.");		
  					$.ajax({
  						url : "emailAuthPass",
  			            data : data1,
  			            success : function(data1){
  			            }
  					})
  				}else{						
  					alert("입력하신 아이디를 찾을수 없습니다.")
  					return false;
  				}					
  			}//callback			
  		});//ajax
		
		
	}) 
})
  
  </script>
</head>
<body>

<div class="container">
  <div class="row">
  	</p></p></p>
    <div class="col-md-4">
    </div>
    <div class="col-md-4">
			<div class="login-box well">
         <form action="${pageContext.request.contextPath}/user/updatePassword">
             <legend>비밀번호 찾기</legend>
             <div class="form-group">
                 <label for="username-email">아이디</label>
                 <input value='' id="memberId" name="memberId" placeholder="E-mail address" type="text" class="form-control" />
             </div>                                              
             <div class="form-group">
                 <input type="submit" id ="passWord" class="btn btn-default btn-login-submit btn-block m-t-md" value="비밀번호 찾기" />
             </div>
             <div  style="margin-top: 30px;"/>
             <span class='text-center'><a href="${pageContext.request.contextPath}/" class="text-sm">메인으로 돌아가기</a></span><p>
         </form>
      </div>
    </div>
    <div class="col-md-4">
    </div>    
  </div>
</div>

</body>
</html>