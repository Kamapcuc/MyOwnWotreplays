package ru.kamapcuc.myownwotreplays.search.facets;

import java.util.Map;

public class FieldFacetBuilder extends FacetBuilder {

    public FieldFacetBuilder(String name, String field) {
        super(name, field);
    }

    @Override
    public Facet getFacet(Map<String, String> params) {
        String[] selectedValues = null;
        if (params.containsKey(field))
            selectedValues = params.get(field).split(",");
        return new FieldFacet(this, selectedValues);
    }

}