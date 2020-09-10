<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Edit</title>
<!-- 보드에서 카드를 만들고 카드를 클릭한 뒤 edit 버튼을 눌렀을 때 나타나는 모달창. 제목, 내용, 멤버를 수정할 수 있다  -->

<style>
.background6 {
	display:none;
	position:absolute;
	width:100%;
	height:100%;
	background:rgba(0, 0, 0, 0.2);
}

.close_cardEdit {
   color: #cfcfcf;
   cursor: pointer;
   font-size: 15pt;
   font-family: DX경필명조B;
   float:right;
   margin-top:1%;
   margin-right:1.5%;
}

.font5 {
   font-family:DX경필명조B;
   font-size: 13pt;
}

.cardMember3 {
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

.cardMember3:hover {
   background-color: #444F5999;
   transition:0.3s;
   cursor:pointer;
}

.cardEdit1 {
   float: right;
   width: 80px;
   height: 40px;
   background-color: #E85A71;
   font-family:DX경필명조B;
   font-size:13pt;
   border-radius: 3px;
   border:0;
   text-align: center;
   padding-top:3.5px;
   text-decoration: none;
   color: white;
   margin-top:1%;
}

.cardEdit1:hover {
	background-color:#E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.inline {
   display: inline-block;
}

.titleEdit::placeholder, .contentEdit::placeholder {
	font-family:DX경필명조B;
	font-size:13pt;
}

.contentEdit, .titleEdit {
   border: 0;
   border-radius:5px;
   resize: none;
   font-family:DX경필명조B;
   font-size:13pt;
}

.titleEdit:focus, .contentEdit:focus {
   outline: none;
   border: 1px solid #4ea1d3;
}

#cardEdit1 {
   width:600px;
   height: 300px;
   background:#F6F6F6;
   border-radius: 10px;
   padding:3%;
}

.cardBack3 {
   width:650px;
   height:350px;
   background:#F6F6F6;
   border-radius: 10px;
   box-shadow: 3px 3px 3px #cfcfcf;
}

#cardEditView {
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
	$("#cardEdit").click(function() {
		$("#cardEditView").show();
		$(".background6").show();
	});

	$(".close_cardEdit").click(function() {
		$("#cardEditView").hide();
		$(".background6").hide();
		$("#edittitle").val("");
		$("#editcontent").val("");
	});

	$(".background6").click(function() {
		$("#cardEditView").hide();
		$(".background6").hide();
		$("#edittitle").val("");
		$("#editcontent").val("");
	});
});
</script>

<body>
<form name="cardedit" action="" method="post">
<div class="background6"></div>

<div class="font5">
<div id="cardEditView">
   <div class="cardBack3">
      <span class="close_cardEdit">X</span>
      
      <div id="cardEdit1">
         <div class="inline">
            <input type="text" placeholder="Edit the title" id="edittitle" class="titleEdit" size="56"/>
         </div>
         
         <br><br><br>
         
         <div class="inline">
            <textarea name="content" id="editcontent" class="contentEdit" cols="55"
            rows="12" placeholder="Add a more detailed Contents"></textarea>
         </div>

         <div class="cardMember3">
            <a id="cardMember3">Member</a>
         </div>
         
		<input type="submit" value="Edit" class="cardEdit1">
      </div>
   </div>
</div>
</div>

</form>
</body>
</html>