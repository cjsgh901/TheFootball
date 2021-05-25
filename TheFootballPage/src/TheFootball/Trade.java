package TheFootball;

import java.sql.*;

public class Trade {
	private String tradeplayername;
	private String preteam = null;
	private String teamname = null;
	private String tradehappen;
	private int tradeprice_gbp = 0;
	private String tradedate;
	private String sqlTradePlayer;
	private String sqlInsertTrade;
	
	public String getTradePlayerName() {return tradeplayername;}
	public void setTradePlayerName(String tradeplayername) {this.tradeplayername = tradeplayername;}
	
	public String getPreteam() {return preteam;}
	public void setPreteam(String preteam) {this.preteam = preteam;}
	
	public String getTeamName() {return teamname;}
	public void setTeamName(String teamname) {this.teamname = teamname;}
	
	public String getTradeHappen() {return tradehappen;}
	public void setTradeHappen(String tradehappen) {this.tradehappen = tradehappen;}
	
	public int getTradePrice_gbp() {return tradeprice_gbp;}
	public void setTradePrice_gbp(int tradeprice_gbp) {this.tradeprice_gbp = tradeprice_gbp;}
	
	public String getTradeDate() {return tradedate;}
	public void setTradeDate(String tradedate) {this.tradedate = tradedate;}
	
	public String getSqlTradePlayer() {return sqlTradePlayer;}
	public void setSqlTradePlayer(String chooseLeague) {
		String tmpSql;
		tmpSql = "SELECT * from trade t where preteam in (select teamname from team where leaguename = '"
		+chooseLeague+"') or teamname in (select teamname from team where leaguename= '"+chooseLeague+"') order by tradedate desc";
		
		this.sqlTradePlayer = tmpSql;
	}
	
	public String getSqlInsertTrade() {return sqlInsertTrade;}
	public void setSqlInsertTrade(String tmpTradePlayerName, String tmpPreteam, String tmpTeamname, String tmpTradeHappen, int tmpTradeprice_GBP, String tmpTradeDate) throws Exception {
		Connection con = DBCon.getCon();
		
		String tmpSql;
		tmpSql = "INSERT INTO trade VALUES ('"+tmpTradePlayerName+"','"+tmpPreteam+"','"+tmpTeamname+"','"+tmpTradeHappen+"',"+tmpTradeprice_GBP+",'"+tmpTradeDate+"')";
		
		Statement stmt = con.createStatement();
		stmt.executeUpdate(tmpSql);
		DBCon.close(con,  stmt,  null);	
	}
}
