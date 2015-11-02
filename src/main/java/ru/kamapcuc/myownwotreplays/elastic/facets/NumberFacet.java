package ru.kamapcuc.myownwotreplays.elastic.facets;

import java.util.LinkedHashMap;

public class NumberFacet extends FieldFacet {

    private final int[] values;

    public NumberFacet(String field, String code, int[] values) {
        super(field, code);
        this.values = values;
//        Range.closedOpen(0, 10).boxed().collect(Collectors.toList())
    }

    @Override
    public Object getValues() {
        LinkedHashMap<String, String> values = new LinkedHashMap<>();
        for (Integer i : this.values)
            values.put(String.valueOf(i), String.valueOf(i));
        return values;
    }

}
