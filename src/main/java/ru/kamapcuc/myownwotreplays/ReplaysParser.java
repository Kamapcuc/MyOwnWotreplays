package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.common.base.Joiner;
import ru.kamapcuc.myownwotreplays.search.Config;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.search.TypesMeta;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReplaysParser {

    private long version = 0;
    private final Map startInfo;
    private final List endInfo;
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
                System.out.println(clientVersion);
            }
        }
    }

    public Map<String, Object> buildDoc() {
        parseStartInfo(startInfo);
        if (endInfo != null) {
            document.put("haveResults", true);
            parseEndInfo(endInfo);
        } else
            document.put("haveResults", false);
        return document;
    }


    private void parseStartInfo(Map startInfo) {
        String battleDate = startInfo.get("dateTime").toString();
        document.put("battleDate", parseDate(battleDate));
        document.put("playerName", startInfo.get("playerName"));
        document.put("map", startInfo.get("mapName"));
        String tankInfo = startInfo.get("playerVehicle").toString();
        String tankId = tankInfo.substring(tankInfo.indexOf('-') + 1);
        document.put("tank", getTankSearchInfo(tankId));
    }

    private Map<String, Object> getTankSearchInfo(String tankId) {
        Map<String, Object> result = new HashMap<>();
        Doc tank = tanksData.get(tankId);
        if (tank != null) {
            result.put("id", tank.getId());
            result.put("level", tank.get("level"));
            result.put("nation", tank.get("nation"));
            result.put("class", tank.get("class"));
        }
        return result;
    }


    private void parseEndInfo(List endInfo) {
        Map personalResults = (Map) endInfo.get(0);
        if (version >= 9_00_00) {
            Map personal = (Map) personalResults.get("personal");
            parsePersonal(personal);
        } else
            parsePersonal(personalResults);
    }

    public final static Set<Long> wrong1 = new HashSet<>();
    public final static Set<Long> wrong2 = new HashSet<>();

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
