<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header3</title>
</head>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	background-color: #F5FAFA;
}

.header3 {
	position: fixed;
	width: 100%;
	height: 60px;
	background-color: #D8E9EF;
}

.searchBoard {
	float: left;
	border-radius: 3px;
	border: 1.5px solid #444F59;
	background-color: #00000000;
	width: 10%;
	height: 30px;
	margin-top: 0.8%;
	animation-name: animation2;
	animation-duration: 0.3s;
	-webkit-animation-fill-mode: both;
}

@keyframes animation {
	from { 
		width:10%;
		background-color: #00000000;
	}

	to {
		width: 20%;
		background-color: white;
	}
}

@keyframes animation2 {
	from { 
		width:20%;
		background-color: white;
	}

	to {
		width: 10%;
		background-color: #00000000;
	}
}

.searchBoard:focus {
	animation-name: animation;
	animation-duration: 0.3s;
	-webkit-animation-fill-mode: both;
	background-image: url(../images/search.png);
	background-size: 25px 25px;
	background-position: 280px 5px;
	background-repeat: no-repeat;
	cursor: pointer;
}

input:focus {
	outline: none;
}

.home {
	display: inline-block;
	width: 40px;
	height: 30px;
	margin-top: 0.8%;
	margin-left: 2%;
	margin-right: 0.8%;
	padding-top: 0.2%;
	float: left;
	background-color: #444F59;
	border-radius: 5px;
}

.logo {
	padding-top: 0.4%;
	padding-right: 15%;
	position: fixed;
	left: 45%;
}

.userIcon2 {
	display: inline-block;
	border-radius:60px;
	background-color: #E85A71;
	width: 40px;
	height: 40px;
	position: fixed;
	left: 95%;
	top: 1.2%;
	cursor:pointer;
	overflow:hidden;
}

.profile2 {
	width: 100%;
    height: 100%;
    object-fit: cover;
}

.underhead {
	position: fixed;
	width: 100%;
	height: 50px;
	background-color: #D7F0F0;
	margin-top:3.9%;
	padding-top:1%;
}

.boardMemberList {
	display: inline-block;
	background-color: #444F59;
	color: white;
	border-radius: 3px;
	font-family: DX경필명조B;
	text-align: center;
	padding-top: 0.6%;
	height: 25px;
	width: 110px;
	cursor: pointer;
}

.boardMemberList:hover {
	background-color: #444F5999;
	cursor: pointer;
	transition: 0.3s;
}

.boardMemberAdd {
	display: inline-block;
	background-color: #E85A71;
	color: white;
	border-radius: 3px;
	font-family: DX경필명조B;
	text-align: center;
	padding-top: 0.6%;
	height: 25px;
	width: 65px;
	cursor: pointer;
}

.boardMemberAdd:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition: 0.3s;
}

.boardDel_Btn {
	float:right;
	display: inline-block;
	background-color: #E85A71;
	color: white;
	border-radius: 3px;
	font-family: DX경필명조B;
	text-align: center;
	padding-top: 0.6%;
	height: 25px;
	width: 110px;
	cursor: pointer;
	margin-right:2%;
}

.boardDel_Btn:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition: 0.3s;
}

#addList {
	display:inline-block;
	width:150px;
	height: 25px;
	border:0px;
	border-radius:5px;
	background-color:rgba(0, 0, 0, 0.1);
	font-family: DX경필명조B;
	color:#444f59;
	text-align: center;
	padding-top: 0.6%;
	cursor: pointer;
}

#addList:hover {
	background-color:rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

.boardName {
	margin-left:2%;
	margin-right:2%;
}

</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$("#boardmemberList").click(function() {
		$(".b_MemberInvite").hide();
		$(".background8").hide();

		$(".listAdd").hide();
		$(".background14").hide();

		$(".userWrap").hide();
		$(".background3").hide();

		$(".boardDelete").hide();
		$(".background15").hide();

		$('.userInfoModify').hide();
		$(".background4").hide();

		$(".memberDelWrap").hide();
		$(".background9").hide();
	});
	
	$("#boardmemberAdd").click(function() {
		$(".b_MemberList").hide();
		$(".background7").hide();
		
		$(".listAdd").hide();
		$(".background14").hide();

		$(".userWrap").hide();
		$(".background3").hide();

		$(".boardDelete").hide();
		$(".background15").hide();

		$('.userInfoModify').hide();
		$(".background4").hide();

		$(".memberDelWrap").hide();
		$(".background9").hide();
	});

	$("#addList").click(function() {
		$(".b_MemberList").hide();
		$(".background7").hide();
		
		$(".b_MemberInvite").hide();
		$(".background8").hide();

		$(".userWrap").hide();
		$(".background3").hide();

		$(".boardDelete").hide();
		$(".background15").hide();

		$('.userInfoModify').hide();
		$(".background4").hide();

		$(".memberDelWrap").hide();
		$(".background9").hide();
	});

	$("#deleteBoard").click(function() {
		$(".b_MemberList").hide();
		$(".background7").hide();
		
		$(".b_MemberInvite").hide();
		$(".background8").hide();

		$(".userWrap").hide();
		$(".background3").hide();

		$(".listAdd").hide();
		$(".background14").hide();

		$('.userInfoModify').hide();
		$(".background4").hide();

		$(".memberDelWrap").hide();
		$(".background9").hide();
	});

	$("#userInfo").click(function() {
		$(".b_MemberList").hide();
		$(".background7").hide();
		
		$(".b_MemberInvite").hide();
		$(".background8").hide();

		$(".boardDelete").hide();
		$(".background15").hide();

		$(".listAdd").hide();
		$(".background14").hide();

		$('.userInfoModify').hide();
		$(".background4").hide();

		$(".memberDelWrap").hide();
		$(".background9").hide();
	});
});
</script>

<body>
	<jsp:include page="./userInfo.jsp" />
	<jsp:include page="./memberList.jsp" />
	<jsp:include page="./memberAdd.jsp" />
	<jsp:include page="./boardDel.jsp"/>

	<header align="center" class="header3">
		<a class="home" href="/board/boardlist" name="home" id="home">
			<img src="../images/home.png" width="30px" height="25px">
		</a>
		<input class="searchBoard" type="text" name="keyword" id="keywordInput" autocomplete="off"/>
		<img src="../images/colla_logo.png" width="100" height="40" class="logo">
		<span class="userIcon2" id="userInfo"><img src="${memberVO.getImg()}" class="profile2"></span>
	</header>

	<div class="underhead">
		<span class="boardName">board name</span>
		<div class="boardMemberList" id="boardmemberList">Member List</div>
		<div class="boardMemberAdd" id="boardmemberAdd">Invite</div>
		<div id="addList" onclick="createList();">+ Add another List</div>
		<div class="boardDel_Btn" id="deleteBoard">Board Delete</div>
	</div>
</body>
</html>