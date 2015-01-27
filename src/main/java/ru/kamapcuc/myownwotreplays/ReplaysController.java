package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kamapcuc.myownwotreplays.elastic.RequestBuilder;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class ReplaysController {

    private RequestBuilder requestBuilder = RequestBuilder.getInstance();
    private Indexer indexer = Indexer.getInstance();
    private ReplaysParser parser = ReplaysParser.getInstance();

    @RequestMapping("/")
    public String search(HttpServletRequest httpRequest, ModelMap model) {
        model.addAttribute("indexer", indexer);
        SearchRequestBuilder searchRequest = requestBuilder.buildRequest(httpRequest);
        SearchResponse response = searchRequest.execute().actionGet();

        try {
            model.put("battles", parser.stringify(response.getHits().getHits()));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "search";
    }

}
