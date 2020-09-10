<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Delete</title>
<style>
.card_Delete {
	display: none;
	width: 200px;
	height:80px;
	position: absolute;
	top:25%;
	left:40%;
	background: #F6F6F6;
	border-radius: 10px;
	padding:2%;
	z-index:2;
}

.background13 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background-color:rgba(0, 0, 0, 0.4);
	z-index:2;
}

.close_cardDelete {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1%;
}

.cardDeleteBtn {
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	font-size: 13pt;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
}

.cardDeleteBtn:hover {
	background-color: #E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.font12 {
	font-family: DX경필명조B;
	font-size: 13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#cardDelete").click(function() {
			$(".card_Delete").show();
			$(".background13").show();
		});
		
		$(".close_cardDelete").click(function() {
			$(".card_Delete").hide();
			$(".background13").hide();
		});
	});
</script>
</head>
<body>
<div class="background13"></div>

<div class="font12">
	<div class="card_Delete">
		<span class="close_cardDelete">X</span>
		<span style="color:#e85a71; font-size:15pt">Delete Card?</span>
		<br><br>
		
		<div align="center">
			<div class="cardDeleteBtn">
				<a id="cardDeleteBtn">Delete</a>
			</div>
		</div>	
	</div>
</div>
</body>
</html>