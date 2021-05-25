<!DOCTYPE html>

<%@ page import = "TheFootball.Team"  %>
<% Team team = new Team();
%>
<html>

<head>
<meta charset="UTF-8">
<title>Menu</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>


$(document).ready(function() {
    
    $('.league').click(function(){ 
    	window.location.href="1_0_LeagueRank.jsp"
    });
    
    $('.goal').click(function() {
    	window.location.href="2_0_PlayerRank.jsp"
    });
    
    $('.team').click(function() {
    	window.location.href="3_0_TeamInfo.jsp"
    });
    
    $('.injure').click(function() {
    	window.location.href="4_0_InjurePlayer.jsp"
    });
    
    $('.nation').click(function() {
    	window.location.href="5_0_Nation.jsp"
    });
    
    $('.trade').click(function() {
    	window.location.href="6_0_Trade.jsp"
    });
    
    $('.issue').click(function() {
   		window.location.href="7_0_Issue.jsp";
   	});
    
    $('.insert').click(function() {
    	window.location.href="8_0_Insert.jsp"
    });
    
    $('.previous').click(function() {
    	window.location.href="Index.jsp";
    });
});
    

</script>

</head>

<%
String tmp = request.getParameter("chooseLeague");
session.setAttribute("chooseLeague", tmp);
%>


<style>
@font-face{font-family:'UEFASupercup-Bold'; src:url('addFont/UEFAFont/OTF/UEFASupercup-Light.otf')}
body {
  width:100%;
  height:100%;
  font-family: "UEFASupercup-Bold",  sans-serif;
  font-weight: 100;
  font-size:8px;
  background: url("image/back2.png") no-repeat center rgba(0,0,0,0.8);
  overflow:hidden;
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
  background-color:#38003C;
}



.item:hover {
  color:#38003C;
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

.league.item:before {
  background-image: url("image/league.png");
}

.league.item:hover:before {
  background-image: url("image/league2.png");
}

.goal.item:before {
  background-image: url("image/goal.png");
}

.goal.item:hover:before {
  background-image: url("image/goal2.png");
}

.team.item:before {
  background-image: url("image/team.png");
}

.team.item:hover:before {
  background-image: url("image/team2.png");
}

.injure.item:before {
  background-image: url("image/injure.png");
}

.injure.item:hover:before {
  background-image: url("image/injure2.png");
}

.nation.item:before {
  background-image: url("image/nation.png");
}

.nation.item:hover:before {
  background-image: url("image/nation2.png");
}

.trade.item:before {
  background-image: url("image/trade.png");
}

.trade.item:hover:before {
  background-image: url("image/trade2.png");
}
.issue.item:before {
background-image: url("image/issue.png");
}

.issue.item:hover:before {
background-image: url("image/issue2.png");
}

.insert.item:before {
background-image: url("image/plus.png");
}

.insert.item:hover:before {
background-image: url("image/plus2.png");
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



</style>

<body>



<h1>
<div class = "main1" id="expertise" align = "center">
	<div class = "menu" align = "center" style = "width:80%;">
		<div style = "width : 680px; height : 80px; font-size:50px; color:rgba( 255, 255, 255, 0.8 ); background-color: rgba( 56, 0, 60, 0.8 );">MENU</div>
		<div class="league item" >League Ranking</div>
		<div class="goal item">Goal/Assist Ranking</div>
		<div class="team item">Team Information</div>
		<div class="injure item">Injury List</div>
		<div class="nation item">Nation List of Player</div>
		<div class="trade item">Trade Market List</div>
		<div class="issue item">Issue</div>
		<div class="insert item">Insert Information</div>
	</div>
	<div class="previous back" id="previous" ></div>
</div>
</h1>





</body>
</html>