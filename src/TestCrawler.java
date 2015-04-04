import java.io.*;
import java.util.*;
import java.sql.*;
import com.gargoylesoftware.htmlunit.*;
import com.gargoylesoftware.htmlunit.html.*;
import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import org.jsoup.select.Elements;

class TestCrawler{

    private static java.sql.Connection cn;
    private static Statement s;
    private static PreparedStatement ps;

    public static void main (String[] args) {
        getDatabaseConnection();
        ArrayList<String> leaguesID = getLeaguesWithDailyActivity();
        processDailyMatches(leaguesID);
        System.out.println("Llego acá");
        //getTopScorers();
        //getResults();
        //extractLeaguesID();
    }

    public static void getPartsMatchFact(String fact, String condition, String team, long lastInsertedMatch){
        String[] subPartsFact = fact.split(" ");
        String[] minutesAndExtra;
        String playerName = "";
        int ownGoalFlag = 0;
        int penaltyGoalFlag = 0;
        PreparedStatement ps;
        int minute = 0;
        int position = 0;
        for(int i = 0; i<subPartsFact.length; i++){
            if(subPartsFact[i].matches(".*\\d+.*")){
                subPartsFact[i] = subPartsFact[i].replace("'", "");
                if(subPartsFact[i].contains("+")){
                    minutesAndExtra = subPartsFact[i].split("\\+");
                    minute = Integer.parseInt(minutesAndExtra[0].trim()) + Integer.parseInt(minutesAndExtra[1].trim());
                }
                else{
                    minute = Integer.parseInt(subPartsFact[i].replace("'", "").trim());
                }
                if(condition.equalsIgnoreCase("Local")){
                    position = i + 3;
                    break;
                }
            }
            else{
                if(condition.equalsIgnoreCase("Away") && subPartsFact[i].contains("(") && !subPartsFact[i].equalsIgnoreCase("(OG)")){
                    position = i + 2;
                    break;
                }
                if(subPartsFact[i].equalsIgnoreCase("(OG)")){
                    ownGoalFlag = 1;
                }
                else{
                    if(subPartsFact[i].equalsIgnoreCase("(PG)")) {
                        penaltyGoalFlag = 1;
                    }
                    else{
                        playerName += " " + subPartsFact[i].trim();
                    }
                }
            }
        }
        try{
            ps = cn.prepareStatement("INSERT INTO footballCrawler.goalEvent (minute, player, goalEvent.condition, team, ownGoalFlag, penaltyGoalFlag, playerAssist, idMatch) VALUES (?,?,?,?,?,?,?,?)");
            ps.setInt(1, minute);
            ps.setString(2, playerName.trim());
            ps.setString(3, condition);
            ps.setString(4, team.trim());
            ps.setInt(5, ownGoalFlag);
            ps.setInt(6, penaltyGoalFlag);
            if(fact.contains("Asistencia")){
                playerName = "";
                for(int i = position; i<subPartsFact.length; i++){
                    playerName += " " + subPartsFact[i].replace(")", "").trim();
                }
                ps.setString(7, playerName.trim());
            }
            else{
                ps.setNull(7, Types.NULL);
            }
            ps.setLong(8, lastInsertedMatch);
            ps.executeUpdate();
        }
        catch (Exception e){
            System.out.println("Error en GoalEvent: " + e);
        }
    }

