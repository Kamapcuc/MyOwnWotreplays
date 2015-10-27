package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import ru.kamapcuc.myownwotreplays.Config;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class TypesMeta {

    private final static String[] repositoryTypes = new String[]{
            Config.TANK_TYPE_NAME,
            Config.MAP_TYPE_NAME,
            Config.CLASS_TYPE_NAME,
            Config.NATION_TYPE_NAME,
            Config.LANGUAGE_TYPE_NAME,
            Config.MEDAL_TYPE_NAME
    };

    public final static HashMap<String, Map<String, Doc2>> REPOSITORIES = new HashMap<>();

    static {
        ElasticClient client = ElasticClient.getInstance();
        for (String repositoryType : repositoryTypes) {
            SearchRequestBuilder searchRequest = client.prepareSearch();
            searchRequest.setQuery(new MatchAllQueryBuilder());
            searchRequest.setSize(10_000);
            searchRequest.setTypes(repositoryType);
            SearchResult searchResult = client.search(searchRequest);
            LinkedHashMap<String, Doc2> map = new LinkedHashMap<>();
            for (Doc2 doc : searchResult.getDocs()) {
                map.put(doc.getId(), doc);
            }
            REPOSITORIES.put(repositoryType, map);
        }
    }

}
