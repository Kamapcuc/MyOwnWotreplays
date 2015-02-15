package ru.kamapcuc.myownwotreplays.spring;

import org.elasticsearch.common.util.LocaleUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import ru.kamapcuc.myownwotreplays.elastic.Doc;
import ru.kamapcuc.myownwotreplays.Config;
import ru.kamapcuc.myownwotreplays.elastic.TypesMeta;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LocaleInterceptor extends HandlerInterceptorAdapter {

    private final static Pattern languagePattern = Pattern.compile("^/([a-z]{2})/.+$");

    private final static Map<String, Doc> supportedLanguages = TypesMeta.REPOSITORIES.get(Config.LANGUAGE_TYPE_NAME);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
        Locale locale;
        String lang = getLang(request);
        if (lang == null)
            locale = request.getLocale();
        else
            locale = LocaleUtils.parse(lang);
        if (!supportedLanguages.containsKey(locale.getLanguage()))
            locale = Config.DEFAULT_LOCALE;
        LocaleContextHolder.setLocale(locale, true);
        return true;
    }

    private String getLang(HttpServletRequest request) {
        String path = request.getRequestURI().substring(request.getContextPath().length());
        Matcher matcher = languagePattern.matcher(path);
        if (matcher.find())
            return matcher.group(1);
        return null;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        ModelMap model = modelAndView.getModelMap();
        model.put("languages", getSortedLanguages());
        model.put("translate", new Translator());
        model.put("path", Config.getReplaysPath());
    }

    private List<Doc> getSortedLanguages() {
        String selected = LocaleContextHolder.getLocale().getLanguage();
        List<Doc> result = new ArrayList<>(supportedLanguages.values());
        Collections.sort(result, (l1, l2) -> {
            if (selected.equals(l2.getId()))
                return 1;
            if (selected.equals(l1.getId()))
                return -1;
            return 0;
        });
        return result;
    }

}
