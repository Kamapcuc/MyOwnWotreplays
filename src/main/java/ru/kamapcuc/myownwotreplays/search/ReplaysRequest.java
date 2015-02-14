package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;
import ru.kamapcuc.myownwotreplays.elastic.SearchResult;
import ru.kamapcuc.myownwotreplays.search.facets.Facet;
import ru.kamapcuc.myownwotreplays.search.facets.FacetBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReplaysRequest {

    private final static ElasticClient client = ElasticClient.getInstance();

    private final Map<String, String> params;
    private final SearchRequestBuilder searchRequest;

    public ReplaysRequest(Map<String, String> params) {
        this.params = params;
        this.searchRequest = createSearchRequest();
    }

    private SearchRequestBuilder createSearchRequest() {
        SearchRequestBuilder result = client.prepareSearch(Config.REPLAYS_INDEX_NAME);
        result.setTypes(Config.BATTLE_TYPE_NAME);
        result.setQuery(new MatchQueryBuilder("haveResults", true));
        result.setFetchSource(null, new String[]{"allies", "enemies"});
        return result;
    }

    public SearchResult execute() {
        parsePagination();
        parseSort();
        parseFacets();
        return client.search(searchRequest);
    }

    private void parsePagination() {
        searchRequest.setSize(Config.PAGINATION_SIZE);
        if (params.containsKey("page")) {
            try {
                int pageNum = Integer.valueOf(params.get("page"));
                searchRequest.setFrom((pageNum - 1) * Config.PAGINATION_SIZE);
            } catch (NumberFormatException ignored) {
            }
        }
    }

    private void parseSort() {
        SortType sort = SortType.getSortType(params.get("sortType"));
        SortOrder order = SortType.getSortOrder(params.get("sortOrder"));
        searchRequest.addSort(sort.getSort().order(order));
    }

    private void parseFacets() {
        List<Facet> facets = new ArrayList<>();
        for (FacetBuilder facetBuilder : Config.FACET_BUILDERS)
            facets.add(facetBuilder.getFacet(params));

        List<FilterBuilder> filters = new ArrayList<>();
        for (Facet facet : facets) {
            FilterBuilder filter = facet.getFilter();
            if (filter != null)
                filters.add(filter);
        }
        if (filters.size() > 0) {
            AndFilterBuilder andFilter = new AndFilterBuilder();
            filters.forEach(andFilter::add);
            searchRequest.setPostFilter(andFilter);
        }

        facets.stream().forEach(facet -> {
            AggregationBuilder aggregation = facet.getFacet(facets);
            searchRequest.addAggregation(aggregation);
        });
    }

}