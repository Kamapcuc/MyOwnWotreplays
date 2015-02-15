package ru.kamapcuc.myownwotreplays.elastic.mappers;

import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.index.get.GetField;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHitField;
import ru.kamapcuc.myownwotreplays.elastic.Doc;

import java.util.Map;

class DefaultMapper implements Mapper {

    @Override
    public Doc mapHit(SearchHit hit) {
        SearchHitField parentField = hit.getFields().get(Doc.PARENT_FIELD);
        String parent = (parentField == null)? null : parentField.getValue();
        return mapHit(hit.getId(), parent, hit.getSource());
    }

    @Override
    public Doc mapHit(GetResponse hit) {
        GetField parentField = hit.getFields().get(Doc.PARENT_FIELD);
        Object parent = (parentField == null)? null : parentField.getValue();
        return mapHit(hit.getId(), parent, hit.getSource());
    }

    protected Doc mapHit(String id, Object parent, Map<String, Object> source) {
        source.put(Doc.ID_FIELD, id);
        source.put(Doc.PARENT_FIELD, parent);
        return new Doc(source);
    }

}
