package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import ru.kamapcuc.myownwotreplays.elastic.DocMap;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;
import ru.kamapcuc.myownwotreplays.elastic.SearchResult;

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
            SearchRequestBuilder searchRequest = client.prepareSearch(Config.DATA_INDEX_NAME);
            searchRequest.setQuery(new MatchAllQueryBuilder());
            searchRequest.setSize(10_000);
            searchRequest.setTypes(repositoryType);
            SearchResult searchResult = client.search(searchRequest);
            REPOSITORIES.put(repositoryType, searchResult.getDocs());
        }
    }

}
