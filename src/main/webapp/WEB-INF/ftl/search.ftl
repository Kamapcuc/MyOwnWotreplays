<?xml version='1.0' encoding='UTF-8' ?>
<html lang="ru">
<head>
    <title>My Own WoTReplays</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" media="all">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta charset="UTF-8">
    <script src="resources/js/handlebars-v2.0.0.js"></script>
    <script src="resources/js/jquery-2.1.3.min.js"></script>
    <link rel="icon" type="image/png" href="/resources/img/favicon.ico"/>
</head>
<body>
<div style="height: 23px; display: none">
    ${indexer.getCompleted()}/${indexer.getTotal()}
</div>
<div class="main clearfix ng-scope" id="baseCtrl">
    <div class="main-menu clearfix" style="margin-bottom: 440px;">
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
                                <div class="tf_filters ng-scope">
                                    <div class="tf_title">
                                        <div class="first-letter ng-binding">1</div>
                                        <div >Нации</div>
                                    </div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="01">
                                            <label for="01" ><span></span>СССР</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="02">
                                            <label for="02"
                                                   ><span></span>Германия</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="03"
                                                    >
                                            <label for="03"
                                                   ><span></span>Америка</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="04"
                                                    >
                                            <label for="04"
                                                   ><span></span>Китай</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="05"
                                                    >
                                            <label for="05"
                                                   ><span></span>Франция</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="06"
                                                    >
                                            <label for="06"
                                                   ><span></span>Англия</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="07"
                                                    >
                                            <label for="07"
                                                   ><span></span>Япония</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tf_filters ng-scope">
                                    <div class="tf_title">
                                        <div class="first-letter ng-binding">2</div>
                                        <div >Уровни</div>
                                    </div>
                                    <ul class="two-column">
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="11">
                                            <label for="11"><span></span>1</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="12">
                                            <label for="12"><span></span>2</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="13">
                                            <label for="13"><span></span>3</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="14">
                                            <label for="14"><span></span>4</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="15">
                                            <label for="15"><span></span>5</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="16">
                                            <label for="16"><span></span>6</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="17">
                                            <label for="17"><span></span>7</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="18">
                                            <label for="18"><span></span>8</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="19">
                                            <label for="19"><span></span>9</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="110">
                                            <label for="110"><span></span>10</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tf_filters ng-scope">
                                    <div class="tf_title">
                                        <div class="first-letter ng-binding">3</div>
                                        <div >Типы</div>
                                    </div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="21"
                                                    >
                                            <label for="21"
                                                   ><span></span>ЛТ</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="22"
                                                    >
                                            <label for="22"
                                                   ><span></span>СТ</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="23">
                                            <label for="23"><span></span>ТТ</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="24">
                                            <label for="24" ><span></span>ПТ</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="25">
                                            <label for="25"><span></span>Арта</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tf_slider">
                                <div class="tf_s__head ng-binding">
                                    <span style="color: #6e6e6e">Танков:</span>
                                    1
                                    <span class="tf_s__selectall ng-scope">Сбросить</span>
                                </div>
                                <div class="frame" style="overflow: hidden;">
                                    <ul class="slider" style="transform: translateZ(0px);">
                                        <li class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx" id="tank798">
                                            <label for="tank798" ><span></span>M2
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
                            <div class="t_title ng-binding">Карты</div>
                            <div class="column-content">
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">А</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map31">
                                            <label for="map31" ><span></span>Аэродром</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">В</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map17">
                                            <label for="map17" ><span></span>Вайдпарк</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map23">
                                            <label for="map23" ><span></span>Вестфилд</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map84">
                                            <label for="map84" ><span></span>Виндсторм</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map94">
                                            <label for="map94" ><span></span>Восьмибитная
                                                история</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map103">
                                            <label for="map103" ><span></span>Винтерберг</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Ж</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map60">
                                            <label for="map60" ><span></span>Жемчужная река</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">З</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map38">
                                            <label for="map38" ><span></span>Заполярье</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map86">
                                            <label for="map86" ><span></span>Зимний
                                                Химмельсдорф</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map95">
                                            <label for="map95" ><span></span>Затерянный город</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map109">
                                            <label for="map109" ><span></span>Зимняя битва</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">К</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map1">
                                            <label for="map1" ><span></span>Карелия</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map15">
                                            <label for="map15" ><span></span>Комарин</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Л</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map7">
                                            <label for="map7" ><span></span>Ласвилль</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map14">
                                            <label for="map14" ><span></span>Л. Зигфрида</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map44">
                                            <label for="map44" ><span></span>Лайв Окс</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">М</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map2">
                                            <label for="map2" ><span></span>Малиновка</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map11">
                                            <label for="map11" ><span></span>Мурованка</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map19">
                                            <label for="map19" ><span></span>Монастырь</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map100">
                                            <label for="map100" ><span></span>Миттенгард</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">О</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map96">
                                            <label for="map96" ><span></span>Огненная дуга</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">П</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map3">
                                            <label for="map3" ><span></span>Провинция</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map5">
                                            <label for="map5" ><span></span>Прохоровка</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map28">
                                            <label for="map28" ><span></span>Песчаная река</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map37">
                                            <label for="map37" ><span></span>Перевал</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map42">
                                            <label for="map42" ><span></span>Порт</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Р</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map8">
                                            <label for="map8" ><span></span>Руинберг</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map10">
                                            <label for="map10" ><span></span>Рудники</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map34">
                                            <label for="map34" ><span></span>Редшир</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map36">
                                            <label for="map36" ><span></span>Рыбацкая бухта</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map87">
                                            <label for="map87" ><span></span>Руинберг в огне</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">С</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map35">
                                            <label for="map35" ><span></span>Степи</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map43">
                                            <label for="map43" ><span></span>Северо-Запад</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map53">
                                            <label for="map53" ><span></span>Скрытая деревня</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map73">
                                            <label for="map73" ><span></span>Священная долина</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map85">
                                            <label for="map85" ><span></span>Северогорск</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map92">
                                            <label for="map92" ><span></span>Сталинград</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Т</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map22">
                                            <label for="map22" ><span></span>Топь</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map47">
                                            <label for="map47" ><span></span>Тихий берег</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map63">
                                            <label for="map63" ><span></span>Тундра</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map102">
                                            <label for="map102" ><span></span>Танковые гонки</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">У</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map18">
                                            <label for="map18" ><span></span>Утёс</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Ф</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map33">
                                            <label for="map33" ><span></span>Фьорды</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Х</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map4">
                                            <label for="map4" ><span></span>Химмельсдорф</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map45">
                                            <label for="map45" ><span></span>Хайвей</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map51">
                                            <label for="map51" ><span></span>Хребет Дракона</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map83">
                                            <label for="map83" ><span></span>Харьков</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Ч</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map99">
                                            <label for="map99" ><span></span>Чемпионат
                                                Химмельсдорфа</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Э</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map6">
                                            <label for="map6" ><span></span>Энск</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map13">
                                            <label for="map13" ><span></span>Эрленберг</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map29">
                                            <label for="map29" ><span></span>Эль-Халлуф</label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ng-scope">
                                    <div class="first-letter ng-binding">Ю</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map39">
                                            <label for="map39" ><span></span>Южный берег</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="tab_2" class="t_container">
                            <div class="t_title ng-binding">Медали</div>
                            <div class="column-content">
                                <div style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Эпические достижения</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal50">
                                            <label for="medal50" ><span></span>Медаль Орлика</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal51">
                                            <label for="medal51" ><span></span>Медаль Оськина</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal52">
                                            <label for="medal52" ><span></span>Медаль Халонена</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal53">
                                            <label for="medal53" ><span></span>Медаль Бурды</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal54">
                                            <label for="medal54" ><span></span>Медаль Бийота</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal55">
                                            <label for="medal55" ><span></span>Медаль
                                                Колобанова</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal56">
                                            <label for="medal56" ><span></span>Медаль Фадина</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal73">
                                            <label for="medal73" ><span></span>Медаль
                                                Рэдли-Уолтерса</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal74">
                                            <label for="medal74" ><span></span>Медаль Пула</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal75">
                                            <label for="medal75" ><span></span>Медаль Бруно</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal76">
                                            <label for="medal76" ><span></span>Медаль Тарцая</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal77">
                                            <label for="medal77" ><span></span>Медаль Паскуччи</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal78">
                                            <label for="medal78" ><span></span>Медаль Думитру</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal106">
                                            <label for="medal106" ><span></span>Медаль
                                                Лехвеслайхо</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal107">
                                            <label for="medal107" ><span></span>Медаль Николса</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal110">
                                            <label for="medal110" ><span></span>Медаль героев Расейняя</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal145">
                                            <label for="medal145" ><span></span>Медаль де
                                                Ланглада</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal146">
                                            <label for="medal146" ><span></span>Медаль Тамада
                                                Йошио</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal148">
                                            <label for="medal148" ><span></span>Медаль Найдина</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal305">
                                            <label for="medal305" ><span></span>Медаль «Поле боя:
                                                Арденнская операция 1944 года»</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal301">
                                            <label for="medal301" ><span></span>Медаль «Поле боя: бои
                                                у озера Балатон»</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal303">
                                            <label for="medal303" ><span></span>Медаль «Поле боя:
                                                битва на Курской дуге»</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal298">
                                            <label for="medal298" ><span></span>Медаль Гора</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal300">
                                            <label for="medal300" ><span></span>Медаль Старка</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Герой битвы</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal34">
                                            <label for="medal34" ><span></span>Воин</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal35">
                                            <label for="medal35" ><span></span>Захватчик</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal37">
                                            <label for="medal37" ><span></span>Защитник</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal38">
                                            <label for="medal38" ><span></span>Стальная стена</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal39">
                                            <label for="medal39" ><span></span>Поддержка</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal40">
                                            <label for="medal40" ><span></span>Разведчик</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal72">
                                            <label for="medal72" ><span></span>Дозорный</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal227">
                                            <label for="medal227"
                                                   ><span></span>Танкист-снайпер</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal228">
                                            <label for="medal228" ><span></span>Основной
                                                калибр</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal232">
                                            <label for="medal232" ><span></span>Отличник боевой
                                                подготовки</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal230">
                                            <label for="medal230" ><span></span>За отличную
                                                стрельбу</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Групповые достижения</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal143">
                                            <label for="medal143" ><span></span>Братья по
                                                оружию</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal144">
                                            <label for="medal144" ><span></span>Решающий вклад</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal236">
                                            <label for="medal236" ><span></span>Бронетанковый
                                                кулак</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Почётные звания</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal61">
                                            <label for="medal61" ><span></span>Рейдер</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal62">
                                            <label for="medal62" ><span></span>Коса смерти</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal64">
                                            <label for="medal64" ><span></span>Камикадзе</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal147">
                                            <label for="medal147" ><span></span>Бомбардир</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal237">
                                            <label for="medal237" ><span></span>Тактик</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal306">
                                            <label for="medal306" ><span></span>Уроки истории:
                                                Арденнская операция 1944 года</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal302">
                                            <label for="medal302" ><span></span>Уроки истории: бои у
                                                озера Балатон</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal304">
                                            <label for="medal304" ><span></span>Уроки истории: битва
                                                на Курской дуге</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal297">
                                            <label for="medal297" ><span></span>За контрбатарейную
                                                стрельбу</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal299">
                                            <label for="medal299" ><span></span>Хладнокровный</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal289">
                                            <label for="medal289" ><span></span>За волю к
                                                победе</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal523">
                                            <label for="medal523" ><span></span>Дуэлянт</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal522">
                                            <label for="medal522" ><span></span>Боец</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal517">
                                            <label for="medal517" ><span></span>Непробиваемый</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal521">
                                            <label for="medal521" ><span></span>Огонь на
                                                поражение</label>
                                        </li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Памятные знаки</div>
                                    <ul>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal150">
                                            <label for="medal150" ><span></span>Спартанец</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal151">
                                            <label for="medal151" ><span></span>Невозмутимый</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal152">
                                            <label for="medal152" ><span></span>Счастливчик</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal233">
                                            <label for="medal233" ><span></span>Царь горы</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal286">
                                            <label for="medal286" ><span></span>Бог войны</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal296">
                                            <label for="medal296" ><span></span>Монолит</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal479">
                                            <label for="medal479" ><span></span>Бой до
                                                последнего</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal525">
                                            <label for="medal525" ><span></span>Поджигатель</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal526">
                                            <label for="medal526" ><span></span>Костолом</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal527">
                                            <label for="medal527" ><span></span>Заговорённый</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal524">
                                            <label for="medal524" ><span></span>Взрывотехник</label>
                                        </li>
                                        <li class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal528">
                                            <label for="medal528" ><span></span>В расчёте!</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="tab_3" class="t_container">
                            <div style="display: inline-block; vertical-align: top; margin-right: 60px;">
                                <div class="t_title">Поиск по игроку</div>
                                <div class="m_search-container search-player">
                                    <input class="m_search ng-pristine ng-untouched ng-valid" type="text"
                                           placeholder="введите имя игрока">
                                </div>
                            </div>
                            <div style="display: inline-block; vertical-align: top;">
                                <div class="t_title">Поиск по клану</div>
                                <div style="display: none" >{"query":null,"results":null}</div>
                                <div class="m_search-container search-clan">
                                    <input class="m_search ng-pristine ng-untouched ng-valid" type="text"
                                           placeholder="введите название клана">
                                </div>
                            </div>
                        </div>
                        <div id="tab_4" class="t_container">
                            <div class="tf_filters">
                                <div class="t_title ng-binding">Тип боя</div>
                                <ul class="two-column">
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type1">
                                        <label for="battle_type1" ><span></span>Случайный бой</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type2">
                                        <label for="battle_type2" ><span></span>Тренировка</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type3">
                                        <label for="battle_type3" ><span></span>Ротный бой</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type4">
                                        <label for="battle_type4" ><span></span>Турнир</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type5">
                                        <label for="battle_type5" ><span></span>ГК</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type6">
                                        <label for="battle_type6" ><span></span>Боевое
                                            обучение</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type7">
                                        <label for="battle_type7" ><span></span>Командный бой</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type8">
                                        <label for="battle_type8" ><span></span>Исторические
                                            бои</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type9">
                                        <label for="battle_type9" ><span></span>Химмельсбол</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type10">
                                        <label for="battle_type10" ><span></span>Вылазка</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type11">
                                        <label for="battle_type11" ><span></span>Битва за
                                            Укрепрайон</label>
                                    </li>
                                </ul>
                            </div>
                            <div class="tf_filters">
                                <div class="t_title ng-binding">Респ</div>
                                <ul>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="resp1"
                                                >
                                        <label for="resp1" ><span></span>1</label>
                                    </li>
                                    <li class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="resp2"
                                                >
                                        <label for="resp2" ><span></span>2</label>
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
                        <div class="clearfix">
                            <div class="version-filter">
                                Сортировка:
                                <div class="version-select sort-select" style="width: 135px;">
                                    <div class="vs_label">
                                        <span >по дате</span>
                                    </div>
                                    <div class="vs_slider">
                                        <div class="frame" style="height: 185px;">
                                            <ul class="slider">
                                                <li
                                                        class="ng-scope">
                                                    <label >по кредитам</label>
                                                </li>
                                                <li
                                                        class="ng-scope">
                                                    <label >по фрагам</label>
                                                </li>
                                                <li
                                                        class="ng-scope">
                                                    <label >по урону</label>
                                                </li>
                                                <li
                                                        class="ng-scope">
                                                    <label >по дате</label>
                                                </li>
                                                <li
                                                        class="ng-scope">
                                                    <label >по опыту</label>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="version-filter ng-binding">
                                Версии:
                                <div class="version-select">
                                    <div class="vs_label">
                                                <span
                                                        class="ng-scope">
                                                <span
                                                        class="ng-binding ng-scope">
                                                0.9.5
                                                </span>
                                                </span>
                                    </div>
                                    <div id="vs_slider" class="vs_slider">
                                        <div class="frame" style="overflow: hidden;">
                                            <ul class="slider" style="transform: translateZ(0px);">
                                                <li>
                                                    <input type="checkbox" class="cbx">
                                                    <label >
                                                        Выбрать все
                                                    </label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version34"
                                                            >
                                                    <label for="version34" >0.9.5</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version33"
                                                            >
                                                    <label for="version33" >0.9.4</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version31"
                                                            >
                                                    <label for="version31" >0.9.3</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version30"
                                                            >
                                                    <label for="version30" >0.9.2</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version29"
                                                            >
                                                    <label for="version29" >0.9.1</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version28"
                                                            >
                                                    <label for="version28" >0.9.0</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version27"
                                                            >
                                                    <label for="version27" >0.8.11</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version26"
                                                            >
                                                    <label for="version26" >0.8.10</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version25"
                                                            >
                                                    <label for="version25" >0.8.9</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version24"
                                                            >
                                                    <label for="version24" >0.8.8</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version23"
                                                            >
                                                    <label for="version23" >0.8.7</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version21"
                                                            >
                                                    <label for="version21" >0.8.6</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version19"
                                                            >
                                                    <label for="version19" >0.8.5</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version17"
                                                            >
                                                    <label for="version17" >0.8.4</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version16"
                                                            >
                                                    <label for="version16" >0.8.3</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version14"
                                                            >
                                                    <label for="version14" >0.8.2</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version13"
                                                            >
                                                    <label for="version13" >0.8.1</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version7"
                                                            >
                                                    <label for="version7" >0.8.0</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version6"
                                                            >
                                                    <label for="version6" >0.7.5</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version5"
                                                            >
                                                    <label for="version5" >0.7.4</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version4"
                                                            >
                                                    <label for="version4" >0.7.3</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version1"
                                                            >
                                                    <label for="version1" >0.7.2</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version2"
                                                            >
                                                    <label for="version2" >0.7.1</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version3"
                                                            >
                                                    <label for="version3" >0.6.6</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version20"
                                                            >
                                                    <label for="version20" >0.4.5</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version18"
                                                            >
                                                    <label for="version18" >1.0.4</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version32"
                                                            >
                                                    <label for="version32" >0.0.0</label>
                                                </li>
                                                <li class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version22"
                                                            >
                                                    <label for="version22" >0.9.9</label>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="scrollbar">
                                            <div class="handle"
                                                 style="transform: translateZ(0px) translateY(0px); height: 56px;">
                                                <div class="mousearea"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="selected-filters">
                            <span class="tf_s__selectall">Очистить все фильтры&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <div
                                    class="ng-scope">
                                <small >Уровни:</small>
                                        <span
                                                class="ng-scope">
                                        <a title="Удалить фильтр"
                                           class="ng-binding ng-scope">4</a>
                                        </span>
                            </div>
                            <div
                                    class="ng-scope">
                                <small >Нации:</small>
                                        <span
                                                class="ng-scope">
                                        <a title="Удалить фильтр"
                                           class="ng-binding ng-scope">Франция</a>
                                        </span>
                            </div>
                            <div
                                    class="ng-scope">
                                <small >Типы:</small>
                                        <span
                                                class="ng-scope">
                                        <a title="Удалить фильтр"
                                           class="ng-binding ng-scope">ПТ</a>
                                        </span>
                            </div>
                            <div
                                    class="ng-scope">
                                <small >Танки:</small>
                                        <span
                                                class="ng-scope">
                                        <a title="Удалить фильтр"
                                           class="ng-binding ng-scope">Somua
                                            SAu 40</a>
                                        </span>
                            </div>
                            <div
                                    Найти реплей        class="ng-scope">
                                <small >Версии:</small>
                                        <span
                                                class="ng-scope">
                                        <a title="Удалить фильтр"
                                           class="ng-binding ng-scope">0.9.5</a>
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
                <ul class="b-sort__list b-list">
                    <li class="b-list__item ng-scope">
                        <a class="b-link"
                                >
                            <span class="b-link__text ng-binding">по кредитам</span>
                        </a>
                    </li>
                    <li class="b-list__item ng-scope">
                        <a class="b-link"
                                >
                            <span class="b-link__text ng-binding">по фрагам</span>
                        </a>
                    </li>
                    <li class="b-list__item ng-scope">
                        <a class="b-link"
                                >
                            <span class="b-link__text ng-binding">по урону</span>
                        </a>
                    </li>
                    <li class="b-list__item ng-scope">
                        <a class="b-link b-link_active"
                                >
                            <span class="b-link__text ng-binding">по дате</span>
                                <span class="ng-scope">
                                <ins class="b-sort__dir ng-scope"
                                        >↓
                                </ins>
                                </span>
                        </a>
                    </li>
                    <li class="b-list__item ng-scope">
                        <a class="b-link"
                                >
                            <span class="b-link__text ng-binding">по опыту</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="ng-scope">
                <ul class="r_list initial" id="battlesContainer">
                </ul>
            </div>
            <ul class="pagination replays-pagination" style="height: 29px; overflow: visible;">
                <li class="disabled">← Назад</li>
                <li class="ng-binding ng-scope">1</li>
                <li class="ng-binding ng-scope">2</li>
                <li class="ng-binding ng-scope">3</li>
                <li class="ng-binding ng-scope">4</li>
                <li class="ng-binding ng-scope">5</li>
                <li class="">Вперёд →</li>
            </ul>
        </div>
    </div>
