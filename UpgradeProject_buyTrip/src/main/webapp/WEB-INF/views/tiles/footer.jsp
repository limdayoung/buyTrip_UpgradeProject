<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<head>
<style type="text/css">
/* chat 아이콘 */


/*===========================
     CHAT BOOT MESSENGER
   ===========================*/
#Smallchat .Messages, #Smallchat .Messages_list {
    -webkit-box-flex: 1;
    -webkit-flex-grow: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
}
.chat_close_icon {
   cursor:pointer;
    color: #fff;
    font-size:16px;
    position: absolute;
    right: 12px;
    z-index: 9;
}
.chat_on {
    position: fixed;
    z-index: 10;
    width: 45px;
    height: 45px;
    right: 20px;
    bottom:20px;
    background-color: #8a57cf;
    color: #fff;
    border-radius: 50%;
    text-align: center;
    padding: 9px;
    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)!important;
    cursor: pointer;
    display: block;
}
.chat_on_icon{
    color:#fff;
    font-size:25px;
    text-align:center;
}
/*
#Smallchat,#Smallchat * {
 box-sizing:border-box; 
 -webkit-font-smoothing:antialiased;
 -moz-osx-font-smoothing:grayscale;
 -webkit-tap-highlight-color:transparent
}
*/
#Smallchat .Layout { 
 pointer-events:auto;
 box-sizing:content-box!important;
 z-index:999999999;
 position:fixed;
 bottom:20px;
 min-width:50px;
 max-width:300px;
 max-height:30px;
 display:-webkit-box;
 display:-webkit-flex;
 display:-ms-flexbox;
 display:flex;
 -webkit-box-orient:vertical;
 -webkit-box-direction:normal;
 -webkit-flex-direction:column;
 -ms-flex-direction:column;
 flex-direction:column;
 -webkit-box-pack:end;
 -webkit-justify-content:flex-end;
 -ms-flex-pack:end;
 justify-content:flex-end;
 border-radius:50px;
 box-shadow:5px 0 20px 5px rgba(0,0,0,.1);
 -webkit-animation:appear .15s cubic-bezier(.25,.25,.5,1.1);
 animation:appear .15s cubic-bezier(.25,.25,.5,1.1);
 -webkit-animation-fill-mode:forwards;
 animation-fill-mode:forwards;
 opacity:0;
 -webkit-transition:right .1s cubic-bezier(.25,.25,.5,1),bottom .1s cubic-bezier(.25,.25,.5,1),min-width .2s cubic-bezier(.25,.25,.5,1),max-width .2s cubic-bezier(.25,.25,.5,1),min-height .2s cubic-bezier(.25,.25,.5,1),max-height .2s cubic-bezier(.25,.25,.5,1),border-radius 50ms cubic-bezier(.25,.25,.5,1) .15s,background-color 50ms cubic-bezier(.25,.25,.5,1) .15s,color 50ms cubic-bezier(.25,.25,.5,1) .15s;
 transition:right .1s cubic-bezier(.25,.25,.5,1),bottom .1s cubic-bezier(.25,.25,.5,1),min-width .2s cubic-bezier(.25,.25,.5,1),max-width .2s cubic-bezier(.25,.25,.5,1),min-height .2s cubic-bezier(.25,.25,.5,1),max-height .2s cubic-bezier(.25,.25,.5,1),border-radius 50ms cubic-bezier(.25,.25,.5,1) .15s,background-color 50ms cubic-bezier(.25,.25,.5,1) .15s,color 50ms cubic-bezier(.25,.25,.5,1) .15s
     
}

#Smallchat .Layout-right {
 right:20px
}

