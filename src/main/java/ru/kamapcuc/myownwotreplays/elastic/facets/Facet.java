package ru.kamapcuc.myownwotreplays.elastic.facets;

import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.filter.FilterAggregationBuilder;
import ru.kamapcuc.myownwotreplays.base.Parameters;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Supplier;

public abstract class Facet {

    public abstract String getId();
    public abstract String getType();
    public abstract String getDisplayName();
    public abstract Object getValues();
    public abstract QueryBuilder getFilter(Parameters params);
    public abstract Object getResult(Aggregations aggregations);

    protected abstract AggregationBuilder getOwnAggregation();

    public AggregationBuilder getAggregation(Supplier<QueryBuilder> otherFacets) {
        QueryBuilder filter = otherFacets.get();
        if (filter != null) {
            FilterAggregationBuilder filteredFacet = new FilterAggregationBuilder(getId());
            filteredFacet.subAggregation(getOwnAggregation());
            filteredFacet.filter(filter);
            return filteredFacet;
        } else
            return getOwnAggregation();
    }

    public final Object getInfo(){
        Map<String, Object> info = new HashMap<>();
        info.put("type", getType());
        info.put("name", getDisplayName());
        info.put("values", getValues());
        return info;
    }

}
