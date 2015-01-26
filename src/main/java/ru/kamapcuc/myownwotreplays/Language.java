package ru.kamapcuc.myownwotreplays;

public enum Language {

    EN("English"),
    RU("Русский"),
    PL("Polski"),
    DE("Deutsch"),
    FR("Français"),
    ES("Español"),
    CN("简体中文"), //zh-cn
    TR("Türkçe"),
    CS("Čeština"),
    TH("ไทย"),
    VI("Tiếng Việt"),
    KO("한국어");

    public String getDisplayName() {
        return displayName;
    }

    private final String displayName;

    private Language(String displayName) {
        this.displayName = displayName;
    }

    @Override
    public String toString() {
        return super.toString();
    }

}
