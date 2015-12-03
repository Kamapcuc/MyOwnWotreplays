package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import ru.kamapcuc.myownwotreplays.base.Consts;
import ru.kamapcuc.myownwotreplays.base.Parameters;

public abstract class Request implements Parameters {

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
        FacetContainer facetContainer = getFacets();
        if (facetContainer != null) {
            query.postFilter(facetContainer.getFilter(this));
            facetContainer.getAggregations(this).forEach(query::aggregation);
        }
        return query;
    }

    protected FacetContainer getFacets() {
        return null;
    }

}
