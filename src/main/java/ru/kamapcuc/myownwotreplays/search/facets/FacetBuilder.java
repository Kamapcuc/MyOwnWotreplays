package ru.kamapcuc.myownwotreplays.search.facets;

import java.util.Map;

public abstract class FacetBuilder {

    protected final String name;
    protected final String field;

    public FacetBuilder(String name, String field) {
        this.name = name;
        this.field = field;
    }

    public abstract Facet getFacet(Map<String, String> params);

}
