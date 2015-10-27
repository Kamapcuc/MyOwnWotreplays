package ru.kamapcuc.myownwotreplays.parser;

import org.elasticsearch.common.base.Joiner;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.TypesMeta;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReplaysParser {

    private final long version;
    private final Map startInfo;
    private final List endInfo;

    Integer playerTeam = 1;
    private String playerName;
    private Map<String, Map<String, Object>> players = new HashMap<>();
    private Map<String, Object> document = new HashMap<>();
    private final static Map<String, Doc> tanksData = TypesMeta.REPOSITORIES.get(Config.TANK_TYPE_NAME);
    private final static Map<String, Doc> medals_rep = TypesMeta.REPOSITORIES.get(Config.MEDAL_TYPE_NAME);

    private final static Joiner JOINER = Joiner.on(".").skipNulls();
    private final static SimpleDateFormat DATE_PARSER = new SimpleDateFormat("dd.MM.yyyy kk:mm:ss");

    public ReplaysParser(Map startInfo, List endInfo) {
        this.version = parseVersion(startInfo.get("clientVersionFromExe").toString());
        this.startInfo = startInfo;
        this.endInfo = endInfo;
    }

    private int parseVersion(String clientVersion) {
        int result = 0;
        String[] digits = clientVersion.split("(,| |\\.)+");
        document.put("version", JOINER.join(digits));
        for (int i = 0; i < digits.length; i++) {
            try {
                result += Integer.valueOf(digits[i]) * Math.pow(100, 3 - i);
            } catch (NumberFormatException e) {
                throw new RuntimeException(String.format("Failed to parse client version \"%s\"", clientVersion), e);
            }
        }
        return result;
    }

    public Map<String, Object> buildDoc() {
        parseStartInfo();
        if (endInfo != null) {
            document.put("haveResults", true);
            parseEndInfo();
        } else
            document.put("haveResults", false);
        buildTeams();
        return document;
    }

    private static String getTankId(Object obj) {
        String str = (String) obj;
        return str.substring(str.indexOf(':') + 1);
    }

    private void parsePlayers() {
        Map<String, Map<String, Object>> players = (Map) startInfo.get("vehicles");
        for (Map.Entry<String, Map<String, Object>> playerEntry : players.entrySet()) {
            Map<String, Object> currentPlayerData = playerEntry.getValue();
            Map<String, Object> currentPlayer = new HashMap<>();
            currentPlayer.put("name", currentPlayerData.get("name"));
            currentPlayer.put("clanAbbrev", currentPlayerData.get("clanAbbrev"));
            currentPlayer.put("team", currentPlayerData.get("team"));
            currentPlayer.put("tank", getTankId(currentPlayerData.get("vehicleType")));
            Integer currentPlayerTeam = (Integer) currentPlayerData.get("team");
            if (playerName.equals(currentPlayer.get("name")))
                playerTeam = currentPlayerTeam;
            this.players.put(playerEntry.getKey(), currentPlayer);
        }
    }

    private void buildTeams() {
        List<Map<String, Object>> allies = new ArrayList<>();
        List<Map<String, Object>> enemies = new ArrayList<>();
        for (Map<String, Object> currentPlayer : players.values()) {
            Integer currentPlayerTeam = (Integer) currentPlayer.get("team");
            currentPlayer.remove("team");
            if (currentPlayerTeam.equals(playerTeam))
                allies.add(currentPlayer);
            else
                enemies.add(currentPlayer);
        }
        document.put("respawn", playerTeam);
        document.put("allies", allies);
        document.put("enemies", enemies);
    }

    private void parseStartInfo() {
        String battleDate = startInfo.get("dateTime").toString();
        playerName = (String) startInfo.get("playerName");
        document.put("playerName", playerName);
        document.put("battleDate", parseDate(battleDate));
        document.put("map", startInfo.get("mapName"));
        String tankInfo = (String) startInfo.get("playerVehicle");
        String tankId = tankInfo.substring(tankInfo.indexOf('-') + 1);
        document.put("tank", tankId);
        addTankSearchInfo(tankId);
        parsePlayers();
    }

    private void addTankSearchInfo(String tankId) {
        Doc tank = tanksData.get(tankId);
        if (tank != null) {
            document.put("tankLevel", tank.get("level"));
            document.put("tankNation", tank.get("nation"));
            document.put("tankClass", tank.get("class"));
        } else
            System.out.println(String.format("Don't found tank with id=\"%s\"", tankId));
    }

    private void parseEndInfo() {
        Map personalResults = (Map) endInfo.get(0);
        if (version >= 9_00_00) {
            Map personal = (Map) personalResults.get("personal");
            parsePersonal(personal);
            Map common = (Map) personalResults.get("common");
            parseCommon(common);
        } else
            parsePersonal(personalResults);
    }

    private void parseCommon(Map commonResults) {
        Integer winnerTeam = (Integer) commonResults.get("winnerTeam");
        String result = "draw";
        if (winnerTeam != 0)
            result = (playerTeam.equals(winnerTeam)) ? "win" : "lose";
        document.put("result", result);
        Integer finishReason = (Integer) commonResults.get("winnerTeam");
        String finishReasonName;
        switch (finishReason) {
            case 1:
                finishReasonName = "kill";
                break;
            case 2:
            case 0:
                finishReasonName = "capture";
                break;
            case 3:
                finishReasonName = "time";
                break;
            default:
                throw new RuntimeException("unknown finishReason");
        }
        document.put("finishReason", finishReasonName);
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
        }
//        else if (version != 8_11_00) {
//            document.put("originalCredits", (int) (credits / 1.5));
//            document.put("originalXP", (int) (xp / 1.5));
//        }
        document.put("damageBlockedByArmor", personalResults.get("damageBlockedByArmor"));
        document.put("damageAssistedRadio", personalResults.get("damageAssistedRadio"));
        document.put("damageDealt", personalResults.get("damageDealt"));
        document.put("kills", personalResults.get("kills"));
        parseMedals(personalResults);
        parseBattleEfficiency(personalResults);
    }

    private void parseMedals(Map personalResults) {
        List<String> medals = new ArrayList<>();
        Integer markOfMastery = (Integer) personalResults.get("markOfMastery");
        if (markOfMastery != null && markOfMastery != 0)
            medals.add(String.valueOf(markOfMastery));
//        List<List<Integer>> dossierPopUps = (List<List<Integer>>) personalResults.get("dossierPopUps");
//        if (dossierPopUps != null)
//            for (List<Integer> memorySignPop : dossierPopUps) {
//                String memorySign = String.valueOf(memorySignPop.get(0));
//                if (medals_rep.containsKey(memorySign))
//                    medals.add(memorySign);
//            }
        List<Integer> achievements = (List<Integer>) personalResults.get("achievements");
        if (achievements != null)
            for (Integer achievement : achievements)
                medals.add(String.valueOf(achievement));
        document.put("medals", medals);
    }

    private void parseBattleEfficiency(Map personalResults) {
        List<Map<String, Object>> battleEfficiency = new ArrayList<>();
        Map<String, Map<String, Object>> details = (Map) personalResults.get("details");
        if (details != null)
            for (Map.Entry<String, Map<String, Object>> playerWounds : details.entrySet()) {
                Map<String, Object> detailsInfo = new HashMap<>();
                Map<String, Object> playerInfo = players.get(playerWounds.getKey());
                detailsInfo.put("name", playerInfo.get("name"));
                detailsInfo.put("clanAbbrev", playerInfo.get("clanAbbrev"));
                detailsInfo.put("tank", playerInfo.get("tank"));
                detailsInfo.putAll(playerWounds.getValue());
                detailsInfo.put("crits", parseCrits((Integer) detailsInfo.get("crits")));
                battleEfficiency.add(detailsInfo);
            }
        document.put("battleEfficiency", battleEfficiency);
    }

    private Date parseDate(String date) {
        try {
            return DATE_PARSER.parse(date);
        } catch (ParseException e) {
            return null;
        }
    }

    private Integer parseCrits(Integer crits) {
        int res = 0;
        int tmp = crits;
        while (tmp != 0) {
            if ((tmp & 1) > 0)
                res++;
            tmp = tmp >> 1;
        }
        return res;
    }

}
