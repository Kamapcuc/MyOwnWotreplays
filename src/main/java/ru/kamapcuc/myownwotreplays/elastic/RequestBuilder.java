package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

public class RequestBuilder {

    private ElasticClient client = ElasticClient.getInstance();

    private AggregationBuilder[] facets = new AggregationBuilder[]{
            new TermsBuilder("Карта").field("map"),
            new TermsBuilder("Нация").field("tank.nation"),
            new TermsBuilder("Класс").field("tank.class"),
            new TermsBuilder("Уровень").field("tank.level")
    };

    public SearchRequestBuilder buildRequest(HttpServletRequest request) {
        SearchRequestBuilder searchRequest = client.getClient().prepareSearch(DataConfig.REPLAYS_INDEX_NAME);
        searchRequest.setQuery(new MatchAllQueryBuilder());
        searchRequest.setTypes(DataConfig.BATTLE_TYPE_NAME);
        Arrays.stream(facets).forEach(searchRequest::addAggregation);
        return searchRequest;
    }

    private static volatile RequestBuilder instance;

    private RequestBuilder() {
    }

    public static RequestBuilder getInstance() {
        RequestBuilder localInstance = instance;
        if (localInstance == null)
            synchronized (RequestBuilder.class) {
                localInstance = instance;
                if (localInstance == null)
                    instance = localInstance = new RequestBuilder();
            }
        return localInstance;
    }
}
