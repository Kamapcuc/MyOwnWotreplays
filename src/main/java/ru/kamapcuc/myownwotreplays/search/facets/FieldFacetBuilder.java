package ru.kamapcuc.myownwotreplays.search.facets;

import java.util.Map;

public class FieldFacetBuilder extends FacetBuilder {

    public FieldFacetBuilder(String name, String field) {
        super(name, field);
    }

    @Override
    public Facet getFacet(Map params) {
        return new FieldFacet(this, params.get(field));
    }

}
