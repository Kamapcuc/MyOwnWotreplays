package ru.kamapcuc.myownwotreplays;


import org.elasticsearch.action.admin.cluster.health.ClusterHealthRequest;
import org.elasticsearch.client.Client;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.Stream;

public class Indexer implements Runnable {

    private volatile long worked = -1;
    private volatile long count = Long.MAX_VALUE;

    private final Parser parser = new Parser();
    private final Client client;
    private final Stream<File> filesToIndex;

    public Indexer(Client client) {
        this.client = client;
        File[] allReplays = new File("../replays").listFiles();
        if (allReplays == null) {
            filesToIndex = Stream.empty();
            count = 0;
        } else {
            filesToIndex = Arrays.stream(allReplays);
            count = allReplays.length;
        }
        worked = 0;
        init();
    }

    private void init() {
        ClusterHealthRequest health = new ClusterHealthRequest();
        health.waitForYellowStatus();
        client.admin().cluster().health(health).actionGet();
    }

    @Override
    public void run() {
        filesToIndex.forEach((file) -> {
            if (!file.isDirectory() && file.getName().endsWith(".wotreplay")) {
                try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                    Map<String, Object> test;
                    String data = reader.readLine();
                    if (data.length() == 8) {
                        data = reader.readLine();
                        test = parser.parse(data.substring(3));
                    } else
                        test = parser.parse(data.substring(12));

                    if (test == null)
                        System.out.println(String.format("Failed to parse %s", file.getName()));

                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
            worked++;

        });
    }

    public long getWorked() {
        return worked;
    }

    public long getCount() {
        return count;
    }

}
