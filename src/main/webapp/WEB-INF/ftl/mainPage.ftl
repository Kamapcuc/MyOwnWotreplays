<?xml version='1.0' encoding='UTF-8' ?>
<html lang="ru">
<head>
    <title>My Own WoTReplays</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" media="all">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta charset="UTF-8">
    <script src="resources/js/handlebars-v2.0.0.js"></script>
    <script src="resources/js/jquery-2.1.3.min.js"></script>
    <script src="resources/js/wr.js"></script>
    <link rel="icon" type="image/png" href="/resources/img/favicon.ico"/>
</head>
<body>
<div style="height: 23px; display: none">
${indexer.getCompleted()}/${indexer.getTotal()}
</div>
<div class="main clearfix" id="baseCtrl">
    <div class="main-menu clearfix" style="margin-bottom: 319px;">
        <div class="m-item_dropdown expanded" id="helper-1">
            <div class="m-item_container" style="height: 410px;">
                <div class="tabs clearfix">
                    <div class="t_labels">
                        <div class="t_label active" data-target="tab_0">
                            <i class="i-24_tank"></i>
                            Танки
                        </div>
                        <div class="t_label" data-target="tab_1">
                            <i class="i-24_map"></i>
                            Карты
                        </div>
                        <div class="t_label" data-target="tab_2">
                            <i class="i-24_medal2"></i>
                            Медали
                        </div>
                        <div class="t_label" data-target="tab_3">
                            <i class="i-24_ppl"></i>
                            Игрок/клан
                        </div>
                        <div class="t_label" data-target="tab_4">
                            <i class="i-24_gear"></i>
                            Другое
                        </div>
                    </div>
                    <div class="t_containers">
                        <div id="tab_0" class="t_container active clearfix" style="padding: 0;">
                            <div class="tank-filter clearfix">
                                <div class="tf_filters" id="tankNation">
                                    <#-- NATION FACET HERE -->
                                </div>
                                <div class="tf_filters two-column" id="tankLevel">
                                    <#-- LEVEL FACET HERE -->
                                </div>
                                <div class="tf_filters" id="tankClass">
                                    <#-- CLASS FACET HERE -->
                                </div>
                            </div>
                            <div class="tf_slider">
                                <div class="tf_s__head">
                                    <span style="color: #6e6e6e">Танков:</span>
                                    1
                                    <span class="tf_s__selectall">Сбросить</span>
                                </div>
                                <div class="frame" style="overflow: hidden;">
                                    <ul class="slider" style="transform: translateZ(0px);">
                                        <li>
                                            <input type="checkbox" class="cbx" id="tank798">
                                            <label for="tank798"><span></span>M2
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="scrollbar">
                                    <div class="handle"
                                         style="transform: translateZ(0px) translateY(0px); height: 244px;">
                                        <div class="mousearea"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab_1" class="t_container">
                            <div class="t_title">Карты</div>
                            <div class="column-content">
                                <div>
                                    <div class="first-letter">А</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map31">
                                            <label for="map31"><span></span>Аэродром</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">В</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map17">
                                            <label for="map17"><span></span>Вайдпарк</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map23">
                                            <label for="map23"><span></span>Вестфилд</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map84">
                                            <label for="map84"><span></span>Виндсторм</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map94">
                                            <label for="map94"><span></span>Восьмибитная
                                                история</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map103">
                                            <label for="map103"><span></span>Винтерберг</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Ж</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map60">
                                            <label for="map60"><span></span>Жемчужная река</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">З</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map38">
                                            <label for="map38"><span></span>Заполярье</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map86">
                                            <label for="map86"><span></span>Зимний
                                                Химмельсдорф</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map95">
                                            <label for="map95"><span></span>Затерянный город</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map109">
                                            <label for="map109"><span></span>Зимняя битва</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">К</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map1">
                                            <label for="map1"><span></span>Карелия</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map15">
                                            <label for="map15"><span></span>Комарин</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Л</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map7">
                                            <label for="map7"><span></span>Ласвилль</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map14">
                                            <label for="map14"><span></span>Л. Зигфрида</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map44">
                                            <label for="map44"><span></span>Лайв Окс</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">М</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map2">
                                            <label for="map2"><span></span>Малиновка</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map11">
                                            <label for="map11"><span></span>Мурованка</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map19">
                                            <label for="map19"><span></span>Монастырь</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map100">
                                            <label for="map100"><span></span>Миттенгард</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">О</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map96">
                                            <label for="map96"><span></span>Огненная дуга</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">П</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map3">
                                            <label for="map3"><span></span>Провинция</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map5">
                                            <label for="map5"><span></span>Прохоровка</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map28">
                                            <label for="map28"><span></span>Песчаная река</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map37">
                                            <label for="map37"><span></span>Перевал</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map42">
                                            <label for="map42"><span></span>Порт</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Р</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map8">
                                            <label for="map8"><span></span>Руинберг</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map10">
                                            <label for="map10"><span></span>Рудники</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map34">
                                            <label for="map34"><span></span>Редшир</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map36">
                                            <label for="map36"><span></span>Рыбацкая бухта</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map87">
                                            <label for="map87"><span></span>Руинберг в огне</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">С</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map35">
                                            <label for="map35"><span></span>Степи</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map43">
                                            <label for="map43"><span></span>Северо-Запад</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map53">
                                            <label for="map53"><span></span>Скрытая деревня</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map73">
                                            <label for="map73"><span></span>Священная долина</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map85">
                                            <label for="map85"><span></span>Северогорск</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map92">
                                            <label for="map92"><span></span>Сталинград</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Т</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map22">
                                            <label for="map22"><span></span>Топь</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map47">
                                            <label for="map47"><span></span>Тихий берег</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map63">
                                            <label for="map63"><span></span>Тундра</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map102">
                                            <label for="map102"><span></span>Танковые гонки</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">У</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map18">
                                            <label for="map18"><span></span>Утёс</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Ф</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map33">
                                            <label for="map33"><span></span>Фьорды</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Х</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map4">
                                            <label for="map4"><span></span>Химмельсдорф</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map45">
                                            <label for="map45"><span></span>Хайвей</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map51">
                                            <label for="map51"><span></span>Хребет Дракона</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map83">
                                            <label for="map83"><span></span>Харьков</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Ч</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map99">
                                            <label for="map99"><span></span>Чемпионат
                                                Химмельсдорфа</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Э</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map6">
                                            <label for="map6"><span></span>Энск</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map13">
                                            <label for="map13"><span></span>Эрленберг</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map29">
                                            <label for="map29"><span></span>Эль-Халлуф</label>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="first-letter">Ю</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="map39">
                                            <label for="map39"><span></span>Южный берег</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="tab_2" class="t_container">
                            <div class="t_title">Медали</div>
                            <div class="column-content">
                                <div style="margin-bottom: 25px;"
                                        >
                                    <div class="t_title">Эпические достижения</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal50">
                                            <label for="medal50"><span></span>Медаль Орлика</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal51">
                                            <label for="medal51"><span></span>Медаль Оськина</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal52">
                                            <label for="medal52"><span></span>Медаль Халонена</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal53">
                                            <label for="medal53"><span></span>Медаль Бурды</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal54">
                                            <label for="medal54"><span></span>Медаль Бийота</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal55">
                                            <label for="medal55"><span></span>Медаль
                                                Колобанова</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal56">
                                            <label for="medal56"><span></span>Медаль Фадина</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal73">
                                            <label for="medal73"><span></span>Медаль
                                                Рэдли-Уолтерса</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal74">
                                            <label for="medal74"><span></span>Медаль Пула</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal75">
                                            <label for="medal75"><span></span>Медаль Бруно</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal76">
                                            <label for="medal76"><span></span>Медаль Тарцая</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal77">
                                            <label for="medal77"><span></span>Медаль Паскуччи</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal78">
                                            <label for="medal78"><span></span>Медаль Думитру</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal106">
                                            <label for="medal106"><span></span>Медаль
                                                Лехвеслайхо</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal107">
                                            <label for="medal107"><span></span>Медаль Николса</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal110">
                                            <label for="medal110"><span></span>Медаль героев Расейняя</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal145">
                                            <label for="medal145"><span></span>Медаль де
                                                Ланглада</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal146">
                                            <label for="medal146"><span></span>Медаль Тамада
                                                Йошио</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal148">
                                            <label for="medal148"><span></span>Медаль Найдина</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal305">
                                            <label for="medal305"><span></span>Медаль «Поле боя:
                                                Арденнская операция 1944 года»</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal301">
                                            <label for="medal301"><span></span>Медаль «Поле боя: бои
                                                у озера Балатон»</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal303">
                                            <label for="medal303"><span></span>Медаль «Поле боя:
                                                битва на Курской дуге»</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal298">
                                            <label for="medal298"><span></span>Медаль Гора</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal300">
                                            <label for="medal300"><span></span>Медаль Старка</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                        >
                                    <div class="t_title">Герой битвы</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal34">
                                            <label for="medal34"><span></span>Воин</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal35">
                                            <label for="medal35"><span></span>Захватчик</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal37">
                                            <label for="medal37"><span></span>Защитник</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal38">
                                            <label for="medal38"><span></span>Стальная стена</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal39">
                                            <label for="medal39"><span></span>Поддержка</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal40">
                                            <label for="medal40"><span></span>Разведчик</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal72">
                                            <label for="medal72"><span></span>Дозорный</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal227">
                                            <label for="medal227"
                                                    ><span></span>Танкист-снайпер</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal228">
                                            <label for="medal228"><span></span>Основной
                                                калибр</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal232">
                                            <label for="medal232"><span></span>Отличник боевой
                                                подготовки</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal230">
                                            <label for="medal230"><span></span>За отличную
                                                стрельбу</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                        >
                                    <div class="t_title">Групповые достижения</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal143">
                                            <label for="medal143"><span></span>Братья по
                                                оружию</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal144">
                                            <label for="medal144"><span></span>Решающий вклад</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal236">
                                            <label for="medal236"><span></span>Бронетанковый
                                                кулак</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                        >
                                    <div class="t_title">Почётные звания</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal61">
                                            <label for="medal61"><span></span>Рейдер</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal62">
                                            <label for="medal62"><span></span>Коса смерти</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal64">
                                            <label for="medal64"><span></span>Камикадзе</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal147">
                                            <label for="medal147"><span></span>Бомбардир</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal237">
                                            <label for="medal237"><span></span>Тактик</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal306">
                                            <label for="medal306"><span></span>Уроки истории:
                                                Арденнская операция 1944 года</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal302">
                                            <label for="medal302"><span></span>Уроки истории: бои у
                                                озера Балатон</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal304">
                                            <label for="medal304"><span></span>Уроки истории: битва
                                                на Курской дуге</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal297">
                                            <label for="medal297"><span></span>За контрбатарейную
                                                стрельбу</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal299">
                                            <label for="medal299"><span></span>Хладнокровный</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal289">
                                            <label for="medal289"><span></span>За волю к
                                                победе</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal523">
                                            <label for="medal523"><span></span>Дуэлянт</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal522">
                                            <label for="medal522"><span></span>Боец</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal517">
                                            <label for="medal517"><span></span>Непробиваемый</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal521">
                                            <label for="medal521"><span></span>Огонь на
                                                поражение</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                        >
                                    <div class="t_title">Памятные знаки</div>
                                    <ul>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal150">
                                            <label for="medal150"><span></span>Спартанец</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal151">
                                            <label for="medal151"><span></span>Невозмутимый</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal152">
                                            <label for="medal152"><span></span>Счастливчик</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal233">
                                            <label for="medal233"><span></span>Царь горы</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal286">
                                            <label for="medal286"><span></span>Бог войны</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal296">
                                            <label for="medal296"><span></span>Монолит</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal479">
                                            <label for="medal479"><span></span>Бой до
                                                последнего</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal525">
                                            <label for="medal525"><span></span>Поджигатель</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal526">
                                            <label for="medal526"><span></span>Костолом</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal527">
                                            <label for="medal527"><span></span>Заговорённый</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal524">
                                            <label for="medal524"><span></span>Взрывотехник</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="cbx"
                                                   id="medal528">
                                            <label for="medal528"><span></span>В расчёте!</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="tab_3" class="t_container">
                            <div style="display: inline-block; vertical-align: top; margin-right: 60px;">
                                <div class="t_title">Поиск по игроку</div>
                                <div class="m_search-container search-player">
                                    <input class="m_search   " type="text"
                                           placeholder="введите имя игрока">
                                </div>
                            </div>
                            <div style="display: inline-block; vertical-align: top;">
                                <div class="t_title">Поиск по клану</div>
                                <div style="display: none">{"query":null,"results":null}</div>
                                <div class="m_search-container search-clan">
                                    <input class="m_search   " type="text"
                                           placeholder="введите название клана">
                                </div>
                            </div>
                        </div>
                        <div id="tab_4" class="t_container">
                            <div class="tf_filters">
                                <div class="t_title">Тип боя</div>
                                <ul class="two-column">
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type1">
                                        <label for="battle_type1"><span></span>Случайный бой</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type2">
                                        <label for="battle_type2"><span></span>Тренировка</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type3">
                                        <label for="battle_type3"><span></span>Ротный бой</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type4">
                                        <label for="battle_type4"><span></span>Турнир</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type5">
                                        <label for="battle_type5"><span></span>ГК</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type6">
                                        <label for="battle_type6"><span></span>Боевое
                                            обучение</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type7">
                                        <label for="battle_type7"><span></span>Командный бой</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type8">
                                        <label for="battle_type8"><span></span>Исторические
                                            бои</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type9">
                                        <label for="battle_type9"><span></span>Химмельсбол</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type10">
                                        <label for="battle_type10"><span></span>Вылазка</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx"
                                               id="battle_type11">
                                        <label for="battle_type11"><span></span>Битва за
                                            Укрепрайон</label>
                                    </li>
                                </ul>
                            </div>
                            <div class="tf_filters">
                                <div class="t_title">Респ</div>
                                <ul>
                                    <li>
                                        <input type="checkbox" class="cbx" id="resp1"
                                                >
                                        <label for="resp1"><span></span>1</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" class="cbx" id="resp2"
                                                >
                                        <label for="resp2"><span></span>2</label>
                                    </li>
                                </ul>
                            </div>
                            <div class="tf_filters">
                                <div class="t_title">Знак классности</div>
                                <ul>
                                    <li>
                                        <input type="checkbox" class="cbx" id="mastery"
                                                >
                                        <label for="mastery"><span></span>Мастер</label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tabs-bottom">
                        <div class="selected-filters">
                            <span class="tf_s__selectall">Очистить все фильтры&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>

                            <div>
                                <small>Уровни:</small>
                                <span>
                                <a title="Удалить фильтр" class="">4</a>
                                </span>
                            </div>
                            <div>
                                <small>Нации:</small>
                                <span>
                                <a title="Удалить фильтр" class="">Франция</a>
                                </span>
                            </div>
                            <div>
                                <small>Типы:</small>
                                <span>
                                <a title="Удалить фильтр" class="">ПТ</a>
                                </span>
                            </div>
                            <div>
                                <small>Танки:</small>
                                <span>
                                <a title="Удалить фильтр" class="">Somua SAu 40</a>
                                </span>
                            </div>
                            <div>
                                <small>Версии:</small>
                                <span>
                                <a title="Удалить фильтр" class="">0.9.5</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <div>
        <div class="b-replays">
            <div class="b-sort b-replays__sort">
                <span class="b-sort__label">Сортировать</span>
                <ul class="b-sort__list b-list" id="sortTypesContainer">

                </ul>
            </div>
            <div id="battlesContainer">
            </div>
            <ul class="pagination replays-pagination" style="height: 29px; overflow: visible;">
                <li class="disabled">← Назад</li>
                <li class="">1</li>
                <li class="">2</li>
                <li class="">3</li>
                <li class="">4</li>
                <li class="">5</li>
                <li class="">Вперёд →</li>
            </ul>
        </div>
    </div>
