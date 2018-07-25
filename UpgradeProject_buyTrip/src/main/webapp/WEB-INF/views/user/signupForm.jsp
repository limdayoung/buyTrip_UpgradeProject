<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
	
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
    $(function () {
        var chk = -1;
        var chkPass = -1;
        var checkResultId="";
        
        $("#get_auth").click(function () {
            var data = {"email": $("#email").val()};
            var authNum = "";
            
            $.ajax({
                url : "emailAuth",
                data : data,
                success : function (data) {
                    alert("인증번호 전송완료.");
                    authNum = data;
                    
                    $("#auth_btn2").click(function() {
                    	chk = checkNum(authNum);
            			
            			if( chk > 0){
                         alert("인증완료");
                         chk = 1;
                         $("#lab1").html("<label>인증완료</label>");
                     }else{
                         alert("인증실패");
                         $("#lab1").html("<label>인증실패</label>");
                     }
            		})
                }
            });
        });// 이메일 인증 버튼 end
        
        //아이디 중복체크
        $("#email").keyup(function() {
        	var memberId=$(this).val().trim();
        	
        	$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/user/idcheckAjax",				
    			data:"${_csrf.parameterName}=${_csrf.token}&&memberId="+memberId,	
    			success:function(data){						
    				if(data=="fail"){
    				$("#idCheckView").html("  "+memberId+" 이미 존재하는 아이디 입니다. ").css("color","red");
    					checkResultId="";
    				}else{						
    					$("#idCheckView").html("  "+memberId+" 사용 가능합니다.!! ").css("color","blue");		
    					checkResultId=memberId;
    				}					
    			}//callback			
    		});//ajax
		})
		
		
		//비밀번호 확인
		$(":password").keyup(function() {
			if($("#password").val()==$("#checkPassword").val()){
				$("#passCheckView").html("비밀번호 일치!").css("color", "blue");
				chkPass=1;
			}else{
				$("#passCheckView").html("비밀번호 불일치!").css("color", "red");
				chkPass=-1;
			}
		})
        
        
        //회원가입
        $("#regForm").submit(function() {
    		if($("#regForm :input[name=memberId]").val().trim()==""){
    			alert("아이디를 입력하세요");				
    			return false;
    		}
    		if(checkResultId==""){
    			alert("아이디 중복확인을 하세요");
    			return false;
    		}
    		if($("#regForm :input[name=memberPassword]").val().trim()==""){
    			alert("비밀번호를 입력하세요");				
    			return false;
    		}
    		if($("#regForm :input[id=checkPassword]").val().trim()==""){
    			alert("비밀번호확인을 입력하세요");				
    			return false;
    		}
    		if(chkPass<0){
            	alert("패스워드를 확인하세요");
    			return false;
    		}
    		if($("#regForm :input[name=memberName]").val().trim()==""){
    			alert("이름을 입력하세요");				
    			return false;
    		}
    		if($("#regForm :input[name=mobile]").val().trim()==""){
    			alert("전화번호를 입력하세요");				
    			return false;
    		}
    			
            if( chk > 0  ){
                return true;
            }else{
                alert("이메일 인증을 완료하여 주세요.");
                return false;
            }
    	})
    });
</script>
<script type="text/javascript">
    function checkNum(authNum) {
        var chk = 0;
        var user_authNum = $("#user_authNum").val();
        
        // 인증번호 비교
        if (authNum == user_authNum) {
            chk = 1;
//             $("#user_authNum").val(user_authNum);
        } else {
            chk = -1;
        }
        return chk;
    };
    
    
    
 
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
                    <form action="${pageContext.request.contextPath}/user/signup" id="regForm">
                        <legend>회원가입</legend>
                        <div class="form-group">
                            <label for="username-email">아이디</label>
                            <input value='' name="memberId" id="email" placeholder="E-mail address" type="text" class="form-control" />
                            <div id="idCheckView"></div>
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input id="password" name="memberPassword" value='' placeholder="Password" type="password" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호확인</label>
                            <input id="checkPassword" name="memberPassword" value='' placeholder="Password" type="password" class="form-control" />
                            <div id="passCheckView"></div>
                        </div>
                        <div class="form-group">
                            <label for="username-email">이름</label>
                            <input value='' name="memberName" id="username-email" placeholder="name" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="username-email">전화번호</label>
                            <input value='' name="mobile" id="phone" placeholder="전화번호" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="username-email">인증하기</label>
                            <input type="text" id="user_authNum" name="user_authNum" class="form-control"><div id="lab1"></div><br>
                            <button type="button" id="get_auth">인증번호 받기</button>
                            <button type="button" id="auth_btn2">인증하기</button>
                        </div>
        				
        					
        					                                            
                        <div class="form-group">
                            <input type="submit" id="signUp_btn" class="btn btn-default btn-login-submit btn-block m-t-md" value="회원가입" />
                        </div>
                        <div  style="margin-top: 30px;"/>
                        <div class="form-group">
                            <p class="text-center m-t-xs text-sm">이미 계정이 있나요?</p> 
                            <a href="${pageContext.request.contextPath}/user/loginForm" class="btn btn-default btn-block m-t-md">로그인</a>
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