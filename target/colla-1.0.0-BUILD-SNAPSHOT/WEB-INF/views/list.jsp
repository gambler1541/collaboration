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
	background: -webkit-linear-gradient(180deg, rgba(232, 90, 113, 0.2), rgba(78, 161, 211, 0.3));
	background: linear-gradient(180deg, rgba(232, 90, 113, 0.2), rgba(78, 161, 211, 0.3));
	white-space:nowrap;
}

.list {
	display:inline-block;
	font-family:DX경필명조B;
	border:1px solid #4EA1D3;
	border-radius:5px;
	width:200px;
	height:100%;
	padding:10%;
	overflow:hidden;
	cursor:pointer;
}

.card {
	font-family:DX경필명조B;
	border-radius:5px;
	width:200px;
	height:50px;
	background-color:white;
	margin-top:4%;
	overflow:auto;
	cursor:pointer;
}

.wrap {
	width:220px;
	height:510px;
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
	width:230px;
	height:100%;
	overflow-y:scroll;
}

.cardInTheList {
   width: 180px;
   height: 50px;
   background:rgba(255, 255, 255, 0.5);
   margin-bottom: 3%;
   border-radis: 5%;
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
	margin-top:4%;
	margin-bottom:4%;
}
</style>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   $(function() {
      $('.scrollBlind').sortable({
         connectWith : ".scrollBlind",
         placeholder : "cardHighlight"
      });
   });

   function createList() {
      $.ajax({
         url : "/list/addlist",
         type : 'get',
         /* dataType : 'json', */
         success : function(data) {
            // data.bFk
            function createlist() {
               var contents = "<div class='wrap'>"
                           	+ "<div id='" + data.lFk + "' class='list'>"
                           	+ "<span id='compareTitle"+data.lFk+ "' class='listTitle'>"
                           	+ data.lTitle
                           	+ "</span><br><br>"
                           	+ "<div class='view'>"
                           	+ "<div class='scrollBlind'></div>"
                           	+ "</div>"
                           	+ "<span class='addCard'>+ Create Card</span>"
                           	+ "</div></div>"

               $('.scrollBlind').sortable({
                  connectWith : ".scrollBlind",
                  placeholder : "cardHighlight"
               });
               return contents;
            }
            
            $(createlist()).appendTo("#listWrap");
            var text = $("#compareTitle" + data.lFk).text();
            console.log(text);
            var pencil = "<img id='imgfunc"+ data.lFk+"' src='../images/pencil.png' align='right' width='20' height='20'/>"

            $("#compareTitle" + data.lFk).append(pencil);
            $('#imgfunc' + data.lFk).click(function() {
               $("#compareTitle" + data.lFk).empty();
               var formtag = "<form action='/list/updateListTitle' method='post'>"
                  			 + "<input type='hidden' name='${_csrf.parameterName }' value='${_csrf.token }' />"
                  			 + "<input type='hidden' name='lFk' value='"+data.lFk+"' />"
                   			 + "<input type='hidden' name='bFk' value='${bFk}' />"
                   			 + "<input type='text' name='lTitle' placeholder='Create Title' style='border:0; height:30px; border-radius:5px;'>&nbsp;"
                   			 + "<input type='submit' value='send' style='background-color:white; border:0; height:30px; border-radius:5px;'>"
                   			 + "</form>";
               $("#compareTitle" + data.lFk).append(formtag);
            });
            },
            error : function(xhr, status, data) {
               console.log(error);
            }
      });
   }

   $(function() {
      $('#listWrap').sortable({
			placeholder : "listHighlight"
      });
   });
</script>
<body>
<jsp:include page="./header3.jsp"/>
<jsp:include page="./cardRead.jsp"/>
<jsp:include page="./cardWrite.jsp"/>
<jsp:include page="./cardMemberList.jsp"/>

   <div id="listWrap">
      <!-- 카드 추가 시 카드가 생기는 공간 -->
      <c:forEach var="list" items="${listList}">
         <div class="wrap" align="center">
            <div id="${list.getlFk()}" class="list">
               <span class='listTitle'>${list.getlTitle()}</span><br><br>
               <div class="view">
               <div class="scrollBlind">
                  <c:choose>
                     <c:when test="${cardList.size() != null }">
                        <c:forEach var="card" items="${cardList}">
                           <c:choose>
                              <c:when test="${card.getlFk() == list.getlFk()}">
                                 <div class="cardInTheList">${card.getcTitle()}</div>
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