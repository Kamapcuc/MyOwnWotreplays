package ru.kamapcuc.myownwotreplays.elastic;

import org.json.JSONObject;

import java.util.List;

public class SearchResult extends JSONObject {

    private final List<Doc> docs;

    public SearchResult(long total, List<Doc> hits, FacetResult facets) {
        this.docs = hits;
        put("total", total);
        put("facets", facets.getValues());
    }

    public List<Doc> getDocs() {
        return docs;
    }

    @Override
    public String toString() {
        put("docs", docs);
        return super.toString();
    }

}