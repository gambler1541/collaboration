<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Board</title>
<style>
.newBoard {
	display: none;
	width: 300px;
	height:auto;
	position: absolute;
	top: 15%;
	left: 38%;
	background: #F6F6F6;
	border-radius:10px;
	padding:1%;
	box-shadow:3px 3px 3px #cfcfcf;
}

.background5 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.2);
}

.close_newBoard {
	color: #cfcfcf;
	font-family: DX경필명조B;
	font-size:15pt;
	float:right;
	padding-right:2%;
	cursor:pointer;
}

.newBoardContent {
	width: 100%;
	height: 100%;
}

.boardCreateBtn {
	display: inline-block;
	width: 130px;
	height:27px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
	float:right;
	cursor:pointer;
}

.boardCreateBtn:hover {
	background-color: #E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.withMember {
	display: inline-block;
	width: 130px;
	height:27px;
	background-color: #444f59;
	font-family: DX경필명조B;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
	float:left;
	cursor:pointer;
}

.withMember:hover {
	background-color: #444f5999;
	transition:0.3s;
	cursor:pointer;
}

.newBoardTitle {
	font-family:DX경필명조B;
	width: 290px;
	height: 27px;
	font-size:13pt;
	border: 0;
	border-radius:5px;
}

.newBoardContent {
	font-family:DX경필명조B;
	width: 290px;
	height: 120px;
	font-size:13pt;
	border: 0px;
	resize: none;
	border-radius:5px;
}

.newBoardTitle::placeholder, .newBoardContent::placeholder {
	font-family: DX경필명조B;
	font-size: 13pt;
}

.newBoardTitle:focus, .newBoardContent:focus {
	outline: none;
	border: 1px solid #4EA1D3;
}

#addmember {
	background-color:white;
	width:100%;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#addNewBoard").click(function() {
			$(".newBoard").show();
			$(".background5").show();
		});

		$(".close_newBoard").click(function() {
			$(".newBoard").hide();
			$(".background5").hide();
			$(".addMemberWrap").hide();
			$("#result").empty();
			$("#search").val("");
			$(".newBoardTitle").val("");
			$(".newBoardContent").val("");
			$("#addmember").empty();
		});

		$(".background5").click(function() {
			$(".newBoard").hide();
			$(".background5").hide();
			$(".newBoardTitle").val("");
			$(".newBoardContent").val("");
			$("#addmember").empty();
		});
	})
	
	function formSubmit() {
		document.getElementById('boardform').submit();
	}
</script>
</head>
<jsp:include page="./searchMember.jsp" />

<body>
<div class="background5"></div>

	<div class="newBoard">
		<div>
			<span class="close_newBoard">X</span>
		</div>
		<br><br>
		<div class="newBoardContent">
			<div>
				<form action="/board/addboard" method="post" id="boardform">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<input type="hidden" name="bLeader" value="${memberVO.getEmail()}">
					<input class="newBoardTitle" type="text" name="bTitle" placeholder="Title">
					<br><br>

					<textarea class="newBoardContent" name="bContent" placeholder="Description"></textarea>
					
					<br><br>
					<input type="hidden" name="ex" value="ex"/>
					
					<span>With Member</span>
					<table id="addmember"></table>
					<input type="hidden" name="withmember" value="${memberVO.getEmail()}">
				</form>

				<br><br>

				<div>
					<div class="withMember">
						<div id="withmember">+ With Member</div>
					</div>
				
					<div class="boardCreateBtn">
						<a onclick="formSubmit();">Create Board</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>