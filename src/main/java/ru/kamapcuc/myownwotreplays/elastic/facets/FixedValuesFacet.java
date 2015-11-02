package ru.kamapcuc.myownwotreplays.elastic.facets;

import java.util.LinkedHashMap;
import java.util.List;

public class FixedValuesFacet extends FieldFacet {

    private final List<?> values;

    public FixedValuesFacet(String field, String code, List<?> values) {
        super(field, code);
        this.values = values;
    }

    @Override
    public Object getValues() {
        LinkedHashMap<Object, Object> values = new LinkedHashMap<>();
        for (Object value : this.values)
            values.put(value, value);
        return values;
    }

}
