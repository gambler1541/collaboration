<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My List</title>
</head>
<style>
::selection {
	background:#444f59;
	color:white;
}

::-webkit-scrollbar {
	width:15px;
}

::-webkit-scrollbar-track {
	background-color:rgba(0, 0, 0, 0.1);
	border-radius:15px;
}

::-webkit-scrollbar-thumb {
	background-color:#444f59;
	border-radius:15px;
}

::-webkit-scrollbar-thumb:hover {
	background:#E85A71;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {
	width:15px;
	height:5px;
}

html, body {
	width:100%;
	height:100%;
	position:fixed;
	background: -webkit-linear-gradient(180deg, rgba(78, 161, 211, 0.3), rgba(232, 90, 113, 0.2));
	background: linear-gradient(180deg, rgba(78, 161, 211, 0.3), rgba(232, 90, 113, 0.2));
	white-space:nowrap;
}

.underhead {
	position: fixed;
	width: 100%;
	height: 50px;
	background-color:rgba(0, 0, 0, 0.05);
	margin-top:3.9%;
	padding-top:1%;
}

.boardMemberList {
	display: inline-block;
	background-color:#444F59;
	color: white;
	border-radius: 3px;
	font-family: DX경필명조B;
	text-align: center;
	padding-top: 0.6%;
	height: 25px;
	width: 110px;
	cursor: pointer;
}

.boardMemberList:hover {
	background-color: #444F5999;
	cursor: pointer;
	transition: 0.3s;
}

.boardMemberAdd {
	display: inline-block;
	background-color: #E85A71;
	color: white;
	border-radius: 3px;
	font-family: DX경필명조B;
	text-align: center;
	padding-top: 0.6%;
	height: 25px;
	width: 65px;
	cursor: pointer;
}

.boardMemberAdd:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition: 0.3s;
}

.boardDel_Btn {
	float:right;
	display: inline-block;
	background-color: #E85A71;
	color: white;
	border-radius: 3px;
	font-family: DX경필명조B;
	text-align: center;
	padding-top: 0.6%;
	height: 25px;
	width: 110px;
	cursor: pointer;
	margin-right:2%;
}

.boardDel_Btn:hover {
	background-color: #E85A7199;
	cursor: pointer;
	transition: 0.3s;
}

.chat {
	display: inline-block;
	width:28px;
	height:26px;
	background-color:rgba(0, 0, 0, 0.2);
	border-radius: 5px;
	float: right;
	align-items: center;
	margin-right:0.5%;
	padding:0.4%;
}

.chatImg {
	width: inherit;
	max-width: 100%;
	height: auto;
}

.chat:hover {
	background-color:rgba(0, 0, 0, 0.3);
	transition:0.3s;
}

#addList {
	display:inline-block;
	width:150px;
	height: 25px;
	border:0px;
	border-radius:5px;
	background-color:rgba(0, 0, 0, 0.1);
	font-family: DX경필명조B;
	color:#444f59;
	text-align: center;
	padding-top: 0.6%;
	cursor: pointer;
}

#addList:hover {
	background-color:rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

.boardName {
	margin-left:2%;
	margin-right:2%;
	font-family:console;
	font-size:15pt;
	font-weight:bold;
	color:white;
}

.list {
	display:inline-block;
	font-family:DX경필명조B;
	background-color:rgba(0, 0, 0, 0.05);
	border-radius:5px;
	width:200px;
	height:100%;
	padding:10%;
	overflow:hidden;
	cursor:pointer;
}

.wrap {
	width:220px;
	height:500px;
	margin-left:2%;
	margin-right:2%;
	margin-top:1%;
	box-sizing:border-box;
	display:inline-block;
	vertical-align:top;
	white-space:nowrap;
}

#listWrap {
	display:inline-block;
	width:100%;
	height:81%;
	overflow-x:auto;
	margin-top:9%;
}

.addCard {
	width:200px;
	height:30px;
	display:table-cell;
	vertical-align:middle;
	border-radius:5px;
	background-color:rgba(0, 0, 0, 0.1);
	cursor:pointer;
}

