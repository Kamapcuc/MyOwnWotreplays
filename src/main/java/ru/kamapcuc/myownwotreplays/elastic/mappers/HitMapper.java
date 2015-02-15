package ru.kamapcuc.myownwotreplays.elastic.mappers;

import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.search.SearchHit;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.Config;

import java.util.HashMap;
import java.util.Map;

public class HitMapper implements Mapper {

    private final static Map<String, Mapper> TYPE_MAPPERS = new HashMap<>();
    private final static Mapper DEFAULT_MAPPER = new DefaultMapper();

    static {
        TYPE_MAPPERS.put(Config.BATTLE_TYPE_NAME, new BattleMapper());
    }

    private Mapper getTypeMapper(String type) {
        Mapper typeMapper = TYPE_MAPPERS.get(type);
        if (typeMapper == null)
            return DEFAULT_MAPPER;
        return typeMapper;
    }

    @Override
    public Doc mapHit(SearchHit hit) {
        return getTypeMapper(hit.getType()).mapHit(hit);
    }

    @Override
    public Doc mapHit(GetResponse hit) {
        return getTypeMapper(hit.getType()).mapHit(hit);
    }

}
