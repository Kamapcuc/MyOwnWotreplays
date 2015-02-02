package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.kamapcuc.myownwotreplays.elastic.DocMap;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;
import ru.kamapcuc.myownwotreplays.search.RequestBuilder;
import ru.kamapcuc.myownwotreplays.search.SortType;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ReplaysController {

    private Indexer indexer = Indexer.getInstance();
    private ElasticClient client = ElasticClient.getInstance();

    @RequestMapping("/")
    public String mainPage(HttpServletRequest httpRequest, ModelMap model) {
        model.put("indexer", indexer);
        model.put("sortTypes", SortType.toXContent());
        model.put("battlesData", searchInternal(httpRequest));
        return "mainPage";
    }

    @ResponseBody
    @RequestMapping("/search.do")
    public String search(HttpServletRequest httpRequest) {
        return searchInternal(httpRequest);
    }

    private String searchInternal(HttpServletRequest httpRequest) {
        RequestBuilder requestBuilder = new RequestBuilder(httpRequest.getParameterMap());
        SearchRequestBuilder searchRequest = requestBuilder.buildRequest();
        DocMap searchResponse = client.search(searchRequest);
        return searchResponse.stringify();
    }

}
