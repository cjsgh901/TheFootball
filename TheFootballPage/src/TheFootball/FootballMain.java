package TheFootball;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;



public class FootballMain {
	
	Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) throws Exception {
		FootballMain sp = new FootballMain();
		sp.printMain();
	}
	
	
	
	public void printMain() throws Exception {								// - 메인 프린팅 -
		while(true) {
			System.out.println("====================================================================");
			System.out.println("\n\t\t\t     <MENU> \n\n[1]각 리그 순위\t\t[2]리그별 득점/도움 순위\t\t"
					+ "[3]구단정보\n[4]부상자 명단\t\t[5]국가별 선수명단\t\t\t[6]이적시장 현황\n[7]최근 이슈 한눈에 보기\t[8]정보입력/수정/삭제\n ");
			System.out.println("====================================================================\n <�Է�>");
			int tmpChooseNum = sc.nextInt();
			switch(tmpChooseNum) {
			case 1: {	//[1]리그별 순위
				leagueRank();
				break;
				}
			case 2:{	//[2]리그별 득점/도움순위
				System.out.println("====================================================================");
				System.out.println("[1]리그별 득점순위\t[2]리그별 도움순위");
				System.out.println("====================================================================");
				System.out.println("<입력>");
				int tmpChooseRank = sc.nextInt();
				
				switch(tmpChooseRank) {
				case 1: {
					goalRank();
					break;
					}
				case 2: {
					assistRank();
					break;
					}
				}
				goalRank();
				break;
				}
			case 3:{	//[3]구단 정보
				teamInfo();
				break;
				}
			case 4:{	//[4]부상자 명단
				injurePlayer();
				break;
				}
			case 5:{	//[5]국가별 선수명단
				printNationSquad();
				break;
				}
			case 6:{	//[6]이적시장 현황
				tradeInfo();
				break;
				}
			case 7: {	//[7]최근 이슈 한눈에 보기
				issueInfo();
				break;
				}
			case 8:{	//[8]정보 입력
				System.out.println("[1]새로운 선수 정보 입력\t\t[2]기존 선수 정보 수정\t\t[3]기존 선수 정보 삭제");
				int chooseNumPlayerInfo = sc.nextInt();
				
				switch(chooseNumPlayerInfo) {
				case 1: {
					insertPlayer();
					break;
					}
				case 2: {
					updatePlayer();
					break;
					}
				case 3: {
					deletePlayer();
					break;
					}
				case 4: {
					allPlayer();
					break;
					}
				}
				break;
				}
			}
		}
	}
	
	public void leagueRank() throws Exception {								//[1] ���׺� ����
		Team team = new Team();
		String chooseLeagueStr = chooseLeague();
		int tmpRank, tmpSum, tmpTotal;
		Connection con = DBCon.getCon();
		String sql = "SELECT rank() over(order by teamwin*3 + teamdraw desc, teamplus-teamminus  desc) as rank"
				+ ", teamname, teamgame, teamwin, teamdraw, teamlose, teamplus, teamminus, (teamplus-teamminus) as sum, teamwin*3 + teamdraw as total "
				+ "FROM TEAM WHERE LeagueName = '"+chooseLeagueStr+"'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		System.out.println("==============================================================================================");
		System.out.println("순위\t\t팀이름\t\t경기수\tㅣ승\tㅣ무\tㅣ패\tㅣ득\tㅣ실\tㅣ승점");
		System.out.println("----------------------------------------------------------------------------------------------");
		while (rs.next()) {
			tmpRank = rs.getInt("rank");
			team.setTeamName(rs.getString("teamName"));
			team.setTeamGame(rs.getInt("teamGame"));
			team.setTeamWin(rs.getInt("teamWin"));
			team.setTeamDraw(rs.getInt("teamDraw"));
			team.setTeamLose(rs.getInt("teamLose"));
			team.setTeamPlus(rs.getInt("teamPlus"));
			team.setTeamMinus(rs.getInt("teamMinus"));
			tmpSum = rs.getInt("sum");
			tmpTotal = rs.getInt("total");
			
			System.out.print(tmpRank + "\t" );
			System.out.printf("%17s", team.getTeamName());
			System.out.print("\t��" + team.getTeamGame() + "\t��" + team.getTeamWin() + "\t��" + team.getTeamDraw() + "\t��"
			+ team.getTeamLose() + "\t��" + team.getTeamPlus() + "\t��" + team.getTeamMinus() + "\t��" + tmpSum + "\t��" + tmpTotal + "\n");
			System.out.println("----------------------------------------------------------------------------------------------");
			
		}
		System.out.println("==============================================================================================");
		DBCon.close(con, stmt, rs);
		System.out.println();
	}
	
	public void goalRank() throws Exception {								//[2] - (1) ���׺� ��������
		Player player = new Player();
		String tmpLeagueName = chooseLeague();
		int tmpRank;
		
		Connection con = DBCon.getCon();
		String sql ="select * from (select rank() over( order by playergoal desc) as rank, playername, playergoal, player.teamname " + 
				"from player, team where player.teamname = team.teamname and team.leagueName = '"+ tmpLeagueName +"') where rank <= 10";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		System.out.println("====================================================================");
		System.out.println("����\t\t�̸�\t\t��\t�Ҽ� ��");
		System.out.println("--------------------------------------------------------------------");
		
		while(rs.next()) {
			tmpRank = rs.getInt("rank");
			player.setPlayerName(rs.getString("playerName"));
			player.setPlayerGoal(rs.getInt("playergoal"));
			player.setTeamName(rs.getString("teamname"));
			
			System.out.print(tmpRank + "\t" );
			System.out.printf("%17s", player.getPlayerName());
			System.out.println("\t"+player.getPlayerGoal()+"\t"+player.getTeamName());
		}
		System.out.println("--------------------------------------------------------------------");
		DBCon.close(con, stmt, rs);
	}
	
	public void assistRank() throws Exception {								//[2] - (2) ���׺� �������
		Player player = new Player();
		String tmpLeagueName = chooseLeague();
		int tmpRank;
		
		Connection con = DBCon.getCon();
		String sql ="select * from (select rank() over( order by playerassist desc) as rank, playername, playerassist, player.teamname " + 
				"from player, team where player.teamname = team.teamname and leagueName = '"+ tmpLeagueName +"') where rank <= 10";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		System.out.println("====================================================================");
		System.out.println("����\t\t�̸�\t\t����\t�Ҽ� ��");
		System.out.println("--------------------------------------------------------------------");
		
		while(rs.next()) {
			tmpRank = rs.getInt("rank");
			player.setPlayerName(rs.getString("playerName"));
			player.setPlayerAssist(rs.getInt("playerassist"));
			player.setTeamName(rs.getString("teamname"));
			
			System.out.print(tmpRank + "\t" );
			System.out.printf("%17s", player.getPlayerName());
			System.out.println("\t"+player.getPlayerAssist()+"\t"+player.getTeamName());
		}
		System.out.println("--------------------------------------------------------------------");
		DBCon.close(con, stmt, rs);
	}
	
	public void teamInfo() throws Exception {								//[3] ��������
		Team team = new Team();
		Player player = new Player();
		
		printTeamName();
		System.out.println("�˻��� ���ܸ��� �Է��ϼ���.");
		String tmpTeamName = sc.next();
		
		Connection con = DBCon.getCon();
		String sql1 = "SELECT teamname, teamstadium,tstadiumpeople,teamsite from team where teamname = '" + tmpTeamName +"'";
		Statement stmt1 = con.createStatement();
		ResultSet rs1 = stmt1.executeQuery(sql1);
		System.out.println("\n======================================================================================\n");
		System.out.println("\t\t\t\t        [���� ����]\n");
		System.out.println("\t���ܸ�\t\t\t         ������̸�\t����� �����ο�\t���� ����Ȩ������");
		while(rs1.next()) {
			team.setTeamName(rs1.getString("teamname"));
			team.setTeamStadium(rs1.getString("teamstadium"));
			team.setTStadiumPeople(rs1.getInt("tstadiumpeople"));
			team.setTeamSite(rs1.getString("teamsite"));
			
			System.out.printf("%17s\t", team.getTeamName());
			System.out.printf("%20s\t", team.getTeamStadium());
			System.out.println(team.getTStadiumPeople() + "\t\t" + team.getTeamSite());
			System.out.println("======================================================================================");
		}
		DBCon.close(null, stmt1, rs1);
		System.out.println("\n\t\t\t\t\t[���� ������]\n");
		System.out.println("\t�����̸�\t\t\t�Ҽӱ���\t\t���ȣ\t������\t�������\t\t����Ƚ��");
		System.out.println("--------------------------------------------------------------------------------------");
		String sql2 = "SELECT playername,teamname,playernumber,position,TO_CHAR(playerborn,'YYYY/MM/DD') as born,playergame FROM player WHERE teamname = '"+ tmpTeamName +"' ORDER BY position desc";
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery(sql2);
		while(rs2.next()) {
			player.setPlayerName(rs2.getString("playername"));
			player.setTeamName(rs2.getString("teamname"));
			player.setPlayerNumber(rs2.getInt("playernumber"));
			player.setPosition(rs2.getString("position"));
			player.setPlayerBorn(rs2.getString("born"));
			player.setPlayerGame(rs2.getInt("playergame"));
			
			System.out.printf("%20s\t", player.getPlayerName());
			System.out.printf("%17s\t", player.getTeamName());
			System.out.println(player.getPlayerNumber() + "\t" + player.getPosition() + "\t" + player.getPlayerBorn() + "\t" + player.getPlayerGame());
		}
		DBCon.close(con, stmt2, rs2);
		
	}
	
	public void injurePlayer() throws Exception {							//[4] 부상자 명단
		Connection con = DBCon.getCon();
		Player player = new Player();
		
		System.out.println("[1]리그별 부상자 명단\t\t[2]구단별 부상자 명단");
		int tmpChooseNum = sc.nextInt();
		
		switch(tmpChooseNum) {
		case 1: {
			String tmpLeagueName = chooseLeague();
			String sql1 = "SELECT p.playername, p.position, p.teamname FROM player p, team t WHERE p.teamname = t.teamname "
					+ "AND p.playerinjure=1 and t.leaguename = '"+tmpLeagueName+"'";
			Statement stmt1 = con.createStatement();
			ResultSet rs1 = stmt1.executeQuery(sql1);
			
			System.out.println("======================================================================================\n");
			System.out.println("\t\t      [부상자 명단]\n");
			System.out.println("\t      선수 이름\t포지션\t\t소속 구단\n");
			System.out.println("--------------------------------------------------------------------------------------");
			while(rs1.next()) {
				player.setPlayerName(rs1.getString("playername"));
				player.setPosition(rs1.getString("position"));
				player.setTeamName(rs1.getString("teamname"));
				
				System.out.printf("%20s\t", player.getPlayerName());
				System.out.println(player.getPosition() + "\t\t" + player.getTeamName());
				
			}
			System.out.println("--------------------------------------------------------------------------------------");
			DBCon.close(con, stmt1, rs1);
			break;
			}
		case 2: {
			printTeamName();
			String tmpTeamName = sc.next();
			
			String sql2 = "SELECT playername,position,teamname FROM player WHERE teamname = '" + tmpTeamName +"' AND playerinjure = 1";
			Statement stmt2 = con.createStatement();
			ResultSet rs2 = stmt2.executeQuery(sql2);
			
			System.out.println("======================================================================================\n");
			System.out.println("\t\t      [�λ��� ���]\n");
			System.out.println("\t      �����̸�\t������\t\t�Ҽӱ���\n");
			System.out.println("--------------------------------------------------------------------------------------");
			while(rs2.next()) {
				player.setPlayerName(rs2.getString("playername"));
				player.setPosition(rs2.getString("position"));
				player.setTeamName(rs2.getString("teamname"));
				
				System.out.printf("%20s\t", player.getPlayerName());
				System.out.println(player.getPosition() + "\t\t" + player.getTeamName());
				
			}
			System.out.println("--------------------------------------------------------------------------------------");
			DBCon.close(con, stmt2, rs2);
			break;
			}
		}
		
	}
	
	public void printNationSquad() throws Exception {						//[5] ������ �������
		Player player = new Player();
		Connection con = DBCon.getCon();
		int tmp = 0;
		printTeamName();
		String tmpTeamName = sc.next();
		String sql1 = "SELECT DISTINCT playernation FROM player WHERE teamname ='" + tmpTeamName + "'";
		Statement stmt1 = con.createStatement();
		ResultSet rs1 = stmt1.executeQuery(sql1);
		
		System.out.println("�Ҽӱ��� ������ ���� ���");
		System.out.println("--------------------------------------------------------------------");
		while(rs1.next()) {
			player.setPlayerNation(rs1.getString("playernation"));
			if (tmp%4==0) {
				System.out.println();
			}
			System.out.printf("%12s\t", player.getPlayerNation());
			tmp++;
		}
		System.out.println("\n--------------------------------------------------------------------");
		DBCon.close(null, stmt1, rs1);
		System.out.println("�˻��� �������� �Է��ϼ���.");
		String tmpNation = sc.next();
		String sql2 = "SELECT playername, teamname, playernation FROM player WHERE teamname = '" + tmpTeamName + "' AND playernation = '" + tmpNation + "'";
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery(sql2);
		System.out.println("====================================================================");
		System.out.println("\t�����̸�\t\t\t   ���ܸ�\t\t\t  ������");
		System.out.println("\n--------------------------------------------------------------------");
		while(rs2.next()) {
			player.setPlayerName(rs2.getString("playername"));
			player.setTeamName(rs2.getString("teamname"));
			player.setPlayerNation(rs2.getString("playernation"));
			
			System.out.printf("%17s\t", player.getPlayerName());
			System.out.printf("%20s\t", player.getTeamName());
			System.out.printf("%20s", player.getPlayerNation());
			System.out.println();
		}
		System.out.println("\n--------------------------------------------------------------------");
	}
	
	public void tradeInfo() throws Exception {								//[6] �������� ��Ȳ
		Trade trade = new Trade();
		Connection con = DBCon.getCon();
		System.out.println("-------------------------------------------------------------------------------------------------------------");
		System.out.println("\t\t\t\t\t[������ �� ���� ���� ����]");
		String tmpLeagueName = chooseLeague();
		
		String sql = "SELECT tr.tradeplayername, tr.preteam, tr.teamname, tr.tradehappen, tr.tradeprice_gbp FROM trade tr, team t where tr.teamname = t.teamname and t.leaguename = '"+tmpLeagueName+"'"; 
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("-------------------------------------------------------------------------------------------------------------");
		System.out.println("\t�����̸�\t\t\t\t���� ��\t\t    ������ ��\t\t��������\t������-m(GBP)\t������-��(KRW)");
		System.out.println("-------------------------------------------------------------------------------------------------------------");
		while(rs.next()) {
			trade.setTradePlayerName(rs.getString("tradeplayername"));
			trade.setPreteam(rs.getString("preteam"));
			trade.setTeamName(rs.getString("teamname"));
			trade.setTradeHappen(rs.getString("tradehappen"));
			trade.setTradePrice_gbp(rs.getInt("tradeprice_gbp"));
			
			System.out.printf("%17s\t", trade.getTradePlayerName());
			System.out.printf("%20s\t", trade.getPreteam());
			System.out.printf("%20s\t", trade.getTeamName());
			System.out.print(trade.getTradeHappen() + "\t");
			if (trade.getTradePrice_gbp() == 0) {
				System.out.println("-\t\t-");
			} else if (trade.getTradePrice_gbp() > 0) {
				System.out.println((int)(trade.getTradePrice_gbp()/10000) + "\t\t" + (int)(trade.getTradePrice_gbp()*0.0000155) );
			}
		}
		System.out.println("\n=============================================================================================================\n");
		
		
	}
	
	public void issueInfo() throws Exception {								//[7] �̽� ��Ȳ
		
		Issue issue = new Issue();
		
		Connection con = DBCon.getCon();
		String sql = "SELECT issueplayername, teamname, issuetalk FROM issue";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("=============================================================================================================");
		System.out.println("\t�����̸�\t\t          �Ҽӱ���\t\t  �ҽ� �� �߾�");
		System.out.println("-------------------------------------------------------------------------------------------------------------");
		while(rs.next()) {
			issue.setIssuePlayerName(rs.getString("issueplayername"));
			issue.setTeamName(rs.getString("teamname"));
			issue.setIssueTalk(rs.getString("issuetalk"));
			
			System.out.printf("%17s%20s\t\t", issue.getIssuePlayerName(),issue.getTeamName());
			System.out.println(issue.getIssueTalk());
		}
		System.out.println("-------------------------------------------------------------------------------------------------------------");
		DBCon.close(con, stmt, rs);
		
	}
	
	public void insertPlayer() throws Exception {							//[8] �����Է�/����/���� - [1]���������Է�
		Connection con = DBCon.getCon();
		
		System.out.println("�����̸�");
		String tmpPlayerName = sc.next();
		System.out.println("���̸�");
		String tmpTeamName = sc.next();
		System.out.println("���� ���ȣ");
		int tmpBackNumber = sc.nextInt();
		System.out.println("���� ������");
		String tmpPosition = sc.next();
		System.out.println("���� �������");
		String tmpBorn = sc.next();
		System.out.println("���� ����");
		String tmpNation = sc.next();
		System.out.println("������ Ƚ��");
		int tmpPlayerGame = sc.nextInt();
		System.out.println("�� Ƚ��");
		int tmpPlayerGoal = sc.nextInt();
		System.out.println("���� Ƚ��");
		int tmpPlayerAssist = sc.nextInt();
		System.out.println("��� Ƚ��");
		int tmpPlayerYellow = sc.nextInt();
		System.out.println("���� Ƚ��");
		int tmpPlayerRed = sc.nextInt();
		System.out.println("�λ�");
		int tmpPlayerInjure = sc.nextInt();
			
		String sql = "INSERT INTO Player VALUES ('"
				+ tmpPlayerName + "','" + tmpTeamName + "',"+tmpBackNumber+",'"+tmpPosition+"','"+tmpBorn+"','"+tmpNation+"',"+
				tmpPlayerGame+","+tmpPlayerGoal+","+tmpPlayerAssist+","+tmpPlayerYellow+","+tmpPlayerRed+","+tmpPlayerInjure+")";
		Statement stmt = con.createStatement();
		stmt.executeUpdate(sql);
		DBCon.close(con,  stmt,  null);
	}
	
	public void updatePlayer() throws Exception {							//[8] �����Է�/����/���� - [2]������������
		Connection con = DBCon.getCon();
		System.out.println("������ ���� �̸��� �Է��ϼ���");
		String tmpPlayerName = sc.next();
		
		System.out.println(tmpPlayerName+"�� ������ �������� �׸� �°� ���ʷ� �Է��ϼ���.");
		System.out.println("���̸�");
		String tmpTeamName = sc.next();
		System.out.println("���� ���ȣ");
		int tmpBackNumber = sc.nextInt();
		System.out.println("���� ������");
		String tmpPosition = sc.next();
		System.out.println("���� �������");
		String tmpBorn = sc.next();
		System.out.println("���� ����");
		String tmpNation = sc.next();
		System.out.println("������ Ƚ��");
		int tmpPlayerGame = sc.nextInt();
		System.out.println("�� Ƚ��");
		int tmpPlayerGoal = sc.nextInt();
		System.out.println("���� Ƚ��");
		int tmpPlayerAssist = sc.nextInt();
		System.out.println("��� Ƚ��");
		int tmpPlayerYellow = sc.nextInt();
		System.out.println("���� Ƚ��");
		int tmpPlayerRed = sc.nextInt();
		System.out.println("�λ�");
		int tmpPlayerInjure = sc.nextInt();
		
		String sql = "UPDATE player "
				+ "SET teamname = '"+tmpTeamName+"',playernumber = "+tmpBackNumber+", position = '"+tmpPosition+"', playerborn = '"+tmpBorn+"', "
				+ "playernation = '"+tmpNation+"', playergame = "+tmpPlayerGame+", playergoal = "+tmpPlayerGoal+", playerassist = "+tmpPlayerAssist+", "
				+ "playeryellow = "+tmpPlayerYellow+", playerred = "+tmpPlayerRed+", playerinjure = "+tmpPlayerInjure+"  where playername = '"+tmpPlayerName+"'";
		Statement stmt = con.createStatement();
		stmt.executeUpdate(sql);
		DBCon.close(con,  stmt,  null);
	}
	
	public void deletePlayer() throws Exception {							//[8] �����Է�/����/���� - [3]������������
		Connection con = DBCon.getCon();
		
		System.out.println("������ ������ �̸��� �Է��ϼ���.");
		String tmpPlayerName = sc.next();
		String sql = "DELETE player WHERE playername = '"+ tmpPlayerName + "'";
		
		Statement stmt = con.createStatement();
		stmt.executeUpdate(sql);
		DBCon.close(con,  stmt, null);
	}
	
	public void allPlayer() throws Exception {								//[8] �����Է�/����/���� - [4]��ü ���� ���
		Connection con = DBCon.getCon();
		Player player = new Player();
		
		String sql = "SELECT * FROM player";
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("\t\t        �����̸�\t\t�Ҽӱ��ܸ�\t\t���ȣ\t������\t�������\t\t\t\t�Ҽӱ���\t\t����Ƚ��\t����\t����\t���\t����\t�λ󿩺�(1 = ����λ�)");
		System.out.println("---------------------------------------------------------------------------------------------------------------"
				+ "----------------------------------------------------------");
		
		while(rs.next()) {
			player.setPlayerName(rs.getString("playername"));
			player.setTeamName(rs.getString("teamname"));
			player.setPlayerNumber(rs.getInt("playernumber"));
			player.setPosition(rs.getString("position"));
			player.setPlayerBorn(rs.getString("playerborn"));
			player.setPlayerNation(rs.getString("playernation"));
			player.setPlayerGame(rs.getInt("playergame"));
			player.setPlayerGoal(rs.getInt("playergoal"));
			player.setPlayerAssist(rs.getInt("playerassist"));
			player.setPlayerYellow(rs.getInt("playeryellow"));
			player.setPlayerRed(rs.getInt("playerred"));
			player.setPlayerInjure(rs.getInt("playerinjure"));
			
			System.out.printf("%25s\t", player.getPlayerName());
			System.out.printf("%20s\t", player.getTeamName());
			System.out.print(player.getPlayerNumber() + "\t" + player.getPosition() + "\t" + player.getPlayerBorn() + "\t");
			System.out.printf("%20s", player.getPlayerNation());
			System.out.println("\t" + player.getPlayerGame() + "\t" + player.getPlayerGoal() + "\t" + player.getPlayerAssist() + "\t"
			+ player.getPlayerYellow() + "\t" + player.getPlayerRed() + "\t" + player.getPlayerInjure() );
		}
		
	}
	
	// �� �Ļ� ��ɵ� ��
	
	public String chooseLeague() {											// �� ���� ����  ��
		System.out.println("\t\t\t\t\t  <���׸� �����ϼ���>\n[1]England Premier League\t[2]Spain Laliga\t\t[3]Germany Bundesliga\t\t[4]Italy Seria A");
		System.out.println("-------------------------------------------------------------------------------------------------------------");
		System.out.println("<�Է�>");
		int chooseLeagueNum = sc.nextInt();
		String tmpStr = null;
		switch(chooseLeagueNum) {
		case 1: {
			tmpStr = "PremierLeague";
			break;
			}
		case 2: {
			tmpStr = "Laliga";
			break;
			}
		case 3: {
			tmpStr = "Bundesliga";
			break;
			}
		case 4: {
			tmpStr = "SerieA";
			break;
			}
		}
		
		return tmpStr;
	}
	
	public void printTeamName() throws Exception {							// �� ���̸� ��� ��
		Team team = new Team();
		Connection con = DBCon.getCon();
		
		String tmpLeagueName = chooseLeague();
		String sql = "SELECT teamname FROM team WHERE LeagueName ='"+tmpLeagueName+"'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		System.out.println("�Ҽ� ���� ���� ���");
		System.out.println("--------------------------------------------------------------------");
		while(rs.next()) {
			team.setTeamName(rs.getString("teamname"));
			System.out.println(team.getTeamName());
		}
		System.out.println("--------------------------------------------------------------------");
		DBCon.close(con, stmt, rs);
	}
	
	public void printTeamNation() throws Exception {						// �� �Ҽ��� �������� ���� ��� ��
		Player player = new Player();
		Connection con = DBCon.getCon();
		int tmp = 0;
		
		printTeamName();
		String tmpTeamName = sc.next();
		String sql = "SELECT DISTINCT playernation FROM player WHERE teamname ='" + tmpTeamName + "'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		System.out.println("�Ҽӱ��� ������ ���� ���");
		System.out.println("--------------------------------------------------------------------");
		while(rs.next()) {
			player.setPlayerNation(rs.getString("playernation"));
			
			if (tmp%4==0) {
				System.out.println();
			}
			
			System.out.printf("%12s\t", player.getPlayerNation());
			tmp++;
		}
		System.out.println("\n--------------------------------------------------------------------");
		DBCon.close(con, stmt, rs);
	}
	
	
}
