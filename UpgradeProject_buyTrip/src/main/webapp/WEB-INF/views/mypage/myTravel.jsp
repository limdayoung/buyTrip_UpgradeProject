<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

</style>
</head>

<body>
<div class="container-fluid">
	
	<div class="row" style="height: 200px; background-color: #ddfdff; vertical-align: middle;">
		<div class="container" style="padding-left: 200px; padding-right: 200px;">
			<div class="row" style="margin-top: 40px;">
					<div class="col-md-12">
							<h3>여행기간 : 2018-06-11</h3>
							<h1>${requestScope.arrNation} <i class="fa fa-plane"></i> ${requestScope.deNation} </h1>
					</div>
			</div>
		</div>
	</div>

	<div class="container" style="padding-left: 200px; padding-right: 200px;">
		<div class="row" >
			<ul class="nav nav-tabs nav-justified">
		    <li class="active"><a href="#">주문</a></li>
		    <li><a href="#">오퍼</a></li>
		    <li><a href="#">배달완료</a></li>
		    <li><a href="#">기간만료</a></li>
	 	 	</ul>
	 	</div>
	 	
	 	
	 	<div class="row" style="margin-top: 20px; float: right; margin-right: 20px;">
		 	<!-- 정렬기능 -->
		 	<div class="dropdown">
		    <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">정렬
		    <span class="caret"></span></button>
		    <ul class="dropdown-menu">
		      <li><a href="#">가격순</a></li>
		      <li><a href="#">최신등록순</a></li>
		      <li><a href="#">인기순</a></li>
		    </ul>
	  	</div>
	  	<!-- /정렬기능 -->
	 	</div>
	 	
	 	<div class="row">

				<c:choose>
					<c:when test="${empty requestScope.searchProductList}">
						<tr>
							<td colspan="5">
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestScope.searchProductList}" var="productDTO">
							<!-- 주문 list -->
							<div class="col-sm-12">
								<div class="well well-sm"
									onclick="location.href='${pageContext.request.contextPath}/detail'"
									style="background-color: white; padding: 10px; margin: 20px">
									<div class="row">
										<div class="col-sm-2" style="margin-bottom: 15px;">
											<img
												src="${productDTO.memberImg}"
												class="avatar img-circle" alt="avatar"
												style="width: 50px; height: auto;">
										</div>
										<div class="col-sm-4">
											<span>${productDTO.proposerId}</span></br> <span>요청날짜 :${productDTO.requestedDate}</span>
										</div>
										<div class="col-sm-6" align="right">
											<h5>마감날짜 : ${productDTO.deadlineDate}</h5>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-3 col-md-3 text-center">
											<img
												src="${productDTO.productImg}"
												alt="bootsnipp" class="img-rounded img-responsive"
												style="width: 189px; height: auto;" />
										</div>
										<div class="col-xs-9 col-md-9 section-box"
											style="align-self: center;">
											<h2>
												${productDTO.productName} <a href="http://bootsnipp.com/" target="_blank"><span
													class="glyphicon glyphicon-new-window"> </span></a>
											</h2>
											<div class="well well-sm">
												<div class="col-sm-6" style="font-size: 15px;">
													<small>출발지 : </small> ${productDTO.arrivalNation}
												</div>
												<small>도착지 : </small>${productDTO.departNation}<br>
											</div>
											<div class="row">
												<div class="col-sm-7" style="font-size: 20px;">
													금 액 : ${productDTO.productPrice} <small>원</small>
												</div>
												<div class="col-sm-5" align="right">
													<button type="button" class="btn btn-info">제안하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- / 주문 list -->
								</c:forEach>
													</c:otherwise>
												</c:choose>
												
			</div>
	</div>

</body>
</html>