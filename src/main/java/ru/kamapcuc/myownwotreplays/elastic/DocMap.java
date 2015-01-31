package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;

import java.io.IOException;
import java.util.LinkedHashMap;

public class DocMap extends LinkedHashMap<String, Doc> {

    public String stringify() {
        try {
            XContentBuilder builder = XContentFactory.jsonBuilder();
            builder.startArray();
            for (Doc doc : values()) {
                doc.toXContent(builder, ToXContent.EMPTY_PARAMS);
            }
            builder.endArray();
            builder.close();
            return builder.string();
        } catch (IOException e) {
            return "[]";
        }
    }

}
