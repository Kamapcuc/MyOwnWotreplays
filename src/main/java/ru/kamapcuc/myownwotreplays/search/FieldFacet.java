package ru.kamapcuc.myownwotreplays.search;

import org.apache.lucene.search.TermQuery;
import org.elasticsearch.index.query.FilterBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.TermFilterBuilder;
import org.elasticsearch.index.query.TermQueryBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;

public class FieldFacet extends TermsBuilder {

    private final String name;
    private final String field;
    private Object value;

    public FieldFacet(String field, String name) {
        super(field);
        field(field);
        size(1000);
        order(Terms.Order.term(true));
        this.name = name;
        this.field = field;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public FilterBuilder getFilter() {
        if (value != null)
            return new TermFilterBuilder(field, value);
        else
            return null;
    }

    public QueryBuilder getQuery() {
        if (value != null)
            return new TermQueryBuilder(field, value);
        else
            return null;
    }

    @Override
    public String getName() {
        return name;
    }

}
