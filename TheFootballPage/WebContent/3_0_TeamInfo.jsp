<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import = "TheFootball.Team"  %>
<% Team team = new Team();
%>
<html>
<%
request.setCharacterEncoding("UTF-8");

Object inputLeague = session.getAttribute("chooseLeague");
String chooseLeague = (String)inputLeague;
team.setLeagueName(chooseLeague);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=chooseLeague %> Team Information</title>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>





$(document).ready(function() {
	var chooseLeague = "<%=team.getLeagueName()%>";
	if (chooseLeague == "PremierLeague") {
    	$('.Laliga').hide();
    	$('.Bundesliga').hide();
    	$('.SerieA').hide();
    	$('.PremierLeague').show();
    } else if (chooseLeague == "Laliga") {
    	$('.Laliga').show();
    	$('.PremierLeague').hide();
    	$('.Bundesliga').hide();
    	$('.SerieA').hide();
    } else if (chooseLeague == "Bundesliga") {
    	$('.Bundesliga').show();
    	$('.Laliga').hide();
    	$('.PremierLeague').hide();
    	$('.SerieA').hide();
    } else if (chooseLeague == "SerieA") {
    	$('.SerieA').show();
    	$('.Laliga').hide();
    	$('.Bundesliga').hide();
    	$('.PremierLeague').hide();
    }
	$('.previous').click(function() {
    	window.location.href="Index.jsp";
    });
});


function ManCity_input(){
    document.getElementById("chooseClub").value = 'ManchesterCity';
}
function ManUtd_input(){
    document.getElementById("chooseClub").value = 'ManchesterUnited';
}
function Leicester_input(){
    document.getElementById("chooseClub").value = 'LeicesterCity';
}
function Chelsea_input(){
    document.getElementById("chooseClub").value = 'Chelsea';
}
function Westham_input(){
    document.getElementById("chooseClub").value = 'WesthamUnited';
}

function Tottenham_input(){
    document.getElementById("chooseClub").value = 'Tottenham';
}
function Liverpool_input(){
    document.getElementById("chooseClub").value = 'Liverpool';
}
function Everton_input(){
    document.getElementById("chooseClub").value = 'Everton';
}
function Arsenal_input(){
    document.getElementById("chooseClub").value = 'Arsenal';
}
function Aston_input(){
    document.getElementById("chooseClub").value = 'AstonVilla';
}

function Leeds_input(){
    document.getElementById("chooseClub").value = 'LeedsUnited';
}
function Wolves_input(){
    document.getElementById("chooseClub").value = 'Wolverhampton';
}
function Crystal_input(){
    document.getElementById("chooseClub").value = 'CrystalPalace';
}
function Brighton_input(){
    document.getElementById("chooseClub").value = 'Brighton';
}
function Southampton_input(){
    document.getElementById("chooseClub").value = 'Southampton';
}

function Burnley_input(){
    document.getElementById("chooseClub").value = 'Burnley';
}
function Newcastle_input(){
    document.getElementById("chooseClub").value = 'NewcastleUnited';
}
function Fulham_input(){
    document.getElementById("chooseClub").value = 'Fulham';
}
function Westbrom_input(){
    document.getElementById("chooseClub").value = 'WestBromwich';
}
function Sheff_input(){
    document.getElementById("chooseClub").value = 'SheffieldUnited';
}    


function ATMadrid_input(){
	document.getElementById("chooseClub").value = 'AtleticoMadrid';
}
function Realmadrid_input(){
	document.getElementById("chooseClub").value = 'RealMadrid';
}
function Barcelona_input(){
	document.getElementById("chooseClub").value = 'Barcelona';
}
function Sevilla_input(){
	document.getElementById("chooseClub").value = 'Sevilla';
}
function Realsociedad_input(){
	document.getElementById("chooseClub").value = 'RealSociedad';
}

function Villareal_input(){
	document.getElementById("chooseClub").value = 'Villareal';
}
function Realbetis_input(){
	document.getElementById("chooseClub").value = 'RealBetis';
}
function Celtavigo_input(){
	document.getElementById("chooseClub").value = 'CeltaVigo';
}
function Athleticclub_input(){
	document.getElementById("chooseClub").value = 'AthleticClub';
}
function Granada_input(){
	document.getElementById("chooseClub").value = 'Granada';
}