.addCard:hover {
	height:30px;
	border-radius:5px;
	background-color:rgba(0, 0, 0, 0.2);
	transition:0.3s;
}

.listTitle {
	font-family:console;
	font-weight:bold;
	color:#444f59;
}

.cardlist {
    width:200px;
	height:500px;
	overflow: hidden;
}

.view {
	width:200px;
	height:420px;
	overflow:hidden;
}

.scrollBlind {
	width:220px;
	height:100%;
	overflow-y:scroll;
}

.cardInTheList {
	width: 180px;
	height: 50px;
	background:rgba(255, 255, 255, 0.5);
	margin-bottom:3%;
	border-radius:5px;
	white-space:normal;
}

.cardInTheList:hover {
	cursor: pointer;
	background:rgba(255, 255, 255, 0.8);
}

.listHighlight{
	display: inline-block;
	box-sizing: border-box;
	width: 245px;
	height: 550px;
	margin-left: 2%;
	margin-right: 2%;
	margin-top: 1%;
	background-color: rgba(0, 0, 0, 0.1);
	border-radius:5px;
	vertical-align: top;
	white-space: nowrap;
}

.cardHighlight {
	width:180px;
	height:50px;
	border-radius:5px;
	background-color: rgba(0, 0, 0, 0.1);
	margin-bottom:3%;
}

.enterTitle {
	font-family:console;
	border:0;
	height:32px;
	border-radius:5px;
	background-color:rgba(255, 255, 255, 0.6);
}

