<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.sql.*" %>
<%@ page import = "TheFootball.Trade"  %>
<% request.setCharacterEncoding("utf-8"); %>
<% Trade trade = new Trade();
%>
<html>

<head>
<meta charset="UTF-8">
<title>Football Mainpage</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>


$(document).ready(function() {
    $('.previous').click(function() {
    	window.location.href="8_3_Inserttrade.jsp";
    });
});
    

</script>

</head>

<%
	Object inputLeague = session.getAttribute("chooseLeague");
	String chooseLeague = (String)inputLeague;
	session.setAttribute("chooseLeague", chooseLeague);

	String tradeplayername = request.getParameter("tradeplayername");
	String preteam = request.getParameter("preteam");
	String teamname = request.getParameter("teamname");
	String tradehappen = request.getParameter("tradehappen");
	String tradedate = request.getParameter("tradedate");
	int tradeprice_gbp = Integer.parseInt(request.getParameter("tradeprice_gbp"));
	
	trade.setSqlInsertTrade(tradeplayername, preteam, teamname, tradehappen, tradeprice_gbp, tradedate);
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

<body>



<h1>
<div class = "main1" id="expertise" align = "center">
	<div class = "menu" align = "center" style = "width:80%;">
		<div style = "width : 680px; height : 80px; font-size:50px; color:rgba( 255, 255, 255, 0.8 ); background-color: rgba( 56, 0, 60, 0.8 );">INSERT PLAYER</div>
		<div style="width: 680px; height:90%; position:relative; background-color: rgba(189, 189, 189, 0.8); overflow:auto;">
			<table>
				<tbody>
						<tr>
							<td><p><label>PLAYER NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<label><%= tradeplayername %></label></td>
							<td>
							<label><%= tradedate %></label>
							</td>
						</tr>
			
						<tr>
							<td><label>PREVIOUS NAME&nbsp;&nbsp;</label>
								<label><%= preteam %></label>
							</td>
							<td><label>TEAM NAME&nbsp;&nbsp;</label>
								<label><%= teamname %></label>
							</td>
						</tr>
						
				</tbody>
			</table>
		</div>
	</div>
	<div class="previous back" id="previous" ></div>
</div>
</h1>





</body>
</html>