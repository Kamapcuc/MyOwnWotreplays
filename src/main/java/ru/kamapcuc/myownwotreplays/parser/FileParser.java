package ru.kamapcuc.myownwotreplays.parser;

import org.codehaus.jackson.map.ObjectMapper;
import ru.kamapcuc.myownwotreplays.parser.ReplaysParser;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class FileParser {

    private final static String RX = "\u0000\u0000";
    private final ObjectMapper mapper = new ObjectMapper();

    public Map<String, Object> parse(File file) {
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String data = reader.readLine();
            if (data.length() == 8) {
                data = reader.readLine().substring(3);
            } else
                data = data.substring(12);
            return parse(data);
        } catch (IOException e) {
            return null;
        }
    }

    private Map<String, Object> parse(String data) {
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
        if (startInfo != null) {
            ReplaysParser doc = new ReplaysParser(startInfo, endInfo);
            return doc.buildDoc();
        } else
            return null;
    }

}