package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.common.xcontent.XContentBuilder;
import ru.kamapcuc.myownwotreplays.elastic.Doc2;
import ru.kamapcuc.myownwotreplays.elastic.TypesMeta;

import java.io.IOException;
import java.util.Map;

public class RepositoryFacetBuilder extends FieldFacetBuilder {

    private final Map<String, Doc2> values;

    public RepositoryFacetBuilder(String field, String code, String repository) {
        super(field, code);
        values = TypesMeta.REPOSITORIES.get(repository);
    }

    @Override
    protected void toXContentValues(XContentBuilder builder) throws IOException {
        for (Doc2 value : values.values())
            builder.field(value.getId(), value.get("name_i18n"));
    }

}