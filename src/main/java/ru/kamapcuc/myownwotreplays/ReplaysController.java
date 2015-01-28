package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.xcontent.ToXContent;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.search.SearchHit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kamapcuc.myownwotreplays.search.RequestBuilder;
import ru.kamapcuc.myownwotreplays.search.SortType;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;

@Controller
public class ReplaysController {

    private RequestBuilder requestBuilder = RequestBuilder.getInstance();
    private Indexer indexer = Indexer.getInstance();

    @RequestMapping("/")
    public String search(HttpServletRequest httpRequest, ModelMap model) {
        model.addAttribute("indexer", indexer);
        model.addAttribute("sortTypes", SortType.toXContent());
        SearchRequestBuilder searchRequest = requestBuilder.buildRequest(httpRequest.getParameterMap());
        SearchResponse response = searchRequest.execute().actionGet();

        try {
            model.put("battles", stringify(response.getHits().getHits()));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "search";
    }

    public String stringify(SearchHit[] hits) throws IOException {
        XContentBuilder builder = XContentFactory.jsonBuilder();
        builder.startArray();
        Arrays.stream(hits).forEach((hit) -> {
            try {
                hit.toXContent(builder, ToXContent.EMPTY_PARAMS);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        builder.endArray();
        builder.close();
        return builder.string();
    }

}
