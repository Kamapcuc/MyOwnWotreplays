package ru.kamapcuc.myownwotreplays.spring;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.kamapcuc.myownwotreplays.base.Consts;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.ElasticClient;
import ru.kamapcuc.myownwotreplays.elastic.SearchResult;
import ru.kamapcuc.myownwotreplays.search.ReplaysRequest;
import ru.kamapcuc.myownwotreplays.search.SortType;
import ru.kamapcuc.myownwotreplays.view.BattleMapper;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class ReplaysController {

    private final static ElasticClient client = ElasticClient.getInstance();

    @RequestMapping({"/", "**/search.do"})
    public String search(HttpServletRequest httpRequest, ModelMap model) {
        model.put("battlesData", search(httpRequest));
        model.put("sortTypes", SortType.values());
        model.put("defaultSort", Consts.DEFAULT_SORT);
        model.put("defaultOrder", Consts.DEFAULT_ORDER);
        model.put("facetsData", ReplaysRequest.FACETS.getInfo());
        model.put("paginationSize", Consts.PAGINATION_SIZE);
        return "search";
    }

    @RequestMapping("**/view.do")
    public String view(HttpServletRequest httpRequest, ModelMap model) {
        String id = httpRequest.getParameter("id");
        if (id != null) {
            Doc battle = client.get(Consts.BATTLE_TYPE_NAME, id);
            model.put("battle", new BattleMapper().mapHit(battle));
        }
        return "view";
    }

    @ResponseBody
    @RequestMapping({"**/search_ajax.do", "**/paginate.do"})
    public String searchAjax(HttpServletRequest httpRequest) {
        return search(httpRequest);
    }

    private String search(HttpServletRequest httpRequest) {
        SearchResult searchResult = client.search(new ReplaysRequest(httpRequest));
        BattleMapper battleMapper = new BattleMapper();
        searchResult.getDocs().forEach(battleMapper::mapHit);
        return searchResult.toJson();
    }

    @RequestMapping("/start_replay.do")
    public ResponseEntity<String> startReplay(HttpServletRequest httpRequest) throws Exception {
        try {
            String[] cmdArray = new String[2];
            cmdArray[0] = Consts.getWotExePath();
            cmdArray[1] = Consts.getReplaysPath() + '\\' + httpRequest.getParameter("file_name");
            Runtime.getRuntime().exec(cmdArray);
            return new ResponseEntity<>("Started", HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>("Unable to start replay", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}