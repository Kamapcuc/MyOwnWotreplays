package ru.kamapcuc.myownwotreplays.elastic;

import org.json.JSONObject;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class Doc2 extends JSONObject {

    public Doc2(Map<String, Object> source) {
        super();
        try {
            Field f = JSONObject.class.getDeclaredField("map");
            f.setAccessible(true);
            f.set(this, new Source(source));
        } catch (NoSuchFieldException | IllegalArgumentException | IllegalAccessException ignored) {
        }
    }

    private class Source extends HashMap<String, Object> {

        public Source(Map<? extends String, ?> m) {
            super(m);
        }

        @Override
        public Object get(Object key) {
            Object value = super.get(key);
            if (key instanceof String && ((String) key).endsWith("_i18n"))
                return ((Map) value).get(Locale.ENGLISH.getLanguage());
            else
                return value;
        }

    }

}