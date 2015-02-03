package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;

import java.io.IOException;

public enum SortType implements ToXContent {

    DATE("battleDate", "по дате"),
    DMG("damageDealt", "по урону"),
    XP("originalXP", "по опыту"),
    CASH("originalCredits", "по кредитам"),
    KILLS("kills", "по фрагам");

    private final String field;
    private final String description;

    private final static SortType DEFAULT_SORT = SortType.DATE;
    private final static SortOrder DEFAULT_ORDER = SortOrder.DESC;

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

    public static SortType getSortType(String value) {
        if (value != null)
            return valueOf(value);
        else
            return DEFAULT_SORT;
    }

    public static SortOrder getSortOrder(String value) {
        if (value != null)
            return SortOrder.valueOf(value);
        else
            return DEFAULT_ORDER;
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
            return null;
        }
    }

}

