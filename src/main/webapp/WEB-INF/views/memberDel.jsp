<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Delete</title>
<style>
.background9 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background:rgba(0, 0, 0, 0.2);
}

.font8 {
	font-family: DX경필명조B;
	font-size: 13pt;
}

.close_memberDel {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1.5%;
}

.memberDelBtn {
	float: right;
	display: inline-block;
	width:130px;
	height:28px;
	background-color:#E85A71;
	font-family: DX경필명조B;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
	cursor:pointer;
}

.memberDelBtn:hover {
	background-color: #E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.memberDelWrap {
	display: none;
	width:220px;
	height:250px;
	position: absolute;
	top: 18%;
	left:42%;
	background: #F6F6F6;
	border-radius: 10px;
	padding:1%;
}

.view3 {
	width: 200px;
	height:160px;
	overflow: hidden;
}

.scrollBlind3 {
	width:230px;
	height:100%;
	overflow-y: scroll;
}

.boardDelMember_List {
	border:1px solid #D8E9EF;
	padding:1%;
	width:210px;
	height:160px;
	font-size:13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#memberDelete").click(function() {
			$(".memberDelWrap").show();
			$(".background9").show();
		});

		$(".close_memberDel").click(function() {
			$(".memberDelWrap").hide();
			$(".background9").hide();
		});
	});
</script>
</head>
<body>
<div class="background9"></div>

	<form action="" method="post">
	
	<div class="font8">
		<div class="memberDelWrap">
			<span>Choose Delete Member</span>
			<span class="close_memberDel">X</span>
			
			<hr color="#D8E9EF" size="2">
			
			<div class="boardDelMember_List">
			<div class="view3">
				<div class="scrollBlind3">
					<!-- 보드에서 삭제할 멤버들을 보여주는 리스트 -->
					<div><input type="checkbox">member1</div>
					<div><input type="checkbox">member2</div>
					<div><input type="checkbox">member3</div>
				</div>
			</div>
			</div>
			
			<br>
			
			<div class="memberDelBtn">
				<a id="deleteMember">Delete Member</a>
			</div>
		</div>
	</div>	
		
	</form>
</body>
</html>