function Cadiz_input(){
	document.getElementById("chooseClub").value = 'Cadiz';
}
function Osasuna_input(){
	document.getElementById("chooseClub").value = 'Osasuna';
}
function Valencia_input(){
	document.getElementById("chooseClub").value = 'Valencia';
}
function Levante_input(){
	document.getElementById("chooseClub").value = 'Levante';
}
function Getafe_input(){
	document.getElementById("chooseClub").value = 'Getafe';
}


function Alaves_input(){
	document.getElementById("chooseClub").value = 'Alaves';
}
function Realvalladolid_input(){
	document.getElementById("chooseClub").value = 'RealValladolid';
}
function Huesca_input(){
	document.getElementById("chooseClub").value = 'Huesca';
}
function Elche_input(){
	document.getElementById("chooseClub").value = 'Elche';
}
function Eibar_input(){
	document.getElementById("chooseClub").value = 'Eibar';
}


function BayernMunchen_input(){
	document.getElementById("chooseClub").value = 'BayernMunchen';
}
function Leipzig_input(){
	document.getElementById("chooseClub").value = 'Leipzig';
}
function Wolfsburg_input(){
	document.getElementById("chooseClub").value = 'Wolfsburg';
}
function Frankfurt_input(){
	document.getElementById("chooseClub").value = 'Frankfurt';
}
function Dortmund_input(){
	document.getElementById("chooseClub").value = 'Dortmund';
}

function Leverkusen_input(){
	document.getElementById("chooseClub").value = 'Leverkusen';
}
function Monchengladbach_input(){
	document.getElementById("chooseClub").value = 'Monchengladbach';
}
function UnionBerlin_input(){
	document.getElementById("chooseClub").value = 'UnionBerlin';
}
function Freiburg_input(){
	document.getElementById("chooseClub").value = 'Freiburg';
}
function Stuttgart_input(){
	document.getElementById("chooseClub").value = 'Stuttgart';
}

function Hoffenheim_input(){
	document.getElementById("chooseClub").value = 'Hoffenheim';
}
function Mainz_input(){
	document.getElementById("chooseClub").value = 'Mainz';
}
function Augsburg_input(){
	document.getElementById("chooseClub").value = 'Augsburg';
}
function WerderBremen_input(){
	document.getElementById("chooseClub").value = 'WerderBremen';
}
function ArminiaBielefeld_input(){
	document.getElementById("chooseClub").value = 'ArminiaBielefeld';
}


function Koln_input(){
	document.getElementById("chooseClub").value = 'Koln';
}
function Hertha_input(){
	document.getElementById("chooseClub").value = 'Hertha';
}
function Schalke04_input(){
	document.getElementById("chooseClub").value = 'Schalke04';
}


function InterMilan_input(){
	document.getElementById("chooseClub").value = 'InterMilan';
}
function Atalanta_input(){
	document.getElementById("chooseClub").value = 'Atalanta';
}
function ACMilan_input(){
	document.getElementById("chooseClub").value = 'ACMilan';
}
function Juventus_input(){
	document.getElementById("chooseClub").value = 'Juventus';
}
function Napoli_input(){
	document.getElementById("chooseClub").value = 'Napoli';
}

function ASRoma_input(){
	document.getElementById("chooseClub").value = 'ASRoma';
}
function Sassuolo_input(){
	document.getElementById("chooseClub").value = 'Sassuolo';
}
function Sampdoria_input(){
	document.getElementById("chooseClub").value = 'Sampdoria';
}
function Bologna_input(){
	document.getElementById("chooseClub").value = 'Bologna';
}
function Genoa_input(){
	document.getElementById("chooseClub").value = 'Genoa';
}

function Fiorentina_input(){
	document.getElementById("chooseClub").value = 'Fiorentina';
}
function Spezia_input(){
	document.getElementById("chooseClub").value = 'Spezia';
}
function Torino_input(){
	document.getElementById("chooseClub").value = 'Torino';
}
function Cagliari_input(){
	document.getElementById("chooseClub").value = 'Cagliari';
}
function Benevento_input(){
	document.getElementById("chooseClub").value = 'Benevento';
}


function Parma_input(){
	document.getElementById("chooseClub").value = 'Parma';
}
function Crotone_input(){
	document.getElementById("chooseClub").value = 'Crotone';
}
function Lazio_input(){
	document.getElementById("chooseClub").value = 'Lazio';
}
function Verona_input(){
	document.getElementById("chooseClub").value = 'Verona';
}
function Udinese_input(){
	document.getElementById("chooseClub").value = 'Udinese';
}
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
}

