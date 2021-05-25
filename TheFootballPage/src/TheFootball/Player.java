package TheFootball;

import java.sql.Connection;
import java.sql.Statement;

public class Player {
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
	
	private String sqlGoalRank;
	private String sqlAssistRank;
	private String sqlPlayerInfo;
	private String sqlInjurePlayer;
	private String sqlPlayerNation;
	private String sqlPlayerNationPrint;
	private String sqlInsertPlayer;
	
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
	
	public String getSqlPlayerNationPrint() {return sqlPlayerNationPrint;}
	public void setSqlPlayerNationPrint(String chooseNation, String chooseLeague) {
		String tmpSql;
		tmpSql = "SELECT p.playername, p.teamname, p.position from player p,team t where t.teamname = p.teamname and p.playernation = '"
		+chooseNation+"' and t.leaguename = '"+chooseLeague+"' order by p.position, p.teamname, p.playername";
		
		this.sqlPlayerNationPrint = tmpSql;
	}
	
	public String getSqlPlayerNation() {return sqlPlayerNation;}
	public void setSqlPlayerNation(String chooseLeague) {
		String tmpSql;
		tmpSql = "SELECT DISTINCT p.playernation from player p, team t where p.teamname = t.teamname and t.leaguename = '"+chooseLeague+"' ORDER BY p.playernation";
		
		this.sqlPlayerNation = tmpSql;
	}
	
	public String getSqlGoalRank() {return sqlGoalRank;}
	public void setSqlGoalRank(String chooseLeague) {
		String tmpGoal;
		tmpGoal = "select * from (select rank() over( order by playergoal desc) as rank, playername, playergoal, player.teamname "
				+ "from player, team where player.teamname = team.teamname and team.leagueName = '"+chooseLeague+"') where rank <= 10";
		this.sqlGoalRank = tmpGoal;}
	
	public String getSqlAssistRank() {return sqlAssistRank;}
	public void setSqlAssistRank(String chooseLeague) {
		String tmpAssist;
		tmpAssist = "select * from (select rank() over( order by playerassist desc) as rank, playername, playerassist, player.teamname "
				+ "from player, team where player.teamname = team.teamname and leagueName = '"+chooseLeague+"') where rank <= 10";
		this.sqlAssistRank = tmpAssist;}
	
	public String getSqlPlayerInfo() {return sqlPlayerInfo;}
	public void setSqlPlayerInfo(String chooseClub) {
		String tmpPlayerInfo;
		tmpPlayerInfo = "SELECT playernumber,playername,position,TO_CHAR(playerborn,'YYYY/MM/DD') as born,playergame FROM player WHERE teamname = '"+chooseClub
				+"' ORDER BY playernumber";
		this.sqlPlayerInfo = tmpPlayerInfo;
	}
	
	public String getSqlInjurePlayer() {return sqlInjurePlayer;}
	public void setSqlInjurePlayer(String chooseClub) {
		String tmpSql;
		tmpSql = "SELECT p.playername, p.position, p.teamname FROM player p, team t WHERE p.teamname = t.teamname "
				+ "AND p.playerinjure=1 and t.leaguename = '"+chooseClub+"' ORDER BY p.teamname, p.position";
		this.sqlInjurePlayer = tmpSql;
	}
	
	public String getSqlInsertPlayer() {return sqlInsertPlayer;}
	public void setSqlInsertPlayer(String tmpPlayerName, String tmpTeamName, int tmpPlayerNumber, String tmpPosition,
			String tmpPlayerBorn, String tmpPlayerNation, int tmpPlayerGame, int tmpPlayerGoal, int tmpPlayerAssist,
			int tmpPlayerYellow, int tmpPlayerRed, int tmpPlayerInjure) throws Exception {
		Connection con = DBCon.getCon();
		
		String tmpSql;
		tmpSql ="INSERT INTO PLAYER VALUES ('"+tmpPlayerName+"','"+tmpTeamName+"',"+tmpPlayerNumber+",'"+tmpPosition
				+"','"+tmpPlayerBorn+"','"+tmpPlayerNation+"',"+tmpPlayerGame+","+tmpPlayerGoal+","+tmpPlayerAssist
				+","+tmpPlayerYellow+","+tmpPlayerRed+","+tmpPlayerInjure+")";
		
		Statement stmt = con.createStatement();
		stmt.executeUpdate(tmpSql);
		DBCon.close(con,  stmt,  null);
	}
}
