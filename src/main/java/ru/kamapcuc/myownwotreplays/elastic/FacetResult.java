package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.filter.Filter;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacetResult {

    private final List<Aggregation> list;

    public FacetResult(Aggregations aggregations) {
        if (aggregations == null)
            list = Collections.emptyList();
        else
            list = aggregations.asList();
    }

    private Object getFacetValue(Aggregation facet) {
        Map<String, Object> result = new HashMap<>();
        if (facet instanceof Terms) {
            Terms termsFacet = (Terms) facet;
            for (Terms.Bucket bucket : termsFacet.getBuckets())
                result.put(bucket.getKey(), bucket.getDocCount());
        } else if (facet instanceof Filter) {
            Filter filteredFacet = (Filter) facet;
            Aggregation innerFacet = filteredFacet.getAggregations().asList().get(0);
            return getFacetValue(innerFacet);
        }
        return result;
    }

    public Map<String, Object> getValues() {
        Map<String, Object> result = new HashMap<>();
        for (Aggregation aggregation : list)
            result.put(aggregation.getName(), getFacetValue(aggregation));
        return result;
    }

}