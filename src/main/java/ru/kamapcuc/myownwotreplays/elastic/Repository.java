package ru.kamapcuc.myownwotreplays.elastic;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Repository extends LinkedHashMap<String, Doc> {

    private static final Map<String, Repository> repositories = new ConcurrentHashMap<>();

    private Repository(String typeName) {
        SearchResult searchResult = ElasticClient.getInstance().search(new GetAllRequest(typeName));
        searchResult.getDocs().forEach(doc -> this.put(doc.getId(), doc));
    }

    public static Repository getDocs(String typeName) {
        if (!repositories.containsKey(typeName))
            repositories.put(typeName, new Repository(typeName));
        return repositories.get(typeName);
    }



}
