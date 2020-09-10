<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Member List</title>
<style>
.background10 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2);
}

.close_cardMemberList {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1%;
}

.card_MemberList {
	display: none;
	width:200px;
	height:250px;
	position: absolute;
	top: 15%;
	left:73%;
	background: #F6F6F6;
	border-radius: 10px;
	padding:1%;
	box-shadow: 3px 3px 3px #cfcfcf;
}

.cardMember_ListAdd {
	float:left;
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	font-size:13pt;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
}

.cardMember_ListAdd:hover {
	background-color: #E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.cardMember_ListDelete {
	float: right;
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #444F59;
	font-family: DX경필명조B;
	font-size:13pt;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
}

.cardMember_ListDelete:hover {
	background-color: #444f5999;
	transition:0.3s;
	cursor:pointer;
}

.card_Member_List {
	border: 1px solid #D8E9EF;
	width:200px;
	height:140px;
	overflow:hidden;
}

.view4 {
	width:200px;
	height:160px;
	overflow: hidden;
}

.scrollBlind4 {
	width:230px;
	height:100%;
	overflow-y: scroll;
}

.font9 {
	font-family:DX경필명조B;
	font-size:13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#cardMember1").click(function() {
			$(".card_MemberList").show();
			$(".background10").show();
		});

		$("#cardMember2").click(function() {
			$(".card_MemberList").show();
			$(".background10").show();
		});

		$("#cardMember3").click(function() {
			$(".card_MemberList").show();
			$(".background10").show();
		});

		$(".close_cardMemberList").click(function() {
			$(".card_MemberList").hide();
			$(".background10").hide();
		});

		$(".close_cardMemberAdd").click(function() {
			$(".card_MemberList_add").hide();
			$(".background11").hide();
		});

		$(".close_cardMemberDelete").click(function() {
			$(".card_MemberList_del").hide();
			$(".background12").hide();
		});
	});

	function cardMemberAddView() {
		$(".card_MemberList_add").show();
		$(".background11").show();
	}

	function cardMemberDelView() {
		$(".card_MemberList_del").show();
		$(".background12").show();
	}
</script>
</head>
<body>
<div class="background10"></div>

<div class="font9">
	<div class="card_MemberList">
		<span>Card Member List</span>
		<span class="close_cardMemberList">X</span>

		<hr color="#D8E9EF" size="1">
		
		<div class="card_Member_List">
		<div class="view4">
			<div class="scrollBlind4">
				<div>박명배</div>
				<div>조혜인</div>
				<div>배지현</div>
				<div>최우석</div>
				<div>이명희</div>
				<div>최문영</div>
				<div>박명배</div>
				<div>조혜인</div>
				<div>배지현</div>
				<div>최우석</div>
				<div>이명희</div>
				<div>최문영</div>
			</div>
		</div>
		</div>
		<p>
		<div align="right">
			<div class="cardMember_ListAdd">
				<a id="cardMemberAdd" onclick="cardMemberAddView();">Add</a>
			</div>
			<div class="cardMember_ListDelete">
				<a id="cardMemberDelete" onclick="cardMemberDelView();">Delete</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>