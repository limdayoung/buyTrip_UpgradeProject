<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style type="text/css">
.list-notificacao{
  min-width: 400px;
  background: #ffffff;
}

.list-notificacao li{
   border-bottom : 1px #d8d8d8 solid;
   text-align    : justify;
   padding       : 5px 10px 5px 10px;
   cursor: pointer;
   font-size: 12px;
}

.list-notificacao li:hover{
background: #f1eeee;
}

.list-notificacao li:hover .exclusaoNotificacao{
display: block;
}

.list-notificacao li  p{
 color: black;
 width: 305px;
}

.list-notificacao li .exclusaoNotificacao{
    width: 25px;
    min-height: 40px;
    position: absolute;
    right: 0;
    display: none;
}

.list-notificacao .media img{
    width: 40px;
    height: 40px;
    float:left;
    margin-right: 10px;
}

.badgeAlert {
    display: inline-block;
    min-width: 10px;
    padding: 3px 7px;
    font-size: 12px;
    font-weight: 700;
    color: #fff;
    line-height: 1;
    vertical-align: baseline;
    white-space: nowrap;
    text-align: center;
    background-color: #d9534f;
    border-radius: 10px;
    position: absolute;
    margin-top: -10px;
    margin-left: -10px
}
</style>

  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 function excluirItemNotificacao(e){
	  $('#item_notification_'+e.id).remove()
	}
</script>
<title>Insert title here</title>
</head>
<body>

         
         <!-- Collect the nav links, forms, and other content for toggling -->
         
            <ul class="nav navbar-nav navbar-right">
               <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <!-- 종소리 모양. -->
                    <span class="glyphicon glyphicon-bell alertNotificacao"></span>
                    <!-- 알림갯수. -->
                    <span class='badgeAlert'>2</span>
                    <span class="caret"></span></a>
                  <ul class="list-notificacao dropdown-menu">
                    <li id='item_notification_1'>
                        <div class="media">
                           <div class="media-left"> 
                              <a href="#"> 
                              <img alt="64x64" class="media-object" data-src="holder.js/64x64" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PCEtLQpTb3VyY2UgVVJMOiBob2xkZXIuanMvNjR4NjQKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNWZhMWJmZmI3MCB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE1ZmExYmZmYjcwIj48cmVjdCB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSIxMy40Njg3NSIgeT0iMzYuNSI+NjR4NjQ8L3RleHQ+PC9nPjwvZz48L3N2Zz4=" data-holder-rendered="true"> </a> 
                           </div>
                           <div class="media-body">
                              <div class='exclusaoNotificacao'><button class='btn btn-danger btn-xs button_exclusao' id='1' onclick='excluirItemNotificacao(this)'>x</button>
                              </div>
                              <h4 class="media-heading">ITEM 1</h4>
                              <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                           </div>
                        </div>
                     </li>    
            </ul>

</body>
</html>