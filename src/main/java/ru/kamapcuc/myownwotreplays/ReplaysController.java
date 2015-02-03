package ru.kamapcuc.myownwotreplays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.kamapcuc.myownwotreplays.elastic.SearchResult;
import ru.kamapcuc.myownwotreplays.search.ReplaysRequest;
import ru.kamapcuc.myownwotreplays.search.SortType;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class ReplaysController {

    private Indexer indexer = Indexer.getInstance();

    @RequestMapping({"/", "/search.do"})
    public String search(HttpServletRequest httpRequest, ModelMap model) {
        model.put("indexer", indexer);
        model.put("sortTypes", SortType.stringify());
        model.put("battlesData", searchInternal(httpRequest));
        return "mainPage";
    }

    @ResponseBody
    @RequestMapping("/search_ajax.do")
    public String searchAjax(HttpServletRequest httpRequest) {
        return searchInternal(httpRequest);
    }

    private String searchInternal(HttpServletRequest httpRequest) {
        Map params = httpRequest.getParameterMap();
        ReplaysRequest requestBuilder = new ReplaysRequest(params);
        SearchResult searchResult = requestBuilder.execute();
        return searchResult.stringify();
    }

}