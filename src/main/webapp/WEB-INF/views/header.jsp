<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- home.jsp에 include되는 header. 로고와 로그인 버튼, 사인 업 버튼이 있다 -->

</head>
<style>
html, body {
	width:100%;
	height:100%;
	margin:0;
}

.login {
	float:right;
	display:inline-block;
	width:70px; height:30px;
	background-color:#444F59;
	font-family:DX경필명조B;
	border-radius:3px;
	text-align:center;
	margin-top:20px;
	margin-right:20px;
	box-shadow:3px 3px #CFCFCF;
}

.login:hover {
	background-color:#444F5999;
	cursor:pointer;
	transition:0.3s;
}

.signup {
	float:right;
	display:inline-block;
	width:80px; height:30px;
	background-color:#E85A71;
	font-family:DX경필명조B;
	border-radius:3px;
	text-align:center;
	margin-top:20px;
	margin-right:20px;
	box-shadow:3px 3px #CFCFCF;
}

.signup:hover {
	background-color:#E85A7199;
	cursor:pointer;
	transition:0.3s;
}

.headerlogo {
	padding-top:0.4%;
	padding-left:12.6%;
}

.button1 {
	display:inline-block;
	padding-top:6px;
	text-decoration:none;
	color:white;
}

.header1 {
	position:fixed;
	width:100%; height:80px;
	background-color:#D8E9EF40;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body>
<header align="center" class="header1">
	<img class="headerlogo" src="../images/colla_logo.png" width="120" height="60">
	<div class="signup"><a class="button1" href="/member/join">Sign Up</a></div>
	<div class="login"><a class="button1" href="/member/login">Login</a></div>
</header>
</body>
</html>