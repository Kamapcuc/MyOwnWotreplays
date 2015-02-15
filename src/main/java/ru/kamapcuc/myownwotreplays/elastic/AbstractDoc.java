package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;

import java.io.IOException;
import java.util.List;
import java.util.Map;

abstract class AbstractDoc implements ToXContent {

    private final Map<String, Object> source;

    protected AbstractDoc(Map<String, Object> source) {
        this.source = source;
    }

    public Object get(String paramName){
        return source.get(paramName);
    }

    private void toXContent(XContentBuilder builder, Object value) throws IOException {
        if (value instanceof AbstractDoc) {
            toXContent(builder, (AbstractDoc) value);
        } else if (value instanceof Map) {
            toXContent(builder, (Map) value);
        } else if (value instanceof List) {
            toXContent(builder, (List) value);
        } else {
            builder.value(value);
        }
    }

    private void toXContent(XContentBuilder builder, List list) throws IOException {
        builder.startArray();
        for (Object item : list)
            toXContent(builder, item);
        builder.endArray();
    }

    private void toXContent(XContentBuilder builder, Map map) throws IOException {
        builder.startObject();
        for (Object key : map.keySet()) {
            String keyString = (String) key;
            builder.field(keyString);
            toXContent(builder, map.get(key));
        }
        builder.endObject();
    }

    private void toXContent(XContentBuilder builder, AbstractDoc doc) throws IOException {
        builder.startObject();
        for (Object key : doc.source.keySet()) {
            String keyString = (String) key;
            builder.field(keyString);
            toXContent(builder, doc.get(keyString));
        }
        builder.endObject();
    }

    @Override
    public XContentBuilder toXContent(XContentBuilder builder, Params params) throws IOException {
        toXContent(builder, this);
        return builder;
    }

}