#Smallchat .Layout-open {
 overflow:hidden;
 min-width:300px;
 max-width:300px;
 height:500px;
 max-height:500px;
 border-radius:10px;
 color:#fff;
 -webkit-transition:right .1s cubic-bezier(.25,.25,.5,1),bottom .1s cubic-bezier(.25,.25,.5,1.1),min-width .2s cubic-bezier(.25,.25,.5,1.1),max-width .2s cubic-bezier(.25,.25,.5,1.1),max-height .2s cubic-bezier(.25,.25,.5,1.1),min-height .2s cubic-bezier(.25,.25,.5,1.1),border-radius 0ms cubic-bezier(.25,.25,.5,1.1),background-color 0ms cubic-bezier(.25,.25,.5,1.1),color 0ms cubic-bezier(.25,.25,.5,1.1);
 transition:right .1s cubic-bezier(.25,.25,.5,1),bottom .1s cubic-bezier(.25,.25,.5,1.1),min-width .2s cubic-bezier(.25,.25,.5,1.1),max-width .2s cubic-bezier(.25,.25,.5,1.1),max-height .2s cubic-bezier(.25,.25,.5,1.1),min-height .2s cubic-bezier(.25,.25,.5,1.1),border-radius 0ms cubic-bezier(.25,.25,.5,1.1),background-color 0ms cubic-bezier(.25,.25,.5,1.1),color 0ms cubic-bezier(.25,.25,.5,1.1);
}

#Smallchat .Layout-expand {
 height:500px;
 min-height:500px;
      display:none;
}
#Smallchat .Layout-mobile {
 bottom:10px
}
#Smallchat .Layout-mobile.Layout-open {
 width:calc(100% - 20px);
 min-width:calc(100% - 20px)
}
#Smallchat .Layout-mobile.Layout-expand {
 bottom:0;
 height:100%;
 min-height:100%;
 width:100%;
 min-width:100%;
 border-radius:0!important
}
@-webkit-keyframes appear {
 0% {
  opacity:0;
  -webkit-transform:scale(0);
  transform:scale(0)
 }
 to {
  opacity:1;
  -webkit-transform:scale(1);
  transform:scale(1)
 }
}
@keyframes appear {
 0% {
  opacity:0;
  -webkit-transform:scale(0);
  transform:scale(0)
 }
 to {
  opacity:1;
  -webkit-transform:scale(1);
  transform:scale(1)
 }
}
#Smallchat .Messenger_messenger {
 position:relative;
 height:100%;
 width:100%;
 min-width:300px;
 -webkit-box-orient:vertical;
 -webkit-box-direction:normal;
 -webkit-flex-direction:column;
 -ms-flex-direction:column;
 flex-direction:column
}
#Smallchat .Messenger_header,#Smallchat .Messenger_messenger {
 display:-webkit-box;
 display:-webkit-flex;
 display:-ms-flexbox;
 display:flex
}
#Smallchat .Messenger_header {
 -webkit-box-align:center;
 -webkit-align-items:center;
 -ms-flex-align:center;
 align-items:center;
 padding-left:10px;
 padding-right:40px;
 height:40px;
 -webkit-flex-shrink:0;
 -ms-flex-negative:0;
 flex-shrink:0
}


#Smallchat .Messenger_header h4 {
 opacity:0;
 font-size:16px;
 -webkit-animation:slidein .15s .3s;
 animation:slidein .15s .3s;
 -webkit-animation-fill-mode:forwards;
 animation-fill-mode:forwards
}

#Smallchat .Messenger_prompt {
 margin:0;
 font-size:16px;
 line-height:18px;
 font-weight:400;
 overflow:hidden;
 white-space:nowrap;
 text-overflow:ellipsis
}

@-webkit-keyframes slidein {
 0% {
  opacity:0;
  -webkit-transform:translateX(10px);
  transform:translateX(10px)
 }
 to {
  opacity:1;
  -webkit-transform:translateX(0);
  transform:translateX(0)
 }
}
@keyframes slidein {
 0% {
  opacity:0;
  -webkit-transform:translateX(10px);
  transform:translateX(10px)
 }
 to {
  opacity:1;
  -webkit-transform:translateX(0);
  transform:translateX(0)
 }
}
#Smallchat .Messenger_content {
    height: 450px;
    -webkit-box-flex: 1;
    -webkit-flex-grow: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    background-color: #fff;
}
#Smallchat .Messages {
    position: relative;
    -webkit-flex-shrink: 1;
    -ms-flex-negative: 1;
    flex-shrink: 1;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    overflow-x: hidden;
    overflow-y: auto;
    padding: 10px;
    background-color: #fff;
    -webkit-overflow-scrolling: touch;
}





