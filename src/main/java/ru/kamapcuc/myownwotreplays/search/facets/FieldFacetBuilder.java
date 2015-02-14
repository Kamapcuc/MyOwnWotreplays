package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.common.xcontent.XContentBuilder;
import ru.kamapcuc.myownwotreplays.spring.Translator;

import java.io.IOException;
import java.util.Map;

public abstract class FieldFacetBuilder extends FacetBuilder {

    private final String code;

    public FieldFacetBuilder(String field, String code) {
        super(field);
        this.code = code;
    }

    @Override
    public String getType() {
        return "field";
    }

    @Override
    public String getName() {
        return Translator.translate(code);
    }

    @Override
    public Facet getFacet(Map<String, String> params) {
        String[] selectedValues = null;
        if (params.containsKey(getId()))
            selectedValues = params.get(getId()).split(",");
        return new FieldFacet(this, selectedValues);
    }

    @Override
    protected void toXContentInner(XContentBuilder builder) throws IOException {
        builder.field("values");
        builder.startObject();
        toXContentValues(builder);
        builder.endObject();
    }

    protected abstract void toXContentValues(XContentBuilder builder) throws IOException;

}