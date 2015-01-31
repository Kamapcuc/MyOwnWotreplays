package ru.kamapcuc.stuff;


public class Utils {

    public static Object coalesce(Object... items) {
        for (Object i : items)
            if (i != null)
                return i;
        return null;
    }

}
