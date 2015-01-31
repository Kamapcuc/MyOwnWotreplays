package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kamapcuc.myownwotreplays.elastic.DocMap;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;
import ru.kamapcuc.myownwotreplays.search.RequestBuilder;
import ru.kamapcuc.myownwotreplays.search.SortType;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ReplaysController {

    private RequestBuilder requestBuilder = new RequestBuilder();
    private Indexer indexer = Indexer.getInstance();
    private ElasticClient client = ElasticClient.getInstance();

    @RequestMapping("/")
    public String search(HttpServletRequest httpRequest, ModelMap model) {
        model.addAttribute("indexer", indexer);
        model.addAttribute("sortTypes", SortType.toXContent());
        SearchRequestBuilder searchRequest = requestBuilder.buildRequest(httpRequest.getParameterMap());
        DocMap searchResponce = client.search(searchRequest);
        model.put("battles", searchResponce.stringify());
        return "search";
    }

}
