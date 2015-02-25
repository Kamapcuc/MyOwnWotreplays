package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;
import ru.kamapcuc.myownwotreplays.elastic.SearchResult;
import ru.kamapcuc.myownwotreplays.search.facets.Facet;
import ru.kamapcuc.myownwotreplays.search.facets.FacetBuilder;
import ru.kamapcuc.myownwotreplays.search.facets.RepositoryFacetBuilder;
import ru.kamapcuc.myownwotreplays.search.facets.TankLevelFacetBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReplaysRequest {

    private final static ElasticClient client = ElasticClient.getInstance();
    private final static WrappedClient wrappedClient = new WrappedClient();

    private final Map<String, String> params;
    private final List<Facet> facets = new ArrayList<>();
    private final SearchRequestBuilder searchRequest;

    public ReplaysRequest(Map<String, String> params) {
        this.params = params;
        this.searchRequest = createSearchRequest();
        parsePagination();
        parseSort();
        parseFilters();
    }

    private SearchRequestBuilder createSearchRequest() {
        SearchRequestBuilder result = client.prepareSearch();
        result.setTypes(Config.BATTLE_TYPE_NAME);
        result.setQuery(new MatchQueryBuilder("haveResults", true));
        result.setFetchSource(null, new String[]{"allies", "enemies", "battleEfficiency"});
        return result;
    }

    public SearchResult fullSearch() {
        facets.stream().forEach(facet -> {
            AggregationBuilder aggregation = facet.getFacet(facets);
            searchRequest.addAggregation(aggregation);
        });
        return wrappedClient.search(searchRequest);
    }

    public SearchResult paginate() {
        return wrappedClient.search(searchRequest);
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

    private void parseFilters() {
        for (FacetBuilder facetBuilder : FACET_BUILDERS)
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
    }

    public final static FacetBuilder[] FACET_BUILDERS = new FacetBuilder[]{
            new RepositoryFacetBuilder("tankNation", "facet_tank_nation", Config.NATION_TYPE_NAME),
            new RepositoryFacetBuilder("tankClass", "facet_tank_class", Config.CLASS_TYPE_NAME),
            new RepositoryFacetBuilder("map", "facet_map", Config.MAP_TYPE_NAME),
            new TankLevelFacetBuilder("tankLevel", "facet_tank_level")
    };

}