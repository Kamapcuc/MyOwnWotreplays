package ru.kamapcuc.myownwotreplays.parser;

import org.elasticsearch.common.base.Joiner;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.search.Config;
import ru.kamapcuc.myownwotreplays.search.TypesMeta;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReplaysParser {

    private long version = 0;
    private final Map startInfo;
    private final List endInfo;
    private Map<String, Map<String, Object>> players;
    private Map<String, Object> document = new HashMap<>();
    private final static Map<String, Doc> tanksData = TypesMeta.REPOSITORIES.get(Config.TANK_TYPE_NAME);

    private final static Joiner JOINER = Joiner.on(".").skipNulls();
    private final static SimpleDateFormat DATE_PARSER = new SimpleDateFormat("dd.MM.yyyy kk:mm:ss");

    public ReplaysParser(Map startInfo, List endInfo) {
        parseVersion(startInfo.get("clientVersionFromExe").toString());
        this.startInfo = startInfo;
        this.endInfo = endInfo;
    }

    private void parseVersion(String clientVersion) {
        String[] digits = clientVersion.split("(,| )+");
        document.put("version", JOINER.join(digits));
        for (int i = 0; i < digits.length; i++) {
            try {
                version += Integer.valueOf(digits[i]) * Math.pow(100, 3 - i);
            } catch (NumberFormatException e) {
                System.out.println(String.format("Failed to parse client version \"%s\"", clientVersion));
            }
        }
    }

    public Map<String, Object> buildDoc() {
        parseStartInfo();
        if (endInfo != null) {
            document.put("haveResults", true);
            parseEndInfo();
        } else
            document.put("haveResults", false);
        return document;
    }

    private static String getTankId(Object obj) {
        String str = (String) obj;
        return str.substring(str.indexOf(':') + 1);
    }

    private void parseTeams() {
        List<Map<String, Object>> team1 = new ArrayList<>();
        List<Map<String, Object>> team2 = new ArrayList<>();
        Integer playerTeam = 1;
        Object playerName = document.get("playerName");
        for (Map<String, Object> currentPlayerData : players.values()) {
            Map<String, Object> currentPlayer = new HashMap<>();
            currentPlayer.put("isAlive", currentPlayerData.get("isAlive"));
            currentPlayer.put("name", currentPlayerData.get("name"));
            currentPlayer.put("clanAbbrev", currentPlayerData.get("clanAbbrev"));
            currentPlayer.put("isTeamKiller", currentPlayerData.get("isTeamKiller"));
            currentPlayer.put("tank", getTankId(currentPlayerData.get("vehicleType")));
            Integer currentPlayerTeam = (Integer) currentPlayerData.get("team");
            if (currentPlayerTeam.equals(1)) {
                team1.add(currentPlayer);
            } else
                team2.add(currentPlayer);
            if (playerName.equals(currentPlayer.get("name")))
                playerTeam = currentPlayerTeam;
        }
        document.put("respawn", playerTeam);
        if (playerTeam.equals(1)) {
            document.put("allies", team1);
            document.put("enemies", team2);
        } else {
            document.put("allies", team2);
            document.put("enemies", team1);
        }
    }

    private void parseStartInfo() {
        String battleDate = startInfo.get("dateTime").toString();
        document.put("date", parseDate(battleDate));
        document.put("playerName", startInfo.get("playerName"));
        document.put("map", startInfo.get("mapName"));
        String tankInfo = (String) startInfo.get("playerVehicle");
        String tankId = tankInfo.substring(tankInfo.indexOf('-') + 1);
        players = (Map) startInfo.get("vehicles");
        addTankSearchInfo(tankId);
        parseTeams();
    }

    private void addTankSearchInfo(String tankId) {
        document.put("tank", tankId);
        Doc tank = tanksData.get(tankId);
        if (tank != null) {
            document.put("tankLevel", tank.getStraight("level"));
            document.put("tankNation", tank.getStraight("nation"));
            document.put("tankClass", tank.getStraight("class"));
        } else
            System.out.println(String.format("Don't found tank with id=\"%s\"", tankId));
    }

    private void parseEndInfo() {
        Map personalResults = (Map) endInfo.get(0);
        if (version >= 9_00_00) {
            Map personal = (Map) personalResults.get("personal");
            parsePersonal(personal);
        } else
            parsePersonal(personalResults);
    }

    private void parsePersonal(Map personalResults) {
        Integer credits = (Integer) personalResults.get("credits");
        Integer xp = (Integer) personalResults.get("xp");
        document.put("credits", credits);
        document.put("xp", xp);
        if (version > 8_11_00) {
            Integer originalCredits = (Integer) personalResults.get("originalCredits");
            Integer originalXP = (Integer) personalResults.get("originalXP");
            document.put("originalCredits", originalCredits);
            document.put("originalXP", originalXP);
        } else if (version != 8_11_00) {
            document.put("originalCredits", (int) (credits / 1.5));
            document.put("originalXP", (int) (xp / 1.5));
        }
        document.put("damageBlockedByArmor", personalResults.get("damageBlockedByArmor"));
        document.put("damageAssistedRadio", personalResults.get("damageAssistedRadio"));
        document.put("damageDealt", personalResults.get("damageDealt"));
        document.put("kills", personalResults.get("kills"));
    }

    private Date parseDate(String date) {
        try {
            return DATE_PARSER.parse(date);
        } catch (ParseException e) {
            return null;
        }
    }

}
