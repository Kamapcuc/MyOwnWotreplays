package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;

public class Controller {

    public Controller() {
        Client client = connect();
        Indexer indexer = new Indexer(client);
        new Thread(indexer).start();
        //client.close();
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
