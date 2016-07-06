package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortBuilder;
import ru.kamapcuc.myownwotreplays.base.Translator;

public enum SortType {

    DATE("battleDate", "sort_date"),
    DMG("damageDealt", "sort_dmg"),
    XP("originalXP", "sort_xp"),
    CASH("originalCredits", "sort_cash"),
    KILLS("kills", "sort_kills");

    private final String field;
    private final String code;

    SortType(String field, String code) {
        this.field = field;
        this.code = code;
    }

    public SortBuilder getSortBuilder() {
        return new FieldSortBuilder(field);
    }

    public String getName() {
        return Translator.translate(code);
    }

}

