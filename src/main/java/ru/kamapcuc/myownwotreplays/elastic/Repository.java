package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Repository extends LinkedHashMap<String, Doc> {

    private static final Map<String, Repository> repositories = new ConcurrentHashMap<>();

    private static final SearchSourceBuilder getAllQuery;

    static {
        getAllQuery = new SearchSourceBuilder();
        getAllQuery.query(new MatchAllQueryBuilder());
        getAllQuery.size(10_000);
    }

    private Repository(String typeName) {
        SearchResult searchResult = ElasticClient.getInstance().search(typeName, getAllQuery);
        searchResult.getDocs().forEach(doc -> this.put(doc.getId(), doc));
    }

    public static Repository getDocs(String typeName) {
        if (!repositories.containsKey(typeName))
            repositories.put(typeName, new Repository(typeName));
        return repositories.get(typeName);
    }

}
