package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.filter.FilterAggregationBuilder;

import java.util.ArrayList;
import java.util.List;

public abstract class Facet {

    public abstract String getId();

    public abstract QueryBuilder getFilter();

    protected abstract AggregationBuilder getUnfilteredFacet();

    public AggregationBuilder getFacet(List<Facet> otherFacets) {
        List<QueryBuilder> otherFacetsFilters = new ArrayList<>();
        otherFacets.stream().filter(facet -> facet != this).forEach(facet -> {
            QueryBuilder filter = facet.getFilter();
            if (filter != null)
                otherFacetsFilters.add(filter);
        });
        if (otherFacetsFilters.size() > 0)
            return getFilteredFacet(otherFacetsFilters);
        else
            return getUnfilteredFacet();
    }

    private AggregationBuilder getFilteredFacet(List<QueryBuilder> filters) {
        BoolQueryBuilder andFilter = new BoolQueryBuilder();
        filters.forEach(andFilter::must); //TODO

        FilterAggregationBuilder filteredFacet = new FilterAggregationBuilder(getId());
        filteredFacet.subAggregation(getUnfilteredFacet());
        filteredFacet.filter(andFilter);
        return filteredFacet;
    }

}
