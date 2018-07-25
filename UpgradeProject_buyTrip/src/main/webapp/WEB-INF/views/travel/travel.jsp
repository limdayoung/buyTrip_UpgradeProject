<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>

<style type="text/css">
#main {
   width: 700px;
   height: 500px;
   "
}
.col-md-6 {
   text-align: center;
}
.btn-default{
   padding-top: 5px;
   padding-bottom: 5px;
   
}
.col-md-2, .col-md-4 {
   padding: 0px;
}
.form-group, .btn {
   margin-top: 20px;
}
.well-lg {
   padding: 0px;
   margin-bottom: 0px;
}

#box {
   position: absolute;
   z-index: 1;
   width: 100%;
   margin: 0px;
   padding: 5px;
}
</style>
<script type="text/javascript">
$(function(){
     $("#departNation").keyup(function(){
         if($(this).val()==""){
            $("#suggest").hide();
            return;
         }
         
         $.ajax({
            type:"post" ,
            url: "${pageContext.request.contextPath}/travel/suggest",
            data:"${_csrf.parameterName}=${_csrf.token}&&keyWord="+$(this).val(),
            dataType:"json",
             success: function(result){//개수|단어,단어,단어,...
             
                 var str="<div id='box' class='well' style='background-color: #def3f5;'>";
                   $.each(result,function(index, item){
                      str+="<div style='padding: 5px;'><a href='#none' style='text-decoration: none;'><b>"+item+"</b></a></div>";
                   });
                str+="</div>";
                
                $("#suggest").html(str);
                $("#suggest").show();
                
             } , 
             error:function(err){
                console.log("에러 발생 : " + err);
             }
            
         });
      });
      
      $("#suggest").on("click","a" ,function(){
         
         $("#departNation").val($(this).text());
         $("#suggest").hide();
         
      });
      
})
function getSearchProductList(x) {
   var searchProductIndex = document.getElementById("searchProductList"+x);
   searchProductIndex.submit();

}

function getMypageProdcutList(x) {
	   var productIndex = document.getElementById("mypageProdcutList"+x);
	   productIndex.submit();

	}

</script>



</head>

