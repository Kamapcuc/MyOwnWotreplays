package ru.kamapcuc.myownwotreplays.elastic.mappers;

import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.search.SearchHit;
import ru.kamapcuc.myownwotreplays.elastic.Doc;

public interface Mapper {

    Doc mapHit(SearchHit hit);
    Doc mapHit(GetResponse hit);

}
