package ru.kamapcuc.myownwotreplays;

import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.search.SearchHit;
import ru.kamapcuc.myownwotreplays.elastic.DataConfig;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReplaysParser {

    private ElasticClient client = ElasticClient.getInstance();

    private final static String RX = "\u0000\u0000";
    private final ObjectMapper mapper = new ObjectMapper();

    private Map<String, Doc> tanksData = null;

    private Map<String, Doc> getTanksData() {
        if (tanksData == null)
            tanksData = client.getDataType(DataConfig.TANK_TYPE_NAME);
        return tanksData;
    }

    private Map<String, Object> getTankSearchInfo(String tankId) {
        Map<String, Object> result = new HashMap<>();
        Doc tank = getTanksData().get(tankId);
        if (tank != null) {
            result.put("id", tank.getId());
            result.put("level", tank.get("level"));
            result.put("nation", tank.get("nation"));
            result.put("class", tank.get("class"));
        }
        return result;
    }

    public Map<String, Object> parse(String data) {
        Map startInfo = null;
        List endInfo = null;
        String[] parts = data.split(RX);
        switch (parts.length) {
            case 3:
            case 2:
                if (parts[1] != null)
                    try {
                        endInfo = mapper.readValue(parts[1], List.class);
                    } catch (IOException ignored) {
                    }
            case 1:
                if (parts[0] != null)
                    try {
                        startInfo = mapper.readValue(parts[0], Map.class);
                    } catch (IOException ignored) {
                    }
        }
        return createDoc(startInfo, endInfo);
    }

    private Map<String, Object> createDoc(Map startInfo, List endInfo) {
        Map<String, Object> document = new HashMap<>();
        if (startInfo != null) {
            document.put("playerName", startInfo.get("playerName"));
            document.put("map", startInfo.get("mapName"));
            String tankInfo = startInfo.get("playerVehicle").toString();
            String tankId = tankInfo.split("-")[1];
            document.put("tank", getTankSearchInfo(tankId));
            if (endInfo != null)
                document.put("test", endInfo.size());
            return document;
        } else
            return null;
    }

    public String stringify(SearchHit[] hits) throws IOException {
        XContentBuilder builder = XContentFactory.jsonBuilder();
        builder.startArray();
        Arrays.stream(hits).forEach((hit) -> {
            try {
                hit.toXContent(builder, ToXContent.EMPTY_PARAMS);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        builder.endArray();
        builder.close();
        return builder.string();
    }

    private static volatile ReplaysParser instance;

    private ReplaysParser() {
    }

    public static ReplaysParser getInstance() {
        ReplaysParser localInstance = instance;
        if (localInstance == null)
            synchronized (ReplaysParser.class) {
                localInstance = instance;
                if (localInstance == null)
                    instance = localInstance = new ReplaysParser();
            }
        return localInstance;
    }

}