<body>
   <div style="height: 50px;"></div>

   <sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberId" var="memberId" />
   </sec:authorize>

   <div class="container-fluid">
      <div class="row">
         <div class="col-md-1"></div>
         <div class="col-md-4" style="text-align: center; margin-top: 50px">
            <h1>
               <br> <br>여행하면서 돈을 벌어보세요!
            </h1>
            <h5>
               <br>직구자가 당신의 여행지에서 상품을 기다리고 있습니다.<br> <br>여행지를 검색해보고
               판매자가 되어보세요.<br><br><br>
            </h5>
            <form class="form-inline"
               action="${pageContext.request.contextPath}/travel/searchProductList" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               
               
               <div class="row">
                  <div class="col-md-2">
                     <label for="form-group">출발지 </label>
                  </div>
                  <div class="col-md-4">
                     <input type="text" class="form-control" name="arrivalNation"
                        id="arrivalNation" placeholder="출발나라" style="width: 100%;">
                     <div id="suggest" style="width: 100%; vertical-align: middle;"></div>
                  </div>
                  <div class="col-md-2">
                     <label for="">도착지 </label>
                  </div>
                  <div class="col-md-4">
                        <input type="text" class="form-control" placeholder="한국"
                           disabled="disabled" style="width: 100%;">
                  </div>
               </div>
               <div class="row">
                  <input type="submit" class="btn btn-default btn-block"
                     value="검색하기">
               </div>
               
            </form>
         </div>
         <div class="col-md-1"></div>
         <div class="col-md-6">
            <img alt=""
               src="${pageContext.request.contextPath}/resources/images/travel.jpg"
               class="img-rounded" id="main">
         </div>
      </div>

      <div class="row"
         style="background-color: #f6f6f6; margin-top: 50px; padding-top:50px;
         padding-bottom:50px; text-align: center; height: auto">
            <h1>여행지를 등록해보세요</h1>
            <h5>
               <br>
               <p>여러분의 여행할 장소들을 등록해보세요
            </h5>
            <button type="button" class="btn btn-info" style="width: 20%;"
               onclick="location.href='${pageContext.request.contextPath}/travel/addTrip?${_csrf.parameterName}=${_csrf.token}'">
               여행지 등록</button>
      </div>



     	<!-- 거래율이 가장 높은 여행지 -->
		<c:if test="${!empty list}">

			<div class="container" style="padding: 40px;">
				<div class="row">
					<div style="text-align: center; margin-top: 100px; margin-bottom: 50px">
						<h1>상품등록수가 가장 높은 여행지, Top 3</h1>
						<h5>
							<br><br>
							<p>당신의 다음 여행지는 어디인가요?</p>
							<br>
							<p>상품등록수가 가장 높은 여행지는 이곳입니다!</p>
						</h5>
					</div>
				</div>

				<div class="row">
					<!-- 여행지 list -->
					<c:forEach items="${list}" var="highestDealDTO">
						<div class="col-md-4">
							<div class="row" style="margin: 0px;">
								<div class="well well-lg"
									onclick="location.href='${pageContext.request.contextPath}/order/detail'"
									style="background-color: white; margin: 10px;">
									<div class="row" style="margin: 0px;">
										<div class="col-sm-1"></div>
										<div class="col-sm-11" style="margin: 10px;">
											<h2>${highestDealDTO.arrivalNation}</h2>
										</div>
									</div>
									<div class="row" style="margin: 0px;">
										<img alt=""
											src="${pageContext.request.contextPath}/resources/nation/${highestDealDTO.nationImg}"
											style="width: 100%;">
									</div>
									<div class="row" style="height: 15px;"></div>
									<div class="row" style="text-align: center;">
										<div class="col-xs-4">
											<span>상품등록수</span>
										</div>
										<div class="col-xs-4">
											<span>완료된 거래수</span>
										</div>
										<div class="col-xs-4">
											<span>거래율</span>
										</div>
									</div>	
									<div class="row" style="text-align: center;">
										<div class="col-xs-4">
											<h3><span>${highestDealDTO.orderNumber}</span></h3>
										</div>
										<div class="col-xs-4">
											<h3><span>${highestDealDTO.completedDealNumber}</span></h3>
										</div>
										<div class="col-xs-4">
											<h3><span>${highestDealDTO.deal} %</span></h3>
										</div>
									</div>
									<div class="row" style="height: 15px;"></div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- / 여행지 list -->
						
				</div>
			</div>
		</c:if>
		<!-- / 거래율이 가장 높은 여행지 -->


      <!-- 여백 -->
      <div style="height: 50px; margin-top: 50px;"></div>


      <!-- 최근 등록된 주문들 -->
      <div class="row" style="background-color: #f6f6f6;">
         <div class="container">
            <div class="row">
               <div style="text-align: center; margin-top: 50px;">
                  <h1>최근 등록된 주문들</h1>
                  <h5>
                     </br>
                     <p>이러한 품목은 최근 전세계에서 요청되었습니다.</p>
                     <p>국경없는 쇼핑을 위해 buyTrip에 가입하십시오.</p>
                     </br>
                  </h5>
               </div>
            </div>
            <div class="row">

               <!-- 주문 list -->

               <c:choose>
                  <c:when test="${empty requestScope.recentList}">
                     <tr>
                        <td colspan="5">
                           <p align="center">
                              <b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
                           </p>
                        </td>
                     </tr>
                  </c:when>
                  <c:otherwise>
                     <c:forEach items="${requestScope.recentList}" var="productDTO" varStatus="state">
                        <!-- 주문 list -->
                        <div class="col-sm-6">
                              <form id="mypageProdcutList${state.index}" name="mypageProdcutList"  method="post"
                                             action="${pageContext.request.contextPath}/travel/detail">
                           <div class="well well-sm" style="background-color: white; padding: 10px; margin: 20px" onclick="getMypageProdcutList(${state.index})">
                        
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="productCode" value="${productDTO.productCode}"/>
                        </form>
                              <div class="row">
                                 <div class="col-sm-2" style="margin-bottom: 15px;">
                                 
                                    <img src="${productDTO.memberImg}" class="avatar img-circle"
                                       alt="avatar" style="width: 50px; height: auto;">
                                 </div>
                                 <div class="col-sm-4">
                                    <span><c:out value="${productDTO.proposerId}"/></span><br> <span>요청날짜
                                       :${productDTO.requestedDate}</span>
                                 </div>
                                 <div class="col-sm-8" align="right">
                                    <h5>마감날짜 : ${productDTO.deadlineDate}</h5>
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="col-xs-3 col-md-3 text-center">
                                    <img src="${productDTO.productImg}"\
                                       class="img-rounded img-responsive"
                                       style="width: 189px; height: auto;" />
                                 </div>
                                 <div class="col-xs-9 col-md-9 section-box"
                                    style="align-self: center;">
                                    <h3>
                                       ${productDTO.productName} <span
                                          class="glyphicon glyphicon-new-window"> </span></a>
                                    </h3>
                                    <div class="well well-sm">
                                       <div class="col-sm-6" style="font-size: 15px;">
                                          <small>출발지 : </small> ${productDTO.arrivalNation}
                                       </div>
                                       <small>도착지 : </small>${productDTO.departNation}<br>
                                    </div>
                                    <div class="row">
                                       <div class="col-sm-7" style="font-size: 20px;">
                                        금 액 : <fmt:formatNumber value="${productDTO.productPrice}"/><small>원</small>
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
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
      </div>
   </div>   
   <!-- / 최근 등록된 주문들 -->
   
   <div style="height: 50px; margin-top: 50px;"></div>   
</div>

</body>
</html>