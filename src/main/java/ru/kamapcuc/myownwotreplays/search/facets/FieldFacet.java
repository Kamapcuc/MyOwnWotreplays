package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.TermsQueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;

public class FieldFacet extends Facet {

    private final String field;
    private final String[] selectedValues;

    public FieldFacet(FieldFacetBuilder facetBuilder, String[] selectedValues) {
        this.field = facetBuilder.getId();
        this.selectedValues = selectedValues;
    }

    @Override
    public String getId() {
        return field;
    }

    public QueryBuilder getFilter() {
        if (selectedValues != null)
            return new TermsQueryBuilder(field, selectedValues);
        else
            return null;
    }

    @Override
    public AggregationBuilder getUnfilteredFacet() {
        TermsBuilder facet = new TermsBuilder(field);
        facet.field(field);
        facet.size(1000);
        return facet;
    }

}
