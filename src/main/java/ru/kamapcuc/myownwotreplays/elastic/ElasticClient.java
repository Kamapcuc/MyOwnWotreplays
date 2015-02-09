package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.action.get.GetRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import ru.kamapcuc.myownwotreplays.search.Config;

public class ElasticClient {

    private final Client client;

    private ElasticClient() {
        client = connect();
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        client.admin().cluster().health(health).actionGet();
    }

    public SearchRequestBuilder prepareSearch(String index) {
        return client.prepareSearch(index);
    }

    public IndexRequestBuilder prepareIndex(String index, String type) {
        return client.prepareIndex(index, type);
    }

    public SearchResult search(SearchRequestBuilder searchRequest) {
        SearchResponse response = searchRequest.execute().actionGet();
        SearchHits hits = response.getHits();
        DocMap result = new DocMap();
        for (SearchHit hit : hits)
            result.put(hit.getId(), new Doc(hit));
        FacetResult facets = new FacetResult(response.getAggregations());
        return new SearchResult(hits.totalHits(), result, facets);
    }

    public Doc get(String index, String type, String id) {
        GetRequestBuilder getRequest = client.prepareGet();
        getRequest.setIndex(index);
        getRequest.setType(type);
        getRequest.setId(id);
        GetResponse getResponse = getRequest.execute().actionGet();
        return new Doc(getResponse);
    }

    @SuppressWarnings("unused")
    private static Client createNode() {
        ImmutableSettings.Builder settings = ImmutableSettings.settingsBuilder();
        settings.loadFromClasspath("main/resources/elasticsearch.yml");
        settings.put("path.data", Config.getElasticDataPath());
        NodeBuilder nodebuilder = new NodeBuilder();
        nodebuilder.settings(settings);
        Node node = nodebuilder.node();
        node.start();
        return node.client();
    }

    /* for debug */
    private static Client connect() {
        TransportClient transportClient = new TransportClient();
        transportClient.addTransportAddress(new InetSocketTransportAddress("localhost", 9300));
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        transportClient.admin().cluster().health(health).actionGet();
        return transportClient;
    }

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
