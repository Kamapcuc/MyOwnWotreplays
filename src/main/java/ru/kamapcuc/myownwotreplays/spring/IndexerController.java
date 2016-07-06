package ru.kamapcuc.myownwotreplays.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.kamapcuc.myownwotreplays.parser.Indexer;

@Controller
public class IndexerController {

    private Indexer indexer = Indexer.getInstance();

    @ResponseBody
    @RequestMapping("/indexer_state.do")
    public String indexerState() {
        return String.format("{'completed': %d, 'total': %d}", indexer.getCompleted(), indexer.getTotal());
    }

}
