package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.action.get.GetRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.index.get.GetField;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHitField;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import ru.kamapcuc.myownwotreplays.Config;

import java.util.ArrayList;
import java.util.List;

public class ElasticClient {

    private final static String PARENT_FIELD = "_parent";
    private final static String SOURCE_FIELD = "_source";

    private final Client client;

    private ElasticClient() {
        client = createNode();
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        client.admin().cluster().health(health).actionGet();
    }

    public SearchRequestBuilder prepareSearch() {
        SearchRequestBuilder searchRequest = client.prepareSearch(Config.INDEX_NAME);
        searchRequest.addField(PARENT_FIELD);
        searchRequest.addField(SOURCE_FIELD);
        return searchRequest;
    }

    public IndexRequestBuilder prepareIndex(String type) {
        return client.prepareIndex(Config.INDEX_NAME, type);
    }

    public SearchResult search(String type, SearchSourceBuilder source) {
        source.fields(PARENT_FIELD, SOURCE_FIELD);
        SearchRequest result = new SearchRequest();
        result.indices(Config.INDEX_NAME);
        result.types(type);
        result.source(source);

        SearchResponse response = client.search(result).actionGet();
        SearchHits hits = response.getHits();
        List<Doc> docs = new ArrayList<>();
        for (SearchHit hit : hits) {
            SearchHitField parentField = hit.getFields().get(PARENT_FIELD);
            String parent = (parentField == null) ? null : parentField.getValue();
            docs.add(new Doc(hit.getId(), parent, hit.getSource()));
        }
        FacetResult facets = new FacetResult(response.getAggregations());
        return new SearchResult(hits.totalHits(), docs, facets);
    }

    public Doc get(String type, String id) {
        GetRequestBuilder getRequest = client.prepareGet();
        getRequest.setIndex(Config.INDEX_NAME);
        getRequest.setType(type);
        getRequest.setId(id);
        getRequest.setRouting("0"); //TODO
        getRequest.setFields(SOURCE_FIELD, PARENT_FIELD);
        GetResponse response = getRequest.execute().actionGet();
        GetField parentField = response.getFields().get(PARENT_FIELD);
        Object parent = (parentField == null) ? null : parentField.getValue();
        return new Doc(response.getId(), parent, response.getSource());
    }

    private static Client createNode() {
        ImmutableSettings.Builder settings = ImmutableSettings.settingsBuilder();
        settings.loadFromClasspath("/elasticsearch.yml");
        settings.put("path.data", Config.getElasticDataPath());
        NodeBuilder nodebuilder = new NodeBuilder();
        nodebuilder.settings(settings.build());
        Node node = nodebuilder.node();
        node.start();
        return node.client();
    }

//    private static Client connect() {
//        TransportClient transportClient = new TransportClient();
//        transportClient.addTransportAddress(new InetSocketTransportAddress("localhost", 9300));
//        return transportClient;
//    }

    private static volatile ElasticClient instance;

    public static ElasticClient getInstance() {
        ElasticClient localInstance = instance;
        if (localInstance == null)
            synchronized (ElasticClient.class) {
                localInstance = instance;
                if (localInstance == null)
                    instance = localInstance = new ElasticClient();
            }
        return localInstance;
    }

}
