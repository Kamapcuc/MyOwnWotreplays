package ru.kamapcuc.myownwotreplays.view;

import org.elasticsearch.common.joda.time.format.DateTimeFormatter;
import org.elasticsearch.common.joda.time.format.ISODateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class BattleMapper {

    private final DateTimeFormatter dateParser = ISODateTimeFormat.dateOptionalTimeParser();

    private final Map<String, Doc> tanks = Repository.getDocs(Config.TANK_TYPE_NAME);
    private final Map<String, Doc> maps = Repository.getDocs(Config.MAP_TYPE_NAME);
    private final Map<String, Doc> medals = Repository.getDocs(Config.MEDAL_TYPE_NAME);

    public Doc mapHit(Doc battle) {
//        source.put(Doc.ID_FIELD, id);
//        String tankId = (String) parent;
//        source.put("tank", tanks.get(tankId));
        String mapId = (String) battle.get("map");
        battle.put("map", maps.get(mapId));
        battle.put("battleDate", formatDate((String) battle.get("battleDate")));
        battle.put("medals", mapMedals((List) battle.get("medals")));
        if (battle.has("allies")) {
            mapTeam((List) battle.get("allies"));
            mapTeam((List) battle.get("enemies"));
        }
        return battle;
    }

    private List<Doc> mapMedals(List ids) {
        List<Doc> result = new ArrayList<>();
        for (Object id : ids) {
            String idString = (String) id;
            result.add(medals.get(idString));
        }
        return result;
    }

    private void mapTeam(List team) {
        if (team != null)
            for (Object member : team) {
                Map memberMap = (Map) member;
                String tank = (String) memberMap.get("tank");
                memberMap.put("tank", tanks.get(tank));
            }
    }

    private String formatDate(String battleDate) {
        Date date = dateParser.parseDateTime(battleDate).toDate();
        DateFormat localizedFormat = new SimpleDateFormat("dd MMM yyyy kk:mm", LocaleContextHolder.getLocale());
        return localizedFormat.format(date);
    }

}
