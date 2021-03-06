<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link
   href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<style type="text/css">
body {
   margin-top: 20px;
}

.glyphicon {
   margin-right: 5px;
}

.section-box h2 {
   margin-top: 0px;
}

.section-box h2 a {
   font-size: 15px;
}

.glyphicon-heart {
   color: #e74c3c;
}

.glyphicon-comment {
   color: #27ae60;
}

.separator {
   padding-right: 5px;
   padding-left: 5px;
}

.section-box hr {
   margin-top: 0;
   margin-bottom: 5px;
   border: 0;
   border-top: 1px solid rgb(199, 199, 199);
}
</style>
<script type="text/javascript">
function getSearchProductList(x) {
   var searchProductIndex = document.getElementById("searchProductList"+x);
   searchProductIndex.submit();
}
</script>
</head>
<body>
     <!-- 여행 경로 찾는 키워드 창 -->
   <div class="container" align="center">
      <div class="row">
         <div class="span12">
            <form method="post" action="${pageContext.request.contextPath}/travel/searchProductList" class="form-inline">
               <input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}"> 
               <label for="" style="width: 10%;">출발지</label> 
               <input type="text" class="form-control" name="arrivalNation" placeholder="${requestScope.arrivalNation}" size="30"> <i class="fa fa-refresh" style="width: 10%;"></i>
               <label for="" style="width: 10%;">도착지</label>
                <input type="text"    class="form-control" placeholder="한국" size="30">
               <button type="submit" class="btn btn-primary" value="검색하기">검색하기</button>
            </form>
         </div>
      </div>
   </div>

   <!-- /navigation -->
<div class="container" align="right">
   <button id="button1" class="btn btn-link"  onclick="location.href=' ${pageContext.request.contextPath}/travel/searchProductList?arrivalNation=${requestScope.arrivalNation}'">최신순</button>/<button id="button2" class="btn btn-link"  onclick="location.href=' ${pageContext.request.contextPath}/travel/costList?arrivalNation=${requestScope.arrivalNation}'">가격순</button>
</div>
   <!-- projects -->
   <div class="container">
      <div class="row" align="center">
         <div class="col-md-10">

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
                  <c:forEach items="${requestScope.searchProductList}"   var="productDTO" varStatus="state">
                  <form id="searchProductList${state.index}" name="searchProductList"    method="post"    action="${pageContext.request.contextPath}/travel/detail">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                     <input type="hidden" name="productCode" value="${productDTO.productCode}"/>
                     <!-- 주문 list -->
                     <div class="col-sm-12">
                        <div class="well well-sm" onclick="getSearchProductList(${state.index})"
                           style="background-color: white; padding: 10px; margin: 20px">
                        </form>
                           <div class="row">
                              <div class="col-sm-2" style="margin-bottom: 15px;">
                                 <img src="${pageContext.request.contextPath}/resources/member/${productDTO.memberImg}" class="avatar img-circle"
                                    alt="avatar" style="width: 50px; height: auto;">
                              </div>
                              
                              <div class="col-sm-6" align="right">
                                 <h5>마감날짜 : ${productDTO.deadlineDate}</h5>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-xs-3 col-md-3 text-center">
                                 <img src="${productDTO.productImg}" alt="bootsnipp"
                                    class="img-rounded img-responsive"
                                    style="width: 189px; height: auto;" />
                              </div>
                              <div class="col-xs-9 col-md-9 section-box"
                                 style="align-self: center;">
                                 <h2>
                                    ${productDTO.productName} <a
                                       href="http://bootsnipp.com/" target="_blank"><span
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
                                    <form method="POST" action="${pageContext.request.contextPath}/deal/offerDeal">
                                     <input type="submit" class="btn btn-info" value="배달하기"/>
                                      </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                      <input type="hidden" name="proposerId" value="${productDTO.proposerId}"/>
                        <input type="hidden" name="productCode" value="${productDTO.productCode}"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                     </form>
                     <!-- / 주문 list -->
                  </c:forEach>

                  <ul class="pagination">
                     <c:if test="${p.pageStartNum ne 1}">
                        <li><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
                        <li><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
                     </c:if>

                     <c:forEach var='i' begin="${p.pageStartNum}"
                        end="${p.pageLastNum}" step="1">
                        <li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
                     </c:forEach>

                     <c:if test="${p.lastChk}">
                        <li><a
                           onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
                        <li><a
                           onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&raquo;</a></li>
                     </c:if>
                  </ul>
                  <form
                     action="${pageContext.request.contextPath}/travel/searchProductList"
                     method="post" id='frmPaging'>
                     <input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}"> 
                     <input type='hidden' name='departNation' id='departNation'  value='${requestScope.departNation}'> 
                     <input type='hidden' name='index' id='index' value='${p.index}'>
                     <input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'> 
                     <input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>
                  </form>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
   </div>


   <!-- //projects -->

</body>
</html>