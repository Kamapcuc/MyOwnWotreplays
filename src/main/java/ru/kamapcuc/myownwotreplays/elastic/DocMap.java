package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;

import java.io.IOException;
import java.util.LinkedHashMap;

public class DocMap extends LinkedHashMap<String, Doc> implements ToXContent {

    @Override
    public XContentBuilder toXContent(XContentBuilder builder, Params params) throws IOException {
        builder.startArray();
        for (Doc doc : values())
            doc.toXContent(builder, ToXContent.EMPTY_PARAMS);
        builder.endArray();
        return builder;
    }

}
