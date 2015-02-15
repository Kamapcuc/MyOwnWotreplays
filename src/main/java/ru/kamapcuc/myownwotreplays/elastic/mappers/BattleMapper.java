package ru.kamapcuc.myownwotreplays.elastic.mappers;

import org.elasticsearch.common.joda.time.format.DateTimeFormatter;
import org.elasticsearch.common.joda.time.format.ISODateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.DocMap;
import ru.kamapcuc.myownwotreplays.elastic.TypesMeta;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class BattleMapper extends DefaultMapper {

    private final DateTimeFormatter dateParser = ISODateTimeFormat.dateOptionalTimeParser();

    private final DocMap tanks = TypesMeta.REPOSITORIES.get(Config.TANK_TYPE_NAME);
    private final DocMap maps = TypesMeta.REPOSITORIES.get(Config.MAP_TYPE_NAME);
    private final DocMap medals = TypesMeta.REPOSITORIES.get(Config.MEDAL_TYPE_NAME);

    @Override
    protected Doc mapHit(String id, Object parent, Map<String, Object> source) {
        source.put(Doc.ID_FIELD, id);
        String tankId = (String) parent;
        source.put("tank", tanks.get(tankId));
        String mapId =(String) source.get("map");
        source.put("map", maps.get(mapId));
        source.put("battleDate", formatDate((String) source.get("battleDate")));
        source.put("medals", mapMedals((List) source.get("medals")));
        return new Doc(source);
    }

    private List mapMedals(List ids) {
        List<Doc> result = new ArrayList<>();
        for (Object id : ids) {
            String idString = (String)id;
            result.add(medals.get(idString));
        }
        return result;
    }

    private String formatDate(String battleDate) {
        Date date = dateParser.parseDateTime(battleDate).toDate();
        DateFormat localizedFormat = new SimpleDateFormat("dd MMM yyyy kk:mm", LocaleContextHolder.getLocale());
        return localizedFormat.format(date);
    }

}
