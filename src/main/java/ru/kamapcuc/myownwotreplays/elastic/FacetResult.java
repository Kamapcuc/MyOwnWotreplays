package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.filter.Filter;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

public class FacetResult implements ToXContent {

    private final List<Aggregation> list;

    public FacetResult(Aggregations aggregations) {
        if (aggregations == null)
            list = Collections.emptyList();
        else
            list = aggregations.asList();
    }

    private void facetToXContent(XContentBuilder builder, Aggregation facet) throws IOException {
        builder.field(facet.getName());
        builder.startObject();
        if (facet instanceof Terms) {
            Terms termsFacet = (Terms) facet;
            for (Terms.Bucket bucket : termsFacet.getBuckets())
                builder.field(bucket.getKey(), bucket.getDocCount());
        } else if (facet instanceof Filter) {
            Filter filteredFacet = (Filter) facet;
            Aggregation innerFacet = filteredFacet.getAggregations().asList().get(0);
            facetToXContent(builder, innerFacet);
        }
        builder.endObject();
    }

    @Override
    public XContentBuilder toXContent(XContentBuilder builder, Params params) throws IOException {
        builder.startObject();
        for (Aggregation facet : list)
            facetToXContent(builder, facet);
        builder.endObject();
        return builder;
    }

}