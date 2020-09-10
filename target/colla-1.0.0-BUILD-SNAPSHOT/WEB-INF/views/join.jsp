<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
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
	background-size: 520px 330px, 315px 426px;
	background-position: 110% 30%, 5% 250%;
}

.signform {
	margin-left: 28%;
	margin-top: 5%;
	background-color: white;
	font-family: DX경필명조B;
	height: 650px;
	width: 650px;
	box-shadow: 5px 5px 5px 5px #CFCFCF;
}

.signupSubmit {
	background-color: #E85A71;
	color: white;
	border-style: none;
	border-radius: 3px;
	width: 55.5%;
	height: 32px;
	cursor:pointer;
}

.signupEmail, .signupPass, .signupName {
	border-radius: 4px;
	border: 1.5px solid #4EA1D3;
	width: 55%;
	height: 30px;
}

.signupEmail::placeholder, .signupPass::placeholder, .signupName::placeholder {
	font-family:DX경필명조B;
	font-size:12pt;
}

input:focus {
	outline: none;
}

.signAccount {
	padding-top: 10px;
	font-size: 25pt;
}

.signline {
	display: inline-block;
	width: 70%;
	color:#444f59;
	size:2px;
}

.logo {
	padding-top: 5%;
	cursor:pointer;
}

.signupfont {
	font-family: DX경필명조B;
	font-size:13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$(function() {
		$("img").click(function() {
			location.href = "/";
		});

		$("#email").blur(
			function() {
				console.log('#email function() start');
				var email = $('#email').val();

				$.ajax({
					url : '/member/emailcheck?email=' + email,
					type : 'get',
					success : function(data) {
						if (data == 1) {
							$('#emailcheck').text("This Email is already in use.");
							$('#emailcheck').css("color", "red");
							$('#emailcheck').css("font-family", "DX경필명조B");
							$('#signup').attr("disabled", true);
						} else {
							$('#emailcheck').text('You can use this Email.');
							$('#emailcheck').css("color", "green");
							$('#emailcheck').css("font-family", "DX경필명조B");
							$('#signup').attr("disabled", false);
						}
					},
					error : function(xhr, status, error, data) {
						console.log("실패");
						console.log(xhr);
						console.log(status);
						console.log(error);
						console.log("data출력 : " + data);
					}
				});
			}
		);
	});
});
</script>

<body align="center">
	<img class="logo" src="../images/colla_logo.png" width="120" height="60">
	<form name="joinForm" action="/member/join" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<div class="signform">
			<table align="center" width="100%">
				<tr>
					<th colspan="2"><p class="signAccount">Sign up for your account</p><br><br></th>
				</tr>
				<tr>
					<td>
						<input type="email" name="email" id="email" class="signupEmail signupfont" placeholder="Enter Email" required="required"><br>
						<span id="emailcheck"></span>
					</td>
				</tr>
				
				<tr><td><br></td></tr>
				
				<tr>
					<td>
						<input type="text" name="name" id="name" class="signupName signupfont" placeholder="Enter Name" required="required"><br>
					</td>
				</tr>
				
				<tr><td><br></td></tr>
				
				<tr>
					<td>
						<input type="password" name="password" id="password" class="signupPass signupfont" placeholder="Enter Password" required="required"><br>
					</td>
				</tr>
				
				<tr><td><br><br><br></td></tr>
				
				<tr>
					<td>
						<input class="signupfont signupSubmit" type="submit" name="signup" id="signup" value="Sign Up" /><br>
					</td>
				</tr>
				
				<tr><td><br><br><hr class="signline"><br><br></td></tr>
			</table>
		</div>
	</form>
	
	<div style="margin-top: 50px;">
		<jsp:include page="./footer2.jsp" />
	</div>
</body>
</html>