#Smallchat .Input {
    position: relative;
    width: 100%;
    -webkit-box-flex: 0;
    -webkit-flex-grow: 0;
    -ms-flex-positive: 0;
    flex-grow: 0;
    -webkit-flex-shrink: 0;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    padding-top: 17px;
    padding-bottom: 15px;
    color: #96aab4;
    background-color: #fff;
    border-top: 1px solid #e6ebea;
}
#Smallchat .Input-blank .Input_field {
    max-height: 20px;
}
#Smallchat .Input_field {
    width: 100%;
    resize: none;
    border: none;
    outline: none;
    padding: 0;
        padding-right: 0px;
        padding-left: 0px;
    padding-left: 20px;
    padding-right: 75px;
    background-color: transparent;
    font-size: 16px;
    line-height: 20px;
    min-height: 20px !important;
}
#Smallchat .Input_button-emoji {
    right: 45px;
}
#Smallchat .Input_button {
    position: absolute;
    bottom: 15px;
    width: 25px;
    height: 25px;
    padding: 0;
    border: none;
    outline: none;
    background-color: transparent;
    cursor: pointer;
}
#Smallchat .Input_button-send {
    right: 15px;
}
#Smallchat .Input-emoji .Input_button-emoji .Icon, #Smallchat .Input_button:hover .Icon {
    -webkit-transform: scale(1.1);
    -ms-transform: scale(1.1);
    transform: scale(1.1);
    -webkit-transition: all .1s ease-in-out;
    transition: all .1s ease-in-out;
}
#Smallchat .Input-emoji .Input_button-emoji .Icon path, #Smallchat .Input_button:hover .Icon path {
    fill: #2c2c46;
}
/* /chat 아이콘 */

</style>



<script type="text/javascript">

   $(document).ready(function(){
    $(".chat_on").click(function(){
        $(".Layout").toggle();
        $(".chat_on").hide(300);
    });
    
       $(".chat_close_icon").click(function(){
        $(".Layout").hide();
           $(".chat_on").show(300);
    });
    
});
   

   
   //부트스트랩 적용
   
   
</script>

