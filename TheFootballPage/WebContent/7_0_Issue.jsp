<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.sql.*" %>


<%! Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String user_id = "soccer1";
	String user_pw = "tngh12";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "SELECT issueplayername, teamname, issuetalk FROM issue";
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	
    $('.previous').click(function() {
    	 location.href="Index.jsp";
    });
    });
</script>

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
  background-color: transparent;
  padding: 10px;
  width:12%;
  margin-bottom:10px;
  display:inline-block;
  margin: 5px 3px 10px 3px;
  padding:5px;
  box-sizing:border-box;
  text-align:center;
  text-transform:uppercase;
  letter-spacing:2px;
  border-radius:2px;
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

.previous.item:before {
background-image: url("image/previous.png");
}

.previous.item:hover:before {
background-image: url("image/previous2.png");
}

.item:after {
  content: "";
  display:block;
  position:absolute;
  top:0;
  left:0;
  width:0;
  z-index:-1;
  overflow:hidden;
}

.item:hover:after {
  z-index:-1;
  border-bottom:500px solid transparent;
  overflow:hidden;
  background-color:#0078D7;
}

.item:hover {
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
</style>

<body>



<h1>


<div class = "menu" id="expertise" align = "center" style = " width:80%; position:relative;">

	<div style = "width : 680px; height : 80px; font-size:50px; color:#F3F3F3; background-color: rgba( 189, 189, 189, 0.3 );">ISSUE</div>
	
	<div style = "width: 680px; position:static;">
		
		<div style="width: 680px; height:90%; position:static; background-color: rgba(189, 189, 189, 0.8); overflow:auto;">
			<table style="width:100%; height:20%; font-size:12px; position:relative; border:2px solid white;">
				<tbody>
					<tr>
						<td style="width:150px; color:white; background-color:black; text-align:center;">
						선 수 이 름<br>[ 소 속 팀 ]
						</td>
						<td style="width:2px;">
						</td>
						
						<td style="color:white; background-color:black; text-align:center;">
						인 터 뷰  &  이 슈 내 용
						</td>
					</tr>
				</tbody>
			</table>
			<%
				conn = DriverManager.getConnection(url, user_id, user_pw);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
			
				while(rs.next())
				{
			%>
			
			
			<table style="position:relative; border:2px solid white;">
				<tbody>
					<tr>
						<td style="width:150px; color:white; background-color:#38003C; text-align:center;">
						<p><%= rs.getString("issueplayername") %><p>[ <%= rs.getString("teamname") %> ]
						</td>
						</td>
						<td>
						</td>
						<td style="color:#38003c; background-color:#00FF85;">
						<%= rs.getString("issuetalk") %>
						</td>
					</tr>
				</tbody>
			</table>
			<%
				}
				rs.close();
				stmt.close();
				conn.close();
			%>
			<div class="previous item" id="previous" ></div>
		</div>
		<div>
	</div>
		
</div>

</h1>
		
		

</body>
</html>