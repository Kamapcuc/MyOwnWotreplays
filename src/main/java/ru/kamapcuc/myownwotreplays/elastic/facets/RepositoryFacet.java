package ru.kamapcuc.myownwotreplays.elastic.facets;

import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.elastic.Repository;

import java.util.LinkedHashMap;

public class RepositoryFacet extends FieldFacet {

    private final String repository;

    public RepositoryFacet(String field, String code, String repository) {
        super(field, code);
        this.repository = repository;
    }

    @Override
    public Object getValues() {
        LinkedHashMap<String, String> values = new LinkedHashMap<>();
        for (Doc doc : Repository.getDocs(repository).values())
            values.put(doc.getId(), (String) doc.get("name_i18n"));
        return values;
    }

}