</head>
<body>   
   <!-- footer start here -->
   <div class="footer-agile jarallax">
      <div class="container">

         <div class="footer-btm-agileinfo">
            <div class="col-md-3 col-xs-3 footer-grid">
               <h3>바로 가기</h3> 
               <ul>
                  <li><a href="index.html">주문하기</a></li>
                  <li><a href="services.html">배달하기</a></li> 
                  <li><a href="projects.html">메시지</a></li> 
                  <li><a href="contact.html">마이페이지</a></li> 
               </ul> 
            </div>
            <div class="col-md-3 col-xs-3 footer-grid w3social">
                  <div class="col-md-12 col-xs-12 footer-grid w3social">
               
            </div> 
            </div>
            <div class="col-md-6 col-xs-6 footer-grid footer-review">
               <h3>Newsletter</h3>
               <form action="#" method="post">
                  <input type="email" name="Email" placeholder="Your Email"
                     required=""> <input type="submit" value="Subscribe">
                  <div class="clearfix"></div>
               </form>
            </div>
            <div class="clearfix"></div>
         </div>
         <div class="footer-top-agileinfo">
            <div class="social-wthree-icons bnragile-icons">
               <ul>
                  <li><a href="#"
                     class="fa fa-facebook icon icon-border facebook"> </a></li>
                  <li><a href="#"
                     class="fa fa-twitter icon icon-border twitter"> </a></li>
                  <li><a href="#"
                     class="fa fa-google-plus icon icon-border googleplus"> </a></li>
                  <li><a href="#"
                     class="fa fa-dribbble icon icon-border dribbble"> </a></li>
               </ul>
               <div class="clearfix"></div>
            </div>
         </div>
      </div>
   </div>
   <!-- //footer end here -->
   <script src="${pageContext.request.contextPath}/resources/js/responsiveslides.min.js"></script>
      <!-- start-smooth-scrolling -->
         <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/move-top.js"></script>
         <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
         <script type="text/javascript">
            jQuery(document).ready(function($) {
               $(".scroll").click(function(event){      
               event.preventDefault();
               $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
         });
         </script>
   <!-- //start-smoth-scrolling -->
   <!-- here stars scrolling icon -->
   <script type="text/javascript">
      $(document).ready(function() {
         /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear' 
            };
         */
                        
         $().UItoTop({ easingType: 'easeOutQuart' });
                        
         });
   </script>



<!-- chat 아이콘 -->
<div class="container">
   <div class="row">
    <div id="Smallchat">
    <div class="Layout Layout-open Layout-expand Layout-right" style="background-color: #3F51B5;color: rgb(255, 255, 255);opacity: 5;border-radius: 10px;">
      <div class="Messenger_messenger">
        <div class="Messenger_header" style="background-color: rgb(22, 46, 98); color: rgb(255, 255, 255);">
          <h4 class="Messenger_prompt">어떻게 도와드릴까요?</h4> <span class="chat_close_icon"><i class="fa fa-window-close" aria-hidden="true"></i></span> </div>
        <div class="Messenger_content">
          <div class="Messages">
            <div class="Messages_list"></div>
          </div>
          <div class="Input Input-blank">
            <textarea class="Input_field" placeholder="Send a message..." style="height: 20px;"></textarea>
           
            <button class="Input_button Input_button-send">
              <div class="Icon" style="width: 18px; height: 18px;">
                <svg width="57px" height="54px" viewBox="1496 193 57 54" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="width: 18px; height: 18px;">
                  <g id="Group-9-Copy-3" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(1523.000000, 220.000000) rotate(-270.000000) translate(-1523.000000, -220.000000) translate(1499.000000, 193.000000)">
                    <path d="M5.42994667,44.5306122 L16.5955554,44.5306122 L21.049938,20.423658 C21.6518463,17.1661523 26.3121212,17.1441362 26.9447801,20.3958097 L31.6405465,44.5306122 L42.5313185,44.5306122 L23.9806326,7.0871633 L5.42994667,44.5306122 Z M22.0420732,48.0757124 C21.779222,49.4982538 20.5386331,50.5306122 19.0920112,50.5306122 L1.59009899,50.5306122 C-1.20169244,50.5306122 -2.87079654,47.7697069 -1.64625638,45.2980459 L20.8461928,-0.101616237 C22.1967178,-2.8275701 25.7710778,-2.81438868 27.1150723,-0.101616237 L49.6075215,45.2980459 C50.8414042,47.7885641 49.1422456,50.5306122 46.3613062,50.5306122 L29.1679835,50.5306122 C27.7320366,50.5306122 26.4974445,49.5130766 26.2232033,48.1035608 L24.0760553,37.0678766 L22.0420732,48.0757124 Z" id="sendicon" fill="#96AAB4" fill-rule="nonzero"></path>
                  </g>
                </svg>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
    <!--===============CHAT ON BUTTON STRART===============-->
    <div class="chat_on" onclick="location.href='${pageContext.request.contextPath}/chatting/chat'"> <span class="chat_on_icon"><i class="fa fa-comments" aria-hidden="true"></i></span> </div>
    <!--===============CHAT ON BUTTON END===============-->
  </div>
   </div>
</div>
<!-- / chat 아이콘 -->

</body>
</html>