package ru.kamapcuc.myownwotreplays.base;

import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.search.SortType;

import java.util.Locale;

public class Consts {

    public final static String ID_FIELD = "_id";
    public final static String UID_FIELD = "_uid";
    public final static String PARENT_FIELD = "_parent";
    public final static String SOURCE_FIELD = "_source";

    public final static Locale DEFAULT_LOCALE = Locale.ENGLISH;

    public final static int PAGINATION_SIZE = 9;

    public final static SortType DEFAULT_SORT = SortType.DATE;
    public final static SortOrder DEFAULT_ORDER = SortOrder.DESC;

    public final static String INDEX_NAME = "replays";

    public final static String BATTLE_TYPE_NAME = "battle";
    public final static String TANK_TYPE_NAME = "tank";
    public final static String MAP_TYPE_NAME = "map";
    public final static String CLASS_TYPE_NAME = "class";
    public final static String NATION_TYPE_NAME = "nation";
    public final static String LANGUAGE_TYPE_NAME = "language";
    public final static String MEDAL_TYPE_NAME = "medal";

    public static String getReplaysPath() {
        return System.getProperty("replaysPath");
    }

    public static String getElasticDataPath() {
        return System.getProperty("dataPath");
    }

}