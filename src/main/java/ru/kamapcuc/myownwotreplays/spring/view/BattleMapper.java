package ru.kamapcuc.myownwotreplays.spring.view;

import org.elasticsearch.common.joda.time.format.DateTimeFormatter;
import org.elasticsearch.common.joda.time.format.ISODateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.elastic.Doc2;
import ru.kamapcuc.myownwotreplays.elastic.TypesMeta;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class BattleMapper {

    private final DateTimeFormatter dateParser = ISODateTimeFormat.dateOptionalTimeParser();

    private final Map<String, Doc2> tanks = TypesMeta.REPOSITORIES.get(Config.TANK_TYPE_NAME);
    private final Map<String, Doc2> maps = TypesMeta.REPOSITORIES.get(Config.MAP_TYPE_NAME);
    private final Map<String, Doc2> medals = TypesMeta.REPOSITORIES.get(Config.MEDAL_TYPE_NAME);

    protected Doc2 mapHit(String id, Object parent, Map<String, Object> source) {
//        source.put(Doc.ID_FIELD, id);
//        String tankId = (String) parent;
//        source.put("tank", tanks.get(tankId));
        String mapId = (String) source.get("map");
        source.put("map", maps.get(mapId));
        source.put("battleDate", formatDate((String) source.get("battleDate")));
        source.put("medals", mapMedals((List) source.get("medals")));
        mapTeam((List) source.get("allies"));
        mapTeam((List) source.get("enemies"));
        return new Doc2(id, parent, source);
    }

    private List<Doc2> mapMedals(List ids) {
        List<Doc2> result = new ArrayList<>();
        for (Object id : ids) {
            String idString = (String) id;
            result.add(medals.get(idString));
        }
        return result;
    }

    private void mapTeam(List team) {
        if (team != null)
            for (Object member : team) {
                Map<String, Object> memberMap = (Map) member;
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
