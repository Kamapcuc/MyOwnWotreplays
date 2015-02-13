package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.common.joda.time.DateTime;
import org.elasticsearch.common.joda.time.format.ISODateTimeFormat;
import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.search.SearchHit;
import org.springframework.context.i18n.LocaleContextHolder;
import ru.kamapcuc.myownwotreplays.search.Config;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static ru.kamapcuc.myownwotreplays.search.TypesMeta.REPOSITORIES;

public class Doc implements ToXContent {

    private final String id;
    private final Map<String, Object> source;

    public Doc(SearchHit hit) {
        this(hit.getId(), hit.getSource());
    }

    public Doc(GetResponse getResponse) {
        this(getResponse.getId(), getResponse.getSource());
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

    private Object getLocalized(Object value) {
        Map langMap = (Map) value;
        Object result = langMap.get(LocaleContextHolder.getLocale().getLanguage());
        if (result != null)
            return result;
        else
            return langMap.get(Config.DEFAULT_LOCALE.getLanguage());
    }

    private Object getFromRepository(String repositoryName, String id) {
        Map<String, Doc> repository = REPOSITORIES.get(repositoryName);
        Doc doc = repository.get(id);
        if (doc == null) {
            System.out.println(String.format("Missing doc with \"%s\" id in \"%s\" repository", id, repositoryName));
            return null;
        } else
            return doc;
    }

    private Object retFromRepository(String repositoryName, Object value) {
        if (value instanceof List) {
            List list = (List) value;
            List<Object> result = new ArrayList<>();
            for (Object element : list)
                result.add(getFromRepository(repositoryName, (String) element));
            return result;
        } else {
            return getFromRepository(repositoryName, (String) value);
        }
    }

    private Object getInternal(String paramName, Map map) {
        Object value = map.get(paramName);
        if (paramName.endsWith("_i18n")) {
            return getLocalized(value);
        } else if (paramName.equals("date")) {
            DateTime zz = ISODateTimeFormat.dateOptionalTimeParser().parseDateTime((String) value);
            DateFormat localizedFormat = new SimpleDateFormat("dd MMM yyyy kk:mm", LocaleContextHolder.getLocale());
            return localizedFormat.format(zz.toDate());
        } else {
            if (REPOSITORIES.containsKey(paramName))
                return retFromRepository(paramName, value);
            else
                return map.get(paramName);
        }
    }

    public Object get(String paramName) {
        return getInternal(paramName, source);
    }

    private void toXContent(XContentBuilder builder, String rootKey, List list) throws IOException {
        builder.startArray();
        for (Object item : list)
            toXContent(builder, rootKey, item);
        builder.endArray();
    }

    private void toXContent(XContentBuilder builder, String key, Object value) throws IOException {
        if (value instanceof Doc) {
            ((Doc) value).toXContent(builder, ToXContent.EMPTY_PARAMS);
        } else if (value instanceof Map) {
            toXContent(builder, (Map) value);
        } else if (value instanceof List) {
            toXContent(builder, key, (List) value);
        } else {
            builder.value(value);
        }
    }

    private void toXContent(XContentBuilder builder, Map map) throws IOException {
        for (Object key : map.keySet()) {
            String keyString = (String) key;
            builder.field(keyString);
            Object value = getInternal(keyString, map);
            toXContent(builder, keyString, value);
        }
    }

    @Override
    public XContentBuilder toXContent(XContentBuilder builder, Params params) throws IOException {
        builder.startObject();
        builder.field("_id", getId());
        toXContent(builder, source);
        builder.endObject();
        return builder;
    }

}
