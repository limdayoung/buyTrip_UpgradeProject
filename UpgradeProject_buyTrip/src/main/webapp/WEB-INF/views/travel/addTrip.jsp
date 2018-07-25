<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

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
</head>
<body>


<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.memberId" var="memberId" />
</sec:authorize>

<div class="container">
  <div class="row">
  	</p></p></p>
    <div class="col-md-4">
    </div>
    <div class="col-md-4" align="center">
			<div class="login-box well">
        <form action="${pageContext.request.contextPath}/travel/insert" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="memberId" value="${memberId}"/>  
        <img src="${pageContext.request.contextPath}/resources/images/trip.JPG" class="img-responsive" alt="Cinque Terre" width="130px" height="100px"> 
            <legend>여행 추가 </legend>
            
				<div class="form-group">
					<label for="">출발지</label> <input type="text" class="form-control"
						placeholder="출발나라" size="17"  name="arrivalNation" >
				</div>
				<div class="form-group">
					<label for="">도착지</label> <input type="text" class="form-control"
						placeholder="한국" disabled="disabled" size="17" name="departNation" >
				</div>
				<div class="form-group">
					<label for="">도착날짜</label> <input name="arrivalDate"  type="date" class="form-control date-picker" data-date-format="yyyy-mm-dd"/>
				</div>
				<input type="submit" class="btn btn-default btn-block" value="등록하기">
        </form>
          </div>
    </div>
    <div class="col-md-4" style="margin-bottom: 20px;">
    </div>    
  </div>
</div>
</body>
</html>