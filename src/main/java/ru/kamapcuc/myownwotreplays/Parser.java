package ru.kamapcuc.myownwotreplays;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class Parser {

    private final String RX = "\u0000\u0000";
    private final ObjectMapper mapper = new ObjectMapper();

    public Map<String, Object> parse(String data) {
        Map<String, Object> result = null;
        String[] parts = data.split(RX);
        switch (parts.length) {
            case 3:
            case 2:
                String battleFinishInfo = parts[1];
                if (battleFinishInfo != null)
                    try {
                        mapper.readValue(battleFinishInfo, List.class);
                    } catch (IOException ignored) {
                    }
            case 1:
                String battleStartInfo = parts[0];
                if (battleStartInfo != null)
                    try {
                        result = mapper.readValue(battleStartInfo, Map.class);
                    } catch (IOException ignored) {
                    }
        }
        return result;
    }

}
