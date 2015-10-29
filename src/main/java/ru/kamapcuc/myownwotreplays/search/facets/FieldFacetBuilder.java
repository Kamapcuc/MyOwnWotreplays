package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.common.xcontent.XContentBuilder;
import ru.kamapcuc.myownwotreplays.base.Translator;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

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
    public Facet getFacet(HttpServletRequest params) {
        String selectedValues = params.getParameter(getId());
        return new FieldFacet(this, (selectedValues == null)? null : selectedValues.split(","));
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