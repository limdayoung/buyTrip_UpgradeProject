<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

				<!--  mypage content -->
					<div class="profile-content">
						<!-- head부분 -->
						<h1 class="page-header">거래 관리</h1>
						<!-- content tab부분. -->
						<div>
							<ul class="nav nav-tabs nav-justified">
								<li class="active"><a href="#tabb1" data-toggle="tab">배달 대기</a></li>
								<li><a href="#tabb2" data-toggle="tab">배달 확정</a></li>
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
												<c:when test="${empty requestScope.offerJoinProductListYet}">
													<tr>
														<td colspan="5">
															<p align="center">
																<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
															</p>
														</td>
													</tr>
													</c:when>
													<c:otherwise>
													<c:forEach items="${requestScope.offerJoinProductListYet}" var="offerJoinProductDTO">
														<!-- 상품 한개 템플릿 -->
														<div class="panel panel-default  panel--styled"
															style="padding: 10px;" 
															onclick="location.href='${pageContext.request.contextPath}/order/readOrderDetail?productCode=${offerJoinProductDTO.productDTO.productCode}'">
															<div align="right">
																<h4>마감날짜 : ${offerJoinProductDTO.productDTO.deadlineDate}</h4>
															</div>

															<div class="row">
																<div class="col-xs-3 col-md-3 text-center">
																	<img
																		src="${offerJoinProductDTO.productDTO.imgList[0]}"
																		alt="bootsnipp" class="img-rounded img-responsive"
																		style="width: 189px; height: auto;" />
																</div>
																<div class="col-xs-9 col-md-9 section-box"
																	style="align-self: center;">
																	<h2>
																		${offerJoinProductDTO.productDTO.productName} <a href="http://bootsnipp.com/" target="_blank"><span
																			class="glyphicon glyphicon-new-window"> </span></a>
																	</h2>
																	<div class="well well-sm">
																		<div class="col-sm-6" style="font-size: 15px;">
																			<small>출발지 : </small> ${offerJoinProductDTO.productDTO.arrivalNation}
																		</div>
																		<small>도착지 : </small>${offerJoinProductDTO.productDTO.departNation}<br>
																	</div>
																	<div class="row">
																		<div class="col-sm-5" style="font-size: 20px;">
																			${offerJoinProductDTO.productDTO.productPrice}<small>원</small>
																		</div>
																		<div class="col-sm-7" align="right">
																			<button type="button" class="btn btn-info"
																				onclick="location.href='${pageContext.request.contextPath}/order/readOrderDetail?productCode=${offerJoinProductDTO.productDTO.productCode}'">상세보기</button>
																			<form method="POST" action="deleteDeal">
																				<input type="hidden" name="offerCode" value="${offerJoinProductDTO.offerCode}"/>
																				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
																				<input type="submit" class="btn btn-info" value="배달 취소"/>
																			</form>
																		</div>
																	</div>

																</div>
															</div>
														</div>
														<!-- 상품 한개 템플릿 끝 -->

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
												<c:when test="${empty requestScope.offerJoinProductListAccepted}">
													<tr>
														<td colspan="5">
															<p align="center">
																<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
															</p>
														</td>
													</tr>
													</c:when>
													<c:otherwise>
													<c:forEach items="${requestScope.offerJoinProductListAccepted}" var="offerJoinProductDTO">
														<!-- 상품 한개 템플릿 -->
														<div class="panel panel-default  panel--styled"
															style="padding: 10px;" 
															onclick="location.href='${pageContext.request.contextPath}/order/readOrderDetail?productCode=${offerJoinProductDTO.productDTO.productCode}'">
															<div align="right">
																<h4>마감날짜 : ${offerJoinProductDTO.productDTO.deadlineDate}</h4>
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
																		${offerJoinProductDTO.productDTO.productName} <a href="http://bootsnipp.com/" target="_blank"><span
																			class="glyphicon glyphicon-new-window"> </span></a>
																	</h2>
																	<div class="well well-sm">
																		<div class="col-sm-6" style="font-size: 15px;">
																			<small>출발지 : </small> ${offerJoinProductDTO.productDTO.arrivalNation}
																		</div>
																		<small>도착지 : </small>${offerJoinProductDTO.productDTO.departNation}<br>
																	</div>
																	<div class="row">
																		<div class="col-sm-5" style="font-size: 20px;">
																			${offerJoinProductDTO.productDTO.productPrice}<small>원</small>
																		</div>
																		<div class="col-sm-7" align="right">
																			<button type="button" class="btn btn-info"
																				onclick="location.href='${pageContext.request.contextPath}/order/readOrderDetail?productCode=${offerJoinProductDTO.productDTO.productCode}'">상세보기</button>
																			<form method="POST" action="deleteDeal">
																				<input type="hidden" name="offerCode" value="${offerJoinProductDTO.offerCode}"/>
																				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
																				<input type="submit" class="btn btn-info" value="배달 취소"/>
																			</form>
																		</div>
																	</div>

																</div>
															</div>
														</div>
														<!-- 상품 한개 템플릿 끝 -->

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
												<c:when test="${empty requestScope.offerJoinProductListExpired}">
													<tr>
														<td colspan="5">
															<p align="center">
																<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
															</p>
														</td>
													</tr>
													</c:when>
													<c:otherwise>
													<c:forEach items="${requestScope.offerJoinProductListExpired}" var="offerJoinProductDTO">
														<!-- 상품 한개 템플릿 -->
														<div class="panel panel-default  panel--styled"
															style="padding: 10px;" 
															onclick="location.href='${pageContext.request.contextPath}/order/readOrderDetail?productCode=${offerJoinProductDTO.productDTO.productCode}'">
															<div align="right">
																<h4>마감날짜 : ${offerJoinProductDTO.productDTO.deadlineDate}</h4>
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
																		${offerJoinProductDTO.productDTO.productName} <a href="http://bootsnipp.com/" target="_blank"><span
																			class="glyphicon glyphicon-new-window"> </span></a>
																	</h2>
																	<div class="well well-sm">
																		<div class="col-sm-6" style="font-size: 15px;">
																			<small>출발지 : </small> ${offerJoinProductDTO.productDTO.arrivalNation}
																		</div>
																		<small>도착지 : </small>${offerJoinProductDTO.productDTO.departNation}<br>
																	</div>
																	<div class="row">
																		<div class="col-sm-5" style="font-size: 20px;">
																			${offerJoinProductDTO.productDTO.productPrice}<small>원</small>
																		</div>
																		<div class="col-sm-7" align="right">
																			<button type="button" class="btn btn-info"
																				onclick="location.href='${pageContext.request.contextPath}/order/readOrderDetail?productCode=${offerJoinProductDTO.productDTO.productCode}'">상세보기</button>
																			<form method="POST" action="deleteDeal">
																				<input type="hidden" name="offerCode" value="${offerJoinProductDTO.offerCode}"/>
																				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
																				<input type="submit" class="btn btn-info" value="배달 취소"/>
																			</form>
																		</div>
																	</div>

																</div>
															</div>
														</div>
														<!-- 상품 한개 템플릿 끝 -->

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
	<!-- //projects -->

</body>
</html>