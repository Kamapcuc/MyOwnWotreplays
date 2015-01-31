package ru.kamapcuc.stuff;


public class Utils {

    public static <T> T coalesce(T... items) {
        for (T i : items)
            if (i != null)
                return i;
        return null;
    }

}
