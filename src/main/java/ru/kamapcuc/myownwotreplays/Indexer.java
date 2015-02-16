package ru.kamapcuc.myownwotreplays;


import org.elasticsearch.action.index.IndexRequestBuilder;
import ru.kamapcuc.myownwotreplays.parser.FileParser;
import ru.kamapcuc.myownwotreplays.search.Config;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;

import java.io.File;
import java.util.Arrays;
import java.util.Map;
import java.util.stream.Stream;

public class Indexer implements Runnable {

    private volatile long completed;
    private final long total;

    private final Stream<File> filesToIndex;

    private ElasticClient client = ElasticClient.getInstance();
    private FileParser parser = new FileParser();

    private Indexer() {
        File[] allReplays = new File(Config.getReplaysPath()).listFiles();
        if (allReplays == null) {
            filesToIndex = Stream.empty();
            total = 0;
        } else {
            filesToIndex = Arrays.stream(allReplays);
            total = allReplays.length;
        }
        completed = 0;
        new Thread(this).start();
        //bzzz
    }

    @Override
    public void run() {
        filesToIndex.forEach(file -> {
            if (!file.isDirectory() && file.getName().endsWith(".wotreplay")) {
                Map<String, Object> doc = parser.parse(file);
                if (doc != null) {
                    IndexRequestBuilder indexRequest = client.prepareIndex(Config.REPLAYS_INDEX_NAME, Config.BATTLE_TYPE_NAME);
                    indexRequest.setId(file.getName());
                    indexRequest.setSource(doc);
                    indexRequest.execute();
                } else
                    System.out.println(String.format("Failed to parse %s", file.getName()));
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
