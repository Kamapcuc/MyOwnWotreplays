package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.elastic.mappers.HitMapper;
import ru.kamapcuc.myownwotreplays.elastic.mappers.Mapper;

import java.util.HashMap;

public class TypesMeta {

    private final static String[] repositoryTypes = new String[]{
            Config.TANK_TYPE_NAME,
            Config.MAP_TYPE_NAME,
            Config.CLASS_TYPE_NAME,
            Config.NATION_TYPE_NAME,
            Config.LANGUAGE_TYPE_NAME,
            Config.MEDAL_TYPE_NAME
    };

    public final static HashMap<String, DocMap> REPOSITORIES = new HashMap<>();

    static {
        ElasticClient client = ElasticClient.getInstance();
        for (String repositoryType : repositoryTypes) {
            SearchRequestBuilder searchRequest = client.prepareSearch();
            searchRequest.setQuery(new MatchAllQueryBuilder());
            searchRequest.setSize(10_000);
            searchRequest.setTypes(repositoryType);
            SearchResponse searchResponse = client.search(searchRequest);
            SearchResult searchResult = mapResponse(searchResponse, HitMapper.DEFAULT_MAPPER);
            REPOSITORIES.put(repositoryType, searchResult.getDocs());
        }
    }

    private static SearchResult mapResponse(SearchResponse searchResponse, Mapper mapper) {
        SearchHits hits = searchResponse.getHits();
        DocMap result = new DocMap();
        for (SearchHit hit : hits)
            result.put(hit.getId(), mapper.mapHit(hit));
        FacetResult facets = new FacetResult(searchResponse.getAggregations());
        return new SearchResult(hits.totalHits(), result, facets);
    }
}
