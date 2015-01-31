package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.search.SearchHit;
import ru.kamapcuc.myownwotreplays.search.Config;
import ru.kamapcuc.stuff.Utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import static ru.kamapcuc.myownwotreplays.search.TypesMeta.REPOSITORIES;

public class Doc implements ToXContent {

    private final static Set<String> localizedFields = new HashSet<>();

    static {
        localizedFields.add("description");
        localizedFields.add("name");
        localizedFields.add("shortName");
    }

    private final String id;
    private final Map<String, Object> source;

    public Doc(SearchHit hit) {
        this(hit.getId(), hit.getSource());
    }

    private Doc(String id, Map<String, Object> source) {
        this.id = id;
        this.source = source;
    }

    public String getId() {
        return id;
    }

    public Object getStraight(String paramName) {
        return source.get(paramName);
    }

    public Object get(String paramName) {
        if (localizedFields.contains(paramName)) {
            Map langMap = (Map) source.get(paramName);
            return Utils.coalesce(langMap.get(Config.lang), langMap.get(Config.defaultLang));
        } else {
            if (REPOSITORIES.containsKey(paramName)) {
                Map<String, Doc> repository = REPOSITORIES.get(paramName);
                String docId = (String) source.get(paramName);
                Doc doc = repository.get(docId);
                if (doc == null) {
                    System.out.println(String.format("Missing doc with \"%s\" id in \"%s\" repository", docId, paramName));
                    return new Doc(docId, new HashMap<>());
                } else
                    return doc;
            } else
                return source.get(paramName);
        }
    }

    @Override
    public XContentBuilder toXContent(XContentBuilder builder, Params params) throws IOException {
        builder.startObject();
        builder.field("_id", getId());
        for (String key : source.keySet()) {
            Object value = get(key);
            if (value instanceof Doc) {
                builder.field(key);
                ((Doc) value).toXContent(builder, params);
            } else
                builder.field(key, value);
        }
        builder.endObject();
        return builder;
    }

}
