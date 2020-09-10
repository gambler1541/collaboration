<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Member List</title>
<style>
.background10 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2);
}

.close_cardMemberList {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1%;
}

.card_MemberList {
	display: none;
	width:200px;
	height:250px;
	position: absolute;
	top: 18%;
	left:73%;
	background: #F6F6F6;
	border-radius: 10px;
	padding:1%;
	box-shadow: 3px 3px 3px #cfcfcf;
}

.cardMember_ListAdd {
	float:left;
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #E85A71;
	font-family: DX경필명조B;
	font-size:13pt;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
}

.cardMember_ListAdd:hover {
	background-color: #E85A7199;
	transition:0.3s;
	cursor:pointer;
}

.cardMember_ListDelete {
	float: right;
	display: inline-block;
	width: 80px;
	height: 30px;
	background-color: #444F59;
	font-family: DX경필명조B;
	font-size:13pt;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
}

.cardMember_ListDelete:hover {
	background-color: #444f5999;
	transition:0.3s;
	cursor:pointer;
}

.card_Member_List {
	border: 1px solid #D8E9EF;
	width:200px;
	height:200px;
	overflow:hidden;
}

.view4 {
	width:200px;
	height:160px;
	overflow: hidden;
}

.scrollBlind4 {
	width:230px;
	height:100%;
	overflow-y: scroll;
}

.font9 {
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

<script>
	$(function() {
		$("#cardMember1").click(function() {
			$(".card_MemberList").show();
			$(".background10").show();
		});

		$("#cardMember2").click(function() {
			$(".card_MemberList").show();
			$(".background10").show();
		});

		$("#cardMember3").click(function() {
			$(".card_MemberList").show();
			$(".background10").show();
		});

		$(".close_cardMemberList").click(function() {
			$(".card_MemberList").hide();
			$(".background10").hide();
		});

		$(".close_cardMemberAdd").click(function() {
			$(".card_MemberList_add").hide();
			$(".background11").hide();
		});

		$(".close_cardMemberDelete").click(function() {
			$(".card_MemberList_del").hide();
			$(".background12").hide();
		});
	});

	function cardMemberAddView() {
		$(".card_MemberList_add").show();
		$(".background11").show();
	}

	function cardMemberDelView() {
		$(".card_MemberList_del").show();
		$(".background12").show();
	}

	function addMember(id){
		console.log("addMember click event");
		var profileimg = $("#"+id).children("img").prop("src");
		var member = $("#"+id).text();
		
		var str = '<td onClick="remove(this.id)" id="' + id + id + '">' 
			+ '<img width="30" height="30" src="'+profileimg+'">' + '</td>'+ '<input type="hidden" name="cardmembers" value="' +member+ '"/>' 
	
		$('#cardmember').append(str);
		$('#'+id).remove();
	}

function remove(id){
	$('#'+id).remove();
}

	
</script>
</head>
<body>

<div class="background10"></div>

<div class="font9">
	<div class="card_MemberList">
		<span>Card Member List</span>
		<span class="close_cardMemberList">X</span>

		<hr color="#D8E9EF" size="1">
		
		<div class="card_Member_List">
		<div class="view4">
			<div class="scrollBlind4">
				<c:forEach var="bmember" items="${mlist}" varStatus="status">
					<div id="${status.count }" onClick="addMember(this.id)"><img id="profile${status.count }" width="30" height="30" src="${bmember.getImg()}" />${bmember.getEmail()}</div>
				</c:forEach>
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>