    public static ArrayList<String> getLeaguesWithDailyActivity(){
        Document doc;
        Document docGame;
        ArrayList<String> leaguesDatabase = new ArrayList<String>();
        ArrayList<String> validLeagues = new ArrayList<String>();
        WebClient webClient = new WebClient(BrowserVersion.FIREFOX_24);
        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(java.util.logging.Level.OFF);
        webClient.getOptions().setJavaScriptEnabled(true);
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setUseInsecureSSL(true);
        webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
        webClient.getCookieManager().setCookiesEnabled(true);
        webClient.setAjaxController(new NicelyResynchronizingAjaxController());
        webClient.getOptions().setThrowExceptionOnScriptError(false);
        webClient.getCookieManager().setCookiesEnabled(true);
        String query;
        try {
            query = "SELECT idLeague FROM League";
            ResultSet rs = s.executeQuery(query);
            while (rs.next()) {
                try{
                    leaguesDatabase.add(rs.getString("idLeague"));
                }
                catch(Exception err){
                    System.out.println("ERROR: From database: " + err);
                }
            }
            //closeDatabaseConnection();
        }
        catch (SQLException e) {
            //closeDatabaseConnection();
            System.out.println("Error: " +e);
        }
        try {
            HtmlPage page = webClient.getPage("http://el.soccerway.com/matches/2015/04/04/");
            String mainPage = page.asXml();
            doc = Jsoup.parse(mainPage);
            Element tableMatches = doc.select("table.matches.date_matches.grouped").first();
            Iterator<Element> ite = tableMatches.select("tr").iterator();
            Element nodeMatch;
            while(ite.hasNext()){
                nodeMatch = ite.next();
                if(nodeMatch.attr("id").startsWith("date_matches")){
                    String[] subPartsLeague = nodeMatch.attr("id").split("-");
                    if(leaguesDatabase.contains(subPartsLeague[1])){
                        validLeagues.add(subPartsLeague[1]);
                    }
                }
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return validLeagues;
    }

    public static void processDailyMatches(ArrayList<String> leaguesID){
        Document doc;
        String url;
        String result = "";
        UnexpectedPage page;
        WebResponse response;
        JsonElement jelement;
        JsonObject  jobject;
        JsonArray jarray;
        Elements tableMatches;
        Iterator<Element> ite;
        Element nodeMatch;
        String localTeam = "";
        String awayTeam = "";
        String matchDirectory = "";
        String resultMatch = "";
        String query = "";
        String[] subPartsResultMatch;
        int count = 1;
        long lastInsertedMatch = 0;
        WebClient webClient = new WebClient(BrowserVersion.FIREFOX_24);
        java.util.logging.Logger.getLogger("com.gargoylesoftware").setLevel(java.util.logging.Level.OFF);
        webClient.getOptions().setTimeout(20*1000);
        webClient.getOptions().setJavaScriptEnabled(true);
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setUseInsecureSSL(true);
        webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
        webClient.getCookieManager().setCookiesEnabled(true);
        webClient.setAjaxController(new NicelyResynchronizingAjaxController());
        webClient.getOptions().setThrowExceptionOnScriptError(false);
        webClient.getCookieManager().setCookiesEnabled(true);
        for(String idLeague : leaguesID) {
            try {
                //System.out.println(idLeague);
                url = "http://el.soccerway.com/a/block_date_matches?block_id=page_matches_1_block_date_matches_1&callback_params=%7B%22bookmaker_urls%22%3A%7B%2213%22%3A%5B%7B%22link%22%3A%22http%3A%2F%2Fwww.bet365.com%2Fhome%2F%3Faffiliate%3D365_308136%22%2C%22name%22%3A%22Bet%20365%22%7D%5D%7D%2C%22block_service_id%22%3A%22matches_index_block_datematches%22%2C%22date%22%3A%222015-04-04%22%2C%22stage-value%22%3A%2239%22%7D&action=showMatches&params=%7B%22competition_id%22%3A" + idLeague + "%7D";
                result = java.net.URLDecoder.decode(url, "UTF-8");
            }
            catch (UnsupportedEncodingException e) {
                System.out.println("Error la procesar URL de torneo: " + e);
            }
            try {
                page = webClient.getPage(result);
                response = page.getWebResponse();
                jelement = new JsonParser().parse(response.getContentAsString());
                jobject = jelement.getAsJsonObject();
                jarray = jobject.getAsJsonArray("commands");
                doc = Jsoup.parse(jarray.get(0).getAsJsonObject().get("parameters").getAsJsonObject().get("content").getAsString().trim());
                tableMatches = doc.select("a");
                ite = tableMatches.iterator();
                while (ite.hasNext()) {
                    nodeMatch = ite.next();
                    if (nodeMatch.attr("title").equalsIgnoreCase("Más información") || nodeMatch.attr("title").equalsIgnoreCase("Ver eventos")) {
                        count = 1;
                        continue;
                    }
                    if (count == 1) { //local team
                        if(nodeMatch.attr("title").equalsIgnoreCase("")){
                            continue;
                        }
                        localTeam = nodeMatch.attr("title");
                        count++;
                    } else {
                        if (count == 2) { //match result
                            resultMatch = nodeMatch.text();
                            matchDirectory = nodeMatch.attr("href");
                            count++;
                        } else {
                            if(resultMatch.matches("[0-9] - [0-9]")){
                                awayTeam = nodeMatch.attr("title");
                                subPartsResultMatch = resultMatch.split("-");
                                ps = cn.prepareStatement("INSERT INTO footballCrawler.match (date, localTeam, awayTeam, idLeague, localGoals, awayGoals) VALUES (?,?,?,?,?,?)");
                                ps.setString(1, "2014-12-01");
                                ps.setString(2, localTeam.trim());
                                ps.setString(3, awayTeam.trim());
                                ps.setString(4, idLeague);
                                ps.setInt(5, Integer.parseInt(subPartsResultMatch[0].trim()));
                                ps.setInt(6, Integer.parseInt(subPartsResultMatch[1].trim()));
                                ps.executeUpdate();
                                if (!resultMatch.equalsIgnoreCase("0 - 0")) {
                                    ResultSet generatedKeys = ps.getGeneratedKeys();
                                    if (generatedKeys.next()) {
                                        lastInsertedMatch = generatedKeys.getLong(1);
                                    }
                                    else {
                                        throw new SQLException("Creating match failed, no ID obtained.");
                                    }
                                    getMatchFacts(matchDirectory, localTeam, awayTeam, lastInsertedMatch);
                                } else {
                                    //System.out.println("Fue empate a ceros");
                                }
                            }
                            else{
                                count = 1;
                                continue;
                            }
                        }
                    }
                }
            } catch (Exception e) {
                System.out.println("Error en processDailyMatches: " + e);
            }
            localTeam = "";
            awayTeam = "";
            matchDirectory = "";
            resultMatch = "";
        }
    }

    public static void getDatabaseConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost/footballcrawler?useUnicode=true&characterEncoding=utf8", "root", "");
            s = cn.createStatement();
        } catch (Exception err) {
            System.out.println("ERROR: Connection unsuccesful" + err);
        }
    }

