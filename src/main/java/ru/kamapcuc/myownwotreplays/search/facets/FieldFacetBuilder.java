package ru.kamapcuc.myownwotreplays.search.facets;

import java.util.Map;

public class FieldFacetBuilder extends FacetBuilder {

    public FieldFacetBuilder(String name, String field) {
        super(name, field);
    }

    @Override
    public Facet getFacet(Map params) {
        String[] selectedValues = null;
        String[] paramValue = (String[]) params.get(field);
        if (paramValue != null)
            selectedValues = paramValue[0].split(",");
        return new FieldFacet(this, selectedValues);
    }

}