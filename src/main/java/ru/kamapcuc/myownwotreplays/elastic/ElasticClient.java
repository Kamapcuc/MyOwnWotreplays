package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;
import org.elasticsearch.search.SearchHit;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class ElasticClient {

    private final Client client;

    private ElasticClient() {
        client = connect();
    }

    public Client getClient() {
        return client;
    }

    public Map<String, Doc> getDataType(String typeName){
        Map<String, Doc> result = new HashMap<>();

        SearchRequestBuilder searchRequest = client.prepareSearch(Config.DATA_INDEX_NAME);
        searchRequest.setQuery(new MatchAllQueryBuilder());
        searchRequest.setSize(10_000);
        searchRequest.setTypes(typeName);
        SearchResponse response = searchRequest.execute().actionGet();
        SearchHit[] hits =  response.getHits().getHits();
        Arrays.stream(hits).forEach(hit -> result.put(hit.getId(), new Doc(hit)));

        return result;
    }

    @SuppressWarnings("unused")
    private static Client createNode() {
        ImmutableSettings.Builder settings = ImmutableSettings.settingsBuilder();
        settings.loadFromClasspath("main/resources/elasticsearch.yml");
        NodeBuilder nodebuilder = new NodeBuilder();
        nodebuilder.settings(settings);
        Node node = nodebuilder.node();
        node.start();
        Client client = node.client();
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        client.admin().cluster().health(health).actionGet();
        return client;
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
