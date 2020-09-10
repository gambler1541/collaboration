<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete List</title>
<style>
.background16 {
	width: 100%;
	height: 100%;
	display: none;
	position: absolute;
	background: rgba(0, 0, 0, 0.4);
}

.listDelete {
	display: none;
	width:200px;
	height:80px;
	position: absolute;
	top: 25%;
	left: 40%;
	background: #F6F6F6;
	border-radius: 10px;
	padding: 1%;
}

.listDeleteBtn {
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
	cursor: pointer;
}

.listDeleteBtn:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition: 0.3s;
}

.close_listDelete {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1.5%;
}

.font14 {
	font-family:DX경필명조B;
	font-size:13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#deleteList").click(function() {
			$(".listDelete").show();
			$(".background16").show();
		});
		
		$(".close_listDelete").click(function() {
			$(".listDelete").hide();
			$(".background16").hide();
		});
	});
</script>
</head>
<body>
<div class="background16"></div>

<div class="font14">
	<div class="listDelete">
		<span style="color:#e85a71; font-size:15pt">Delete List?</span>
		<span class="close_listDelete">X</span>

		<br><br>

		<div align="center">
			<div class="listDeleteBtn">
				<a id="listDeleteBtn">Delete</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>