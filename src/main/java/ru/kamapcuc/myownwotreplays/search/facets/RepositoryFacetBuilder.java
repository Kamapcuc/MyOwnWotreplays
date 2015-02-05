package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.common.xcontent.XContentBuilder;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.DocMap;
import ru.kamapcuc.myownwotreplays.search.TypesMeta;

import java.io.IOException;

public class RepositoryFacetBuilder extends FieldFacetBuilder {

    private final DocMap values;

    public RepositoryFacetBuilder(String field, String name, String repository) {
        super(field, name);
        values = TypesMeta.REPOSITORIES.get(repository);
    }

    @Override
    protected void toXContentValues(XContentBuilder builder) throws IOException {
        for (Doc value : values.values())
            builder.field(value.getId(), value.get("name"));
    }

}