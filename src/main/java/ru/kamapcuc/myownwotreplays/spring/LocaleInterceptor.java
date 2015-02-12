package ru.kamapcuc.myownwotreplays.spring;

import org.elasticsearch.common.util.LocaleUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.search.Config;
import ru.kamapcuc.myownwotreplays.search.TypesMeta;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;
import java.util.Map;

public class LocaleInterceptor extends HandlerInterceptorAdapter {

    private final static Map<String, Doc> supportedLanguages = TypesMeta.REPOSITORIES.get(Config.LANGUAGE_TYPE_NAME);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
        Locale locale;
        String lang = request.getParameter("lang");
        if (lang != null)
            locale = LocaleUtils.parse(lang);
        else
            locale = request.getLocale();
        if (!supportedLanguages.containsKey(locale.getLanguage()))
            locale = Config.DEFAULT_LOCALE;
        LocaleContextHolder.setLocale(locale, true);
        return true;
    }

}
