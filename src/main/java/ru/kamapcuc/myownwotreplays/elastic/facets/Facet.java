package ru.kamapcuc.myownwotreplays.elastic.facets;

import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.filter.Filter;
import org.elasticsearch.search.aggregations.bucket.filter.FilterAggregationBuilder;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public abstract class Facet {

    public abstract String getId();
    public abstract Class getType();
    public abstract String getDisplayName();
    public abstract Object getValues();
    public abstract FilterBuilder getFilter(HttpServletRequest params);

    public Object getResult(Aggregations aggregations) {
        Aggregation agg = aggregations.get(getId());
        if (agg instanceof Filter) {
            Filter filteredFacet = (Filter) agg;
            return getResult(filteredFacet.getAggregations());
        }
        return null;
    }

    private List<FilterBuilder> filters = new ArrayList<>();

    public void addFilter(FilterBuilder filter) {
        filters.add(filter);
    }

    protected abstract AggregationBuilder getOwnAggregation();

    public AggregationBuilder getAggregation() {
        if (filters.size() > 0) {
            AndFilterBuilder andFilter = new AndFilterBuilder();
            filters.forEach(andFilter::add);

            FilterAggregationBuilder filteredFacet = new FilterAggregationBuilder(getId());
            filteredFacet.subAggregation(getOwnAggregation());
            filteredFacet.filter(andFilter);
            return filteredFacet;
        } else
            return getOwnAggregation();
    }


}
