<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Member Add</title>
<style>
.background8 {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
}

.close_memberInvite {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	margin-right: 1.5%;
}

.b_MemberInvite {
	display: none;
	width: 18%;
	height:auto;
	position: absolute;
	top:18%;
	left:17%;
	background: #F6F6F6;
	border-radius:6px;
	padding:1%;
}

.memberInviteBtn {
	float: right;
	display: inline-block;
	width:130px;
	height: 30px;
	background-color:#E85A71;
	font-family: DX경필명조B;
	border-radius: 3px;
	text-align: center;
	padding-top: 10px;
	text-decoration: none;
	color: white;
	cursor:pointer;
}

.memberInviteBtn:hover {
	background-color:#E85A7199;
	transition:0.3s;
}

.searchEmail {
	font-family:DX경필명조B;
	font-size:13pt;
	border:0;
	border-radius:5px;
}

.searchEmail:focus {
	outline:none;
	border:1px solid #4EA1D3;
}

#addMemberList {
	width: 220px;
	height:20px;
}

.searchResult:hover {
	width: 220px;
	height:20px;
	border-radius:5px;
	background-color:rgba(0, 0, 0, 0.2);
}

.font7 {
	font-family:DX경필명조B;
	font-size:13pt;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#boardmemberAdd").click(function() {
			$(".b_MemberInvite").show();
			$(".background8").show();
		});

		$(".close_memberInvite").click(function() {
			$(".b_MemberInvite").hide();
			$(".background8").hide();
			$("#userSearch").val("");
			$("#addMemberList").empty();
		});

		$(".background8").click(function() {
			$(".b_MemberInvite").hide();
			$(".background8").hide();
			$("#userSearch").val("");
			$("#addMemberList").empty();
		});

		var userSearch;

		$("#userSearch").keypress(function(e) {
			userSearch = $("#userSearch").val();
			$("#addMemberList").empty();

			$.ajax({
				url : "/member/search?search=" + userSearch,
				type : 'get',
				success : function(data) {

					var str = '<tr>';

					$.each(data, function(i) {
						console.log("each로 돌린 data[i] : " + data[i]);
						str += '<td class="searchResult">' + data[i] + '</td>';
						str += '</tr>';

					});

					var check = $("#userSearch").val();
					if((check == "") || (check == null)) {
						$("#addMemberList").empty();
					}
					
					$("#addMemberList").append(str);
				},
				error : function(xhr, status, data) {
					console.log("실패");
					console.log(xhr);
					console.log(status);
					console.log("data" + data);
				}
			})
		})
	});
</script>
</head>
<body>
<div class="background8"></div>

	<form action="" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="font7">
		<div class="b_MemberInvite">
			<span class="close_memberInvite">X</span>
			<span>Add On Board</span>
			
			<br><br>

			<input type="email" autocomplete="off" id="userSearch" name="searchuserEmail" class="searchEmail" size="29"/>

			<hr color="#D8E9EF" size="2">

			<table id="addMemberList"></table>
			
			<br><br>
			
			<div class="memberInviteBtn">
				<a id="sendInvite">Send Invitation</a>
			</div>
			</div>
		</div>
	</form>
</body>
</html>