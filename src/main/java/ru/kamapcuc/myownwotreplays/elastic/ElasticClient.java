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
import org.elasticsearch.index.get.GetField;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHitField;
import org.elasticsearch.search.SearchHits;
import ru.kamapcuc.myownwotreplays.Config;

import java.util.ArrayList;
import java.util.List;

public class ElasticClient {

    public final static String ID_FIELD = "_id";
    public final static String PARENT_FIELD = "_parent";
    public final static String SOURCE_FIELD = "_source";

    private final Client client;

    private ElasticClient() {
        client = createNode();
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        client.admin().cluster().health(health).actionGet();
    }

    public SearchRequestBuilder prepareSearch() {
        SearchRequestBuilder searchRequest = client.prepareSearch(Config.REPLAYS_INDEX_NAME);
        searchRequest.addField(SOURCE_FIELD);
        searchRequest.addField(PARENT_FIELD);
        return searchRequest;
    }

    public IndexRequestBuilder prepareIndex(String index, String type) {
        return client.prepareIndex(index, type);
    }

    public SearchResult search(SearchRequestBuilder searchRequest) {
        SearchResponse response = searchRequest.execute().actionGet();
        SearchHits hits = response.getHits();
        List<Doc> result = new ArrayList<>();
        for (SearchHit hit : hits) {

            SearchHitField parentField = hit.getFields().get(PARENT_FIELD);
            String parent = (parentField == null)? null : parentField.getValue();
            result.add(new Doc(hit.getId(), parent, hit.getSource()));
        }
        FacetResult facets = new FacetResult(response.getAggregations());
        return new SearchResult(hits.totalHits(), result, facets);
    }

    public Doc get(String index, String type, String id) {
        GetRequestBuilder getRequest = client.prepareGet();
        getRequest.setIndex(index);
        getRequest.setType(type);
        getRequest.setId(id);
        getRequest.setRouting("0"); //TODO
        getRequest.setFields(SOURCE_FIELD, PARENT_FIELD);
        GetResponse response = getRequest.execute().actionGet();
        GetField parentField = response.getFields().get(PARENT_FIELD);
        Object parent = (parentField == null)? null : parentField.getValue();
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
