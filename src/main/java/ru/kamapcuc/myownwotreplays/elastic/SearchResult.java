package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;

import java.io.IOException;

public class SearchResult {

    private final long total;
    private final DocMap docs;
    private final FacetResult facets;

    public SearchResult(long total, DocMap hits, FacetResult facets) {
        this.total = total;
        this.docs = hits;
        this.facets = facets;
    }

    public DocMap getDocs() {
        return docs;
    }

    public String stringify() {
        try {
            XContentBuilder builder = XContentFactory.jsonBuilder();
            builder.startObject();
            builder.field("total", total);
            builder.field("docs");
            docs.toXContent(builder, ToXContent.EMPTY_PARAMS);
            builder.field("facets");
            facets.toXContent(builder, ToXContent.EMPTY_PARAMS);
            builder.endObject();
            builder.close();
            return builder.string();
        } catch (IOException e) {
            return null;
        }
    }

}