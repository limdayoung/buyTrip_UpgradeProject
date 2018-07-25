<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


					<div class="profile-content">
						<!-- head부분 -->
						<h1 class="page-header">여행 관리</h1>



						<!-- list상세부분. -->
						<div class="tab-content">

							<!-- 여행계획(현재 부분) -->
							<div class="tab-pane fade in active" id="tabb1">
								<div class="container">


									<!-- 여행지 폼 -->

									<c:choose>
										<c:when test="${empty requestScope.travelList}">
											<tr>
												<td colspan="5">
													<p align="center">
														<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
													</p>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${requestScope.travelList}" var="travelDTO">
												<div class="row">
													<div class="col-md-8">
														<div class="panel panel-default  panel--styled">
															<div class="panel-body"
																onclick="location.href='${pageContext.request.contextPath}/travel/searchProductList?arrivalNation=${travelDTO.arrivalNation}'">
																<div class="col-md-12 panelTop">
																	<div class="col-md-4">
																		<img class="img-responsive"
																			src="${pageContext.request.contextPath}/resources/images/159.jpg"
																			alt="" />
																	</div>
																	<div class="col-md-8">
																		<h2>${travelDTO.arrivalNation}-
																			${travelDTO.departNation}</h2>
																		<p>${travelDTO.arrivalDate}</p>
																		<hr>
																		등록 된 상품 개수 : <span style="font-size: 10px;">${travelDTO.countProduct}</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>

												<!-- 여행지폼 완료 -->
											</c:forEach>
											<select class='btn btn-primary' id='listCount' 	name='listCount' onchange='listCnt();'><option value='5'>5</option>
												<option value='10'>10</option><option value='15'>15</option><option value='20'>20</option>				
											</select>
											<ul class="pagination">
												<c:if test="${p.pageStartNum ne 1}">
													<li><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
													<li><a
														onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
												</c:if>

												<c:forEach var='i' begin="${p.pageStartNum}"
													end="${p.pageLastNum}" step="1">
													<li class='pageIndex${i}'><a
														onclick='pageIndex(${i});'>${i}</a></li>
												</c:forEach>

												<c:if test="${p.lastChk}">
													<li><a
														onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
													<li><a
														onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&raquo;</a></li>
												</c:if>
											</ul>
											<form action="select" method="post" id='frmPaging'>
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}"> <input type='hidden'
													name='index' id='index' value='${p.index}'> <input
													type='hidden' name='pageStartNum' id='pageStartNum'
													value='${p.pageStartNum}'> <input type='hidden'
													name='listCnt' id='listCnt' value='${p.listCnt}'>
											</form>
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
	<!-- //projects -->

</body>
</html>