package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.TermsFilterBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;

public class FieldFacet extends Facet {

    private final String name;
    private final String field;
    private final String[] selectedValues;

    public FieldFacet(FieldFacetBuilder facetBuilder, String[] selectedValues) {
        this.name = facetBuilder.name;
        this.field = facetBuilder.field;
        this.selectedValues = selectedValues;
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
        if (selectedValues != null)
            return new TermsFilterBuilder(field, selectedValues);
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
