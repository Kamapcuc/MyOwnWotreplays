package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.filter.FilterAggregationBuilder;

import java.util.ArrayList;
import java.util.List;

public abstract class Facet {

    public abstract String getId();

    public abstract String getName();

    public abstract FilterBuilder getFilter();

    protected abstract AggregationBuilder getUnfilteredFacet();

    public AggregationBuilder getFacet(List<Facet> otherFacets) {
        List<FilterBuilder> otherFacetsFilters = new ArrayList<>();
        otherFacets.stream().filter(facet -> facet != this).forEach(facet -> {
            FilterBuilder filter = facet.getFilter();
            if (filter != null)
                otherFacetsFilters.add(filter);
        });
        if (otherFacetsFilters.size() > 0)
            return getFilteredFacet(otherFacetsFilters);
        else
            return getUnfilteredFacet();
    }

    private AggregationBuilder getFilteredFacet(List<FilterBuilder> filters) {
        AndFilterBuilder andFilter = new AndFilterBuilder();
        filters.stream().forEach(andFilter::add);

        FilterAggregationBuilder filteredFacet = new FilterAggregationBuilder(getId());
        filteredFacet.subAggregation(getUnfilteredFacet());
        filteredFacet.filter(andFilter);
        return filteredFacet;
    }

}
