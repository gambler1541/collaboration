<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<script type="text/javascript">


$(document).ready(function(){
	
var sock = new SockJS("http://localhost:8088/push");

sock.onmessage = onMessage;
sock.onclose = onClose;


// 메세지 전송
function sendMessage(){

   sock.send("zzzzzzz");
}


// 서버로부터 메시지를 받았을 때 실행
function onMessage(message){


}

// 서버와 연결을 끊었을 때
function onClose(e){
	console.log("Info : connection closed");
}

});

</script>

</head>
<body>
	<button id="sendsend">click</button>
	<p id="messageee"></p>
</body>
</html>