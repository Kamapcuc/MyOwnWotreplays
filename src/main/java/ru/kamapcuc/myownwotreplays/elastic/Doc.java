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

    private final String id;
    private final Map<String, Object> source;


    public Doc(SearchHit hit) {
        this.id = hit.getId();
        this.source = hit.getSource();
    }

    public String getId() {
        return id;
    }

    public Object get(String paramName) {
        if (localizedFields.contains(paramName))
            return ((Map) source.get(paramName)).get(Config.lang);
        else
            return source.get(paramName);
    }

}
