package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;
import org.elasticsearch.search.SearchHit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
public class ReplaysController {

    private final Client client = connect();
    private final Indexer indexer = new Indexer(client);

    public ReplaysController() {
        new Thread(indexer).start();
    }

    @RequestMapping("/")
    public String search(ModelMap model) {
        model.addAttribute("indexer", indexer);
        SearchRequestBuilder searchRequest = client.prepareSearch(Indexer.REPLAYS_INDEX_NAME);
        searchRequest.setQuery(new MatchAllQueryBuilder());
        searchRequest.setTypes(Indexer.BATTLE_TYPE_NAME);
        SearchResponse response = searchRequest.execute().actionGet();

        try {
            model.put("battles", indexer.parser.stringify(response.getHits().getHits()));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "search";
    }

    private Client createNode() {
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

    private Client connect() {
        TransportClient client = new TransportClient();
        client.addTransportAddress(new InetSocketTransportAddress("localhost", 9300));
        return client;
    }

}
