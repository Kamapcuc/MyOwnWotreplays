package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.node.Node;
import org.elasticsearch.node.NodeBuilder;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public class Main {

    private static Parser parser = new Parser();

    public static AtomicInteger indexed;
    public static AtomicInteger all;

    public static void main(String[] args) {
        ImmutableSettings.Builder settings = ImmutableSettings.settingsBuilder();
        settings.loadFromClasspath("main/resources/elasticsearch.yml");
        NodeBuilder nodebuilder = new NodeBuilder();
        nodebuilder.settings(settings);
        Node node = nodebuilder.node();
        node.start();
        Client client = node.client();
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForGreenStatus();
        //   client.admin().cluster().health(health).actionGet();

        Path replays = Paths.get("../replays");

        try (DirectoryStream<Path> stream = Files.newDirectoryStream(replays)) {
            for (Path entry : stream) {
                if (!Files.isDirectory(entry) && entry.toString().endsWith(".wotreplay")) {

                    try (BufferedReader reader = new BufferedReader(new FileReader(entry.toString()))) {
                        Map<String, Object> test;
                        String data = reader.readLine();
                        if (data.length() == 8) {
                            data = reader.readLine();
                            test = parser.parse(data.substring(3));
                        } else
                            test = parser.parse(data.substring(12));

                        if (test == null)
                            System.out.println(String.format("Failed to parse %s", entry.toFile().getName()));

                    }
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