</div>
</body>
<script id="battlesTableTemplate" type="x-tmpl-mustache">
    <li class="clearfix">
        <a class="r-map_85" href="/site/4504448#tihiy_bereg-ritterschvert-somua_sau_40"
           title="Тихий берег" style="background-image: url('/resources/img/maps/plan/{{_source.map}}.jpg');">
        </a>
        <div class="r-info">
            <h3>
                <a href="/site/4504448#tihiy_bereg-ritterschvert-somua_sau_40">
                    {{_source.map}}, Стандартный бой
                </a>
            </h3>
            {{#if _source.haveResults}}
                <ul class="r-info_ri">
                    <li><i class="i-16_frags"></i> {{_source.kills}}</li>
                    <li><i class="i-16_exp"></i> {{_source.originalXP}}</li>
                    <li><i class="i-16_cr"></i> {{_source.originalCredits}}</li>
                    <li><i class="i-16_dmg"></i> {{_source.damageDealt}}</li>
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
                <li><b>Танк:</b> {{_source.tank.id}}</li>
                <li><b>Играл:</b> {{_source.playerName}}</li>
                <li><b>Версия:</b> {{_source.version}}</li>
                <li><b>Дата:</b> {{_source.battleDate}}</li>
            </ul>
        </div>
        <div class="r-act">
            <a href="{{_id}}" class="btn_l-grey">Запустить реплей</a>
        </div>
    </li>
</script>
<script>
    var battles = ${battles};

    var battlesTableTemplate = Handlebars.compile( $('#battlesTableTemplate').html());

    var battlesContainer = $('#battlesContainer');
    for (var index in battles) {
        var battle = battles[index];
        battlesContainer.append(battlesTableTemplate(battle));
    }

</script>
</html>