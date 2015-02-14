<#macro site>
    <?xml version='1.0' encoding='UTF-8' ?>
    <html lang="ru">
        <head>
            <title>My Own WoTReplays</title>
            <link rel="stylesheet" type="text/css" href="/resources/css/main.css" media="all">
            <meta http-equiv="content-type" content="text/html; charset=utf-8">
            <meta charset="UTF-8">
            <script src="/resources/js/handlebars-v2.0.0.js"></script>
            <script src="/resources/js/jquery-2.1.3.min.js"></script>
            <script src="/resources/js/search.js"></script>
            <link rel="icon" type="image/png" href="/resources/img/favicon.ico"/>
        </head>
        <body>
            <header>
                <div class="header-menu clearfix">
                    <ul>
                        <#list languages as lang>
                            <li>
                                <a href="/${lang.id}/search.do">
                                    <img src="/resources/img/flags/${lang.flag}"/>&nbsp;${lang.name}
                                </a>
                            </li>
                        </#list>
                    </ul>
                </div>
            </header>

            <#nested />

        </body>
    </html>
</#macro>