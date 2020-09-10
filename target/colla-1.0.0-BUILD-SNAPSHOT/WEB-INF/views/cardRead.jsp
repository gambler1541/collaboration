<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Read</title>
<!-- 보드 페이지에서 리스트를 만들고 그 안에 카드를 만들었을 때 카드를 읽을 수 있는 모달창 -->

<style>
.background2 {
	display:none;
	position:absolute;
	width:100%;
	height:100%;
	background:rgba(0, 0, 0, 0.2);
}

.close_cardView {
   color: #cfcfcf;
   cursor: pointer;
   font-size: 15pt;
   font-family: DX경필명조B;
   float:right;
   margin-top:1%;
   margin-right:1.5%;
}

.font2 {
   font-family:DX경필명조B;
   font-size: 13pt;
}

.cardMember1 {
   float: right;
   display:inline-block;
   width: 80px;
   height: 30px;
   background-color: #444F59;
   font-family:DX경필명조B;
   font-size:13pt;
   border-radius: 3px;
   text-align: center;
   padding-top:10px;
   text-decoration: none;
   color: white;
}

.cardMember1:hover {
   background-color: #444F5999;
   transition:0.3s;
   cursor:pointer;
}

.cardEdit {
   float: right;
   display:inline-block;
   width: 80px;
   height: 28px;
   background-color: #E85A71;
   font-family:DX경필명조B;
   font-size:13pt;
   border-radius: 3px;
   text-align: center;
   padding-top:10px;
   text-decoration: none;
   color: white;
   margin-top:3%;
}

.cardEdit:hover {
	background-color:#E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.cardDelete {
   display:inline-block;
   width: 80px;
   height: 28px;
   background-color: #444f59;
   font-family:DX경필명조B;
   font-size:13pt;
   border-radius: 3px;
   text-align: center;
   padding-top:10px;
   text-decoration: none;
   color: white;
   margin-top:3%;
   margin-right:10%;
}

.cardDelete:hover {
	background-color:#444f5999;
	transition:0.3s;
	cursor:pointer;
}

.inline {
   display: inline-block;
}

#cardTitle {
	border:1px solid #CFCFCF;
	border-radius:5px;
	width:500px;
	height:30px;
	float:left;
}

#cardContent {
	border:1px solid #CFCFCF;
	border-radius:5px;
	overflow-y:auto;
	width:500px;
	height:200px;
	float:left;
}

#cardRead {
   width:600px;
   height: 300px;
   background:#F6F6F6;
   border-radius: 10px;
   padding:3%;
}

.cardBack {
   width:650px;
   height:350px;
   background:#F6F6F6;
   border-radius: 10px;
   box-shadow: 3px 3px 3px #cfcfcf;
}

#cardReadView {
	display:none;
	position:absolute;
	top:15%;
	left:28%;
}
</style>
</head>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$("#cardView").click(function() {
		$("#cardReadView").show();
		$(".background2").show();
	});

	$(".close_cardView").click(function() {
		$("#cardReadView").hide();
		$(".background2").hide();
	});

	$(".background2").click(function() {
		$("#cardReadView").hide();
		$(".background2").hide();
	});

	$("#cardEdit").click(function() {
		$("#cardReadView").hide();
		$(".background2").hide();
	});
});
</script>
<body>
<jsp:include page="./cardEdit.jsp"/>
<jsp:include page="./cardDel.jsp"/>

<div class="background2"></div>

<div class="font2">
<div id="cardReadView">
	<div class="cardBack">
		<span class="close_cardView">X</span>
      
		<div id="cardRead">
			<div id="cardTitle" class="inline"></div>
			
			<br><br><br>
         
			<div id="cardContent" class="inline"></div>
			
			<!-- 카드에서 같이 하는 멤버를 확인하는 버튼 -->
			<div class="cardMember1">
            	<a id="cardMember1">Member</a>
			</div>
         	
         	<div class="cardDelete">
         		<a id="cardDelete">Delete</a>
			</div>

			<div class="cardEdit">
         		<a id="cardEdit">Edit</a>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>