package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import ru.kamapcuc.myownwotreplays.base.Consts;
import ru.kamapcuc.myownwotreplays.base.Parameters;

import java.util.ArrayList;
import java.util.List;

public abstract class Request implements Parameters {

    private final static List<String> FIELDS;

    static {
        FIELDS = new ArrayList<>();
        FIELDS.add(Consts.PARENT_FIELD);
        FIELDS.add(Consts.SOURCE_FIELD);
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
        query.fields(FIELDS);
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
