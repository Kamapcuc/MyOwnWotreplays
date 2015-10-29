package ru.kamapcuc.myownwotreplays.elastic.facets;

import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.TermsFilterBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;
import ru.kamapcuc.myownwotreplays.base.Parameters;
import ru.kamapcuc.myownwotreplays.base.Translator;

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
    public FilterBuilder getFilter(Parameters params) {
        String selectedValues = params.getParameter(getId());
        if (selectedValues != null)
            return new TermsFilterBuilder(field, selectedValues.split(","));
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
