<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Push Bell</title>
<style>
.pushWrap {
	display: none;
	width:300px;
	height:500px;
	position: absolute;
	top: 10%;
	left:75%;
	background:white;
	border-radius: 10px;
	box-shadow: 3px 3px 3px #cfcfcf;
	z-index: 10;
	padding-left:2%;
	padding-right:2%;
	padding-bottom:2%;
	padding-top:0.5%;
}

.close_push {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 15pt;
	float: right;
	margin: 0 4px;
}

#pushTitle {
	display: inline-block;
	float: left;
}

.pushTitle {
	font-size: 13pt;
}

.pushView {
	width:450px;
	height:450px;
	overflow: hidden;
}

.pushScrollBlind {
	width:480px;
	height: 100%;
	overflow-y: scroll;
	text-align: left;
}

.alarm {
	border-bottom:1px solid #444f59;
}

</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(document).on("click", "#pushBell", function() {
		$(".pushWrap").show();
	});

	$(document).on("click", ".close_push", function() {
		$(".pushWrap").hide();
	});

	$(document).on("click", ".background17", function() {
		$(".pushWrap").hide();
	});
</script>
</head>
<body>
	<div class="pushWrap">
		<div id="pushHeader">
			<div id="pushTitle">
				<span class="pushTitle">Push notification</span>
			</div>
			<span class="close_push">X</span>
		</div>
		<br>
		<hr size="2" color="#444f59">

		<div id="pushContent">
			<div class="pushView">
				<div class="pushScrollBlind"></div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var sock = "http://localhost:8088/push";
	function sendMessage() {
		socket = new SockJS(sock);
		socket.onopen = function(event) {
			onOpen(event);
		};
		socket.onmessage = function(event) {
			onMessage(event);
		};
		socket.onerror = function(event) {
			onError(event);
		};
	}
	function onOpen(event) {
		socket.send("send");
	}

	function onMessage(event) {
		console.log(event.data);
		var data = event.data;

		var splitData = data.split('/');
		var alarmCount = splitData.length; //알림갯수	
		var arr = new Array();
		var pushAlarm = new Array();
		for (i = 0; i < splitData.length - 1; i++) {
			arr[i] = splitData[i];
			pushAlarm[i] = arr[i].split('=');
			console.log(pushAlarm[i][0]);
		}
		var addAlarm;
		console.log(pushAlarm.length);

		for (i = 0; i < pushAlarm.length; i++) {

			if (pushAlarm[i][1] != 0) {

				addAlarm = "<div>" + '"' + pushAlarm[i][0]
						+ '" 가<font color="blue"> ' + pushAlarm[i][1]
						+ '</font>일 남았습니다</div>';
				$('.pushScrollBlind').append(addAlarm);

			}

			else {
				addAlarm = "<div>" + '"' + pushAlarm[i][0]
						+ '" 가 <font color="red">오늘까지</font> 입니다';
				$('.pushScrollBlind').append(addAlarm);
			}
		}

	}

	function onError(event) {

	}
	$(document).ready(function() {
		sendMessage();
	});
</script>

</html>