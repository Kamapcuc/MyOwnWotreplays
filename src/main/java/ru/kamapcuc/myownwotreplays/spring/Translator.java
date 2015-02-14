package ru.kamapcuc.myownwotreplays.spring;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.ResourceBundleMessageSource;

import java.util.Locale;

public class Translator {

    private final static ResourceBundleMessageSource messageSource;

    static {
        messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        messageSource.setDefaultEncoding("UTF-8");
    }

    private final Locale locale;

    public Translator() {
        this.locale = LocaleContextHolder.getLocale();
    }

    public String get(String code) {
        return messageSource.getMessage(code, null, locale);
    }

    public static String translate(String code) {
        return messageSource.getMessage(code, null, LocaleContextHolder.getLocale());
    }

}
