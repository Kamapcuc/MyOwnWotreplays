package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Repository extends LinkedHashMap<String, Doc> {

    private static final Map<String, Repository> repositories = new ConcurrentHashMap<>();

    private Repository(String typeName) {
        SearchSourceBuilder source = new SearchSourceBuilder();
        source.query(new MatchAllQueryBuilder());
        source.size(10_000);
        SearchResult searchResult = ElasticClient.getInstance().search(typeName, source);
        searchResult.getDocs().forEach(doc -> put(doc.getId(), doc));
    }

    public static Repository getDocs(String typeName) {
        if (!repositories.containsKey(typeName))
            repositories.put(typeName, new Repository(typeName));
        return repositories.get(typeName);
    }

}
