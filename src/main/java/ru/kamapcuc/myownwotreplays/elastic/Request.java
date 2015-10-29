package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import ru.kamapcuc.myownwotreplays.base.Consts;
import ru.kamapcuc.myownwotreplays.base.Parameters;
import ru.kamapcuc.myownwotreplays.elastic.facets.Facet;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
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

    protected FacetContainer getFacets() {
        return new FacetContainer();
    }

    protected class FacetContainer extends ArrayList<Facet> implements Supplier<FilterBuilder> {

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

            if (filters.size() > 0) {
                AndFilterBuilder andFilter = new AndFilterBuilder();
                filters.forEach(andFilter::add);
                return andFilter;
            } else
                return null;
        }

    }

}