.submitTitle {
	background-color:#444f59;
	color:white;
	border:0; height:32px;
	border-radius:5px;
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
      $('.scrollBlind').sortable({
         connectWith : ".scrollBlind",
         placeholder : "cardHighlight"
      });

      $('#listWrap').sortable({
			placeholder : "listHighlight"
      });

      $("#boardmemberList").click(function() {
  		$(".b_MemberInvite").hide();
  		$(".background8").hide();

  		$(".listAdd").hide();
  		$(".background14").hide();

  		$(".userWrap").hide();
  		$(".background3").hide();

  		$(".boardDelete").hide();
  		$(".background15").hide();

  		$('.userInfoModify').hide();
  		$(".background4").hide();

  		$(".memberDelWrap").hide();
  		$(".background9").hide();
  	});
  	
  	$("#boardmemberAdd").click(function() {
  		$(".b_MemberList").hide();
  		$(".background7").hide();
  		
  		$(".listAdd").hide();
  		$(".background14").hide();

  		$(".userWrap").hide();
  		$(".background3").hide();

  		$(".boardDelete").hide();
  		$(".background15").hide();

  		$('.userInfoModify').hide();
  		$(".background4").hide();

  		$(".memberDelWrap").hide();
  		$(".background9").hide();
  	});

  	$("#addList").click(function() {
  		$(".b_MemberList").hide();
  		$(".background7").hide();
  		
  		$(".b_MemberInvite").hide();
  		$(".background8").hide();

  		$(".userWrap").hide();
  		$(".background3").hide();

  		$(".boardDelete").hide();
  		$(".background15").hide();

  		$('.userInfoModify').hide();
  		$(".background4").hide();

  		$(".memberDelWrap").hide();
  		$(".background9").hide();
  	});

  	$("#deleteBoard").click(function() {
  		$(".b_MemberList").hide();
  		$(".background7").hide();
  		
  		$(".b_MemberInvite").hide();
  		$(".background8").hide();

  		$(".userWrap").hide();
  		$(".background3").hide();

  		$(".listAdd").hide();
  		$(".background14").hide();

  		$('.userInfoModify').hide();
  		$(".background4").hide();

  		$(".memberDelWrap").hide();
  		$(".background9").hide();
  	});

  	$("#userInfo").click(function() {
  		$(".b_MemberList").hide();
  		$(".background7").hide();
  		
  		$(".b_MemberInvite").hide();
  		$(".background8").hide();

  		$(".boardDelete").hide();
  		$(".background15").hide();

  		$(".listAdd").hide();
  		$(".background14").hide();

  		$('.userInfoModify').hide();
  		$(".background4").hide();

  		$(".memberDelWrap").hide();
  		$(".background9").hide();
	});
   });

   $(function() {
	      var startIndex;
	      var stopIndex;
	      var startcFk;
	      var beforecFk;
	      var nextcFk;
	      var startParent;
	      var stopParent;

	      $('.scrollBlind').sortable(
	                  {
	                     connectWith : ".scrollBlind",
	                     start : function(event, ui) {

	                        startIndex = parseInt(ui.item.index());
	                        startcFk = parseInt(ui.item.attr('id'));
	                        startParent = $(this).parent().parent().attr('id');

	                        console.log('startIndex : ' + ui.item.index());
	                        console.log('startcFk : ' + startcFk);
	                        console.log('startParent : '
	                              + $(this).parent().parent().attr('id'));
	                     },

	                     stop : function(event, ui) {

	                        stopIndex = parseInt(ui.item.index());
	                        stopParent = parseInt($('.scrollBlind').find('div#' + startcFk).parent().parent().parent().attr('id'));
	                        beforecFk = parseInt($('.scrollBlind').find(
	                              'div#' + startcFk).prev().attr('id'));
	                        nextcFk = parseInt($('.scrollBlind').find(
	                              'div#' + startcFk).next().attr('id'));

	                        if (stopIndex == 0) {
	                           beforecFk = 0;
	                        }
	                        if (isNaN(nextcFk)) {
	                           nextcFk = 0;
	                        }

	                        console.log('start point : '
	                              + ui.item.position().top);
	                        console.log('stopIndex : ' + ui.item.index());
	                        console.log('beforecFk : ' + beforecFk);
	                        console.log('nextcFk : ' + nextcFk);
	                        console.log("stopParent : "
	                              + $('.scrollBlind').find(
	                                    'div#' + startcFk).parent()
	                                    .parent().parent().attr('id'));
	                  
	                        $.ajax({
	                           url : "/card/cardsortable?startIndex="
	                                 + startIndex + "&stopIndex="
	                                 + stopIndex + "&startcFk="
	                                 + startcFk + "&beforecFk="
	                                 + beforecFk + "&nextcFk=" + nextcFk
	                                 + "&startParent=" + startParent
	                                 + "&stopParent=" + stopParent,
	                           type : "get",
	                           success : function() {
	                              console.log('update success');

	                           },
	                           error : function(xhr, status, data) {

	                              console.log('error');
	                           }

	                        });

	                     }
	                  });
	   });

	   function createList() {

	      $.ajax({
	               url : "/list/addlist",
	               type : 'get',

	               success : function(data) {

	                  function createlist() {
	                	  var contents = "<div class='wrap' align='center'>"
	                           	+ "<div id='" + data.lFk + "' class='list'>"
	                           	+ "<span id='compareTitle" + data.lFk + "' class='listTitle'>"
	                           	+ data.lTitle + "</span><br><br>"
	                           	+ "<div class='view'>"
	                           	+ "<div class='scrollBlind'></div>"
	                           	+ "</div><br>"
	                           	+ "<span class='addCard'>+ Create Card</span>"
	                           	+ "</div></div>"

	                     $('.scrollBlind').sortable({
	                        connectWith : ".scrollBlind"

	                     });

	                     return contents;

	                  }
	                  $(createlist()).appendTo("#listWrap");

	                  var text = $("#compareTitle" + data.lFk).text();
	                  console.log(text);
	                  var pencil = "<img id='imgfunc"+ data.lFk+"' src='../images/pencil.png' align='right' width='20' height='20'/>"

	                  $("#compareTitle" + data.lFk).append(pencil);

	                  $('#imgfunc' + data.lFk)
	                        .click(
	                              function() {

	                                 $("#compareTitle" + data.lFk)
	                                       .empty();
	                                 var formtag = "<form action='/list/updateListTitle' method='post'>"
	                                       + "<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />"
	                                       + "<input type='hidden' name='lFk' value='"+data.lFk+"' />"
	                                       + "<input type='hidden' name='bFk' value='${bFk}' />"
	                                       + "<input type='text' name='lTitle' placeholder='Create Title' class='enterTitle'>&nbsp;"
	                                       + "<input type='submit' value='send' class='submitTitle'>"
	                                       + "</form>";
	                                 $("#compareTitle" + data.lFk)
	                                       .append(formtag);

	                              });

	               },
	               error : function(xhr, status, data) {
	                  console.log(error);
	               }

	            });
	   }

	   $(function() {

	      var startNum;
	      var stopNum;
	      var startlFk;
	      var beforelFk;
	      var nextlFk;

	      $('#listWrap')
	            .sortable(
	                  {
	                     start : function(event, ui) {
	                        console.log('start index : ' + ui.item.index());
	                        startNum = parseInt(ui.item.index());
	                        startlFk = parseInt($('.list').eq(startNum)
	                              .attr('id'));
	                        console.log('select tag id ----> ' + startlFk);
	                     },
	                     stop : function(event, ui) {
	                        console.log('stop index : ' + ui.item.index());
	                        stopNum = parseInt(ui.item.index());

	                        beforelFk = parseInt($('.list').eq(stopNum - 1)
	                              .attr('id'));
	                        if (stopNum == 0) {
	                           beforelFk = 0;
	                        }

	                        nextlFk = parseInt($('.list').eq(stopNum + 1)
	                              .attr('id'));
	                        if (isNaN(nextlFk)) {
	                           nextlFk = 0;
	                        }

	                        console.log('tag before---->' + beforelFk);
	                        console.log('tag next---->' + nextlFk);

	                        $.ajax({
	                           url : "/list/listsort?beforelFk="
	                                 + beforelFk + "&nextlFk=" + nextlFk
	                                 + "&lFk=" + startlFk,
	                           type : "get",
	                           success : function() {
	                              console.log('update success');

	                           },
	                           error : function(xhr, status, data) {

	                              console.log('error......');
	                           }

	                        });

	                     }

	                  });

	      $("#boardChat").click(function() {
	          window.open("/echo/chat", "chat", "width=390, height=580, top=150px, left=500px, resizable=no");
	       }) 
	   });
