<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<title>Insert title here</title>
<style>
html, body {
   width: 98%;
   height: 98%;
   background-color: #444f59;
}

.chatting {
   width: 94%;
   height: 96%;
   position: absolute;
   background-color: #444f59;
   border-radius: 5px;
   color: white;
   font-family: DX경필명조B;
   font-size: 15pt;
   padding: 1%;
}

.close_chat {
   color: #cfcfcf;
   cursor: pointer;
   font-size: 15pt;
   float: right;
   padding-right: 2%;
}

.chatMsg {
   font-family: DX경필명조B;
   font-size: 13pt;
   color: white;
   background-color: rgba(0, 0, 0, 0.1);
   height: 30px;
   border: 0;
   background-color: rgba(0, 0, 0, 0.1);
}

.chatMsg:focus {
   background-color: rgba(0, 0, 0, 0.3);
   outline: none;
}

.chatMsg::placeholder {
   font-family: DX경필명조B;
   font-size: 13pt;
}

.sendMsg {
   display: inline-block;
   width: 65px;
   height: 30px;
   background-color: #E85A71;
   border: 0;
   border-radius: 3px;
   color: white;
   font-family: DX경필명조B;
   font-size: 13pt;
   text-align: center;
   padding-top: 0.6%;
   cursor: pointer;
}

.sendMsg:hover {
   background-color: #E85A7199;
   transition: 0.3s;
}

.sendMsg:focus{
   outline: none;
}

.view1 {
   height: 480px;
   overflow: hidden;
}

.scrollBlind1 {
   height: 100%;
   overflow-y: auto;
}

</style>
</head>
<body>
   <div class="background18"></div>

   <div class="chatting">
      <input type="hidden" id="bFk" value="${bFk}" /> <span>Communication</span>

      <hr color="#E85A71" size="2">

      <div class="view1">
         <div class="scrollBlind1">
            <div id="messageArea" style="word-break: break-all; white-space: normal;"></div>
         </div>
      </div>

      <input type="text" id="message" class="chatMsg" size="30" placeholder="Enter chat"/> 
      <input type="button" value="Send" id="send" class="sendMsg" />
   </div>

</body>
<script>
$(function() {
    $("#boardChat").click(function() {
       $(".chatting").show();
       
    });

    $(".close_chat").click(function(){
        $(".chatting").hide();
        });
 });
   
   $("#send").click(function(){
      sendMessage();
      $('#message').val('')
   });

   var sock = new SockJS("http://localhost:8088/echo");
   
   sock.onmessage = onMessage;
   sock.onclose = onClose;

   // 메세지 전송
   function sendMessage(){
      var message = $("#message").val()
      var message2 = message + "*" + ${bFk}
      sock.send(message2);
   }

   // 서버로부터 메시지를 받았을 때 실행
   function onMessage(msg){
      var bfk = $("#bFk").val();
      var data = msg.data;
      var d = data.split('*')
      var dbfk = data.split('*').reverse()[0];
      var realdata = data.split('*')[1];
      var img  =data.split('*')[0];
   
      console.log("dbfk : " + dbfk);
      console.log("data : " + data);
      console.log("bFk : " + bfk);
      console.log("realdata : " + realdata );

      if(bfk == dbfk){
         $('#messageArea').append( "<img src='" + img +"' width='30' height='30'>" + realdata + "<br />");
      }
   }

   // 서버와 연결을 끊었을 때
   function onClose(e){
      $("#messageArea").append("연결 끊김");
   }
   
</script>
</html>