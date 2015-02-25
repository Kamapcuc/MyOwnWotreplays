package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import ru.kamapcuc.myownwotreplays.elastic.*;
import ru.kamapcuc.myownwotreplays.elastic.mappers.HitMapper;
import ru.kamapcuc.myownwotreplays.elastic.mappers.Mapper;

public class WrappedClient {

    private final ElasticClient client = ElasticClient.getInstance();
    private final Mapper hitMapper = new HitMapper();

    public SearchResult search(SearchRequestBuilder searchRequest) {
        SearchResponse response = client.search(searchRequest);
        SearchHits hits = response.getHits();
        DocMap result = new DocMap();
        for (SearchHit hit : hits)
            result.put(hit.getId(), hitMapper.mapHit(hit));
        FacetResult facets = new FacetResult(response.getAggregations());
        return new SearchResult(hits.totalHits(), result, facets);
    }

    public Doc get(String index, String type, String id) {
        GetResponse getRequest = client.get(index, type, id);
        return hitMapper.mapHit(getRequest);
    }

}
