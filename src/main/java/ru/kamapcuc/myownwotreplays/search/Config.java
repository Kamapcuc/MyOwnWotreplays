package ru.kamapcuc.myownwotreplays.search;

public class Config {

    public volatile static String lang = "ru";
    public volatile static String defaultLang = "ru";

    public final static int PAGINATION_SIZE = 9;

    public final static String REPLAYS_INDEX_NAME = "replays";
    public final static String BATTLE_TYPE_NAME = "battle";

    public final static String DATA_INDEX_NAME = "data";
    public final static String TANK_TYPE_NAME = "tank";
    public final static String MAP_TYPE_NAME = "map";
    public final static String CLASS_TYPE_NAME = "class";
    public final static String NATION_TYPE_NAME = "nation";

    public static String getReplaysPath() {
        return System.getProperty("wotPath") + "replays/";
    }

    public static String getElasticDataPath() {
        return System.getProperty("wotPath") + "MyOwnWotreplays/data/";
    }

}