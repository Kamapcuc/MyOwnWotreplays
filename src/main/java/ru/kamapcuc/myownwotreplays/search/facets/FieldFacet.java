package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.TermFilterBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;

public class FieldFacet extends Facet {

    private final String name;
    private final String field;
    private final Object value;

    public FieldFacet(FieldFacetBuilder facetBuilder, Object value) {
        this.name = facetBuilder.name;
        this.field = facetBuilder.field;
        this.value = value;
    }

    @Override
    public String getId() {
        return field;
    }

    @Override
    public String getName() {
        return name;
    }

    public FilterBuilder getFilter() {
        if (value != null)
            return new TermFilterBuilder(field, value);
        else
            return null;
    }

    @Override
    public AggregationBuilder getUnfilteredFacet() {
        TermsBuilder facet = new TermsBuilder(field);
        facet.field(field);
        facet.size(1000);
        facet.order(Terms.Order.term(true));
        return facet;
    }

}
