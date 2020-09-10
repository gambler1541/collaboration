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

.cardDelete {
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
   margin-top:8%;
   margin-left:3%;
}

.cardDelete:hover {
   background-color:#E85A7199;
   transition:0.3s;
   cursor:pointer;
}

#replySend {
   width: 60px;
   height: 28px;
   background-color:#4EA1D3;
   font-family:DX경필명조B;
   font-size:13pt;
   border-radius: 3px;
   text-align: center;
   text-decoration: none;
   color: white;
   border:0;
}

#replySend:hover {
   background-color:#4EA1D399;
   transition:0.3s;
   cursor:pointer;
}

#replySend:focus {
   outline:none;
}

#replyText {
   border:0;
   border-radius:3px;
   font-family:DX경필명조B;
   font-size:13pt;
   height:28px;
}

#replyText:focus {
   outline:none;
   border:1px solid #4EA1D3;
}

#replyText::placeholder {
   font-family:DX경필명조B;
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
   height:500px;
   background:#F6F6F6;
   border-radius: 10px;
   padding:3%;
}

.cardBack {
   width:650px;
   height:600px;
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

.view5 {
   width:500px;
   height:200px;
   overflow:hidden;
}

.scrollBlind5 {
   width:500px;
   height:100%;
   overflow-y:auto;
   white-space:normal;
}
</style>
</head>

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function() {
   $(".cardInTheList").click(function() {
      if($('#lFk').length){
         $('#lFk').remove();
      }
      
      if($('#cFk').length){
         $('#cFk').remove();
      }
      
      var cfk = $(this).attr("id");
      
      $("#cardTitle").empty();
      $("#cardContent").empty();
      $(".scrollBlind5").empty();
      $("#cardReadView").show();
      $(".background2").show();
      
      $.ajax({
         url : "/card/cardread?cFk=" + cfk,
         type : "get",
         success:function(data) {
            var card = data.cardread;
            var reply = [];
            reply = data.replyread;
            
            console.log(card.cTitle);
            $("#create2").val(card.cCreate);
            $("#deadline2").val(card.cDeadline);
            
            $("#cardTitle").append(card.cTitle);
            $("#cardContent").append(card.cDescription);

            $("#replySend").click(function() {
               var hiddenLfk = "<input type='hidden' id='lFk' name='lFk' value='" + card.lFk + "'>";
               var hiddenCfk = "<input type='hidden' id='cFk' name='cFk' value='" + card.cFk + "'>";

               $("#replyForm").append(hiddenLfk);
               $("#replyForm").append(hiddenCfk);
            });
            
            $.each(reply, function(index, value) {
               console.log(reply.cContent);
               var user = "<span>" + value.rWriter + "</span>&nbsp;:&nbsp;";
               var replyText = "<span>" + value.rContent + "</span><br>";
               
               $(".scrollBlind5").append(user);
               $(".scrollBlind5").append(replyText);
            });
         },
         error : function(){
            console.log("cfk : " + cfk);
            console.log('Card Read Error');
         }
      })
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
         <br>
            <div class="inline">
            Create At&emsp;<input class="date" type="date" name="cCreate" id="create2" />
            &emsp; ~ &emsp;&emsp;Deadline&emsp;<input class="date" type="date" name="cDeadline" id="deadline2" />
         </div>
         
         <br><br>
         
         <div id="cardTitle" class="inline"></div>
         
         <br><br><br>
         
         <div id="cardContent" class="inline"></div>
         
         <div class="cardMember1">
               <a id="cardMember1">Member</a>
         </div>

         <div class="cardDelete">
               <a id="cardDelete">Delete</a>
         </div>

         <!-- 댓글 작성부분 -->
         <table>
            <tr>
               <td>
               <form name="replyForm" id="replyForm" action="/reply/replySend" method="post">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="hidden" name="bFk" value="${bFk}">
                  <input type="hidden" name="rWriter" value="${memberVO.getEmail()}">
                  
                  Reply : <input type="text" name="rContent" id="replyText" placeholder="Write a Comment" size="41" autocomplete="off"/>
                  <input type="submit" name="replySend" id="replySend" value="Send">
               </form>
               </td>
            </tr>
         </table>
         
         <br>
         
         <!-- 작성한 댓글이 추가되는 부분 -->
         <table>
            <tr>
               <td>
                  <div class="view5">
                     <div class="scrollBlind5"></div>
                  </div>
               </td>   
            </tr>
         </table>
      </div>
   </div>
</div>
</div>

</body>
</html>