#expertise {
  width:900px;
  height:650px;
  display:block;
  margin:0 auto;
  padding:2.5vh 0;
}

.item {
  position:relative;
  color: #fff;
  background-color: transparent;
  padding: 15px;
  width:180px;
  height:130px;
  border: #fff solid 2px;
  margin-bottom:5px;
  display:inline-block;
  margin: 0px 3px 10px 3px;
  padding:5px;
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
  height:60px;
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

.ManCity.item:before{
background-image: url("image/club/premierleague/ManCity.png");
}

.ManCity.item:hover:before{
background-image: url("image/club/premierleague/ManCity.png");
}

.ManUtd.item:before{
background-image: url("image/club/premierleague/ManUtd.png");
}

.ManUtd.item:hover:before{
background-image: url("image/club/premierleague/ManUtd.png");
}

.Leicester.item:before{
background-image: url("image/club/premierleague/Leicester.png");
}

.Leicester.item:hover:before{
background-image: url("image/club/premierleague/Leicester.png");
}

.Chelsea.item:before{
background-image: url("image/club/premierleague/Chelsea.png");
}

.Chelsea.item:hover:before{
background-image: url("image/club/premierleague/Chelsea.png");
}

.Westham.item:before{
background-image: url("image/club/premierleague/Westham.png");
}

.Westham.item:hover:before{
background-image: url("image/club/premierleague/Westham.png");
}

.Tottenham.item:before{
background-image: url("image/club/premierleague/Tottenham.png");
}

.Tottenham.item:hover:before{
background-image: url("image/club/premierleague/Tottenham.png");
}

.Liverpool.item:before{
background-image: url("image/club/premierleague/Liverpool.png");
}

.Liverpool.item:hover:before{
background-image: url("image/club/premierleague/Liverpool.png");
}

.Everton.item:before{
background-image: url("image/club/premierleague/Everton.png");
}

.Everton.item:hover:before{
background-image: url("image/club/premierleague/Everton.png");
}

.Arsenal.item:before{
background-image: url("image/club/premierleague/Arsenal.png");
}

.Arsenal.item:hover:before{
background-image: url("image/club/premierleague/Arsenal.png");
}

.Aston.item:before{
background-image: url("image/club/premierleague/Aston.png");
}

.Aston.item:hover:before{
background-image: url("image/club/premierleague/Aston.png");
}

.Leeds.item:before{
background-image: url("image/club/premierleague/Leeds.png");
}

.Leeds.item:hover:before{
background-image: url("image/club/premierleague/Leeds.png");
}

.Wolves.item:before{
background-image: url("image/club/premierleague/Wolves.png");
}

.Wolves.item:hover:before{
background-image: url("image/club/premierleague/Wolves.png");
}

.Crystal.item:before{
background-image: url("image/club/premierleague/Crystal.png");
}

.Crystal.item:hover:before{
background-image: url("image/club/premierleague/Crystal.png");
}

.Brighton.item:before{
background-image: url("image/club/premierleague/Brighton.png");
}

.Brighton.item:hover:before{
background-image: url("image/club/premierleague/Brighton.png");
}

.Southampton.item:before{
background-image: url("image/club/premierleague/Southampton.png");
}

.Southampton.item:hover:before{
background-image: url("image/club/premierleague/Southampton.png");
}

.Burnley.item:before{
background-image: url("image/club/premierleague/Burnley.png");
}

.Burnley.item:hover:before{
background-image: url("image/club/premierleague/Burnley.png");
}

.Newcastle.item:before{
background-image: url("image/club/premierleague/Newcastle.png");
}

.Newcastle.item:hover:before{
background-image: url("image/club/premierleague/Newcastle.png");
}

.Fulham.item:before{
background-image: url("image/club/premierleague/Fulham.png");
}

.Fulham.item:hover:before{
background-image: url("image/club/premierleague/Fulham.png");
}

.Westbrom.item:before{
background-image: url("image/club/premierleague/Westbrom.png");
}

.Westbrom.item:hover:before{
background-image: url("image/club/premierleague/Westbrom.png");
}

.Sheff.item:before{
background-image: url("image/club/premierleague/Sheffield.png");
}

.Sheff.item:hover:before{
background-image: url("image/club/premierleague/Sheffield.png");
}



.ATMadrid.item:before{
background-image: url("image/club/laliga/ATMadrid.png");
}

.ATMadrid.item:hover:before{
background-image: url("image/club/laliga/ATMadrid.png");
}

.RealMadrid.item:before{
background-image: url("image/club/laliga/Realmadrid.png");
}

.RealMadrid.item:hover:before{
background-image: url("image/club/laliga/Realmadrid.png");
}

.Barcelona.item:before{
background-image: url("image/club/laliga/Barcelona.png");
}

.Barcelona.item:hover:before{
background-image: url("image/club/laliga/Barcelona.png");
}

.Sevilla.item:before{
background-image: url("image/club/laliga/Sevilla.png");
}

.Sevilla.item:hover:before{
background-image: url("image/club/laliga/Sevilla.png");
}

.RealSociedad.item:before{
background-image: url("image/club/laliga/Realsociedad.png");
}

.RealSociedad.item:hover:before{
background-image: url("image/club/laliga/Realsociedad.png");
}

.Villareal.item:before{
background-image: url("image/club/laliga/Villareal.png");
}

.Villareal.item:hover:before{
background-image: url("image/club/laliga/Villareal.png");
}

.RealBetis.item:before{
background-image: url("image/club/laliga/Realbetis.png");
}

.RealBetis.item:hover:before{
background-image: url("image/club/laliga/Realbetis.png");
}

.CeltaVigo.item:before{
background-image: url("image/club/laliga/Celtavigo.png");
}

.CeltaVigo.item:hover:before{
background-image: url("image/club/laliga/Celtavigo.png");
}

.AthleticClub.item:before{
background-image: url("image/club/laliga/Athleticclub.png");
}
.AthleticClub.item:hover:before{
background-image: url("image/club/laliga/Athleticclub.png");
}

.Granada.item:before{
background-image: url("image/club/laliga/Granada.png");
}
.Granada.item:hover:before{
background-image: url("image/club/laliga/Granada.png");
}

.Cadiz.item:before{
background-image: url("image/club/laliga/Cadiz.png");
}
.Cadiz.item:hover:before{
background-image: url("image/club/laliga/Cadiz.png");
}

.Osasuna.item:before{
background-image: url("image/club/laliga/Osasuna.png");
}
.Osasuna.item:hover:before{
background-image: url("image/club/laliga/Osasuna.png");
}

.Valencia.item:before{
background-image: url("image/club/laliga/Valencia.png");
}

.Valencia.item:hover:before{
background-image: url("image/club/laliga/Valencia.png");
}

.Levante.item:before{
background-image: url("image/club/laliga/Levante.png");
}
.Levante.item:hover:before{
background-image: url("image/club/laliga/Levante.png");
}

.Getafe.item:before{
background-image: url("image/club/laliga/Getafe.png");
}
.Getafe.item:hover:before{
background-image: url("image/club/laliga/Getafe.png");
}

.Alaves.item:before{
background-image: url("image/club/laliga/Alaves.png");
}
.Alaves.item:hover:before{
background-image: url("image/club/laliga/Alaves.png");
}

.Realvalladolid.item:before{
background-image: url("image/club/laliga/Realvalladolid.png");
}
.Realvalladolid.item:hover:before{
background-image: url("image/club/laliga/Realvalladolid.png");
}

.Huesca.item:before{
background-image: url("image/club/laliga/Huesca.png");
}
.Huesca.item:hover:before{
background-image: url("image/club/laliga/Huesca.png");
}

.Elche.item:before{
background-image: url("image/club/laliga/Elche.png");
}
.Elche.item:hover:before{
background-image: url("image/club/laliga/Elche.png");
}

.Eibar.item:before{
background-image: url("image/club/laliga/Eibar.png");
}
.Eibar.item:hover:before{
background-image: url("image/club/laliga/Eibar.png");
}

.BayernMunchen.item:before{
background-image: url("image/club/bundesliga/BayernMunchen.png");
}
.BayernMunchen.item:hover:before{
background-image: url("image/club/bundesliga/BayernMunchen.png");
}

.Leipzig.item:before{
background-image: url("image/club/bundesliga/Leipzig.png");
}
.Leipzig.item:hover:before{
background-image: url("image/club/bundesliga/Leipzig.png");
}

.Wolfsburg.item:before{
background-image: url("image/club/bundesliga/Wolfsburg.png");
}
.Wolfsburg.item:hover:before{
background-image: url("image/club/bundesliga/Wolfsburg.png");
}

.Frankfurt.item:before{
background-image: url("image/club/bundesliga/Frankfurt.png");
}
.Frankfurt.item:hover:before{
background-image: url("image/club/bundesliga/Frankfurt.png");
}

.Dortmund.item:before{
background-image: url("image/club/bundesliga/Dortmund.png");
}
.Dortmund.item:hover:before{
background-image: url("image/club/bundesliga/Dortmund.png");
}

.Leverkusen.item:before{
background-image: url("image/club/bundesliga/Leverkusen.png");
}
.Leverkusen.item:hover:before{
background-image: url("image/club/bundesliga/Leverkusen.png");
}

.Monchengladbach.item:before{
background-image: url("image/club/bundesliga/Monchengladbach.png");
}
.Monchengladbach.item:hover:before{
background-image: url("image/club/bundesliga/Monchengladbach.png");
}

.UnionBerlin.item:before{
background-image: url("image/club/bundesliga/UnionBerlin.png");
}
.UnionBerlin.item:hover:before{
background-image: url("image/club/bundesliga/UnionBerlin.png");
}

.Freiburg.item:before{
background-image: url("image/club/bundesliga/Freiburg.png");
}
.Freiburg.item:hover:before{
background-image: url("image/club/bundesliga/Freiburg.png");
}

.Stuttgart.item:before{
background-image: url("image/club/bundesliga/Stuttgart.png");
}
.Stuttgart.item:hover:before{
background-image: url("image/club/bundesliga/Stuttgart.png");
}


.Hoffenheim.item:before{
background-image: url("image/club/bundesliga/Hoffenheim.png");
}
.Hoffenheim.item:hover:before{
background-image: url("image/club/bundesliga/Hoffenheim.png");
}

.Mainz.item:before{
background-image: url("image/club/bundesliga/Mainz.png");
}
.Mainz.item:hover:before{
background-image: url("image/club/bundesliga/Mainz.png");
}

.Augsburg.item:before{
background-image: url("image/club/bundesliga/Augsburg.png");
}
.Augsburg.item:hover:before{
background-image: url("image/club/bundesliga/Augsburg.png");
}

.WerderBremen.item:before{
background-image: url("image/club/bundesliga/Bremen.png");
}
.WerderBremen.item:hover:before{
background-image: url("image/club/bundesliga/Bremen.png");
}

.ArminiaBielefeld.item:before{
background-image: url("image/club/bundesliga/Bielefeld.png");
}
.ArminiaBielefeld.item:hover:before{
background-image: url("image/club/bundesliga/Bielefeld.png");
}

.Koln.item:before{
background-image: url("image/club/bundesliga/Koln.png");
}
.Koln.item:hover:before{
background-image: url("image/club/bundesliga/Koln.png");
}

.Hertha.item:before{
background-image: url("image/club/bundesliga/Hertha.png");
}
.Hertha.item:hover:before{
background-image: url("image/club/bundesliga/Hertha.png");
}

.Schalke04.item:before{
background-image: url("image/club/bundesliga/Schalke04.png");
}
.Schalke04.item:hover:before{
background-image: url("image/club/bundesliga/Schalke04.png");
}


.InterMilan.item:before{
background-image: url("image/club/serieA/InterMilan.png");
}
.InterMilan.item:hover:before{
background-image: url("image/club/serieA/InterMilan.png");
}

.Atalanta.item:before{
background-image: url("image/club/serieA/Atalanta.png");
}
.Atalanta.item:hover:before{
background-image: url("image/club/serieA/Atalanta.png");
}

.ACMilan.item:before{
background-image: url("image/club/serieA/ACMilan.png");
}
.ACMilan.item:hover:before{
background-image: url("image/club/serieA/ACMilan.png");
}

.Juventus.item:before{
background-image: url("image/club/serieA/Juventus.png");
}
.Juventus.item:hover:before{
background-image: url("image/club/serieA/Juventus2.png");
}

.Napoli.item:before{
background-image: url("image/club/serieA/Napoli.png");
}
.Napoli.item:hover:before{
background-image: url("image/club/serieA/Napoli.png");
}

.Lazio.item:before{
width:50px;
background-image: url("image/club/serieA/Lazio.png");
}
.Lazio.item:hover:before{
width:50px;
background-image: url("image/club/serieA/Lazio.png");
}

.ASRoma.item:before{
background-image: url("image/club/serieA/Roma.png");
}
.ASRoma.item:hover:before{
background-image: url("image/club/serieA/Roma.png");
}

.Sassuolo.item:before{
background-image: url("image/club/serieA/Sassuolo.png");
}
.Sassuolo.item:hover:before{
background-image: url("image/club/serieA/Sassuolo.png");
}

.Sampdoria.item:before{
background-image: url("image/club/serieA/Sampdoria.png");
}
.Sampdoria.item:hover:before{
background-image: url("image/club/serieA/Sampdoria.png");
}

.Verona.item:before{
background-image: url("image/club/serieA/Verona.png");
}
.Verona.item:hover:before{
background-image: url("image/club/serieA/Verona.png");
}

.Udinese.item:before{
background-image: url("image/club/serieA/Udinese.png");
}
.Udinese.item:hover:before{
background-image: url("image/club/serieA/Udinese.png");
}

.Bologna.item:before{
background-image: url("image/club/serieA/Bologna.png");
}
.Bologna.item:hover:before{
background-image: url("image/club/serieA/Bologna.png");
}

.Genoa.item:before{
background-image: url("image/club/serieA/Genoa.png");
}
.Genoa.item:hover:before{
background-image: url("image/club/serieA/Genoa.png");
}

.Fiorentina.item:before{
background-image: url("image/club/serieA/Fiorentina.png");
}
.Fiorentina.item:hover:before{
background-image: url("image/club/serieA/Fiorentina.png");
}

.Spezia.item:before{
background-image: url("image/club/serieA/Spezia.png");
}
.Spezia.item:hover:before{
background-image: url("image/club/serieA/Spezia.png");
}

.Torino.item:before{
background-image: url("image/club/serieA/Torino.png");
}
.Torino.item:hover:before{
background-image: url("image/club/serieA/Torino.png");
}

.Cagliari.item:before{
background-image: url("image/club/serieA/Cagliari.png");
}
.Cagliari.item:hover:before{
background-image: url("image/club/serieA/Cagliari.png");
}

.Benevento.item:before{
background-image: url("image/club/serieA/Benevento.png");
}
.Benevento.item:hover:before{
background-image: url("image/club/serieA/Benevento.png");
}

.Parma.item:before{
background-image: url("image/club/serieA/Parma.png");
}
.Parma.item:hover:before{
background-image: url("image/club/serieA/Parma.png");
}

.Crotone.item:before{
background-image: url("image/club/serieA/Crotone.png");
}
.Crotone.item:hover:before{
background-image: url("image/club/serieA/Crotone.png");
}










</style>


<body>



<h1>

<div class = "main" id="expertise" align = "center" >
	<div class = "PremierLeague" align="center">
		<div style = "width : 680px; height : 80px; font-size:50px; color:#F3F3F3; background-color: rgba( 189, 189, 189, 0.3 );">SELECT TEAM</div>
		
		<div class="ManCity item" id ="ManCity" onclick="ManCity_input()">Manchester City</div>
		<div class="ManUtd item" id ="ManUtd" onclick="ManUtd_input()">Manchester United</div>
		<div class="Leicester item" id = "Leicester" onclick="Leicester_input()">Leicester City</div>
		<div class="Chelsea item" id ="Chelsea" onclick="Chelsea_input()">Chelsea FC</div>
		<div class="Westham item" id ="Westham" onclick="Westham_input()">Westham United</div>
		
		<div class="Tottenham item" id ="Tottenham" onclick="Tottenham_input()">Tottenham Hotspur</div>
		<div class="Liverpool item" id ="Liverpool" onclick="Liverpool_input()">Liverpool FC</div>
		<div class="Everton item" id ="Everton" onclick="Everton_input()">Everton FC</div>
		<div class="Arsenal item" id ="Arsenal" onclick="Arsenal_input()">Arsenal</div>
		<div class="Aston item" id ="Aston" onclick="Aston_input()">Aston Villa</div>
		
		<div class="Leeds item" id ="Leeds" onclick="Leeds_input()">Leeds United</div>
		<div class="Wolves item" id ="Wolves" onclick="Wolves_input()">Wolverhampton Wanderers</div>
		<div class="Crystal item" id ="Crystal" onclick="Crystal_input()">Crystal Palace</div>
		<div class="Brighton item" id ="Brighton" onclick="Brighton_input()">Brighton & Hove Albion</div>
		<div class="Southampton item" id ="Southampton" onclick="Southampton_input()">Southampton</div>
		
		<div class="Burnley item" id ="Burnley" onclick="Burnley_input()">Burnley</div>
		<div class="Newcastle item" id ="Newcastle" onclick="Newcastle_input()">Newcastle United</div>
		<div class="Fulham item" id ="Fulham" onclick="Fulham_input()">Fulham</div>
		<div class="Westbrom item" id ="Westbrom" onclick="Westbrom_input()">West Bromwich Albion</div>
		<div class="Sheff item" id ="Sheff" onclick="Sheff_input()">Sheffield United</div>
		
	</div>

	<div class = "Laliga" align = "center" >
		<div style = "width : 680px; height : 80px; font-size:50px; color:#F3F3F3; background-color: rgba( 189, 189, 189, 0.3 );">SELECT TEAM</div>
		
		<div class="ATMadrid item" id ="ATMadrid" onclick="ATMadrid_input()">Atletico Madrid</div>
		<div class="RealMadrid item" id ="RealMadrid" onclick="Realmadrid_input()">Real Madrid</div>
		<div class="Barcelona item" id = "Barcelona" onclick="Barcelona_input()">FC Barcelona</div>
		<div class="Sevilla item" id ="Sevilla" onclick="Sevilla_input()">Sevilla</div>
		<div class="RealSociedad item" id ="RealSociedad" onclick="Realsociedad_input()">Real Sociedad</div>
		
		<div class="Villareal item" id ="Villareal" onclick="Villareal_input()">Villareal</div>
		<div class="RealBetis item" id ="RealBetis" onclick="Realbetis_input()">Real Betis</div>
		<div class="CeltaVigo item" id ="CeltaVigo" onclick="Celtavigo_input()">Celta Vigo</div>
		<div class="AthleticClub item" id ="AthleticClub" onclick="Athleticclub_input()">Athletic Club</div>
		<div class="Granada item" id ="Granada" onclick="Granada_input()">Granada</div>
		
		<div class="Cadiz item" id ="Cadiz" onclick="Cadiz_input()">Cadiz</div>
		<div class="Osasuna item" id ="Osasuna" onclick="Osasuna_input()">Osasuna</div>
		<div class="Valencia item" id ="Valencia" onclick="Valencia_input()">Valencia CF</div>
		<div class="Levante item" id ="Levante" onclick="Levante_input()">Levante</div>
		<div class="Getafe item" id ="Getafe" onclick="Getafe_input()">Getafe</div>
		
		<div class="Alaves item" id ="Alaves" onclick="Alaves_input()">Deportivo Alaves</div>
		<div class="Realvalladolid item" id ="Realvalladolid" onclick="Realvalladolid_input()">Real Valladolid</div>
		<div class="Huesca item" id ="Huesca" onclick="Huesca_input()">SD Huesca</div>
		<div class="Elche item" id ="Elche" onclick="Elche_input()">Elche</div>
		<div class="Eibar item" id ="Eibar" onclick="Eibar_input()">Eibar</div>
		
		
	</div>

	<div class = "Bundesliga" align = "center" >
		<div style = "width : 680px; height : 80px; font-size:50px; color:#F3F3F3; background-color: rgba( 189, 189, 189, 0.3 );">SELECT TEAM</div>
		
		<div class="BayernMunchen item" id ="BayernMunchen" onclick="BayernMunchen_input()">Bayern Munchen</div>
		<div class="Leipzig item" id ="Leipzig" onclick="Leipzig_input()">RB Leipzig</div>
		<div class="Wolfsburg item" id = "Wolfsburg" onclick="Wolfsburg_input()">VfL Wolfsburg</div>
		<div class="Frankfurt item" id ="Frankfurt" onclick="Frankfurt_input()">Eintracht Frankfurt</div>
		<div class="Dortmund item" id ="Dortmund" onclick="Dortmund_input()">Borussia Dortmund</div>
		
		<div class="Leverkusen item" id ="Leverkusen" onclick="Leverkusen_input()">Bayer 04 Leverkusen</div>
		<div class="Monchengladbach item" id ="Monchengladbach" onclick="Monchengladbach_input()">Borussia Monchengladbach</div>
		<div class="UnionBerlin item" id ="UnionBerlin" onclick="UnionBerlin_input()">1. FC Union Berlin</div>
		<div class="Freiburg item" id ="Freiburg" onclick="Freiburg_input()">SC Freiburg</div>
		<div class="Stuttgart item" id ="Stuttgart" onclick="Stuttgart_input()">VfB Stuttgart</div>
		
		<div class="Hoffenheim item" id ="Hoffenheim" onclick="Hoffenheim_input()">TSG 1899 Hoffenheim</div>
		<div class="Mainz item" id ="Mainz" onclick="Mainz_input()">1. FSV Mainz 05</div>
		<div class="Augsburg item" id ="Augsburg" onclick="Augsburg_input()">FC Augsburg</div>
		<div class="WerderBremen item" id ="WerderBremen" onclick="WerderBremen_input()">SV Werder Bremen</div>
		<div class="ArminiaBielefeld item" id ="ArminiaBielefeld" onclick="ArminiaBielefeld_input()">DSC Arminia Bielefeld</div>
		
		<div class="Koln item" id ="Koln" onclick="Koln_input()">1. FC Koln</div>
		<div class="Hertha item" id ="Hertha" onclick="Hertha_input()">Hertha BSC</div>
		<div class="Schalke04 item" id ="Schalke04" onclick="Schalke04_input()">SD Huesca</div>
		
	</div>

	<div class = "SerieA" align = "center" >
		<div style = "width : 680px; height : 80px; font-size:50px; color:#F3F3F3; background-color: rgba( 189, 189, 189, 0.3 );">SELECT TEAM</div>
		
		<div class="InterMilan item" id ="InterMilan" onclick="InterMilan_input()">F.C. Internazionale Milano</div>
		<div class="Atalanta item" id ="Atalanta" onclick="Atalanta_input()">Atalanta B.C.</div>
		<div class="ACMilan item" id = "ACMilan" onclick="ACMilana_input()">A.C. Milan</div>
		<div class="Juventus item" id ="Juventus" onclick="Juventus_input()">Juventus F.C</div>
		<div class="Napoli item" id ="Napoli" onclick="Napoli_input()">S.S.C. Napoli</div>
		
		<div class="Lazio item" id ="Lazio" onclick="Lazio_input()">S.S. Lazio</div>
		<div class="ASRoma item" id ="ASRoma" onclick="ASRoma_input()">A.S. Roma</div>
		<div class="Sassuolo item" id ="Sassuolo" onclick="Sassuolo_input()">U.S. Sassuolo Calcio</div>
		<div class="Sampdoria item" id ="Sampdoria" onclick="Sampdoriainput()">U.C. Sampdoria</div>
		<div class="Verona item" id ="Verona" onclick="Verona_input()">Hellas Verona F.C.</div>
		
		<div class="Udinese item" id ="Udinese" onclick="Udinese_input()">Udinese Calcio</div>
		<div class="Bologna item" id ="Bologna" onclick="Bologna_input()">Bologna F.C. 1909</div>
		<div class="Genoa item" id ="Genoa" onclick="Genoa_input()">Genoa C.F.C.</div>
		<div class="Fiorentina item" id ="Fiorentina" onclick="Fiorentina_input()">ACF Fiorentina</div>
		<div class="Spezia item" id ="Spezia" onclick="Spezia_input()">Spezia Calcio</div>
		
		<div class="Torino item" id ="Torino" onclick="Torino_input()">Torino F.C.</div>
		<div class="Cagliari item" id ="Cagliari" onclick="Cagliari_input()">Cagliari Calcio</div>
		<div class="Benevento item" id ="Benevento" onclick="Benevento_input()">Benevento Calcio</div>
		<div class="Parma item" id ="Parma" onclick="Parma_input()">Parma Calcio 1913</div>
		<div class="Crotone item" id ="Crotone" onclick="Crotone_input()">F.C. Crotone</div>
	</div>
	<div>
		<form action="3_1_TeamInfo.jsp" method="post">
			<input type="hidden" id="chooseClub" name="chooseClub" value="Liverpool">
			<input type="submit" class="agree item" onclick="agree_Text()" value="완료" style="width:120px; height:50px;font-family:'UEFASupercup-Bold',sans-serif;font-weight: 100;font-size:12px;">
		</form>
	</div>
</div>
</h1>





</body>
</html>