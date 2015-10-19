package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.action.get.GetRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.inject.Singleton;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;
import ru.kamapcuc.myownwotreplays.Config;

@Singleton
public class ElasticClient {

    private final Client client;

    private ElasticClient() {
        client = createNode();
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        client.admin().cluster().health(health).actionGet();
    }

    public SearchRequestBuilder prepareSearch() {
        SearchRequestBuilder searchRequest = client.prepareSearch(Config.REPLAYS_INDEX_NAME);
        searchRequest.addField(Doc.SOURCE_FIELD);
        searchRequest.addField(Doc.PARENT_FIELD);
        return searchRequest;
    }

    public IndexRequestBuilder prepareIndex(String index, String type) {
        return client.prepareIndex(index, type);
    }

    public SearchResponse search(SearchRequestBuilder searchRequest) {
        return searchRequest.execute().actionGet();
    }

    public GetResponse get(String index, String type, String id) {
        GetRequestBuilder getRequest = client.prepareGet();
        getRequest.setIndex(index);
        getRequest.setType(type);
        getRequest.setId(id);
        getRequest.setRouting("0");
        getRequest.setFields(Doc.SOURCE_FIELD, Doc.PARENT_FIELD);
        return getRequest.execute().actionGet();
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

    /* for debug */
    @SuppressWarnings("unused")
    private static Client connect() {
        TransportClient transportClient = new TransportClient();
        transportClient.addTransportAddress(new InetSocketTransportAddress("localhost", 9300));
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
