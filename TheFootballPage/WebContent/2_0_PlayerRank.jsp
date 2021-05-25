<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.sql.*" %>
<%@ page import = "TheFootball.Player"  %>

<html>

<%
request.setCharacterEncoding("UTF-8");
Player player = new Player();
Object inputLeague = session.getAttribute("chooseLeague");
String chooseLeague = (String)inputLeague;

session.setAttribute("chooseLeague", chooseLeague);

player.setSqlGoalRank(chooseLeague);
player.setSqlAssistRank(chooseLeague);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=chooseLeague %> Player Ranking</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


</head>
<style>
@font-face{font-family:'UEFASupercup-Bold'; src:url('addFont/UEFAFont/OTF/UEFASupercup-Regular.otf')}
body {
  width:100%;
  height:100%;
  font-family: "UEFASupercup-Bold",  sans-serif;
  font-weight: 100;
  font-size:8px;
  background: url("image/back2.png") no-repeat center rgba(0,0,0,0.8);
}

#expertise {
  width:900px;
  height:650px;
  display:block;
  margin:0 auto;
  padding:25vh 0;
}

.item {
  position:relative;
  color: #fff;
  background-color: transparent;
  padding: 10px;
  width:47%;
  border: #fff solid 2px;
  margin-bottom:10px;
  display:inline-block;
  *  display:inline;
  margin: 0px 3px 10px 3px;
  padding:20px;
  box-sizing:border-box;
  text-align:center;
  text-transform:uppercase;
  letter-spacing:2px;
  border-radius:2px;
  box-shadow:0px 2px 5px rgba(0,0,0,0.5);
    overflow:hidden;
}

.item:before {
  content:'';
  background-repeat: no-repeat;
  background-size: 100%;
  width:40px;
  height:50px;
  display:block;
  margin:0 auto;
}

#scorebox{
	width:30px;
	background:#350038;
	color:white;
	text-align:center;
}

.premier.item:before {
  background-image: url("image/premier.png");
}


.premier.item:hover:before {
  background-image: url("image/premier2.png");
}

.laliga.item:before {
background-image: url("image/Laliga.png");
}

.laliga.item:hover:before {
background-image: url("image/Laliga2.png");
}

.bundesliga.item:before{
background-image: url("image/bundesliga.png");
}

.bundesliga.item:hover:before{
background-image: url("image/bundesliga2.png");
}

.serie.item:before{
background-image: url("image/serie.png");
}

.serie.item:hover:before{
background-image: url("image/serie2.png");
}




.item:after {
  content: "";
  display:block;
  border-top: 0 #fff solid;
  border-bottom: 15px transparent solid;
  border-left: 15px #fff solid;
  position:absolute;
  top:0;
  left:0;
  width:0;
  z-index:-1;
  overflow:hidden;
}

.item:hover:after {
  z-index:-1;
  border-left: 1000px solid #fff;
  border-bottom:500px solid transparent;
  overflow:hidden;
  background-color:#0078D7;
}



.item:hover {
  color:#0078D7;
  overflow:hidden;
  margin-bottom: 10px;
  cursor:pointer;
}

.item:hover, .item:after, .item {
  -webkit-transition: 0.5s color ease;
  -moz-transition: 0.5s color ease;
  -o-transition: 0.5s color ease;
  transition: 0.5 color ease;
}

.item:hover, .item:after {
  -webkit-transition: 0.5s border ease;
  -moz-transition: 0.5s border ease;
  -o-transition: 0.5s border ease;
  transition: 0.5s border ease;
}

.item:after {
    overflow:hidden;
}

.item:before, .item:hover:before, .item:hover:after {
  -webkit-transition: 1.5s all ease;
  -moz-transition: 1.5s all ease;
  -o-transition: 1.5s all ease;
  transition: 1.5s all ease;
}

.GoalRanking.item:before{
  background-image: url("image/goalRank.png");
}

.GoalRanking.item:hover:before{
  background-image: url("image/goalRank2.png");
}

.AssistRanking.item:before{
  background-image: url("image/assistRank.png");
}

.AssistRanking.item:hover:before{
  background-image: url("image/assistRank2.png");
}


.previous.back:before {
  background-image: url("image/previous.png");
}


.previous.back:hover:before {
  background-image: url("image/previous2.png");
}

.back {
  position:relative;
  color: #fff;
  background-color: transparent;
  padding: 10px;
  width:70px;
  height:70px;
  margin-bottom:10px;
  margin: 0px 3px 10px 3px;
  padding:20px;
  box-sizing:border-box;
  text-align:center;
  text-transform:uppercase;
  letter-spacing:2px;
  border-radius:2px;
    overflow:hidden;
}

.back:before {
  content:'';
  background-repeat: no-repeat;
  background-size: 100%;
  width:40px;
  height:50px;
  display:block;
  margin:0 auto;
}

.back:after {
  content: "";
  display:block;
  position:absolute;
  top:0;
  left:0;
  width:0;
  z-index:-1;
  overflow:hidden;
}

.back:hover:after {
  z-index:-1;
  border-left: 1000px solid #fff;
  overflow:hidden;
  background-color:#0078D7;
}



.back:hover {
  color:#0078D7;
  overflow:hidden;
  margin-bottom: 10px;
  cursor:pointer;
}

.back:hover, .back:after, .back {
  -webkit-transition: 0.5s color ease;
  -moz-transition: 0.5s color ease;
  -o-transition: 0.5s color ease;
  transition: 0.5 color ease;
}

.item:hover, .item:after {
  -webkit-transition: 0.5s border ease;
  -moz-transition: 0.5s border ease;
  -o-transition: 0.5s border ease;
  transition: 0.5s border ease;
}



.back:before, .back:hover:before, .back:hover:after {
  -webkit-transition: 0.5s all ease;
  -moz-transition: 0.5s all ease;
  -o-transition: 0.5s all ease;
  transition: 0.5s all ease;
}

</style>




<script>


$(document).ready(function() {
	$('.GoalRanking').click(function() {
		window.location.href="2_1_PlayerGoalRank.jsp";
	});
	
	$('.AssistRanking').click(function() {
		window.location.href="2_2_PlayerAssistRank.jsp";
	});
	
    $('.previous').click(function() {
    	 window.location.href="Index.jsp";
    });

});
   	
</script>
<body>
<h1>
<div class = "chartMain" id="expertise" align="center" style = " position:relative;">
	<div class = "menu" align = "center" style = "width:80%;">
		<div style = "width : 680px; height : 80px; font-size:50px; color:#F3F3F3; background-color: rgba( 189, 189, 189, 0.3 );">PLAYER RANKING</div>
		<div class="GoalRanking item" >Goal Ranking</div>
		<div class="AssistRanking item">Assist Ranking</div>
	</div>
	<div class="previous back" id="previous" ></div>
</div>


</h1>
</body>
</html>