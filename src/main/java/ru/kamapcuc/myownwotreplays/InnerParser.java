package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.common.base.Joiner;
import ru.kamapcuc.myownwotreplays.elastic.DataConfig;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InnerParser {

    private long version = 0;
    private final Map startInfo;
    private final List endInfo;
    private Map<String, Object> document = new HashMap<>();
    private ElasticClient client = ElasticClient.getInstance();

    private final static Joiner JOINER = Joiner.on(".").skipNulls();
    private final static SimpleDateFormat DATE_PARSER = new SimpleDateFormat("dd.MM.yyyy kk:mm:ss");

    public InnerParser(Map startInfo, List endInfo) {
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
        String tankId = tankInfo.split("-")[1];
        document.put("tank", getTankSearchInfo(tankId));
    }

    private Map<String, Doc> tanksData = null;

    private Map<String, Doc> getTanksData() {
        if (tanksData == null)
            tanksData = client.getDataType(DataConfig.TANK_TYPE_NAME);
        return tanksData;
    }

    private Map<String, Object> getTankSearchInfo(String tankId) {
        Map<String, Object> result = new HashMap<>();
        Doc tank = getTanksData().get(tankId);
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

    private void parsePersonal(Map personalResults) {
        document.put("damageDealt", personalResults.get("damageDealt"));
        document.put("credits", personalResults.get("credits"));
        document.put("originalCredits", personalResults.get("originalCredits"));
        document.put("xp", personalResults.get("xp"));
        document.put("originalXP", personalResults.get("originalXP"));
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