    public static void closeDatabaseConnection() {
        try {
            s.close();
            cn.close();
        } catch (Exception err) {
            System.out.println("ERROR in closing connection: " + err);
        }
    }

    public static void extractLeaguesID() {
        Document doc = null;
        String query;
        try {
            query = "SELECT nombreLiga, country, link FROM tempLeague";
            ResultSet rs = s.executeQuery(query);
            while (rs.next()) {
                try{
                    doc = Jsoup.connect(rs.getString("link")).get();
                    Element tableRow = doc.select("tr.even.expanded.match.no-date-repetition").first();
                    System.out.println(rs.getString("country") + "," + rs.getString("nombreLiga") + "," + rs.getString("link") + "," + tableRow.attr("data-competition"));
                    //ite.next();
                }
                catch(Exception err){
                    System.out.println("ERROR: From jsoup" + err);
                }
            }
        }
        catch (SQLException e) {
            closeDatabaseConnection();
            System.out.println("Error: " +e);
        }
        closeDatabaseConnection();
    }

    public static void getTopScorers(){
        Document doc = null;
        try {
            doc = Jsoup.connect("http://el.soccerway.com/national/brazil/serie-a/2014/regular-season/r24110/?ICID=TN_02_01_10").get();
            Element table = doc.select("table[class=playerstats table]").first();
            Iterator<Element> ite = table.select("tr").iterator();
            ite.next();
            Element nodePlayer;
            while(ite.hasNext()){
                System.out.println ();
                nodePlayer = ite.next();
                System.out.println("Player: " + nodePlayer.child(0).text());
                System.out.println("Team: " + nodePlayer.child(1).text());
                System.out.println("Goals: " + nodePlayer.child(2).text());
                System.out.println("Penalties: " + nodePlayer.child(3).text());
                String[] partsCountry = nodePlayer.child(0).child(0).attr("class").split(" ");
                String[] subPartsCountry = partsCountry[2].split("_");
                System.out.println("Country: " + subPartsCountry[0].substring(0,1).toUpperCase() + subPartsCountry[0].substring(1).toLowerCase());
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void getResults(){
        Document doc;
        Document docGame;
        try {
            doc = Jsoup.connect("http://el.soccerway.com/national/austria/bundesliga/20142015/regular-season/r25271/").get();
            Element table = doc.select("table.matches").first();
            Iterator<Element> ite = table.select("tr").iterator();
            ite.next();
            Element nodeMatch;
            while(ite.hasNext()){
                System.out.println ();
                nodeMatch = ite.next();
                System.out.println("Date: " + nodeMatch.child(1).text());
                System.out.println("Local: " + nodeMatch.child(2).text());
                System.out.println("Result: " + nodeMatch.child(3).text());
                String[] partsResult = nodeMatch.child(3).text().split("-");
                for (int i = 0; i<partsResult.length; i++){
                    System.out.println(i + ":" + partsResult[i].trim());
                }
                System.out.println("Visitor: " + nodeMatch.child(4).text());
                String gameURL = "http://el.soccerway.com/" + nodeMatch.child(3).child(0).attr("href");
                docGame = Jsoup.connect(gameURL).get();
                Element tableGoals = docGame.select("table.matches.events").first();
                if(tableGoals != null) {
                    Iterator<Element> iteGoal = tableGoals.select("tr").iterator();
                    Element nodeGoal;
                    while (iteGoal.hasNext()) {
                        nodeGoal = iteGoal.next();
                        if (!nodeGoal.child(0).text().equalsIgnoreCase("")) {
                            System.out.println("Goal: " + nodeGoal.child(0).text());
                        } else {
                            System.out.println("Goal: " + nodeGoal.child(2).text());
                        }
                    }
                }
                else{
                    System.out.println("No hay información disponible para el partido");
                }
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void getMatchFacts(String matchDirectory, String localTeam, String awayTeam, long matchID) {
        Document docGame;
        try {
            String gameURL = "http://el.soccerway.com/" + matchDirectory;
            docGame = Jsoup.connect(gameURL).get();
            Element tableGoals = docGame.select("table.matches.events").first();
            if (tableGoals != null) {
                Iterator<Element> iteGoal = tableGoals.select("tr").iterator();
                Element nodeGoal;
                while (iteGoal.hasNext()) {
                    nodeGoal = iteGoal.next();
                    if (!nodeGoal.child(0).text().equalsIgnoreCase("")) {
                        getPartsMatchFact(nodeGoal.child(0).text(), "Local", localTeam, matchID);
                    }
                    else {
                        getPartsMatchFact(nodeGoal.child(2).text(), "Away", awayTeam, matchID);
                    }
                }
            }
            else {
                System.out.println("No hay información disponible para el partido");
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}