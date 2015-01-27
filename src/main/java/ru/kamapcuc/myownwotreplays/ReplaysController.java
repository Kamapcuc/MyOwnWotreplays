package ru.kamapcuc.myownwotreplays;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
public class ReplaysController {

    @Autowired
    private Client client;
    @Autowired
    private Indexer indexer;
    @Autowired
    private ReplaysParser parser;

    @RequestMapping("/")
    public String search(ModelMap model) {
        model.addAttribute("indexer", indexer);
        SearchRequestBuilder searchRequest = client.prepareSearch(Indexer.REPLAYS_INDEX_NAME);
        searchRequest.setQuery(new MatchAllQueryBuilder());
        searchRequest.setTypes(Indexer.BATTLE_TYPE_NAME);
        SearchResponse response = searchRequest.execute().actionGet();

        try {
            model.put("battles", parser.stringify(response.getHits().getHits()));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "search";
    }

}
