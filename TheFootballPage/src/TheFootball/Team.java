package TheFootball;

public class Team {
	private String teamName;
	private String teamStadium;
	private int tStadiumPeople;
	private String leagueName;
	private String teamSite;
	private int teamGame;
	private int teamWin;
	private int teamDraw;
	private int teamLose;
	private int teamPlus;
	private int teamMinus;
	private String sqlLeagueRank;
	private String sqlTeamInfo;
	private String sqlTeamName;
	
	
	public String getTeamName() {return teamName;}
	public void setTeamName(String teamName) {this.teamName = teamName;}
	public String getTeamStadium() {return teamStadium;}
	public void setTeamStadium(String teamStadium) {this.teamStadium = teamStadium;}
	public int getTStadiumPeople() {return tStadiumPeople;}
	public void setTStadiumPeople(int tStadiumPeople) {this.tStadiumPeople = tStadiumPeople;}
	public String getLeagueName() {return leagueName;}
	public void setLeagueName(String leagueName) {this.leagueName = leagueName;}
	public String getTeamSite() {return teamSite;}
	public void setTeamSite(String teamSite) {this.teamSite = teamSite;}
	public int getTeamGame() {return teamGame;}
	public void setTeamGame(int teamGame) {this.teamGame = teamGame;}
	public int getTeamWin() {return teamWin;}
	public void setTeamWin(int teamWin) {this.teamWin = teamWin;}
	public int getTeamDraw() {return teamDraw;}
	public void setTeamDraw(int teamDraw) {this.teamDraw = teamDraw;}
	public int getTeamLose() {return teamLose;}
	public void setTeamLose(int teamLose) {this.teamLose= teamLose;}
	public int getTeamPlus() {return teamPlus;}
	public void setTeamPlus(int teamPlus) {this.teamPlus = teamPlus;}
	public int getTeamMinus() {return teamMinus;}
	public void setTeamMinus(int teamMinus) {this.teamMinus = teamMinus;}
	
	public String getSqlTeamName() {return sqlTeamName;}
	public void setSqlTeamName(String chooseLeague) {
		String tmpSql = "SELECT teamname FROM team WHERE LeagueName = '"+chooseLeague+"'";
		this.sqlTeamName = tmpSql;}
	
	public String getSqlLeagueRank() {return sqlLeagueRank;}
	public void setSqlLeagueRank(String chooseLeague) {
		String tmpLeague;
		tmpLeague = "SELECT rank() over(order by teamwin*3 + teamdraw desc, teamplus-teamminus desc, teamplus  desc) as rank"
				+ ", teamname, teamgame, teamwin, teamdraw, teamlose, teamplus, teamminus, (teamplus-teamminus) as sum, teamwin*3 + teamdraw as total "
				+ "FROM TEAM WHERE LeagueName = '"+chooseLeague+"'";
		this.sqlLeagueRank = tmpLeague;}
	
	public String getSqlTeamInfo() {return sqlTeamInfo;}
	public void setSqlTeamInfo(String chooseClub) {
		String tmpTeam;
		tmpTeam = "SELECT teamname, teamstadium, tstadiumpeople, teamsite from team where teamname = '" + chooseClub +"'";
		this.sqlTeamInfo = tmpTeam;
		
	}
}
