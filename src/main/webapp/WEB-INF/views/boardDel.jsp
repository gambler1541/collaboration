<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Delete</title>

<style>
.background15 {
	width: 100%;
	height: 100%;
	display: none;
	position: absolute;
	background: rgba(0, 0, 0, 0.4);
}

.boardDelete {
	display: none;
	width:200px;
	height:80px;
	position: absolute;
	top: 25%;
	left: 40%;
	background: #F6F6F6;
	border-radius: 10px;
	padding:1%;
}

.boardDeleteBtn {
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
	cursor: pointer;
}

.boardDeleteBtn:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition: 0.3s;
}

.close_boardDelete {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1.5%;
}

.font15 {
	font-family:DX경필명조B;
	font-size:13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(function() {
		$("#deleteBoard").click(function() {
			$(".boardDelete").show();
			$(".background15").show();
		});
		
		$(".close_boardDelete").click(function() {
			$(".boardDelete").hide();
			$(".background15").hide();
		});


				
	});
		   var bFk = ${bFk};
		   
		   function boardDelete(){

		       $.ajax({
		            url : "/board/deleteboard?bFk=" + bFk,
		            type : "post",
		            beforeSend : function(xhr) {
		                  xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		               },
		            success : function(data){ 
			           
		               console.log("success data" + data);
		               if(data=="NotLeader") {
									swal("You do not have access to perform");
			               }else if(data=="Leader"){
									history.go(-1);
				               }
		          },
		          error : function(xhr, status, data){
		            console.log("xhr : " + xhr);
		            console.log("status : " + status);
		            console.log("data : " + data);
		            console.log("실패" );
		             }
		       });
		   }
</script>
</head>
<body>
<div class="background15"></div>

<div class="font15">
	<div class="boardDelete">
		<span style="color:#e85a71; font-size:15pt">Board Delete?</span>
		<span class="close_boardDelete">X</span>

		<br><br>

		<div align="center">
			<div class="boardDeleteBtn">
				<a id="boardDeleteBtn" onclick="boardDelete();">Delete</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>