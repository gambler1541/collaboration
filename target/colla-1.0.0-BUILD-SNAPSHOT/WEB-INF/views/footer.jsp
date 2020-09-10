<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<!-- home.jsp에 include되는 footer -->

</head>
<style>
.footerwrap {
	width:100%;
	margin-left:0;
	margin-right:0;
}

.copysize {
	font-size:15pt;
	color:#747474;
}

.link {
	color:#444f59;
	padding-right:30px;
	font-size:15pt;
}

.footer1 {
	position:relative;
	top:100px;
}

.gra {
	background: -webkit-linear-gradient(180deg, rgb(254, 228, 228), rgb(198, 242, 251));
	background: linear-gradient(180deg, rgb(254, 228, 228), rgb(198, 242, 251));
	height:30%;
	padding-top:30px;
	box-shadow:0px 0px 150px #F0C8C8;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body align="center">
<footer class="footer1">
	<div class="footerwrap gra">
		<a href="" class="link">developer</a><a href="" class="link">help</a><a href="" class="link">click</a><br>
		<img src="../images/company.png" width="236" height="39" style="padding-top:30px"><br><br>
		<div><font class="copysize">© Copyright 2020. All rights reserved.</font></div>
	</div>
</footer>
</body>
</html>