</div>
</body>

<script id="battlesTableTemplate" type="text/x-handlebars-template">
    <ul class="r_list initial">
        {{#each docs}}
        <li class="clearfix">
            <a class="r-map_85" href="view.do?id={{_id}}"
               title="{{map.name}}" style="background-image: url('/resources/img/maps/plan/{{map._id}}.jpg');">
            </a>

            <div class="r-info">
                <h3>
                    <a href="view.do?id={{_id}}">
                        {{tank.shortName}}, {{map.name}}, Стандартный бой
                    </a>
                </h3>
                {{#if haveResults}}
                <ul class="r-info_ri">
                    <li><i class="i-16_frags"></i> {{kills}}</li>
                    <li><i class="i-16_exp"></i> {{originalXP}}</li>
                    <li><i class="i-16_cr"></i> {{originalCredits}}</li>
                    <li><i class="i-16_dmg"></i> {{damageDealt}}</li>
                    <li><i class="i-16_master"></i> Мастер</li>
                </ul>
                {{else}}
                <ul class="r-info_ri">
                    <li><i class="i-16_frags"></i> 0</li>
                    <li><i class="i-16_exp"></i> 0</li>
                    <li><i class="i-16_cr"></i> 0</li>
                    <li><i class="i-16_dmg"></i> 0</li>
                </ul>
                {{/if}}
                <ul class="r-info_ci">
                    <li><b>Танк:</b> {{tank.shortName}}</li>
                    <li><b>Играл:</b> {{playerName}}</li>
                    <li><b>Версия:</b> {{version}}</li>
                    <li><b>Дата:</b> {{battleDate}}</li>
                </ul>
            </div>
            <div class="r-act">
                <a href="view.do?id={{_id}}" class="btn_l-grey">Запустить реплей</a>
            </div>
        </li>
        {{/each}}
    </ul>
</script>

<script id="battlesTileTemplate" type="text/x-handlebars-template">
    {{#each docs}}
    <a href="view.do?id={{_id}}">
    <div class="mr_replay">
        <div class="mrr_head" style="background-image: url(/resources/img/maps/thumb/{{map._id}}.png)" title="{{map.name}}">
            <div class="mrr_tank">
                <div style="background-image: url({{tank.image.big}})"></div>
            </div>
        </div>
        <div class="mrr_ribbon win">
            <div class="mrr_earnings">
                <div class="mrr_exp"><span>{{originalXP}}</span><i class="i-24_exp"></i></div>
                <div class="mrr_medals"><span>1</span><i class="i-24_medal"></i></div>
            </div>
            <div class="medal">
                <img src="http://worldoftanks.com/static/2.18.1/encyclopedia/tankopedia/achievement/medallafayettepool.png"
                     alt="Медаль Пула" title="Медаль Пула" class="wtst_head_awards_item">
                <div class="yellow-ribbon"></div>
            </div>
        </div>
        <div class="mrr_info">
            <div class="mrr_title">{{playerName}} на {{tank.shortName}}</div>
            <div style="text-align: center;">
                <div class="mrr_damage">
                    <span>{{damageDealt}}</span>
                    <i class="i-24_dmg tooltip">
                        <span class="tooltip-container">Урон</span>
                    </i>
                </div>
                <div class="mrr_assist">
                    <i class="i-24_assist tooltip">
                        <span class="tooltip-container">Урон по засвету</span>
                    </i>
                    <span>{{damageAssistedRadio}}</span>
                </div>
                <div class="mrr_frags">
                    <span>{{kills}}</span>
                    <i class="i-24_frags tooltip">
                        <span class="tooltip-container">Фраги</span>
                    </i>
                </div>
                <div class="mrr_dmg-blocked">
                    <i class="i-24_dmg-blocked tooltip">
                        <span class="tooltip-container">Заблокированный урон</span>
                    </i>
                    <span>{{damageBlockedByArmor}}</span>
                </div>
            </div>
        </div>
    </div>
    </a>
    {{/each}}
</script>

<script id="sortTypeTemplate" type="text/x-handlebars-template">
    <li class="b-list__item">
        <a class="b-link {{#if selected}}b-link_active{{/if}}">
            <span class="b-link__text">{{description}}</span>
            <span class="sortOrder" {{#if selected}}{{else}}style="display:none"{{/if}}>
                <ins class="b-sort__dir">{{#if asc}}↓{{else}}↑{{/if}}</ins>
            </span>
        </a>
    </li>
</script>

<script id="fieldFacetTemplate" type="text/x-handlebars-template">
    <div class="tf_title">
        <div>{{name}}</div>
    </div>
    <ul>
        {{#each values}}
        <li>
            <input type="checkbox" class="cbx" id="{{@key}}">
            <label for="{{@key}}"><span></span>{{name}} <small>(12)</small></label>
        </li>
        {{/each}}
    </ul>
</script>

<script>
    var fieldFacetTemplate = Handlebars.compile($('#fieldFacetTemplate').html());
    var battlesTableTemplate = Handlebars.compile($('#battlesTableTemplate').html());
    var battlesTileTemplate = Handlebars.compile($('#battlesTileTemplate').html());
    var sortTypeTemplate = Handlebars.compile($('#sortTypeTemplate').html());
    var battlesTemplate = battlesTableTemplate;

    var battlesContainer = $('#battlesContainer');
    var sortTypesContainer = $('#sortTypesContainer');

    var battles = ${battlesData};
    var facetsData = ${facetsData};
    var sortTypes = ${sortTypes};

    for(var facetKey in facetsData) {
        if(facetsData.hasOwnProperty(facetKey)) {
            var facetContainer = document.getElementById(facetKey);
            facetContainer.innerHTML = fieldFacetTemplate(facetsData[facetKey]);
        }
    }

    var getQueryParams = function () {
        var result = {};
        var search = window.location.search;
        if (search) {
            var query = window.location.search.substring(1);
            var vars = query.split('&');
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split('=');
                result[pair[0]] = pair[1].split(',');
            }
        }
        return result;
    };

    var buildQuery = function() {
        var keys = Object.keys(queryParams);
        var pairs = keys.map(function (a) { return a + '=' + queryParams[a].join(',')})
        return '?' + pairs.join('&')
    };

    var queryParams = getQueryParams();

    function SortType(data) {
        $.extend(this, data);
        if (queryParams.sortType)
            this.selected = this.name == queryParams.sortType[0];
        this.asc = false;
        if (queryParams.sortOrder)
            this.asc = "ASC" == queryParams.sortOrder[0];
        this.html = $(sortTypeTemplate(this));
        this.html.click($.proxy(this.select, this));
        sortTypesContainer.append(this.html);
    }

    SortType.prototype.select = function() {
        if (!this.selected)
            queryParams.sortType = [this.name];
        this.asc = this.selected && !this.asc;
        queryParams.sortOrder = [this.asc? 'ASC' : 'DESC'];
        window.location.search = buildQuery();
    };

    sortTypes.forEach(function (a) {new SortType(a);});

    battlesContainer.append(battlesTemplate(battles));

</script>
</html>