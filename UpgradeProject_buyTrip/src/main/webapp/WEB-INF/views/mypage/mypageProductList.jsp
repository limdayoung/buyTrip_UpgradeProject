<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<script>
function getMypageProdcutList(x) {
	var productIndex = document.getElementById("mypageProdcutList"+x);
	productIndex.submit();

}

$(function(){
	   $("#ww").click(function(){
		   $("#mypageProdcutList2").submit();
	   })
})

$(function(){
	   $("#ee").click(function(){
		   $("#mypageProdcutList3").submit();
	   })
})

$(function(){
	   $("#rr").click(function(){
		   $("#mypageProdcutList4").submit();
	   })
})


</script>

</head>
<body>
				<!--  mypage content -->
					<div class="profile-content">
					
						<!-- head부분 -->
						<h1 class="page-header">등록 주문 관리</h1>
						<!-- content tab부분. -->
						<div>
							<ul class="nav nav-tabs nav-justified">
								<li class="active"><a href="#tabb1" data-toggle="tab">등록
										주문 리스트</a></li>
								<li><a href="#tabb2" data-toggle="tab" >거래중</a></li>
								<li><a href="#tabb3" data-toggle="tab" >거래 완료</a></li>
								<li><a href="#tabb4" data-toggle="tab" >기간 만료</a></li>
							</ul>
							<br>
						</div>

						<!-- list상세부분. -->
						<div class="tab-content">

							<div class="tab-pane fade in active" id="tabb1">
								<div class="container">
									<div class="row">
										<div class="col-md-8">

											<c:choose>
												<c:when test="${empty requestScope.list}">
															<p align="center">
																<b><span style="font-size: 9pt;">등록된 상품이
																		없습니다.</span></b>
															</p>
												</c:when>
												<c:otherwise>
													<c:forEach items="${requestScope.list}" var="productDTO" varStatus="state">
														<form id="mypageProdcutList${state.index}" name="mypageProdcutList"
															method="post" action="${pageContext.request.contextPath}/order/readOrderDetail">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
															<input type="hidden" name="proposerId" value="${productDTO.proposerId}"/>
															<input type="hidden" name="productCode" value="${productDTO.productCode}"/>
															
															
												<!-- 상품 한개 템플릿 -->
												<div class="panel panel-default  panel--styled"
													style="padding: 10px;"
													onclick="getMypageProdcutList(${state.index})">
													<div align="right">
														<h4>마감날짜 : ${productDTO.deadlineDate}</h4>
													</div>
													<div class="row">
														<div class="col-xs-3 col-md-3 text-center">
															<img src="${productDTO.imgList[0]}" alt="bootsnipp"
																class="img-rounded img-responsive"
																style="width: 189px; height: auto;" />
														</div>
														<div class="col-xs-9 col-md-9 section-box"
															style="align-self: center;">
															<h2>${productDTO.productName}</h2>
															<div class="well well-sm">
																<div class="col-sm-6" style="font-size: 15px;">
																	<small>출발지 : </small> ${productDTO.arrivalNation}
																</div>
																<small>도착지 : </small>${productDTO.departNation}<br>
															</div>
															<div class="row">
																<div class="col-sm-5" style="font-size: 20px;">
																	<fmt:formatNumber value="${productDTO.productPrice}" />
																	<small>원</small>
																</div>

															</div>
														</div>
													</div>
												</div>
												<!-- 상품 한개 템플릿 끝 -->
														</form>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>


							<div class="tab-pane fade" id="tabb2">
								<div class="container">
									<div class="row">
										<div class="col-md-8">
										
											
											<c:choose>
												<c:when test="${empty requestScope.list2}">
													<tr>
														<td colspan="5">
															<p align="center">
																<b><span style="font-size: 9pt;">등록된 상품이
																		없습니다.</span></b>
															</p>
														</td>
													</tr>
												</c:when>
												<c:otherwise>

													<c:forEach items="${requestScope.list2}" var="productDTO2">
														<form id="mypageProdcutList2" name="mypageProdcutList"
															method="post"
															action="${pageContext.request.contextPath}/order/readOrderDetail">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
															<input type="hidden" name="proposerId" value="${productDTO2.proposerId}"/>
															<input type="hidden" name="productCode" value="${productDTO2.productCode}"/>
															<input type="hidden" name="tradeState" value="${productDTO2.tradeState}"/>
														

															<!-- 상품 한개 템플릿 -->
															<div class="panel panel-default  panel--styled"
																style="padding: 10px;" id="ww">
																<div align="right">
																	<h4>마감날짜 : ${productDTO2.deadlineDate}</h4>
																</div>

																<div class="row">
																	<div class="col-xs-3 col-md-3 text-center">
																		<img
																			src="${pageContext.request.contextPath}/resources/proImg/${productDTO2.productImg}"
																			class="img-rounded img-responsive"
																			style="width: 189px; height: auto;" />
																	</div>
																	<div class="col-xs-9 col-md-9 section-box"
																		style="align-self: center;">
																		<h2>${productDTO2.productName}</h2>
																		<div class="well well-sm">
																			<div class="col-sm-6" style="font-size: 15px;">
																				<small>출발지 : </small> ${productDTO2.arrivalNation}
																			</div>
																			<small>도착지 : </small>${productDTO2.departNation}<br>
																		</div>
																		<div class="row">
																			<div class="col-sm-5" style="font-size: 20px;">
																				${productDTO2.productPrice}<small>원</small>
																			</div>
																		</div>

																	</div>
																</div>
															</div>
															<!-- 상품 한개 템플릿 끝 -->
														</form>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>


							<div class="tab-pane fade" id="tabb3">
								<div class="container">
									<div class="row">
										<div class="col-md-8">
										
										
								<c:choose>
												<c:when test="${empty requestScope.list3}">
													<tr>
														<td colspan="5">
															<p align="center">
																<b><span style="font-size: 9pt;">등록된 상품이
																		없습니다.</span></b>
															</p>
														</td>
													</tr>
												</c:when>
												<c:otherwise>

													<c:forEach items="${requestScope.list3}" var="productDTO3">
														<form id="mypageProdcutList3" name="mypageProdcutList"
															method="post"
															action="${pageContext.request.contextPath}/order/readOrderDetail">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
															<input type="hidden" name="proposerId" value="${productDTO3.proposerId}"/>
															<input type="hidden" name="productCode" value="${productDTO3.productCode}"/>
															<input type="hidden" name="tradeState" value="${productDTO3.tradeState}"/>

															<!-- 상품 한개 템플릿 -->
															<div class="panel panel-default  panel--styled"
																style="padding: 10px;" id="ee">
																<div align="right">
																	<h4>마감날짜 : ${productDTO3.deadlineDate}</h4>
																</div>

																<div class="row">
																	<div class="col-xs-3 col-md-3 text-center">
																		<img
																			src="${pageContext.request.contextPath}/resources/proImg/${productDTO3.productImg}"
																			class="img-rounded img-responsive"
																			style="width: 189px; height: auto;" />
																	</div>
																	<div class="col-xs-9 col-md-9 section-box"
																		style="align-self: center;">
																		<h2>${productDTO3.productName}</h2>
																		<div class="well well-sm">
																			<div class="col-sm-6" style="font-size: 15px;">
																				<small>출발지 : </small> ${productDTO3.arrivalNation}
																			</div>
																			<small>도착지 : </small>${productDTO3.departNation}<br>
																		</div>
																		<div class="row">
																			<div class="col-sm-5" style="font-size: 20px;">
																				${productDTO3.productPrice}<small>원</small>
																			</div>
																		</div>

																	</div>
																</div>
															</div>
															<!-- 상품 한개 템플릿 끝 -->
														</form>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>



							<div class="tab-pane fade" id="tabb4">
								<div class="container">
									<div class="row">
										<div class="col-md-8">
										<c:choose>
												<c:when test="${empty requestScope.list4}">
													<tr>
														<td colspan="5">
															<p align="center">
																<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
															</p>
														</td>
													</tr>
													</c:when>
													<c:otherwise>
											
													<c:forEach items="${requestScope.list4}" var="productDTO4">
														<form id="mypageProdcutList4" name="mypageProdcutList"
															method="post"
															action="${pageContext.request.contextPath}/order/readOrderDetail">
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
													    <input type="hidden" name="proposerId" value="${productDTO4.proposerId}"/>
														<input type="hidden" name="productCode" value="${productDTO4.productCode}"/>
														<input type="hidden" name="tradeState" value="${productDTO4.tradeState}"/>
														
														<!-- 상품 한개 템플릿 -->
														<div class="panel panel-default  panel--styled"
															style="padding: 10px;" id="rr">
															<div align="right">
																<h4>마감날짜 : ${productDTO4.deadlineDate}</h4>
															</div>

															<div class="row">
																<div class="col-xs-3 col-md-3 text-center">
																	<img
																		src="${pageContext.request.contextPath}/resources/images/159.jpg"
																		alt="bootsnipp" class="img-rounded img-responsive"
																		style="width: 189px; height: auto;" />
																</div>
																<div class="col-xs-9 col-md-9 section-box"
																	style="align-self: center;">
																	<h2>
																		${productDTO4.productName}
																	</h2>
																	<div class="well well-sm">
																		<div class="col-sm-6" style="font-size: 15px;">
																			<small>출발지 : </small> ${productDTO4.arrivalNation}
																		</div>
																		<small>도착지 : </small>${productDTO4.departNation}<br>
																	</div>
																	<div class="row">
																		<div class="col-sm-5" style="font-size: 20px;">
																			${productDTO4.productPrice}<small>원</small>
																		</div>
																		
																	</div>

																</div>
															</div>
														</div>
														<!-- 상품 한개 템플릿 끝 -->
														</form>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>




							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //projects -->

</body>
</html>