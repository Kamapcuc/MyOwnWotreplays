package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.search.SearchHit;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Doc {

    private final static Set<String> localizedFields = new HashSet<>();

    static {
        localizedFields.add("description");
        localizedFields.add("name");
    }

    private final SearchHit hit;
    private final String lang;

    public Doc(SearchHit hit, String lang) {
        this.hit = hit;
        this.lang = lang;
    }

    public String getId() {
        return hit.getId();
    }

    public Object get(String paramName) {
        if (localizedFields.contains(paramName))
            return ((Map) hit.getSource().get(paramName)).get(lang);
        else
            return hit.getSource().get(paramName);
    }

}
