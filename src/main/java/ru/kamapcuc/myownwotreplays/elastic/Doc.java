package ru.kamapcuc.myownwotreplays.elastic;

import org.springframework.context.i18n.LocaleContextHolder;
import ru.kamapcuc.myownwotreplays.Config;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class Doc extends AbstractDoc {

    public final static String ID_FIELD = "_id";
    public final static String PARENT_FIELD = "_parent";
    public final static String SOURCE_FIELD = "_source";

    public Doc(Map<String, Object> source) {
        super(source);
    }

    public String getId() {
        return (String) super.get(ID_FIELD);
    }

    public Doc getParent() {
        return (Doc) super.get(PARENT_FIELD);
    }

    private Object getLocalized(Map langMap) {
        Object result = langMap.get(LocaleContextHolder.getLocale().getLanguage());
        if (result != null)
            return result;
        else
            return langMap.get(Config.DEFAULT_LOCALE.getLanguage());
    }

    private String formatDate(Date value) {
        DateFormat localizedFormat = new SimpleDateFormat("dd MMM yyyy kk:mm", LocaleContextHolder.getLocale());
        return localizedFormat.format(value);
    }

    public Object get(String paramName) {
        Object value = super.get(paramName);
        if (paramName.endsWith("_i18n"))
            return getLocalized((Map) value);
        else if (value instanceof Date)
            return formatDate((Date) value);
        else
            return value;
    }

}
