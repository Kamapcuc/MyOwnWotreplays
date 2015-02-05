package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.kamapcuc.myownwotreplays.elastic.SearchResult;
import ru.kamapcuc.myownwotreplays.search.Config;
import ru.kamapcuc.myownwotreplays.search.ReplaysRequest;
import ru.kamapcuc.myownwotreplays.search.SortType;
import ru.kamapcuc.myownwotreplays.search.facets.FacetBuilder;
import ru.kamapcuc.stuff.Utils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

@Controller
public class ReplaysController {

    private Indexer indexer = Indexer.getInstance();

    @RequestMapping({"/", "/search.do"})
    public String search(HttpServletRequest httpRequest, ModelMap model) {
        model.put("battlesData", searchInternal(httpRequest));
        model.put("indexer", indexer);
        model.put("sortTypes", SortType.values());
        model.put("defaultSort", SortType.DEFAULT_SORT);
        model.put("defaultOrder", SortType.DEFAULT_ORDER);
        model.put("facetsData", getFacetsData());
        return "mainPage";
    }

    @ResponseBody
    @RequestMapping("/search_ajax.do")
    public String searchAjax(HttpServletRequest httpRequest) {
        return searchInternal(httpRequest);
    }

    private String searchInternal(HttpServletRequest httpRequest) {
        Map<String, String> params = Utils.castParams(httpRequest.getParameterMap());
        ReplaysRequest requestBuilder = new ReplaysRequest(params);
        SearchResult searchResult = requestBuilder.execute();
        return searchResult.stringify();
    }

    private String getFacetsData() {
        try {
            XContentBuilder builder = XContentFactory.jsonBuilder();
            builder.startObject();
            for (FacetBuilder facet : Config.FACET_BUILDERS)
                facet.toXContent(builder, ToXContent.EMPTY_PARAMS);
            builder.close();
            return builder.string();
        } catch (IOException e) {
            return null;
        }
    }

}