package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.json.JSONObject;
import ru.kamapcuc.myownwotreplays.base.Consts;
import ru.kamapcuc.myownwotreplays.base.Parameters;
import ru.kamapcuc.myownwotreplays.elastic.facets.Facet;

import java.util.*;
import java.util.function.Supplier;

public abstract class Request implements Parameters {

    public Request() {
    }

    protected abstract String getType();

    public final SearchRequest getRequest() {
        SearchRequest result = new SearchRequest();
        result.indices(Consts.INDEX_NAME);
        result.types(getType());
        result.source(getQuery());
        return result;
    }

    protected SearchSourceBuilder getQuery() {
        SearchSourceBuilder query = new SearchSourceBuilder();
        query.fields(Consts.PARENT_FIELD, Consts.SOURCE_FIELD);
        query.postFilter(getFacets().get());
        getAggregations().forEach(query::aggregation);
        return query;
    }

    private List<AggregationBuilder> getAggregations() {
        List<AggregationBuilder> result = new ArrayList<>();
        List<Facet> facets = getFacets();
        facets.forEach(currentFacet -> {
            FacetContainer otherFacets = new FacetContainer(facets);
            otherFacets.remove(currentFacet);
            result.add(currentFacet.getAggregation(otherFacets));
        });
        return result;
    }

    public FacetContainer getFacets() {
        return new FacetContainer();
    }

    public class FacetContainer extends ArrayList<Facet> implements Supplier<FilterBuilder> {

        public FacetContainer() {
        }

        private FacetContainer(Collection<? extends Facet> c) {
            super(c);
        }

        @Override
        public FilterBuilder get() {
            List<FilterBuilder> filters = new ArrayList<>();
            for (Facet facet : this) {
                FilterBuilder filter = facet.getFilter(Request.this);
                if (filter != null)
                    filters.add(filter);
            }

            switch (filters.size()) {
                case 0:
                    return null;
                case 1:
                    return filters.get(0);
                default:
                    AndFilterBuilder andFilter = new AndFilterBuilder();
                    filters.forEach(andFilter::add);
                    return andFilter;
            }
        }

        public String getInfo() {
            JSONObject info = new JSONObject();
            this.forEach(facet -> info.put(facet.getId(), facet.getInfo()));
            return info.toString();
        }

    }

}
