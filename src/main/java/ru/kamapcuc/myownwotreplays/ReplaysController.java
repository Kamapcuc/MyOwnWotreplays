package ru.kamapcuc.myownwotreplays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.kamapcuc.myownwotreplays.elastic.SearchResult;
import ru.kamapcuc.myownwotreplays.search.ReplaysRequest;
import ru.kamapcuc.myownwotreplays.search.SortType;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Stream;

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
        Map<String, String> params = castParams(httpRequest.getParameterMap());
        ReplaysRequest requestBuilder = new ReplaysRequest(params);
        SearchResult searchResult = requestBuilder.execute();
        return searchResult.stringify();
    }

    private Map<String, String> castParams(Map params) {
        Map<String, String> result = new HashMap<>();
        Stream<?> entrySet = params.entrySet().stream();
        entrySet.filter(obj -> obj instanceof Map.Entry).forEach(obj -> {
            Map.Entry entry = (Map.Entry) obj;
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (key instanceof String && value instanceof String[]) {
                String keySting = (String) key;
                String[] valueString = (String[]) value;
                if (valueString.length > 0)
                    result.put(keySting, valueString[0]);
            }
        });
        return result;
    }

}