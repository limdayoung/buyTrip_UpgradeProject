<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/json2.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var sock = null;
	var message = {};
	
	$(document).ready(function(){
		
		sock = new SockJS("/controller/echo-ws")
		
		sock.onopen = function(){
			
			message = {};
			message.message = "반갑습니다!!";
			message.type = "all";
			message.to = "all";
			
			sock.send(JSON.stringify(message));
		}
		sock.onmessage = function(evt){
			$("#chatMessage").append(evt.data + "<br/>");
		}
		sock.onclose = function(){
			sock.send("퇴장ㅇㅇㅇㅇㅇㅇ");
		}
		$("#sendMessage").click(function(){
			if($("#message").val() != "") {
				
				message = {};
				message.message = $("#message").val();
				message.type = "all";
				message.to = "all";
				
				var to = $("#to").val();
				if(to != "") {
					message.type = "one";
					message.to = to;
				}
				
				
				sock.send(JSON.stringify(message));
				$("#chatMessage").append("나 -> " + $("#message").val() + "<br/>");
				
				$("#message").val("")
			}
		})
	})
	
	
	
	
	
	//부트스트랩 적용
	
	
</script>
</head>
<body>
<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberId" var="memberId" />
		<sec:authentication property="principal.memberName" var="memberNameC" />
		<sec:authentication property="principal.memberImg" var="memberImgC" />
	</sec:authorize>
<h4>Chatting Page</h4>

<c:forEach items="${hostList }" var="list">
	${list}
</c:forEach>


<c:choose>
	<c:when test="${memberId ne 'admin@buytrip.com'}">
	<input type="text" id="to" value="0:0:0:0:0:0:0:1" hidden/>
	</c:when>
	<c:otherwise>
	<input type="text" id="to"/>
	</c:otherwise>
</c:choose>
<input type="text" id="message"/>
<input type="button" id="sendMessage" value="메시지 보내기"/>
<div id="chatMessage" style="overFlow:auto; max-height:500px"></div>

</body>
</html>