package ru.kamapcuc.myownwotreplays.elastic.facets;

import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.TermsFilterBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;
import ru.kamapcuc.myownwotreplays.spring.Translator;

import javax.servlet.http.HttpServletRequest;

public abstract class FieldFacet extends Facet {

    private final String field;

    private final String code;

    public FieldFacet(String field, String code) {
        this.field = field;
        this.code = code;
    }

    @Override
    public String getId() {
        return field;
    }

    @Override
    public Class getType() {
        return Terms.class;
    }

    @Override
    public String getDisplayName() {
        return Translator.translate(code);
    }

    @Override
    public FilterBuilder getFilter(HttpServletRequest params) {
        String param = params.getParameter(getId());
        if (param != null)
            return new TermsFilterBuilder(field, param.split(","));
        else
            return null;
    }

    @Override
    public Object getResult(Aggregations aggregations) {

        return null;
    }

    @Override
    protected AggregationBuilder getOwnAggregation() {
        TermsBuilder facet = new TermsBuilder(getId());
        facet.field(field);
        facet.size(1000);
        return facet;
    }

}
