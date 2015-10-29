package ru.kamapcuc.myownwotreplays.elastic.facets;

import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.filter.Filter;
import org.elasticsearch.search.aggregations.bucket.filter.FilterAggregationBuilder;
import ru.kamapcuc.myownwotreplays.base.Parameters;

import java.util.function.Supplier;

public abstract class Facet {

    public abstract String getId();
    public abstract Class getType();
    public abstract String getDisplayName();
    public abstract Object getValues();
    public abstract FilterBuilder getFilter(Parameters params);

    public Object getResult(Aggregations aggregations) {
        Aggregation agg = aggregations.get(getId());
        if (agg instanceof Filter) {
            Filter filteredFacet = (Filter) agg;
            return getResult(filteredFacet.getAggregations());
        }
        return null;
    }

    protected abstract AggregationBuilder getOwnAggregation();

    public AggregationBuilder getAggregation(Supplier<FilterBuilder> other) {
        FilterBuilder filter = other.get();
        if (filter != null) {
            FilterAggregationBuilder filteredFacet = new FilterAggregationBuilder(getId());
            filteredFacet.subAggregation(getOwnAggregation());
            filteredFacet.filter(filter);
            return filteredFacet;
        } else
            return getOwnAggregation();
    }

}
