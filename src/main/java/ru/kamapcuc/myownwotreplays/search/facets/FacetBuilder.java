package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public abstract class FacetBuilder implements ToXContent {

    private final String id;

    public FacetBuilder(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public abstract String getType();
    public abstract String getName();
    public abstract Facet getFacet(HttpServletRequest params);

    protected abstract void toXContentInner(XContentBuilder builder) throws IOException;

    @Override
    public final XContentBuilder toXContent(XContentBuilder builder, Params params) throws IOException {
        builder.field(getId());
        builder.startObject();
        builder.field("type", getType());
        builder.field("name", getName());
        toXContentInner(builder);
        builder.endObject();
        return builder;
    }

}
