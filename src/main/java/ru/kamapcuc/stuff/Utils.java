package ru.kamapcuc.stuff;


import java.util.HashMap;
import java.util.Map;
import java.util.stream.Stream;

public class Utils {

    public static Map<String, String> castParams(Map params) {
        Map<String, String> result = new HashMap<>();
        Stream<?> entrySet = params.entrySet().stream();
        entrySet.filter(obj -> obj instanceof Map.Entry).forEach(obj -> {
            Map.Entry entry = (Map.Entry) obj;
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (key instanceof String && value instanceof String[]) {
                String keySting = (String) key;
                String[] valueString = (String[]) value;
                if (valueString.length > 0)
                    result.put(keySting, valueString[0]);
            }
        });
        return result;
    }

}