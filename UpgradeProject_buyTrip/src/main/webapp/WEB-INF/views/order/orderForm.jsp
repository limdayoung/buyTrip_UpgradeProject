<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>

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

#box {
    position: absolute;
    z-index: 1;
    width: 96%;
    margin: 0px;
    padding: 10px;
}
</style>

<!-- 1. url 입력 시 상품이름,이미지 가져와서 뿌려주기
2. 출발나라 뿌려주기
-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){		
			
			/* url 정보 받아서 상품정보,이미지 뿌려주기 */
			$("#url").change(function(){
				
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/crawling",
					data:"${_csrf.parameterName}=${_csrf.token}&&url="+$(this).val(),
					dataType:"json",  //이름, 이미지경로, returnData.
					success:function(result){

						//url 상품이름 
						if(result.proName==null)return;
							$("#proName").val(result.proName);

						//url 이미지
						if(result.image==null)return;
						$('input[name=productImg]').attr('value',result.image);
						
						//상단에 이미지 띄워주기
						var data="<input type='image' id='urlImg' src="+result.image+">";
						$("#fileUploadImage").html(data);

						//url의 이미지 추가될 시 file 첨부 필수 조건 해제
						$('input[name=file]').removeAttr("required");
					},
					error:function(xhr,status,error){
						console.log("에러 발생 : " + err);
					}
				}); //ajax
			});//change-url 입력
			
			//url 입력 후 지울 시 띄워준 상품이름과 이미지도 삭제, file 첨부 필수 조건 적용
			$("#url").keyup(function(){
				if($("#url").val()==""){
					$('#urlImg').remove();
					$("#proName").val("");
					$('input[name=file]').attr("required","required");
				}
			})
			
			/* 출발나라 뿌려주기 */
		  $("#arrivalNation").keyup(function(){
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
			   $("#arrivalNation").val($(this).text());
			   $("#suggest").hide();
		   });
});//jquery

</script>

</head>
<body>

	<!-- contact -->
	
	<div class="container-fluid">
		<div class="row" style="background-color: #f6f6f6; text-align: center; height: auto">
			<h1><br><b>인기있는 상점에서 주문을 해보세요!</b></h1>
			<h5>
				<br>
				<p/>웹 사이트로 이동하여 제품을 찾고 상품 URL란에 링크를 붙여 넣으십시오!<br><br><br>
			</h5>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<a href="https://www.ebay.com/" target="_blank">
						<img src="${pageContext.request.contextPath}/resources/images/ebay.png">
					</a>
				</div>
				<div class="col-md-3">
					<a href="https://www.alibaba.com/" target="_blank">
						<img src="${pageContext.request.contextPath}/resources/images/Alibaba.png">
					</a><br><br>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>					
	<div class="contact">
		<div class="container">
			<div class="w3ls-title">
				<h3 class="agileits-title w3title1">상품 등록</h3>
				<p class="top-p">상품 정보를 입력해주세요. 구매를 희망하는 여행지를 기재해주세요. 구매가를
					입력해주세요.</p>
			</div>

			<div class="map-pos">
				<div class="col-md-4 address-row">
					<div class="col-xs-2 address-left">
						<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
					</div>
					<div class="col-xs-10 address-right">
						<h5>상품 정보</h5>
						<p>당신이 원하는 상품을 알려주세요.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 address-row w3-agileits">
					<div class="col-xs-2 address-left">
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					</div>
					<div class="col-xs-10 address-right">
						<h5>직구 여행지</h5>
						<p>
							특별히 희망하는 여행지가 있나요?</a>
						</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 address-row">
					<div class="col-xs-2 address-left">
						<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
					</div>
					<div class="col-xs-10 address-right">
						<h5>구매가</h5>
						<p>여행자에게 제안할 구매가를 입력해보세요.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- 다영 -->
			<form id="fileUploadForm" name="orderForm" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/order/insertOrder?${_csrf.parameterName}=${_csrf.token}">
				<div class="col-sm-6 contact-left">
				
					<p>상품 이미지 (적어도 한장이상)</p>
					<input multiple="multiple" type="file" name="file" required="required">
					<div id="fileUpload"></div>
					<div id="fileUploadImage"></div>
					<input type="hidden" name="productImg" value="">
					<p>상품 URL</p>
					<input type="text" name="productUrl" id="url" placeholder="상품 웹 주소를 입력해주세요.">
					<p>상품이름</p>
					<input type="text" name="productName" id="proName" placeholder="상품 이름을 입력해주세요." required="required">
					<p>상품 상세 설명</p>
					<textarea name="productDesc" id="image" placeholder="상품 상세설명을 입력해주세요.(예. 크기, 색상 등)"
						required="required"></textarea>
					<p>희망가격</p>
					<input type="number" name="productPrice" placeholder="구입 희망 가격을 입력해주세요."
						required="required">
					<p>상품 수량</p>
					<input type="number" name="productQty" placeholder="1" value="1" required="required">
					<p>여행 나라</p>
					<input type="text" id="arrivalNation" name="arrivalNation" placeholder="도착나라를 입력해주세요."
					required="required" style="margin-bottom: 0px;">
					<div id="suggest" style="width: auto;"></div>
					<input type="text" name="departNation" value="한국" style="background-color :#f4f4f4;">
					<p>언제까지</p>
					<input type="date" name="deadlineDate" required="required">
					<p>요청사항</p>
					<textarea name="requirement" placeholder="요청사항을 적어주세요."
						required="required"></textarea>
					<input type="submit" value="다음">
				</div>
				<div class="clearfix"></div>
			</form>
			<!--/ 다영 -->
		</div>
	</div>
	<!-- //contact -->

</body>
</html>