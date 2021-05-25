package TheFootball;
import java.sql.*;

public class Issue {
	private String issueplayername;
	private String teamname;
	private String issuetalk;
	private String sqlInsertIssue;
	
	public String getIssuePlayerName() {return issueplayername;}
	public void setIssuePlayerName(String issueplayername) {this.issueplayername = issueplayername;}
	
	public String getTeamName() {return teamname;}
	public void setTeamName(String teamname) {this.teamname = teamname;}
	
	public String getIssueTalk() {return issuetalk;} 
	public void setIssueTalk(String issuetalk) {this.issuetalk = issuetalk;}
	
	public String getSqlInsertIssue() {return sqlInsertIssue;}
	public void setSqlInsertIssue(String tmpIssuePlayerName, String tmpTeamName, String tmpIssueTalk) throws Exception {
		Connection con = DBCon.getCon();
		
		String tmpSql;
		tmpSql = "INSERT INTO ISSUE VALUES ('"+tmpIssuePlayerName+"','"+tmpTeamName+"','"+tmpIssueTalk+"')";
		Statement stmt = con.createStatement();
		stmt.executeUpdate(tmpSql);
		DBCon.close(con,  stmt,  null);}
	
}
