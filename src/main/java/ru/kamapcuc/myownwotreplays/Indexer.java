package ru.kamapcuc.myownwotreplays;


import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.client.Client;
import ru.kamapcuc.myownwotreplays.elastic.Config;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.Stream;

public class Indexer implements Runnable {

    private volatile long completed;
    private final long total;

    private final Stream<File> filesToIndex;

    private Client client = ElasticClient.getInstance().getClient();
    private ReplaysParser parser = ReplaysParser.getInstance();

    private static String getPath() {
        return System.getProperty("replaysPath");
    }

    private Indexer() {
        File[] allReplays = new File(getPath()).listFiles();
        if (allReplays == null) {
            filesToIndex = Stream.empty();
            total = 0;
        } else {
            filesToIndex = Arrays.stream(allReplays);
            total = allReplays.length;
        }
        completed = 0;
        new Thread(this).start();
    }

    @Override
    public void run() {
        filesToIndex.forEach(file -> {
            if (!file.isDirectory() && file.getName().endsWith(".wotreplay")) {
                try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                    String data = reader.readLine();
                    if (data.length() == 8) {
                        data = reader.readLine().substring(3);
                    } else
                        data = data.substring(12);
                    Map<String, Object> doc = parser.parse(data);
                    if (doc != null) {
                        IndexRequestBuilder indexRequest = client.prepareIndex(Config.REPLAYS_INDEX_NAME, Config.BATTLE_TYPE_NAME);
                        indexRequest.setId(file.getName());
                        indexRequest.setSource(doc);
                        indexRequest.execute();
                    } else
                        System.out.println(String.format("Failed to parse %s", file.getName()));
                } catch (IOException e) {
                    System.exit(0);
                }
            }
            completed++;
        });
    }

    @SuppressWarnings("unused")
    public long getCompleted() {
        return completed;
    }

    @SuppressWarnings("unused")
    public long getTotal() {
        return total;
    }

    private static volatile Indexer instance;

    public static Indexer getInstance() {
        Indexer localInstance = instance;
        if (localInstance == null)
            synchronized (Indexer.class) {
                localInstance = instance;
                if (localInstance == null)
                    instance = localInstance = new Indexer();
            }
        return localInstance;
    }

}
