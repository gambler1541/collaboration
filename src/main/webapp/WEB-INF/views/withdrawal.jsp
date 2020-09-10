<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete(회원 탈퇴)</title>
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
	background-color: #D8E9EF80;
	background-image: url("../images/board1-1.png"), url("../images/board2-1.png");
	background-repeat: no-repeat, no-repeat;
	background-size: 520px 330px, 315px 426px;
	background-position: 110% 25%, 5% 150%;
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
	width:20%;
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
	color:#444f59;
}

.logo {
	padding-top: 5%;
	cursor:pointer;
}

.signupfont {
	font-family: DX경필명조B;
	font-size:13pt;
}

#submitdelete {
	border:0;
	background-color:#E85A71;
	border-radius:5px;
	height:30px;
	width:180px;
	color:white;
	font-family:DX경필명조B;
	font-size:13pt;
}

#submitdelete:hover {
	background-color:#E85A7199;
	transition:0.3s;
}

#submitdelete:focus {
	outline:none;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    // 취소
    $(".cancle").on("click", function(){
       location.href = "/";
                 
    })
 
    $("#submitdelete").on("click", function(){

    	var password = document.getElementById("password").value;
    	
	      if($("#password").val()==""){
          alert("비밀번호를 입력해주세요.");
          $("#password").focus();
          return false;
       }
        if(confirm('Are you sure you want to delete account?')) {

        	 $.ajax({
                 url : "/member/withdrawal?password=" + password,
                 type : "POST",
                 beforeSend : function(xhr) {
                     xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                  },
                 success: function(data){
                    
                    if(data=="NotPassword"){
                       alert("Your password is invalid. Please try again.");
                       history.go(0);
                    }else{
                      		location.href="/"; 
                    }
                 }
              });
              
            }
        else { return false;}
    });
 })
</script>

<body align="center">
	<img class="logo" src="../images/colla_logo.png" width="120" height="60">
	<form name="delForm" action="/member/withdrawal" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<div class="delform">
			<table align="center" width="100%">
				<tr>
					<th colspan="2"><p class="signAccount">Password Check</p><br></th>
				</tr>
				
				<tr>
					<td>
						<input type="password" name="password" id="password" class="signupPass signupfont" placeholder="Enter Password" required="required"><br>						
					</td>
				</tr>
				<tr>
					<td>
						<br><button id="submitdelete">Delete My Account</button>					
					</td>
				</tr>
			</table>
		</div>
	</form>
	
	<c:if test="${msg == false}">
 	<p>
 		Your password is invalid. Please try again.
 	</p>
	</c:if>
	
	
	<div style="margin-top:80px;">
		<jsp:include page="./footer2.jsp" />
	</div>
</body>
</html>