package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.filter.FilterAggregationBuilder;
import org.json.JSONObject;
import ru.kamapcuc.myownwotreplays.base.Parameters;
import ru.kamapcuc.myownwotreplays.elastic.facets.Facet;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class FacetContainer extends ArrayList<Facet> {

    public FacetContainer(Collection<? extends Facet> c) {
        super(c);
    }

    public QueryBuilder getFilter(Parameters params) {
        List<QueryBuilder> filters = new ArrayList<>();
        for (Facet facet : this) {
            QueryBuilder filter = facet.getFilter(params);
            if (filter != null)
                filters.add(filter);
        }

        switch (filters.size()) {
            case 0:
                return null;
            case 1:
                return filters.get(0);
            default:
                BoolQueryBuilder andFilter = new BoolQueryBuilder();
                filters.forEach(andFilter::must);
                return andFilter;
        }
    }

    public List<AggregationBuilder> getAggregations(Parameters params) {
        List<AggregationBuilder> result = new ArrayList<>();
        this.forEach(currentFacet -> {
            FacetContainer otherFacets = new FacetContainer(this);
            otherFacets.remove(currentFacet);
            result.add(getAggregation(currentFacet, otherFacets.getFilter(params)));
        });
        return result;
    }

    public AggregationBuilder getAggregation(Facet facet, QueryBuilder otherFacetsFilters) {
        if (otherFacetsFilters != null) {
            FilterAggregationBuilder filteredFacet = new FilterAggregationBuilder(facet.getId());
            filteredFacet.subAggregation(facet.getAggregation());
            filteredFacet.filter(otherFacetsFilters);
            return filteredFacet;
        } else
            return facet.getAggregation();
    }

    public String getInfo() {
        JSONObject info = new JSONObject();
        this.forEach(facet -> info.put(facet.getId(), facet.getInfo()));
        return info.toString();
    }

}
