package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;

import java.util.Map;

public class RequestBuilder {

    private ElasticClient client = ElasticClient.getInstance();

    private AggregationBuilder[] facets = new AggregationBuilder[]{
            new FieldFacet("map", "Карта"),
            new FieldFacet("tank.nation", "Нация"),
            new FieldFacet("tank.class", "Класс"),
            new FieldFacet("tank.level", "Уровень")
    };

    public SearchRequestBuilder buildRequest(Map params) {
        SearchRequestBuilder searchRequest = client.prepareSearch(Config.REPLAYS_INDEX_NAME);
        searchRequest.setQuery(new MatchAllQueryBuilder());
//        searchRequest.setQuery(new MatchQueryBuilder("haveResults", true));
//        params.entrySet();
        searchRequest.setTypes(Config.BATTLE_TYPE_NAME);
        searchRequest.setSize(Config.PAGINATION_SIZE);
        SortType sort = SortType.DATE;
        SortOrder order = SortOrder.DESC;
        if (params.containsKey("sortType")) {
            sort = SortType.getSortType(params.get("sortType"));
            if (params.containsKey("sortOrder"))
                order = SortType.getSortOrder(params.get("sortOrder"));
        }
        searchRequest.addSort(sort.getSort().order(order));
//       Arrays.stream(facets).forEach(searchRequest::addAggregation);
        return searchRequest;
    }

}
