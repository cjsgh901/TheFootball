package TheFootball;

import java.sql.Connection;
import java.sql.Statement;

public class Backup {
	private String playerName;
	private String teamName;
	private int playerNumber;
	private String position;
	private String playerBorn;
	private String playerNation;
	private int playerGame;
	private int playerGoal;
	private int playerAssist;
	private int playerYellow;
	private int playerRed;
	private int playerInjure;
	private String sysdate;
	
	private String sqlInsertLog;
	private String sqlUpdateLog;
	private String sqlDeleteLog;
	
	public String getPlayerName() {return playerName;}
	public void setPlayerName(String playerName) {this.playerName = playerName;}
	public String getTeamName() {return teamName;}
	public void setTeamName(String teamName) {this.teamName = teamName;}
	public int getPlayerNumber() {return playerNumber;}
	public void setPlayerNumber(int playerNumber) {this.playerNumber = playerNumber;}
	public String getPosition() {return position;}
	public void setPosition(String position) {this.position = position;}
	public String getPlayerBorn() {return playerBorn;}
	public void setPlayerBorn(String playerBorn) {this.playerBorn = playerBorn;}
	public String getPlayerNation() {return playerNation;}
	public void setPlayerNation(String playerNation) {this.playerNation = playerNation;}
	public int getPlayerGame() {return playerGame;}
	public void setPlayerGame(int playerGame) {this.playerGame = playerGame;}
	public int getPlayerGoal() {return playerGoal;}
	public void setPlayerGoal(int playerGoal) {this.playerGoal = playerGoal;}
	public int getPlayerAssist() {return playerAssist;}
	public void setPlayerAssist(int playerAssist) {this.playerAssist = playerAssist;}
	public int getPlayerYellow() {return playerYellow;}
	public void setPlayerYellow(int playerYellow) {this.playerYellow = playerYellow;}
	public int getPlayerRed() {return playerRed;}
	public void setPlayerRed(int playerRed) {this.playerRed = playerRed;}
	public int getPlayerInjure() {return playerInjure;}
	public void setPlayerInjure(int playerInjure) {this.playerInjure = playerInjure;}
	public String getSysdate() {return sysdate;}
	public void setSysdate(String sysdate) {this.sysdate = sysdate;}
	
	public String getSqlInsertLog() {return sqlInsertLog;}
	public void setSqlInsertLog() {
		String tmpSql;
		tmpSql = "SELECT playername, teamname, playernumber, position, TO_CHAR(playerborn,'YYYY/MM/DD') as playerborn, playernation, "
				+ "playergame, playergoal, playerassist, playeryellow, playerred, playerinjure, TO_CHAR(insertdate,'YYYY/MM/DD') as insertdate"
				+ " FROM INSERT_LOG_PLAYERINFO ORDER BY INSERTDATE DESC";
		
		this.sqlInsertLog = tmpSql;
	}
	
	public String getSqlDeleteLog() {return sqlDeleteLog;}
	public void setSqlDeleteLog() {
		String tmpSql;
		tmpSql = "SELECT playername, teamname, playernumber, position, TO_CHAR(playerborn,'YYYY/MM/DD') as playerborn, playernation, "
				+ "playergame, playergoal, playerassist, playeryellow, playerred, playerinjure, TO_CHAR(DELETEDATE,'YYYY/MM/DD') as DELETEDATE"
				+ " FROM DELETE_LOG_PLAYERINFO ORDER BY DELETEDATE DESC";
		
		this.sqlDeleteLog = tmpSql;
	}
	
	public String getSqlUpdateLog() {return sqlUpdateLog;}
	public void setSqlUpdateLog() {
		String tmpSql;
		tmpSql = "SELECT playername, teamname, playernumber, position, TO_CHAR(playerborn,'YYYY/MM/DD') as playerborn, playernation, "
				+ "playergame, playergoal, playerassist, playeryellow, playerred, playerinjure, TO_CHAR(UPDATEDATE,'YYYY/MM/DD') as UPDATEDATE"
				+ " FROM UPDATE_LOG_PLAYERINFO ORDER BY UPDATEDATE DESC";
		
		this.sqlUpdateLog = tmpSql;
	}
}
