package ru.kamapcuc.myownwotreplays.search;

import ru.kamapcuc.myownwotreplays.Consts;
import ru.kamapcuc.myownwotreplays.search.facets.FacetBuilder;
import ru.kamapcuc.myownwotreplays.search.facets.RepositoryFacetBuilder;
import ru.kamapcuc.myownwotreplays.search.facets.TankLevelFacetBuilder;

public class ReplaysRequestBuilder {

    public final static FacetBuilder[] FACET_BUILDERS = new FacetBuilder[]{
            new RepositoryFacetBuilder("tankNation", "facet_tank_nation", Consts.NATION_TYPE_NAME),
            new RepositoryFacetBuilder("tankClass", "facet_tank_class", Consts.CLASS_TYPE_NAME),
            new RepositoryFacetBuilder("map", "facet_map", Consts.MAP_TYPE_NAME),
            new TankLevelFacetBuilder("tankLevel", "facet_tank_level")
    };

}