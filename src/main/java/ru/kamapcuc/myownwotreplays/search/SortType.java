package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;

import java.io.IOException;

@SuppressWarnings("unused")
public enum SortType implements ToXContent {

    DATE("battleDate", "по дате"),
    DMG("damageDealt", "по урону"),
    XP("originalXP", "по опыту"),
    CASH("originalCredits", "по кредитам"),
    KILLS("kills", "по фрагам");

    private final String field;
    private final String description;

    private SortType(String field, String name) {
        this.field = field;
        this.description = name;
    }

    public FieldSortBuilder getSort() {
        return new FieldSortBuilder(field);
    }

    public String getDescription() {
        return description;
    }

    public static SortType getSortType(String[] value) {
        if (value != null )
            return valueOf(value[0]);
        else
            return SortType.DATE;
    }

    public static SortOrder getSortOrder(String[] value) {
        if (value != null)
            return SortOrder.valueOf(value[0]);
        else
            return SortOrder.DESC;
    }

    @Override
    public XContentBuilder toXContent(XContentBuilder builder, Params params) throws IOException {
        builder.startObject();
        builder.field("name", name());
        builder.field("description", getDescription());
        builder.endObject();
        return builder;
    }

    public static String stringify() {
        try {
            XContentBuilder builder = XContentFactory.jsonBuilder();
            builder.startArray();
            for (SortType sortType : values())
                sortType.toXContent(builder, ToXContent.EMPTY_PARAMS);
            builder.endArray();
            builder.close();
            return builder.string();
        } catch (IOException e) {
            return "[]";
        }
    }

}

