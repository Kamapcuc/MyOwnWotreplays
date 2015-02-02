package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;
import ru.kamapcuc.myownwotreplays.search.facets.Facet;
import ru.kamapcuc.myownwotreplays.search.facets.FacetBuilder;
import ru.kamapcuc.myownwotreplays.search.facets.FieldFacetBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RequestBuilder {

    private final static ElasticClient client = ElasticClient.getInstance();

    private final static FacetBuilder[] facetBuilders = new FacetBuilder[]{
            new FieldFacetBuilder("Нация", "tankNation"),
            new FieldFacetBuilder("Класс", "tankClass"),
            new FieldFacetBuilder("Уровень", "tankLevel")
    };

    private final SearchRequestBuilder searchRequest;
    private final Map params;
    private final List<Facet> facets = new ArrayList<>();

    public RequestBuilder(Map params) {
        searchRequest = client.prepareSearch(Config.REPLAYS_INDEX_NAME);
        searchRequest.setTypes(Config.BATTLE_TYPE_NAME);
        searchRequest.setSize(Config.PAGINATION_SIZE);
        searchRequest.setQuery(new MatchQueryBuilder("haveResults", true));
        this.params = params;
    }

    public SearchRequestBuilder buildRequest() {
        parseLang();
        parseSort();
        parseFacets();
        return searchRequest;
    }

    private void parseLang() {
        if (params.containsKey("lang")) {
            Config.lang = (String) params.get("lang");
        }
    }

    private void parseSort() {
        SortType sort = SortType.DATE;
        SortOrder order = SortOrder.DESC;
        if (params.containsKey("sortType")) {
            sort = SortType.getSortType(params.get("sortType"));
            if (params.containsKey("sortOrder"))
                order = SortType.getSortOrder(params.get("sortOrder"));
        }
        searchRequest.addSort(sort.getSort().order(order));
    }

    private void parseFacets() {
        for (FacetBuilder facetBuilder : facetBuilders)
            facets.add(facetBuilder.getFacet(params));
        buildFilters();
        buildFacets();
    }

    private void buildFilters() {
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

    private void buildFacets() {
        facets.stream().forEach(facet -> searchRequest.addAggregation(facet.getFacet(facets)));
    }

}