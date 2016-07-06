package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.action.get.GetRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.index.get.GetField;
import org.elasticsearch.node.Node;
import ru.kamapcuc.myownwotreplays.base.Consts;

import java.io.IOException;

public class ElasticClient {

    private final static String SETTINGS = "/elasticsearch.yml";

    private final Client client;

    private ElasticClient() {
        client = createNode();
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        client.admin().cluster().health(health).actionGet();
    }

    public IndexRequestBuilder prepareIndex(String type) {
        return client.prepareIndex(Consts.INDEX_NAME, type);
    }

    public SearchResult search(Request request) {
        SearchResponse response = client.search(request.getRequest()).actionGet();
        return new SearchResult(response, request.getFacets());
    }

    public Doc get(String type, String id) {
        GetRequestBuilder getRequest = client.prepareGet();
        getRequest.setIndex(Consts.INDEX_NAME);
        getRequest.setType(type);
        getRequest.setId(id);
        getRequest.setRouting(id);
        getRequest.setFields(Consts.SOURCE_FIELD, Consts.PARENT_FIELD);
        GetResponse response = getRequest.execute().actionGet();
        GetField parentField = response.getFields().get(Consts.PARENT_FIELD);
        String parent = (parentField == null) ? null : (String) parentField.getValue();
        return new Doc(response.getId(), parent, response.getSource());
    }

    private Settings getSettings() throws IOException {
        Settings.Builder settings = Settings.builder();
        settings.loadFromStream(SETTINGS, ElasticClient.class.getResourceAsStream(SETTINGS));
        String path = Consts.getElasticDataPath();
        settings.put("path.data", path);
        settings.put("path.home", path);
        return settings.build();
    }

    private Client createNode() {
//        NodeBuilder nodebuilder = new NodeBuilder();
//        nodebuilder.settings(getSettings());
        Node node = null;
        try {
            node = new Node(getSettings());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
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
