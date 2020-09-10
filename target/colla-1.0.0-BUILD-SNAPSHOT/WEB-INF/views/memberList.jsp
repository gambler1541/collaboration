<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Member List</title>
<style>
.background7 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
}

.font6 {
	font-family:DX경필명조B;
	font-size:13pt;
}

.b_MemberList {
	display: none;
	width:240px;
	height:270px;
	position: absolute;
	top: 18%;
	left:10%;
	background: #F6F6F6;
	border-radius:6px;
	padding:1%;
}

.close_memberList {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1.5%;
}

.memberDeleteBtn {
	float: right;
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #444F59;
	font-family: DX경필명조B;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
	cursor:pointer;
}

.memberDeleteBtn:hover {
	background-color: #444f5999;
	transition:0.3s;
	cursor:pointer;
}

.boardmember_List {
	border:1px solid #D8E9EF;
	padding:1%;
	width:234px;
	height:160px;
	font-size:13pt;
}

.scrollBlind2 {
	width:100%;
	height:100%;
	overflow-y:auto;
}

.view2 {
	width:236px;
	height:160px;
	overflow: hidden;
}

.userIcon3 {
	display:inline-block;
	border-radius:60px;
	background-color: #E85A71;
	width: 40px;
	height: 40px;
	overflow:hidden;
}

.profile5 {
	width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#boardmemberList").click(function() {
			$(".b_MemberList").show();
			$(".background7").show();
		});

		$(".close_memberList").click(function() {
			$(".b_MemberList").hide();
			$(".background7").hide();
		});

		$(".background7").click(function() {
			$(".b_MemberList").hide();
			$(".background7").hide();
		});

		$("#memberDelete").click(function() {
			$(".b_MemberList").hide();
			$(".background7").hide();
		});
	});
</script>
<jsp:include page="./memberDel.jsp" />

</head>
<body>
<div class="background7"></div>

<div class="font6">
	<div class="b_MemberList">
		<span class="close_memberList">X</span>
		<span>Board Member List</span>
		
		<hr color="#D8E9EF" size="2">
		
		<div class="boardmember_List">
		<div class="view2">
			<div class="scrollBlind2">
				<c:forEach var="mvo" items="${mlist }">
					<table>
						<tr>
							<td>
								<div class="userIcon3">
									<img src="${mvo.getImg()}" class="profile5" />
								</div>
							</td>
							<td style="vertical-align:bottom;">
								<span>${mvo.getName()}</span>
								<br><br>
							</td>
						</tr>
					</table>
				</c:forEach>
			</div>
		</div>
		</div>
		<br>
		<div class="memberDeleteBtn">
			<a id="memberDelete">Delete</a>
		</div>
	</div>
</div>
</body>
</html>