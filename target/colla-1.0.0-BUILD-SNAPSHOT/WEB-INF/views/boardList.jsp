<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 로그인 후 나오는 페이지. 내가 만들거나 속해 있는 보드의 리스트를 보여준다 -->

<title>Board List</title>
</head>
<style>
::selection {
	background:#444f59;
	color:white;
}

html, body {
	width:100%;
	height:100%;
	margin:0;
	background-color:#F5FAFA;
	overflow:hidden;
}

.margin {
	margin-bottom:10%;
	margin-left:40%;
}

.menubutton {
	border:0px;
	background-color:#00000000;
	border-radius:5px;
	color:#444f59;
	font-size:12pt;
	font-weight:bold;
	width:70%; height:35px;
	text-align:left;
}

.menubutton:hover {
	background-color:#D8E9EF;
	transition:0.3s;
}

.menubutton:focus {
	outline:none;
}

/* 새로운 보드를 만들기 위한 버튼의 스타일 */
.addboard {	
	display:table-cell;
	border:1px solid #4EA1D3;
	border-radius:6px;
	width:180px;
	height:100px;
	text-align:center;
	vertical-align:middle;
	color:#444f59;
	cursor:pointer;
}

.addboard:hover {
	background:#4EA1D3;
	color:white;
	transition:0.3s;
}

/* 만든 보드들이 출력되는 곳의 스타일 */
#boardlist {
	display:inline-block;
	margin-left:8%;
	margin-top:7%;
	width:900px;
	height:500px;
	padding:3%;
}

.menu {
	padding-left:8%;
	padding-top:10%;
	display:inline-block;
	float:left;
}

.goBoard {
	display:inline-block;
	border-radius:6px;
	background-color:#444f59;
	color:white;
	width:180px;
	height:100px;
	cursor:pointer;
}

.goBoard:hover {
	background-color:#444f5999;
	transition:0.3s;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function goBoard() {
	location.href = "/board/board";
}
</script>

<body>
<jsp:include page="./header2.jsp"/>
<jsp:include page="./addBoard.jsp"/>

<div class="menu">
<table>
	<tr>
		<td>
			<button class="margin menubutton" id="boardbtn">Boards</button>
			<button class="margin menubutton">Template</button>
		</td>
	</tr>
</table>
</div>

<div id="boardlist">
	<c:forEach var="boardVO" items="${boardList}">
		<a href="/list/list?bFk=${boardVO.getbFk()}"><div class="goBoard">${boardVO.getbTitle()}</div></a>
	</c:forEach>
	
	<div class="addboard" id="addNewBoard">+ Create New Board</div>
</div>
</body>
</html>