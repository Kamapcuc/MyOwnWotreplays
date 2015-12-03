package ru.kamapcuc.myownwotreplays.search;

import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import ru.kamapcuc.myownwotreplays.base.Consts;
import ru.kamapcuc.myownwotreplays.elastic.FacetContainer;
import ru.kamapcuc.myownwotreplays.elastic.Request;
import ru.kamapcuc.myownwotreplays.elastic.facets.Facet;
import ru.kamapcuc.myownwotreplays.elastic.facets.FixedValuesFacet;
import ru.kamapcuc.myownwotreplays.elastic.facets.RepositoryFacet;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class ReplaysRequest extends Request {

    private final HttpServletRequest params;
    public final static FacetContainer FACETS;

    static {
        List<Facet> facetsList = new ArrayList<>();
        facetsList.add(new RepositoryFacet("tankNation", "facet_tank_nation", Consts.NATION_TYPE_NAME));
        facetsList.add(new RepositoryFacet("tankClass", "facet_tank_class", Consts.CLASS_TYPE_NAME));
        facetsList.add(new RepositoryFacet("map", "facet_map", Consts.MAP_TYPE_NAME));
        List<Integer> tankLevels = IntStream.rangeClosed(1, 10).boxed().collect(Collectors.toList());
        facetsList.add(new FixedValuesFacet("tankLevel", "facet_tank_level", tankLevels));
        FACETS = new FacetContainer(facetsList);
    }

    public ReplaysRequest(HttpServletRequest params) {
        this.params = params;
    }

    @Override
    public String getParameter(String name) {
        return params.getParameter(name);
    }

    @Override
    public FacetContainer getFacets() {
        return FACETS;
    }

    @Override
    protected String getType() {
        return Consts.BATTLE_TYPE_NAME;
    }

    @Override
    protected SearchSourceBuilder getQuery() {
        SearchSourceBuilder query = super.getQuery();
        query.query(new MatchQueryBuilder("haveResults", true));
        query.fetchSource(null, new String[]{"allies", "enemies", "battleEfficiency"});
        query.sort(getSort());
        query.sort(new FieldSortBuilder(Consts.UID_FIELD));
        query.size(Consts.PAGINATION_SIZE);
        query.from(getFrom());
        return query;
    }

    private SortBuilder getSort() {
        String sortValue = getParameter("sortType");
        String orderValue = getParameter("sortOrder");
        SortType sort = (sortValue == null)? Consts.DEFAULT_SORT : SortType.valueOf(sortValue);
        SortOrder order = (orderValue == null)? Consts.DEFAULT_ORDER : SortOrder.valueOf(orderValue);

        SortBuilder result = sort.getSortBuilder();
        result.order(order);
        return result;
    }

    private int getFrom() {
        String page = getParameter("page");
        if (page != null) {
            try {
                int pageNum = Integer.valueOf(page);
                return (pageNum - 1) * Consts.PAGINATION_SIZE;
            } catch (NumberFormatException ignored) {
            }
        }
        return 0;
    }

}
