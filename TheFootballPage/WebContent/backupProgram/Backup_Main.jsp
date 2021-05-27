<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "TheFootball.Backup"  %>
<% Backup backup = new Backup();
%>
<html>

<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>


$(document).ready(function() {
    
    $('.insertlog').click(function(){ 
    	window.location.href="Backup_Insertlog.jsp"
    });
    
    $('.updatelog').click(function() {
    	window.location.href="Backup_Updatelog.jsp"
    });
    
    $('.deletelog').click(function() {
    	window.location.href="Backup_Deletelog.jsp"
    });
});
    

</script>

</head>

<%
Object inputLeague = session.getAttribute("chooseLeague");
String chooseLeague = (String)inputLeague;
session.setAttribute("chooseLeague", chooseLeague);
%>


<style>
@font-face{font-family:'UEFASupercup-Bold'; src:url('../addFont/UEFAFont/OTF/UEFASupercup-Regular.otf')}
body {
  width:100%;
  height:100%;
  font-family: "UEFASupercup-Bold",  sans-serif;
  font-weight: 100;
  font-size:8px;
  background: url("../image/back2.png") no-repeat center rgba(0,0,0,0.8);
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

.insertlog.item:before {
  background-image: url("../image/player.png");
}

.insertlog.item:hover:before {
  background-image: url("../image/player2.png");
}

.updatelog.item:before {
  background-image: url("../image/repair.png");
}

.updatelog.item:hover:before {
  background-image: url("../image/repair2.png");
}

.deletelog.item:before {
  background-image: url("../image/delete.png");
}

.deletelog.item:hover:before {
  background-image: url("../image/delete2.png");
}



</style>

<body>



<h1>
<div class = "main1" id="expertise" align = "center">
	<div class = "menu" align = "center" style = "width:80%;">
		<div style = "width : 680px; height : 80px; font-size:50px; color:rgba( 255, 255, 255, 0.8 ); background-color: rgba( 56, 0, 60, 0.8 );">MENU</div>
		<div class="insertlog item" >INSERT LOG</div>
		<div class="updatelog item">UPDATE LOG</div>
		<div class="deletelog item">DELETE LOG</div>
	</div>
</div>
</h1>





</body>
</html>