<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Chatting</title>
<style>
#chatContent {
	width: 100%;
	height: 490px;
	border: 0;
}

#chatField {
	height: 570px;
	border: 0;
}

#inputMessage {
	background-color: rgba(0, 0, 0, 0.1);
	height: 30px;
	padding-top: 1%;
	border: 0;
}

#inputMessage:hover {
	background-color: white;
}

#inputMessage:focus {
	outline: none;
}

#chatMain {
	background-color: white;
}

#chatSend {
	display: inline-block;
	background-color: #E85A71;
	color: white;
	border-radius: 3px;
	font-family: DX경필명조B;
	text-align: center;
	padding-top: 0.6%;
	height: 35px;
	width: 65px;
	cursor: pointer;
	border: 0;
	font-size: 20px;
}

#chatSend:focus {
	outline: none;
}

#chatTitle {
	text-align: center;
	font-family: DX경필명조B;
}
</style>

<script>

</script>
</head>
<body>
	<form action="send()">
		<div id="chatContentMain">
			<fieldset id="chatField" style="background-color: #D8E9EF;">
				<legend id="chatTitle">[Board Masenger]</legend>
				<div id="chatMain">
					<div id="chatContent">a</div>
					<hr />
					<div style="float: left;">
						<input type="text" name="chatText" id="inputMessage" size="50" placeholder="텍스트 입력" />
					</div>
					<div style="float: right;">
						<input type="submit" value="send" id="chatSend" />
					</div>
				</div>
			</fieldset>
		</div>
	</form>
</body>
</html>