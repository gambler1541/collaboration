<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
</head>
<style>
::selection {
	background:#444f59;
	color:white;
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	background-color: #D8E9EF;
	background-image: url("../images/board1-1.png"), url("../images/board2-1.png");
	background-repeat: no-repeat, no-repeat;
	background-size: 310px 196px, 126px 170px;
	background-position: 150% 20%, 10% 100%;
}

.changeBtn {
	border:0;
	border-radius:5px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	font-size: 13pt;
	color: white;
	width:80px;
	height:30px;
	cursor:pointer;
}

.changeBtn:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition:0.3s;
}

.oriPass, .newPass, .confirmPass {
	font-family:DX경필명조B;
	border-radius: 5px;
	border: 1px solid #4EA1D3;
	width:200px;
	height: 20px;
}

.oriPass::placeholder, .newPass::placeholder, .confirmPass::placeholder {
	font-family:DX경필명조B;
	font-size:12pt;
}

.oriPass:focus, .newPass:focus, .confirmPass:focus {
	outline: none;
}

.changeView {
	display:inline-block;
	background-color:rgba(255, 255, 255, 0.6);
	width:400px;
	height:auto;
	margin-top:20%;
	margin-left:15%;
}

.font13 {
	font-family:DX경필명조B;
	font-size:13pt;
}

.text {
	font-family:tvN 즐거운이야기;
	font-size:25pt;
}

.alert {
	color:#E85A71;
	font-size:13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function passSubmit() {
	var pwd1 = $("#newPassword").val();
	var pwd2 = $("#newPasswordConfirm").val();
	
	if(pwd1 != "" && pwd2 != "") {
		if(pwd1 == pwd2) {
			passchangeForm.submit();
		}
		else {
			$("#passCheck").empty();
			$("#passCheck").append("<span class='alert'>Passwords do not match</span>");
		}
	}
}
</script>
<body>
	<form action="/member/changePasswd" method="post" name="passchangeForm">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	<input type="hidden" name="email" value="${memberVO.getEmail()}">
	<div class="changeView font13" align="center">
		<div class="text">Change Password</div>
		
		<br><br>
		<table align="center">
			<tr>
			</tr>
			<tr>
				<td><span>기존 비밀번호</span></td>
				<td>
					<input type="password" name="password" id="oriPassword" class="oriPass" placeholder="Enter Original Password" required="required">
				</td>
			</tr>
			
			<tr><td><br></td></tr>
			
			<tr>
				<td><span>새 비밀번호</span></td>
				<td>
					<input type="password" name="newpassword" id="newPassword" class="newPass" placeholder="Enter New Password" required="required">
				</td>
			</tr>
			
			<tr><td><br></td></tr>
			
			<tr>
				<td><span>새 비밀번호 확인</span></td>
				<td>
					<input type="password" name="newpassword1" id="newPasswordConfirm" class="confirmPass" placeholder="Confirm Password" required="required">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div id="passCheck" align="center"></div>
				</td>
			</tr>
			<tr><td><br></td></tr>

			<tr>
				<td colspan="2" align="center">
					<input type="button" value="Modify" class="changeBtn" onclick="passSubmit();">
				</td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>