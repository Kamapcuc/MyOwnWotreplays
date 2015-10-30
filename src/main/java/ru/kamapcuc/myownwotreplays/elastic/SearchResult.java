package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHitField;
import org.json.JSONObject;
import ru.kamapcuc.myownwotreplays.base.Consts;
import ru.kamapcuc.myownwotreplays.elastic.facets.Facet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchResult {

    private final SearchResponse response;
    private final List<Facet> facets;

    public SearchResult(SearchResponse response, List<Facet> facets) {
        this.response = response;
        this.facets = facets;
    }

    public List<Doc> getDocs() {
        List<Doc> docs = new ArrayList<>();
        for (SearchHit hit : response.getHits()) {
            SearchHitField parentField = hit.getFields().get(Consts.PARENT_FIELD);
            String parent = (parentField == null) ? null : parentField.getValue();
            docs.add(new Doc(hit.getId(), parent, hit.getSource()));
        }
        return docs;
    }

    private Map<String, Object> getFacets() {
        Map<String, Object> map = new HashMap<>();
        for(Facet facet : facets)
            map.put(facet.getId(), facet.getResult(response.getAggregations()));
        return map;
    }

    @Override
    public String toString() {
        JSONObject result = new JSONObject();
        result.put("total", response.getHits().getTotalHits());
        result.put("docs", getDocs());
        result.put("facets", getFacets());
        return result.toString();
    }

}