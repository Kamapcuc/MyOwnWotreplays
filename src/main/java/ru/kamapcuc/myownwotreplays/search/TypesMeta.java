package ru.kamapcuc.myownwotreplays.search;

import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;

import java.util.HashMap;
import java.util.Map;

public class TypesMeta {

    private final static String[] repositoryTypes = new String[]{
            Config.TANK_TYPE_NAME,
            Config.MAP_TYPE_NAME,
            Config.CLASS_TYPE_NAME,
            Config.NATION_TYPE_NAME
    };

    public final static HashMap<String, Map<String, Doc>> REPOSITORIES = new HashMap<>();

    static {
        ElasticClient client = ElasticClient.getInstance();
        for (String repositoryType : repositoryTypes) {
            Map<String, Doc> x = client.loadDataType(repositoryType);
            REPOSITORIES.put(repositoryType, x);
        }
    }

}
