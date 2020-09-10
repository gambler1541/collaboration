<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>Colla</title>
<!-- 사이트의 홈 화면이다. 이 사이트가 어떤 사이트인지 간략하게 설명되어 있다 -->

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
}

.main {
	font-family:tvN 즐거운이야기;
	font-size:40pt;
	font-weight:bold;
	color:#444f59;
}

.sub {
	font-family:DX경필명조B;
	font-size:20pt;
	color:#444f59;
}

.padding1 {
	padding-top:100px;
	width:100%;
}

.padding2 {
	padding-left:300px;
}

.padding3 {
	padding-left:300px;
	padding-top:60px;
	padding-bottom:40px;
}

.padding_left1 {
	padding-left:130px;
}

.padding_left2 {
	padding-left:100px;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body>
<jsp:include page="./header.jsp"/>

<div class="padding1" style="background-color:#D8E9EF80">
<pre align="left" class="padding2">
<font class="main">
Colla를 사용하면 
더 많은 공동 작업을 수행하고
더 많은 작업을 수행할 수 있습니다!
</font>
</pre>

<pre align="left" class="padding2">
<font class="sub">
Colla의 보드, 목록 및 카드를 사용하면
재미있고 유연하며 보람있는 방식으로
프로젝트를 구성하고 우선 순위를 지정할 수 있습니다
</font>
</pre>

<div align="left" class="padding3"></div>
</div>

<div style="padding-top:100px; padding-right:60px; margin-bottom:100px;">
<table>
	<tr>
		<td>
			<font class="main padding_left1">모든 팀과 협력</font><br>
			<font class="sub padding_left1">
			업무, 부수 프로젝트 또는 다음 가족 휴가 등<br>
			<font class="sub padding_left1">
			Colla는 팀이 잘 유지하도록 도와줍니다</font>
			</font>
		</td>
		<td style="padding-left:20px"><img src="../images/board1.png" width="777" height="491"></td>
	</tr>
	<tr><td style="padding-top:100px"></td></tr>
	<tr>
		<td style="padding-left:230px"><img src="../images/board2.png" width="314" height="420"></td>
		<td>
			<font class="main padding_left2">한눈에 보는 정보</font><br>
			<font class="sub padding_left2">댓글, 마감일 등을 Colla 카드에<br></font>
			<font class="sub padding_left2">직접 추가하여 세부 정보를 자세히 살펴보세요<br></font>
			<font class="sub padding_left2">프로젝트를 처음부터 끝까지 공동 작업하세요<br></font>
		</td>
	</tr>
</table>
</div>

<jsp:include page="./footer.jsp"/>

</body>
</html>