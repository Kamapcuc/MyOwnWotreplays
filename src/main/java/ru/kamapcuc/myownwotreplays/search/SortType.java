package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.spring.Translator;

public enum SortType {

    DATE("date", "sort_date"),
    DMG("damageDealt", "sort_dmg"),
    XP("originalXP", "sort_xp"),
    CASH("originalCredits", "sort_cash"),
    KILLS("kills", "sort_kills");

    private final String field;
    private final String code;

    public final static SortType DEFAULT_SORT = SortType.DATE;
    public final static SortOrder DEFAULT_ORDER = SortOrder.DESC;

    private SortType(String field, String code) {
        this.field = field;
        this.code = code;
    }

    public FieldSortBuilder getSort() {
        return new FieldSortBuilder(field);
    }

    public String getName() {
        return Translator.translate(code);
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

