<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header2</title>
<!-- boardList와 board에 include되는 header. 홈으로 갈 수 있는 버튼, 검색창, 로고, 유저 정보 아이콘이 있다 -->

</head>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	background-color: #F5FAFA;
}

.header2 {
	position: fixed;
	width: 100%;
	height: 60px;
	background-color:rgba(0, 0, 0, 0.05);
}

/* 검색창에 적용한 스타일 */
.searchBoard {
	float: left;
	border-radius: 3px;
	border: 1.5px solid #444F59;
	background-color: #00000000;
	font-family:DX경필명조B;
	font-size:13pt;
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
	background-size:25px 25px;
	background-position:280px 5px;
    background-repeat: no-repeat;
    cursor:pointer;
}

input:focus {
	outline:none;
}

/* 홈으로 돌아가기 위한 홈버튼에 적용한 스타일 */
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

/* 사용자의 유저 아이콘이 출력되는 곳의 스타일 */
.userIcon1 {
	display: inline-block;
	border-radius:60px;
	background-color:white;
	width: 40px;
	height: 40px;
	position: fixed;
	left: 95%;
	top: 1.2%;
	cursor:pointer;
	overflow:hidden;
}

.profile1 {
	width: 100%;
    height: 100%;
    object-fit: cover;
}

.pushBell {
	display: inline-block;
	border-radius: 5px;
	background-color:#444f59;
	width:28px;
	height:27px;
	position:fixed;
	left:91.5%;
	top:1.2%;
	align-items: center;
	padding:0.4%;;
	cursor:pointer;
}

.pushImg {
	width: inherit;
	max-width: 100%;
	height: auto;
}

.pushBell:hover {
	background-color:#444f5999;
	transition:0.3s;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$("#userInfo").click(function() {
		$('.userInfoModify').hide();
		$(".background4").hide();
	});
});

 function search(){
	if(window.event.keyCode == 13){
		searchForm.submit();
	}
 }
</script>
<body>
<jsp:include page="./userInfo.jsp"/>
<jsp:include page="./pushBell.jsp"/>

	<header align="center" class="header2">
		<a class="home" href="/board/boardlist" name="home" id="home">
			<img src="../images/home.png" width="30px" height="25px">
		</a>
		<form action="/board/boardlist" name="searchForm">
		<input class="searchBoard" type="text" name="keyword" id="keywordInput" autocomplete="off" onkeyup="search();"/>
		</form>
		<img src="../images/colla_logo.png" width="100" height="40" class="logo">
		
		<div class="pushBell" id="pushBell"><img src="../images/pushBell.png" class="pushImg"></div>
		<span class="userIcon1" id="userInfo"><img src="${memberVO.getImg()}" class="profile1"></span>
	</header>
	
</body>
</html>