package ru.kamapcuc.myownwotreplays;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.search.SearchHit;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Parser {

    private final static String RX = "\u0000\u0000";
    private final ObjectMapper mapper = new ObjectMapper();

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
            document.put("mapName", startInfo.get("mapName"));
            document.put("playerVehicle", startInfo.get("playerVehicle"));
            document.put("mapDisplayName", startInfo.get("mapDisplayName"));
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
}