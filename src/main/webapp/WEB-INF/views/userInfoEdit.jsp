<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information Edit</title>
<style>
.background4 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background:rgba(0, 0, 0, 0.2);
}

.userInfoModify {
	display: none;
	width:400px;
	height:450px;
	position: absolute;
	top:18%;
	left:37%;
	background:#F6F6F6;
	border-radius: 10px;
	padding-top:1%;
}

.userModify {
	width:320px;
	height: 100px;
	position: absolute;
	top: 10%;
	left: 12%;
	background:#F6F6F6;
	margin-top:5%;
}

.iconModify {
	width:320px;
	height: 100px;
	position: absolute;
	top: 10%;
	left: 12%;
	background:#F6F6F6;
	margin-top:60%;
}

.close_userInfoEdit {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 15pt;
	font-family: DX경필명조B;
	float: right;
	padding-right: 5%;
}

.font4 {
	font-family:DX경필명조B;
	font-size:13pt;
}

.font4::placeholder {
	font-family:DX경필명조B;
}

.modifyBtn {
	width: 80px;
	height: 40px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	font-size: 13pt;
	border:0;
	border-radius: 5px;
	text-align: center;
	padding-top: 0.5%;
	color: white;
	margin-top:38%;
	margin-left:8%;
}

.iconBtn {
	display: inline-block;
	cursor:pointer;
	width:120px;
	height:	30px;
	background-color: #444f59;
	font-family: DX경필명조B;
	font-size: 13pt;
	border-radius: 5px;
	text-align: center;
	color: white;
	padding-top:6%;
}

.iconSubmit {
	display: inline-block;
	cursor:pointer;
	width:120px;
	height:40px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	font-size: 13pt;
	border-radius: 5px;
	border:0;
	text-align: center;
	color: white;
}

input[type="file"] {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
	cursor:pointer;
}

.modifyBtn:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition:0.3s;
}

.iconBtn:hover {
	background-color: #444f5999;
	cursor: pointer;
	transition:0.3s;
}

.iconSubmit:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition:0.3s;
}

.newName::placeholder {
	font-family: DX경필명조B;
	font-size: 5pt;
}

.newName, .oriEmail {
	border: 0;
	border-radius:5px;
	resize: none;
}

.newName:focus {
	outline: none;
	border: 1px solid #4ea1d3;
}

#image_container {
	display: inline-block;
	border:2px solid #444f59;
	border-radius:60px;
	width:80px;
	height:80px;	
	overflow:hidden;
}

.profile4 {
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
		$('#infoEdit').click(function() {
			$('.userInfoModify').show();
			$(".background4").show();
			$(".userWrap").hide();
			$(".background3").hide();
		});

		$('.close_userInfoEdit').click(function() {
			$('.userInfoModify').hide();
			$(".background4").hide();
		});

		$(".background4").click(function() {
			$('.userInfoModify').hide();
			$(".background4").hide();
		});
	});

	function setThumbnail(event) {
      var reader = new FileReader();

      reader.onload = function(event) {
         $("#image_container").empty();
         var img = document.createElement("img");
         img.setAttribute("src", event.target.result);
         img.setAttribute("height", "80");
         img.setAttribute("width", "80");
         document.querySelector("#image_container").appendChild(img);
      };

      reader.readAsDataURL(event.target.files[0]);
   }
</script>
</head>
<body>
	<div class="background4"></div>

	<div class="userInfoModify">
		<form action="/member/modify" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<input type="hidden" name="email" value="${memberVO.getEmail() }" />
			
			<span class="close_userInfoEdit">X</span>

			<div class="userModify">
				<table>
					<tr>
						<td>
							<span class="font4" align="center">이메일</span>
						</td>
						<td>&emsp;</td>
						<td>
							<input type="text" name="email1" id="mail" class="oriEmail font4" size="25" disabled="disabled" value="${memberVO.getEmail()}">
						</td>
					</tr>
					<tr><td><br></td></tr>
					<tr>
						<td>
							<span class="font4" align="center">이름</span>
						</td>
						<td>&emsp;</td>
						<td><input type="text" name="name" id="name" class="newName font4" size="25" required="required" value="${memberVO.getName()}"></td>
					</tr>
				</table>
			</div>
			
			<div align="center">
			<input type="submit" value="Modify" class="modifyBtn">
			</div>
		</form>
		<br>
		<hr color="#D8E9EF" size="2">
		<br>
		<form action="/member/imgupload?${_csrf.parameterName }=${_csrf.token}" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
        	<input type="hidden" name="email" value="${memberVO.getEmail()}"/>
        	
			<div class="iconModify">
        		<table width="100%">
        			<tr>
        				<td align="center">
        					<span id="image_container">
        						<img src="${memberVO.getImg()}" class="profile4"/>
        					</span>
        				</td>
        				<td>&emsp;</td>
        				<td align="center">
        					<div class="iconBtn">
								<label for="iconFile" style="cursor:pointer;">Choose Icon</label>
								<input type="file" value="Icon" id="iconFile" name="file" onchange="setThumbnail(event)">
							</div>
        				</td>
            		</tr>
            		<tr><td><br></td></tr>
        			<tr>
        				<td colspan="3" align="center">
        					<input type="submit" value="Change Icon" class="iconSubmit"/>
        				</td>
        			</tr>
         		</table>
			</div>
		</form>
	</div>
</body>
</html>