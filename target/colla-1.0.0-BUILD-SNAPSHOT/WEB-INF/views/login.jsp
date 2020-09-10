<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
html, body {
   width:100%;
   height:100%;
   margin:0;
   background-color:#D8E9EF;
   background-image:url("../images/board1-1.png"), url("../images/board2-1.png");
   background-repeat:no-repeat, no-repeat;
   background-size:520px 330px, 315px 426px;
   background-position:110% 30%, 5% 250%;
}

.loginform {
   margin-left:28%;
   margin-top:5%;
   background-color:white;
   font-family:DX경필명조B;
   height:650px;
   width:650px;
   box-shadow:5px 5px 5px 5px #CFCFCF;
}

.loginSubmit {
   background-color:#444F59;
   color:white;
   border-style:none;
   border-radius:3px;
   width:55.5%;
   height:32px;
   cursor:pointer;
}

.signbtn {
   background-color:#E85A71;
   color:white;
   border-style:none;
   border-radius:3px;
   width:55.5%;
   height:32px;
   cursor:pointer;
}

.loginEmail, .loginPass {
   border-radius:4px;
   border:1.5px solid #4EA1D3;
   width:55%;
   height:30px;
}

.loginEmail::placeholder, .loginPass::placeholder {
	font-family:DX경필명조B;
	font-size:12pt;
}

input:focus {
   outline:none;
}

.loginAccount {
   padding-top:10px;
   font-size:25pt;
}

.loginline {
   display:inline-block;
   width:70%;
   color:#444f59;
   size:2px;
}

.logo {
   padding-top:5%;
   cursor:pointer;
}

.loginfont {
   font-family:DX경필명조B;
   font-size:13pt;   
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
   $("img").click(function() {
      location.href = "/";
   });
});

function signForm() {
	location.href = "/member/join";
}
</script>

<body align="center">
	<img class="logo" src="../images/colla_logo.png" width="120" height="60">
	<c:url value="/login" var="board"/>
	<form:form name="loginForm" action="${board}" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<div class="loginform">
			<table align="center" width="100%">
				<tr>
					<th colspan="2"><p class="loginAccount">Log in to Colla</p><br><br></th>
				</tr>
				<tr>
					<td>
						<input type="email" name="email" id="email" class="loginEmail loginfont" placeholder="Enter Email" required="required"><br>
					</td>
				</tr>
				
				<tr><td><br></td></tr>
				
				<tr>
					<td>
						<input type="password" name="password" id="password" class="loginPass loginfont" placeholder="Enter Password" required="required"><br><br><br>
					</td>
				</tr>
				<tr>
					<td>
						<input class="loginfont loginSubmit" type="submit" name="login" id="login" value="Login"/><br>
					</td>
				</tr>
      
				<tr><td><br><br></td></tr>
      
				<tr>
					<td>
						<input class="loginfont signbtn" type="button" name="signup" id="signup" value="Sign Up" onclick="signForm();"/><br>
					</td>
				</tr>

				<tr><td><br><br><hr class="loginline"><br><br></td></tr>
			</table>
		</div>
	</form:form>
	
	<div style="margin-top:50px;">
		<jsp:include page="./footer2.jsp"/>
	</div>
</body>
</html>