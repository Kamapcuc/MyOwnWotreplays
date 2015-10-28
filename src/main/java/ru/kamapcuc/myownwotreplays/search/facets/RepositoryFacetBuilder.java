package ru.kamapcuc.myownwotreplays.search.facets;

import org.elasticsearch.common.xcontent.XContentBuilder;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.Repository;

import java.io.IOException;
import java.util.Map;

public class RepositoryFacetBuilder extends FieldFacetBuilder {

    private final Map<String, Doc> values;

    public RepositoryFacetBuilder(String field, String code, String repository) {
        super(field, code);
        values = Repository.getDocs(repository);
    }

    @Override
    protected void toXContentValues(XContentBuilder builder) throws IOException {
        for (Doc value : values.values())
            builder.field(value.getId(), value.get("name_i18n"));
    }

}