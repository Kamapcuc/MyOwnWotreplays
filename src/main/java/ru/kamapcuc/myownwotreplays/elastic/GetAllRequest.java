package ru.kamapcuc.myownwotreplays.elastic;

import org.elasticsearch.index.query.MatchAllQueryBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;

public class GetAllRequest extends Request {

    private final String type;

    public GetAllRequest(String type) {
        this.type = type;
    }

    @Override
    protected String getType() {
        return type;
    }

    @Override
    protected SearchSourceBuilder getQuery() {
        SearchSourceBuilder query = super.getQuery();
        query.query(new MatchAllQueryBuilder());
        query.size(10_000);
        return query;
    }
}
