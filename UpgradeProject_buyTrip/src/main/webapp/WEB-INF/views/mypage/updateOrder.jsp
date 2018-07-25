<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>Prefabrication a Real Estate  Category Flat Bootstrap responsive Website Template | Contact :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Prefabrication Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css" type="text/css" media="all" />
<!--// css -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<style type="text/css">
input[type="number"], input[type="date"], textarea{
    border: 1px solid #ccc;
    font-size: 1em;
    color: #828282;
    background: none;
    width: 100%;
    padding: .8em 1em;
    outline: none;
}
input[type="submit"] {
    padding: .6em 1em;
    color: #fff;
    font-size: 1.1em;
    background: #6bcad2;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
    -ms-transition: 0.5s all;
    transition: 0.5s all;
    outline: none;
    margin: 1em 0 0;
    width: 100%;
    border: 1px solid #6bcad2;
    letter-spacing: 4px;
    text-transform: uppercase;
}
textarea {
    min-height: 8em;
    resize: none;
}
input, textarea{
		margin: 10px 0 10px 0;	
}
.contact-left{
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	float:none;
}
</style>
<script type="text/javascript">


    </script>
</head>
<body>

	<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class="row">
				<div class="w3ls-title">
					<h3 class="agileits-title w3title1">상품 수정</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4" align="center">
					<img src="${pageContext.request.contextPath}/resources/images/159.jpg" class="img-circle" alt="Cinque Terre"/>
				</div>
			</div>
			<div class="row">	
				<!-- 상품수정 폼 -->
				<form action="${pageContext.request.contextPath}/order/updateOrder?${_csrf.parameterName}=${_csrf.token}" method="post">
			    <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
				<input type="hidden" name="productCode" value="${productDTO.productCode}"/> 
				
					<div class="col-sm-6 contact-left">
						<p>상품 이미지 (적어도 한장이상)</p>
						<input type="file" name="productImg" value="${productDTO.productImg}" >
						<p>상품이름</p>
						<input type="text" name="productName" value="${productDTO.productName}" disabled="disabled">
						<p>상품 상세 설명</p>
						<textarea name="productDesc">${productDTO.productDesc}</textarea>
						<p>상품 URL</p>
						<input type="text" name="productUrl" value="${productDTO.productUrl}">
						<p>상품가격+커미션</p>
						<input type="number" name="productQty" value="${requestScope.productDTO.productQty}">
						<p>상품 수량</p>
						<input type="number" name="productPrice" value="${requestScope.productDTO.productPrice}">
						<p>출발/도착나라</p>
						<input type="text" name="arrivalNation" value="${productDTO.arrivalNation}">
						<input type="text" name="departNation" value="한국" disabled="disabled">
						<p>희망 날짜</p>
						<input type="date"  id="deadlineDate" name="deadlineDate">
						<p>요청사항</p>
						<textarea name="requirement" >${productDTO.requirement}</textarea>
						<input type="submit" value="수정하기">
					</div>
					<div class="clearfix"></div>
				</form>
				<!--/ 상품수정 폼 -->
			</div>
		</div>
	</div>
	<!-- //contact -->

</body>
</html>