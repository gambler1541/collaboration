<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information</title>
<!-- 가입한 유저의 간략화된 정보를 볼 수 있다. 닉네임과 이메일, 정보 수정버튼과 로그아웃 버튼이 있다 -->

<style>
/* 배경을 클릭했을때 모달창이 꺼지게 만들기 위함 */
.background3 {
	display:none;
	position:absolute;
	width:100%;
	height:100%;
}

.userWrap {
	display: none;
	width: 250px;
	height:400px;
	position: absolute;
	top:10%;
	left:83%;
	background:white;
	border-radius:10px;
	box-shadow:3px 3px 3px #cfcfcf;
	z-index:1;
}

.userInformation {
	width: 100%;
	height: 100%;
}

/* 모달창을 닫기 위한 X 버튼 */
.close_userInfo {
	color:#cfcfcf;
	cursor:pointer;
	font-size:15pt;
	float:right;
	padding-right:5%;
}

/* 사용자가 선택한 이미지를 출력하는 곳 */
.userImg {
	display: inline-block;
	border-radius:60px;
	background-color:white;
	width:70px;
	height:70px;	
	cursor:pointer;
	overflow:hidden;
}

.profile3 {
	width: 100%;
    height: 100%;
    object-fit: cover;
}

.account {
	display:inline-block;
	font-size:13pt;
}

.padding1 {
	padding:5%;
}

.padding2 {
	padding:10%;
}

.logout {
	border:0;
	font-size:1rem;
	cursor:pointer;
	background-color:rgba(0, 0, 0, 0.0);
}

.deleteAccount {
	text-decoration:none;
	color:#CFCFCF;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$("#userInfo").click(function() {
		$(".userWrap").show();
		$(".background3").show();
	});

	$(".close_userInfo").click(function() {
		$(".userWrap").hide();
		$(".background3").hide();
	});

	$(".background3").click(function() {
		$(".userWrap").hide();
		$(".background3").hide();
	});

	$("#infoEdit").click(function() {
		$(".userWrap").hide();
		$(".background3").hide();
	});

	$("#passwdEdit").click(function() {
		var changePass = window.open("/member/changePasswd", "changePasswd", "width=550, height=500, top=150px, left=500px, resizable=no");
	})
});

</script>
</head>
<body>
<c:url value="/logout" var="logout"/>
<form:form action="${logout}" method="POST">
	<div class="background3"></div>
	
	<div class="userWrap">
		<div class="padding1">
		<div>
			<div class="account">Account</div>
			<span class="close_userInfo">X</span>
		</div>
		</div>
		
		<hr color="#D8E9EF" size="2">
		
		<div class="padding2">
		<div class="userInformation">
			<div align="center">
				<span class="userImg">
					<img src="${memberVO.getImg()}" class="profile3">
				</span>
			</div>
			<br>
			
			<div align="center">${memberVO.getName()}</div>
			<div align="center">${memberVO.getEmail()}</div>
			
			<hr color="#D8E9EF" size="1">
			
			<div align="center" id="infoEdit" style="cursor:pointer;">Profile And Visibility</div>
			<br>
			
			<div align="center" id="passwdEdit" style="cursor:pointer;">Change Password</div>

			<hr color="#D8E9EF" size="1">

			<div align="center" id="logout"><input type="submit" value="Log Out" class="logout"></div>
			
			<br>
			<div align = "center" id = "withdrawal" style="cursor:pointer;"><a href="/member/withdrawal" class="deleteAccount">Delete My Account</a></div>   
		</div>
		</div>
	</div>
</form:form>
<jsp:include page="./userInfoEdit.jsp"/>
</body>
</html>