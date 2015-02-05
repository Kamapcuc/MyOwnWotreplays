package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;

public enum SortType {

    DATE("battleDate", "по дате"),
    DMG("damageDealt", "по урону"),
    XP("originalXP", "по опыту"),
    CASH("originalCredits", "по кредитам"),
    KILLS("kills", "по фрагам");

    private final String field;
    private final String description;

    public final static SortType DEFAULT_SORT = SortType.DATE;
    public final static SortOrder DEFAULT_ORDER = SortOrder.DESC;

    private SortType(String field, String name) {
        this.field = field;
        this.description = name;
    }

    public FieldSortBuilder getSort() {
        return new FieldSortBuilder(field);
    }

    @SuppressWarnings("unused")
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

}

