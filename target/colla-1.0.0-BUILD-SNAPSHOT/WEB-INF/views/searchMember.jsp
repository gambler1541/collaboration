<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Member</title>
<style>
.addMemberWrap {
	display: none;
	width: auto;
	height: auto;
	position: absolute;
	top: 15%;
	left: 60%;
	background: #f6f6f6;
	border-radius: 10px;
	box-shadow: 3px 3px 3px #cfcfcf;
	padding:1%;
	z-index:1;
}

.close_searchMember {
	color: #cfcfcf;
	cursor: pointer;
	font-size: 13pt;
	font-family: DX경필명조B;
	float: right;
	padding-right:3%;
}

.searchUserEmail {
	font-family:DX경필명조B;
	font-size:13pt;
	border:0;
	border-radius:5px;
}

.searchUserEmail:focus {
	outline:none;
	border:1px solid #4EA1D3;
}

#result {
	font-family:DX경필명조B;
	font-size:14pt;
	cursor:pointer;
}

.resultMember:hover {
	background-color: rgba(0, 0, 0, 0.1);
	width:220px;
	height:20px;
	border-radius:5px;
}

.over:hover {
	height:20px;
	border-radius: 5px;
	color:#cfcfcf;
	cursor: pointer;
}
</style>
</head>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {

	$("#withmember").click(function() {
		$(".addMemberWrap").show();
	});

	$(".close_searchMember").click(function() {
		$(".addMemberWrap").hide();
		$("#result").empty();
		$("#search").val("");
	});

	$(".background5").click(function() {
		$(".addMemberWrap").hide();
		$("#result").empty();
		$("#search").val("");
	});
	
	var search;

	$("#search").keypress(function(e) {
		search = $("#search").val();
		console.log("search : " + search);
		$("#result").empty();

		$.ajax({
			url : "/member/search?search=" + search,
			type : 'get',
			success : function(data) {

				var str = '<tr>';

				$.each(data, function(i) {
					console.log("each로 돌린 data[i] : " + data[i]);
					str += '<td id="'+ i +'"class="resultMember" onClick="searchClick(this.id);">' + data[i] + '</td>';
					str += '</tr>';

				});

				var check = $("#search").val();
				if((check == "") || (check == null)) {
					$("#result").empty();
				}
				
				$("#result").append(str);
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

var num = 0;

function searchClick(clicked_id) {
	console.log('클릭함수실행중이다. : ' + clicked_id);
	
	var member = $("#"+clicked_id).text();
	console.log("sssssss : " + member);

	var creatememberspace = '<tr class="over">'
							+ '<td id="' + clicked_id + clicked_id + '" onClick="remove(this.id);">' 
							+ member + '</td>'+ '<input type="hidden" name="withmember" value="' +member+ '"/>' + '</tr>'
	$("#addmember").append(creatememberspace);
	$("#"+clicked_id).remove();
	/*  location.href="/member/memberinsert?member="+member; */

	num++;
};

function remove(removed_id) {
	console.log('removed_id 는 : ' + removed_id);
	$("#"+removed_id).remove();
}
</script>
<body>
	<div class="addMemberWrap">
		<form>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<font style="font-family:DX경필명조B">SEARCH</font>
			<span class="close_searchMember">X</span>
			<br>
			<input autocomplete="off" id="search" type="email" name="userEmail" class="searchUserEmail" size="25" placeholder="Search Member"/>
			<br>
			
			<table id="result"></table>
		</form>
	</div>
</body>
</html>