</script>

<body>
<jsp:include page="./cardRead.jsp"/>
<jsp:include page="./cardWrite.jsp"/>
<jsp:include page="./cardMemberList.jsp"/>
<jsp:include page="./memberList.jsp" />
<jsp:include page="./memberAdd.jsp" />
<jsp:include page="./boardDel.jsp"/>
<jsp:include page="./header2.jsp"/>

	<div class="underhead">
		<span class="boardName">${board.getbTitle()}</span>
		<div class="boardMemberList" id="boardmemberList">Member List</div>
		<div class="boardMemberAdd" id="boardmemberAdd">Invite</div>
		<div id="addList" onclick="createList();">+ Add another List</div>
		<div class="boardDel_Btn" id="deleteBoard">Board Delete</div>
		<div class="chat" id="boardChat"><img src="../images/chat.png" class="chatImg"></div>
	</div>

   <div id="listWrap">
      <!-- 카드 추가 시 카드가 생기는 공간 -->
      <c:forEach var="list" items="${listList}">
         <div class="wrap" align="center" id="${list.getlFk()}">
            <div id="${list.getlFk()}" class="list">
               <span class='listTitle'>${list.getlTitle()}</span><br><br>
               <div class="view">
               <div class="scrollBlind">
                  <c:choose>
                     <c:when test="${cardList.size() != null }">
                        <c:forEach var="card" items="${cardList}">
                           <c:choose>
                              <c:when test="${card.getlFk() == list.getlFk()}">
                                 <div id="${card.getcFk()}" class="cardInTheList">${card.getcTitle()}</div>
                              </c:when>
                           </c:choose>
                        </c:forEach>
                     </c:when>
                  </c:choose>
               </div>
               </div>
               <br>
			   <span id="${list.getlFk()}" class="addCard">+ Create Card</span>
            </div>
         </div>
      </c:forEach>
   </div>
   
</body>
</html>