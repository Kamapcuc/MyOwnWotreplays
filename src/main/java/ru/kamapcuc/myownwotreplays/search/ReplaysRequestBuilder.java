package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.index.query.AndFilterBuilder;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.SortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.search.facets.Facet;
import ru.kamapcuc.myownwotreplays.search.facets.FacetBuilder;
import ru.kamapcuc.myownwotreplays.search.facets.RepositoryFacetBuilder;
import ru.kamapcuc.myownwotreplays.search.facets.TankLevelFacetBuilder;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class ReplaysRequestBuilder {

    private final HttpServletRequest params;
    private final List<Facet> facets = new ArrayList<>();

    public final static FacetBuilder[] FACET_BUILDERS = new FacetBuilder[]{
            new RepositoryFacetBuilder("tankNation", "facet_tank_nation", Config.NATION_TYPE_NAME),
            new RepositoryFacetBuilder("tankClass", "facet_tank_class", Config.CLASS_TYPE_NAME),
            new RepositoryFacetBuilder("map", "facet_map", Config.MAP_TYPE_NAME),
            new TankLevelFacetBuilder("tankLevel", "facet_tank_level")
    };

    public ReplaysRequestBuilder(HttpServletRequest params) {
        this.params = params;
        for (FacetBuilder facetBuilder : FACET_BUILDERS)
            facets.add(facetBuilder.getFacet(this.params));
    }

    private SortBuilder getSort() {
        String sortValue = params.getParameter("sortType");
        String orderValue = params.getParameter("sortOrder");
        SortType sort = (sortValue == null)? Config.DEFAULT_SORT : SortType.valueOf(sortValue);
        SortOrder order = (orderValue == null)? Config.DEFAULT_ORDER : SortOrder.valueOf(orderValue);

        SortBuilder result = sort.getSortBuilder();
        result.order(order);
        return result;
    }

    private int getFrom() {
        String page = params.getParameter("page");
        if (page != null) {
            try {
                int pageNum = Integer.valueOf(page);
                return (pageNum - 1) * Config.PAGINATION_SIZE;
            } catch (NumberFormatException ignored) {
            }
        }
        return 0;
    }

    private FilterBuilder getFilter() {
        List<FilterBuilder> filters = new ArrayList<>();
        for (Facet facet : facets) {
            FilterBuilder filter = facet.getFilter();
            if (filter != null)
                filters.add(filter);
        }

        if (filters.size() > 0) {
            AndFilterBuilder andFilter = new AndFilterBuilder();
            filters.forEach(andFilter::add);
            return andFilter;
        } else
            return null;
    }

    private SearchSourceBuilder getSearchRequest() {
        SearchSourceBuilder source = new SearchSourceBuilder();
        source.query(new MatchQueryBuilder("haveResults", true));
        source.fetchSource(null, new String[]{"allies", "enemies", "battleEfficiency"});
        source.sort(getSort());
        source.postFilter(getFilter());
        source.size(Config.PAGINATION_SIZE);
        source.from(getFrom());
        return source;
    }

    public SearchSourceBuilder fullSearch() {
        SearchSourceBuilder request = getSearchRequest();
        facets.stream().forEach(facet -> {
            AggregationBuilder aggregation = facet.getFacet(facets);
            request.aggregation(aggregation);
        });
        return request;
    }

    public SearchSourceBuilder paginate() {
        return getSearchRequest();
    }

}