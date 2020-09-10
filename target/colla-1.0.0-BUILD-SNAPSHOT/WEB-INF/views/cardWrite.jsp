<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Write</title>
<!-- 보드에서 리스트를 만들고 카드를 만들 때 나오는 모달창. 제목과 내용, 멤버를 추가할 수 있다  -->

<style>
.background1 {
	display:none;
	position:absolute;
	width:100%;
	height:100%;
	background:rgba(0, 0, 0, 0.2);
}

.close_cardWrite {
   color: #cfcfcf;
   cursor: pointer;
   font-size: 15pt;
   font-family: DX경필명조B;
   float:right;
   margin-top:1%;
   margin-right:1.5%;
}

.font3 {
   font-family:DX경필명조B;
   font-size: 13pt;
}

.cardMember2 {
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

.cardMember2:hover {
   background-color: #444F5999;
   transition:0.3s;
   cursor:pointer;
}

.cardCreate {
   float: right;
   width: 80px;
   height:30px;
   background-color: #E85A71;
   font-family:DX경필명조B;
   font-size:13pt;
   border-radius: 3px;
   border:0;
   text-align: center;
   padding-top:2%;
   text-decoration: none;
   color: white;
   margin-top:1%;
}

.cardCreate:hover {
	background-color:#E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.inline {
   display: inline-block;
}

.titleWrite::placeholder, .contentWrite::placeholder {
	font-family:DX경필명조B;
	font-size:13pt;
}

.contentWrite, .titleWrite {
   border: 0;
   border-radius:5px;
   resize: none;
   font-family:DX경필명조B;
   font-size:13pt;
}

.titleWrite:focus, .contentWrite:focus {
   outline: none;
   border: 1px solid #4ea1d3;
}

#cardWrite {
   width:600px;
   height: 300px;
   background:#F6F6F6;
   border-radius: 10px;
   padding:3%;
}

.cardBack2 {
   width:650px;
   height:350px;
   background:#F6F6F6;
   border-radius: 10px;
   box-shadow: 3px 3px 3px #cfcfcf;
}

#cardWriteView {
	display:none;
	position:absolute;
	top:15%;
	left:28%;
}

.date {
	border:0;
	height:20px;
    background:#FFFFFF10;
}

.date:hover {
    border:0;
    height:20px;
    background:#FFFFFF;
    cursor:pointer;
}
</style>
</head>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$(document).on("click", ".addCard",   function() {
		console.log("전달된 id data : " + this.id);
		$("#cardWriteView").show();
		$(".background1").show();
		var hiddenNum = "<input type='hidden' name='lFk' value='"+ this.id+"'>";
		$("#cardwriteform").append(hiddenNum);
	});

	$(".close_cardWrite").click(function() {
		$("#cardWriteView").hide();
		$(".background1").hide();
		$("#title").val("");
		$("#content").val("");
		$(".date").val("");
	});

	$(".background1").click(function() {
		$("#cardWriteView").hide();
		$(".background1").hide();
		$("#title").val("");
		$("#content").val("");
		$(".date").val("");
	});

	$(".cardCreate").click(function() {
		$("#title").val("");
		$("#content").val("");
		$(".date").val("");
	})
});

function cardWriteSubmit() {
	document.getElementById('cardwriteform').submit();
}
</script>

<body>

<form name="cardwrite" id="cardwriteform" action="/card/cardwrite" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="bFk" value="${bFk}"/>
	<div class="background1"></div>

	<div class="font3">
		<div id="cardWriteView">
   			<div class="cardBack2">
      			<span class="close_cardWrite">X</span>
      
      			<div id="cardWrite">
      				<br>
         			<div class="inline">
         				Create At&emsp;
         				<input class="date" type="date" name="cCreate"/>&emsp; ~
         				
         				&emsp;&emsp;Deadline&emsp;
         				
         				<input class="date" type="date" name="cDeadline"/>
         			</div>
         			
         			<br><br>
         			
         			<div class="inline">
            			<input type="text" placeholder="Enter the title" id="title" name="cTitle" class="titleWrite" size="56" style="height:30px;"/>
         			</div>
         			
         			<br><br>
         			
         			<div class="inline">
            			<textarea name="cDescription" id="content" class="contentWrite" cols="55" rows="9" placeholder="Add a more detailed Contents"></textarea>
         			</div>

        			<div class="cardMember2">
            			<a id="cardMember2">Member</a>
         			</div>
         			<a class="cardCreate" onClick="cardWriteSubmit();">Create</a>
		      </div>
  		 </div>
	</div>
</div>

</form>
</body>
</html>