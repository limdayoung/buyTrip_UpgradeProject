<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">


/*****************globals*************/
body {
	font-family: 'open sans';
	overflow-x: hidden;
}

img {
	max-width: 100%;
}

.preview {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
}

@media screen and (max-width: 996px) {
	.preview {
		margin-bottom: 20px;
	}
}

.preview-pic {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.preview-thumbnail.nav-tabs {
	border: none;
	margin-top: 15px;
}

.preview-thumbnail.nav-tabs li {
	width: 18%;
	margin-right: 2.5%;
}

.preview-thumbnail.nav-tabs li img {
	max-width: 100%;
	display: block;
}

.preview-thumbnail.nav-tabs li a {
	padding: 0;
	margin: 0;
}

.preview-thumbnail.nav-tabs li:last-of-type {
	margin-right: 0;
}

.tab-content {
	overflow: hidden;
}

.tab-content img {
	width: 100%;
	-webkit-animation-name: opacity;
	animation-name: opacity;
	-webkit-animation-duration: .3s;
	animation-duration: .3s;
}

.card {
	margin-top: 50px;
	background: #eee;
	padding: 3em;
	line-height: 1.5em;
	width: 100%;
}

@media screen and (min-width: 997px) {
	.wrapper {
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
	}
}

.details {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	margin-left: 35px;
}

.colors {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.product-title, .price, .sizes, .colors {
	text-transform: UPPERCASE;
	font-weight: bold;
}

.checked, .price span {
	color: #ff9f1a;
}

.product-title, .rating, .product-description, .price, .vote, .sizes {
	margin-bottom: 15px;
}

.product-title {
	margin-top: 20px;
}

.size {
	margin-right: 10px;
}

.size:first-of-type {
	margin-left: 40px;
}

.color {
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
	height: 2em;
	width: 2em;
	border-radius: 2px;
}

.color:first-of-type {
	margin-left: 20px;
}

.add-to-cart, .like {
	background: #ff9f1a;
	padding: 1.2em 1.5em;
	border: none;
	text-transform: UPPERCASE;
	font-weight: bold;
	color: #fff;
	-webkit-transition: background .3s ease;
	transition: background .3s ease;
}

.add-to-cart:hover, .like:hover {
	background: #b36800;
	color: #fff;
}

.not-available {
	text-align: center;
	line-height: 2em;
}

.not-available:before {
	font-family: fontawesome;
	content: "\f00d";
	color: #fff;
}

.orange {
	background: #ff9f1a;
}

.green {
	background: #85ad00;
}

.blue {
	background: #0076ad;
}

.tooltip-inner {
	padding: 1.3em;
}

@
-webkit-keyframes opacity { 0% {
	opacity: 0;
	-webkit-transform: scale(3);
	transform: scale(3);
}

100%
{
opacity


:

 

1;
-webkit-transform


:

 

scale


(1);
transform


:

 

scale


(1);
}
}
@
keyframes opacity { 0% {
	opacity: 0;
	-webkit-transform: scale(3);
	transform: scale(3);
}
100%
{
opacity


:

 

1;
-webkit-transform


:

 

scale


(1);
transform


:

 

scale


(1);
}
}

/*# sourceMappingURL=style.css.map */

/* 다중이미지 */
.product-details .product-images > li {
  display: inline-block;
  width: 64px;
  height: product-dimenstions(64px);
  overflow: hidden;
  margin: 5px;
}
.product-details .product-images > li.preview {
  width: 100%;
  height: 350px;
  margin: 0;
}
.product-details .product-images img {
  display: block;
  width: 100%;
}
/* # 다중이미지 */
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<script type="text/javascript">
	
function buttonclick() {
	document.getElementById("chatForm").submit();
}

function offerbuttonclick() {
	document.getElementById("compeleteoffer").submit();
}

</script>

	<!-- projects -->
	<div class="portfolio">
		<div class="container">
	<div class="container" style="padding-left: 150px; padding-right: 150px;">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						<!-- detail 상품 큰 사진. -->
						<div class="preview-pic tab-content">
							<div class="tab-pane active">
								<!-- 다중 이미지 -->
						    <div class="section section-gray">
						        <div class="section-content">
						            <div class="product-details">
						                <ul class="product-images">
						                    <li class="preview">
						                    	<img src="${imgList[0]}" alt="">
						                    </li>
																<c:forEach items="${imgList}" var="img">
						                    <li>
						                        <a href="javascript:void(0)">
						                        <img src="${img}" alt=""></a>
						                    </li>
						                    </c:forEach>
						
						                </ul>
						            </div>
						        </div>
						    </div>
   							<!-- / 다중 이미지 -->
							</div>
							<h3 class="product-title">${productDTO.productName}</h3>
	<p class="product-description">상품 상세 설명 : ${productDTO.productDesc}<p/>
	요청사항 : ${productDTO.requirement}</p>

							<div class="well" style="font-size: 15px">
								<a href="${productDTO.productUrl}" class="link">
									url 바로가기
								</a>
							</div>
						</div>

					</div>
					<!-- 상품 상세 -->
					<div class="details col-md-6">
						<div style="align-self: center;">
							<img src="${pageContext.request.contextPath}/resources/member/${userDto.memberImg}" class="avatar img-circle" alt="avatar"
								style="width: 100px; height: 100px;">
						</div><br>
						<div style="align-self: center;">
							<p class="product-description">${productDTO.proposerId}</p>
						</div>
						<div style="align-self: center;">
							<p class="product-description">요청 날짜 : ${productDTO.requestedDate}</p>
						</div>
						<button type="button" class="btn">${productDTO.proposerId}에게 메세지 요청</button>

						<br>

						<h3 class="price product-title">
											제안 금액 <span><fmt:formatNumber value="${productDTO.productPrice}"/>원</span>
						</h3>
						<p><h4>갯수 <strong>${productDTO.productQty} </strong></h4></p>
						<br>

						<div class="well" style="font-size: 15px">
							<strong>출발지</strong> ${productDTO.arrivalNation}
							<hr>
							<strong>도착지</strong> ${productDTO.departNation}
						</div>
						<div>
					<a href="${pageContext.request.contextPath}/order/updateOrderForm?productCode=${productDTO.productCode}" class="btn btn-primary" role="button"
								style="width: 150px; margin: 5px;">수정하기</a>
							<a href="${pageContext.request.contextPath}/order/deleteOrder?productCode=${productDTO.productCode}" class="btn btn-primary" role="button"
								style="width: 150px; margin: 5px;">삭제하기</a>
						</div>

					</div>
				</div>
			</div>
		</div>
		
		<hr>
		<h2>제안자 정보</h2>
				<c:choose>
					<c:when test="${empty requestScope.offerList}">
						<tr>
							<td colspan="5">
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach items="${requestScope.offerList}" var="userDTO">

							<!-- 제안자 -->
							<div class="card">
								<div class="well">
									<div class="row">
										<div class="col-lg-2">
											<img
												src=" ${userDTO.memberImg }"
												class="avatar img-circle" alt="avatar"
												style="width: 100px; height: auto;">
										</div>
										<div class="col-lg-10">
											<div class="row">
												<div class="col-xs-4">
													<span style="font-size: 20px">${userDTO.memberName }</span>
													<span style="font-size: 20px">${userDTO.memberId }</span>
												</div>
												
										<c:if test="${productDTO.proposerId != memberId}">
									
									
									
									<form action="${pageContext.request.contextPath }/chatForm" id="chatForm" method="post" name="chatForm">
										<input type="hidden" name="userId" value="${productDTO.proposerId}">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<button type="button" class="btn" onclick="buttonclick()">
										${productDTO.proposerId}에게
										</button>
										</form>
									
										<form action="${pageContext.request.contextPath }/order/compeleteoffer" id="compeleteoffer" method="post" name="compeleteoffer">
										<input type="hidden" name="offercode" value="${userDTO.offer.getOfferCode()}">
										<input type="hidden" name="offerId" value="${userDTO.memberId }">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<button type="button" class="btn btn-info" onclick="offerbuttonclick()" style="width: 150px;">
										제안 수락하기
										</button>
										</form>
									
								</c:if> 
										
										
													</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- / 제안자 -->
							</c:forEach>
							</c:otherwise>
							</c:choose>
							

			</div>
		</div>
	</div>
	<!-- //projects -->

<!-- 다중이미지 동작 -->
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script >var Chef = {
    init: function() {
        this.productImagePreview();
        this.menuToggle();
        this.misc();
    },
    
    productImagePreview: function() {
        $(document).on('click', '.product-images li', function() {
            if (!$(this).hasClass('preview')) {
                var src = $(this).find('img').attr('src');
                $('.product-images .preview img').attr('src', src);
            }
        });
    },
    
    menuToggle: function() {
        $(document).on('click', '#menu .trigger', function() {
            // Toggle open and close icons
            $(this).find('img').each(function() {
                if ($(this).hasClass('hidden')) {
                    $(this).removeClass('hidden');
                } else {
                    $(this).addClass('hidden');
                }
            });
            
            // Toggle menu links
            $(this).siblings('.links').stop(true, true).slideToggle(200);
            
            // Toggle open class
            $('#menu').toggleClass('open');
       });
    },
    
    misc: function() {
        // Misc stuff
        
        for (var i = 1; i <= 3; i++) {if (window.CP.shouldStopExecution(1)){break;}
            $('.product').parent().eq(0).clone().appendTo('.product-list');
        }
window.CP.exitedLoop(1);

    }
};

$(function() {
    Chef.init();
});
</script>
</body>
</html>