<?xml version='1.0' encoding='UTF-8' ?>
<html lang="ru">
<head>
    <title>My Own WoTReplays</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" media="all">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta charset="UTF-8">
    <script src="resources/js/Mustache.js"></script>
    <script src="resources/js/jquery-2.1.3.min.js"></script>
    <link rel="icon" type="image/png" href="/resources/img/favicon.ico" />
</head>

<body>


<div class="main clearfix ng-scope" ng-app="wotreplays" id="baseCtrl" >

    <div class="main-menu clearfix" style="margin-bottom: 440px;">

        <div class="m-item">
            <a onclick="return popup.init('login-popup',{url:'/site/popupLogin'});" class="m-item_title orange"
               style="width: 175px;">${indexer.getCompleted()} / ${indexer.getTotal()}</a>
        </div>

        <div class="m-item_dropdown expanded" id="helper-1">

            <div class="m-item_title" style="width: 175px;" >Найти реплей</div>

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

                                <input class="m_search ng-pristine ng-untouched ng-valid" type="text"
                                       ng-model="tankSearch" ng-change="filter.update();"
                                       placeholder="введите название танка">

                                <div class="m_search-descr">
                                    или уточните, какой именно танк вы хотите выбрать, с помощью фильтров <i
                                        class="icon-info tooltip">
                                        <span class="tooltip-container">
                                            Вы можете отфильтровать список танков, <br> используя фильтры по нациям, уровням и типу техники
                                        </span>
                                </i>
                                </div>

                                <!-- ngRepeat: (key, filterType) in filter.data.tank.filters | orderObjectBy: 'position' -->
                                <div class="tf_filters ng-scope"
                                     ng-repeat="(key, filterType) in filter.data.tank.filters | orderObjectBy: 'position'">

                                    <div class="tf_title">
                                        <div class="first-letter ng-binding">1</div>
                                        <div class="ng-binding">Нации</div>
                                    </div>

                                    <ul ng-class="{'two-column': filterType.key == 'level'}">
                                        <!-- ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="01"
                                                   ng-model="cbx.checked">
                                            <label for="01"
                                                   
                                                   class="ng-binding"><span></span>СССР</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="02"
                                                   ng-model="cbx.checked">
                                            <label for="02"
                                                   
                                                   class="ng-binding"><span></span>Германия</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="03"
                                                   ng-model="cbx.checked">
                                            <label for="03"
                                                   
                                                   class="ng-binding"><span></span>Америка</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="04"
                                                   ng-model="cbx.checked">
                                            <label for="04"
                                                   
                                                   class="ng-binding"><span></span>Китай</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="05"
                                                   ng-model="cbx.checked">
                                            <label for="05"
                                                   
                                                   class="ng-binding"><span></span>Франция</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="06"
                                                   ng-model="cbx.checked">
                                            <label for="06"
                                                   
                                                   class="ng-binding"><span></span>Англия</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="07"
                                                   ng-model="cbx.checked">
                                            <label for="07"
                                                   
                                                   class="ng-binding"><span></span>Япония</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                    </ul>

                                </div>
                                <!-- end ngRepeat: (key, filterType) in filter.data.tank.filters | orderObjectBy: 'position' -->
                                <div class="tf_filters ng-scope"
                                     ng-repeat="(key, filterType) in filter.data.tank.filters | orderObjectBy: 'position'">

                                    <div class="tf_title">
                                        <div class="first-letter ng-binding">2</div>
                                        <div class="ng-binding">Уровни</div>
                                    </div>

                                    <ul ng-class="{'two-column': filterType.key == 'level'}" class="two-column">
                                        <!-- ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="11"
                                                   ng-model="cbx.checked">
                                            <label for="11"
                                                   
                                                   class="ng-binding"><span></span>1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="12"
                                                   ng-model="cbx.checked">
                                            <label for="12"
                                                   
                                                   class="ng-binding"><span></span>2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="13"
                                                   ng-model="cbx.checked">
                                            <label for="13"
                                                   
                                                   class="ng-binding"><span></span>3</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="14"
                                                   ng-model="cbx.checked">
                                            <label for="14"
                                                   
                                                   class="ng-binding"><span></span>4</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="15"
                                                   ng-model="cbx.checked">
                                            <label for="15"
                                                   
                                                   class="ng-binding"><span></span>5</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="16"
                                                   ng-model="cbx.checked">
                                            <label for="16"
                                                   
                                                   class="ng-binding"><span></span>6</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="17"
                                                   ng-model="cbx.checked">
                                            <label for="17"
                                                   
                                                   class="ng-binding"><span></span>7</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="18"
                                                   ng-model="cbx.checked">
                                            <label for="18"
                                                   
                                                   class="ng-binding"><span></span>8</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="19"
                                                   ng-model="cbx.checked">
                                            <label for="19"
                                                   
                                                   class="ng-binding"><span></span>9</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="110" ng-model="cbx.checked">
                                            <label for="110"
                                                   
                                                   class="ng-binding"><span></span>10</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                    </ul>

                                </div>
                                <!-- end ngRepeat: (key, filterType) in filter.data.tank.filters | orderObjectBy: 'position' -->
                                <div class="tf_filters ng-scope"
                                     ng-repeat="(key, filterType) in filter.data.tank.filters | orderObjectBy: 'position'">

                                    <div class="tf_title">
                                        <div class="first-letter ng-binding">3</div>
                                        <div class="ng-binding">Типы</div>
                                    </div>

                                    <ul ng-class="{'two-column': filterType.key == 'level'}">
                                        <!-- ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="21"
                                                   ng-model="cbx.checked">
                                            <label for="21"
                                                   
                                                   class="ng-binding"><span></span>ЛТ</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="22"
                                                   ng-model="cbx.checked">
                                            <label for="22"
                                                   
                                                   class="ng-binding"><span></span>СТ</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="23"
                                                   ng-model="cbx.checked">
                                            <label for="23"
                                                   
                                                   class="ng-binding"><span></span>ТТ</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="24"
                                                   ng-model="cbx.checked">
                                            <label for="24"
                                                   
                                                   class="ng-binding"><span></span>ПТ</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                        <li ng-repeat="cbx in filterType.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="25"
                                                   ng-model="cbx.checked">
                                            <label for="25"
                                                   
                                                   class="ng-binding"><span></span>Арта</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filterType.checkboxes -->
                                    </ul>

                                </div>
                                <!-- end ngRepeat: (key, filterType) in filter.data.tank.filters | orderObjectBy: 'position' -->

                            </div>

                            <div class="tf_slider">

                                <div class="tf_s__head ng-binding">
                                    <span style="color: #6e6e6e">Танков:</span>
                                    1
                                    <!-- ngIf: (filter.getChecked(filter.data.tank)).length > 0 --><span
                                        class="tf_s__selectall ng-scope"
                                        ng-if="(filter.getChecked(filter.data.tank)).length > 0"
                                        >Сбросить</span><!-- end ngIf: (filter.getChecked(filter.data.tank)).length > 0 -->
                                </div>

                                <div class="frame" style="overflow: hidden;">
                                    <ul class="slider" style="transform: translateZ(0px);">
                                        <!-- ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank360" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank360" class="ng-binding"><span></span>AMX 50 B</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank361" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank361" class="ng-binding"><span></span>E 100</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank362" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank362" class="ng-binding"><span></span>Maus</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank363" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank363" class="ng-binding"><span></span>T110E5</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank364" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank364" class="ng-binding"><span></span>ИС-7</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank365" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank365" class="ng-binding"><span></span>AMX 50 120</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank366" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank366" class="ng-binding"><span></span>E 75</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank367" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank367" class="ng-binding"><span></span>M103</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank368" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank368" class="ng-binding"><span></span>VK 45.02 (P) Ausf.
                                                B</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank369" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank369" class="ng-binding"><span></span>ИС-4</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank370" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank370" class="ng-binding"><span></span>Bat.-Châtillon 25
                                                t</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank371" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank371" class="ng-binding"><span></span>E 50</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank372" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank372" class="ng-binding"><span></span>Jagdtiger</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank373" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank373" class="ng-binding"><span></span>M46 Patton</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank374" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank374" class="ng-binding"><span></span>T95</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank375" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank375" class="ng-binding"><span></span>Объект 704</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank376" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank376" class="ng-binding"><span></span>Т-54</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank377" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank377" class="ng-binding"><span></span>T30</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank378" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank378" class="ng-binding"><span></span>AMX 50 100</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank379" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank379" class="ng-binding"><span></span>Löwe</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank380" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank380" class="ng-binding"><span></span>M6A2E1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank381" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank381" class="ng-binding"><span></span>Tiger II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank382" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank382" class="ng-binding"><span></span>T32</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank383" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank383" class="ng-binding"><span></span>T34</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank384" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank384" class="ng-binding"><span></span>VK 45.02 (P) Ausf.
                                                A</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank385" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank385" class="ng-binding"><span></span>WZ-111</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank386" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank386" class="ng-binding"><span></span>ИС-3</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank387" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank387" class="ng-binding"><span></span>КВ-5</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank388" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank388" class="ng-binding"><span></span>Ferdinand</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank389" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank389" class="ng-binding"><span></span>T28</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank390" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank390" class="ng-binding"><span></span>ИСУ-152</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank391" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank391" class="ng-binding"><span></span>G.W. E 100</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank392" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank392" class="ng-binding"><span></span>T92</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank393" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank393" class="ng-binding"><span></span>Объект 261</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank394" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank394" class="ng-binding"><span></span>AMX 13 90</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank395" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank395" class="ng-binding"><span></span>Lorraine 40 t</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank396" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank396" class="ng-binding"><span></span>M26 Pershing</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank397" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank397" class="ng-binding"><span></span>Panther II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank399" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank399" class="ng-binding"><span></span>T28 Prototype</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank400" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank400" class="ng-binding"><span></span>Type 59</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank402" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank402" class="ng-binding"><span></span>Т-44</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank403" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank403" class="ng-binding"><span></span>AMX M4 mle. 45</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank404" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank404" class="ng-binding"><span></span>Tiger I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank405" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank405" class="ng-binding"><span></span>Tiger (P)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank406" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank406" class="ng-binding"><span></span>T29</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank407" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank407" class="ng-binding"><span></span>ИС</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank408" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank408" class="ng-binding"><span></span>G.W. Tiger</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank409" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank409" class="ng-binding"><span></span>M40/M43</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank410" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank410" class="ng-binding"><span></span>212А</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank411" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank411" class="ng-binding"><span></span>Jagdpanther</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank412" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank412" class="ng-binding"><span></span>Panther</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank413" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank413" class="ng-binding"><span></span>T20</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank414" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank414" class="ng-binding"><span></span>T25 AT</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank415" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank415" class="ng-binding"><span></span>T25/2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank416" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank416" class="ng-binding"><span></span>VK 30.02 (D)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank417" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank417" class="ng-binding"><span></span>КВ-13</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank418" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank418" class="ng-binding"><span></span>СУ-152</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank419" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank419" class="ng-binding"><span></span>Т-43</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank420" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank420" class="ng-binding"><span></span>ARL 44</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank421" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank421" class="ng-binding"><span></span>M6</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank422" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank422" class="ng-binding"><span></span>КВ-1С</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank423" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank423" class="ng-binding"><span></span>КВ-3</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank424" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank424" class="ng-binding"><span></span>G.W. Panther</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank425" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank425" class="ng-binding"><span></span>M12</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank426" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank426" class="ng-binding"><span></span>С-51</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank427" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank427" class="ng-binding"><span></span>СУ-14-2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank428" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank428" class="ng-binding"><span></span>AMX 13 75</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank429" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank429" class="ng-binding"><span></span>Jagdpanzer IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank430" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank430" class="ng-binding"><span></span>M18 Hellcat</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank431" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank431" class="ng-binding"><span></span>M24 Chaffee</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank432" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank432" class="ng-binding"><span></span>M36 Jackson</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank433" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank433" class="ng-binding"><span></span>M4A3E2 Sherman
                                                Jumbo</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank434" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank434" class="ng-binding"><span></span>M4A3E8 Sherman</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank435" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank435" class="ng-binding"><span></span>Pz.Kpfw. V/IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank436" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank436" class="ng-binding"><span></span>Pz.Kpfw. V/IV
                                                Alpha</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank437" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank437" class="ng-binding"><span></span>Type 62</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank438" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank438" class="ng-binding"><span></span>VK 28.01</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank439" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank439" class="ng-binding"><span></span>VK 30.01 (H)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank440" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank440" class="ng-binding"><span></span>VK 30.01 (P)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank441" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank441" class="ng-binding"><span></span>VK 36.01 (H)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank442" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank442" class="ng-binding"><span></span>СУ-100</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank443" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank443" class="ng-binding"><span></span>Т-34-85</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank445" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank445" class="ng-binding"><span></span>BDR G1 B</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank446" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank446" class="ng-binding"><span></span>Черчилль III</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank447" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank447" class="ng-binding"><span></span>T1 Heavy Tank</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank448" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank448" class="ng-binding"><span></span>T14</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank450" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank450" class="ng-binding"><span></span>КВ-220</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank451" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank451" class="ng-binding"><span></span>КВ-220
                                                Бета-Тест</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank452" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank452" class="ng-binding"><span></span>Hummel</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank453" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank453" class="ng-binding"><span></span>M41 HMC</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank454" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank454" class="ng-binding"><span></span>СУ-8</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank455" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank455" class="ng-binding"><span></span>AMX 12 t</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank456" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank456" class="ng-binding"><span></span>M10 Wolverine</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank457" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank457" class="ng-binding"><span></span>M4 Sherman</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank458" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank458" class="ng-binding"><span></span>M4A2E4 Sherman</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank459" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank459" class="ng-binding"><span></span>M7</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank460" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank460" class="ng-binding"><span></span>Матильда IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank461" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank461" class="ng-binding"><span></span>Pz.Kpfw. III/IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank463" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank463" class="ng-binding"><span></span>Pz.Kpfw. IV hydrostat.</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank464" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank464" class="ng-binding"><span></span>Ram II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank466" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank466" class="ng-binding"><span></span>T-25</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank467" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank467" class="ng-binding"><span></span>T-34</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank468" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank468" class="ng-binding"><span></span>T49</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank469" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank469" class="ng-binding"><span></span>СУ-85</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank470" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank470" class="ng-binding"><span></span>СУ-85И</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank471" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank471" class="ng-binding"><span></span>B1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank472" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank472" class="ng-binding"><span></span>Pz.Kpfw. B2 740
                                                (f)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank473" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank473" class="ng-binding"><span></span>Grille</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank474" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank474" class="ng-binding"><span></span>M7 Priest</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank475" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank475" class="ng-binding"><span></span>СУ-5</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank476" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank476" class="ng-binding"><span></span>AMX 40</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank477" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank477" class="ng-binding"><span></span>Hetzer</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank478" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank478" class="ng-binding"><span></span>M3 Lee</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank479" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank479" class="ng-binding"><span></span>M5 Stuart</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank480" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank480" class="ng-binding"><span></span>M8A1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank481" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank481" class="ng-binding"><span></span>Pz.Kpfw. 38 (t)
                                                n.A.</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank483" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank483" class="ng-binding"><span></span>T40</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank484" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank484" class="ng-binding"><span></span>VK 16.02
                                                Leopard</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank485" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank485" class="ng-binding"><span></span>Валентайн II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank486" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank486" class="ng-binding"><span></span>А-20</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank487" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank487" class="ng-binding"><span></span>А-32</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank488" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank488" class="ng-binding"><span></span>СУ-85Б</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank489" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank489" class="ng-binding"><span></span>Т-28</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank490" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank490" class="ng-binding"><span></span>Т-50</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank491" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank491" class="ng-binding"><span></span>Pz.Kpfw. 38H 735
                                                (f)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank492" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank492" class="ng-binding"><span></span>M37</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank493" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank493" class="ng-binding"><span></span>Sturmpanzer II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank494" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank494" class="ng-binding"><span></span>Wespe</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank495" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank495" class="ng-binding"><span></span>СУ-26</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank496" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank496" class="ng-binding"><span></span>AMX 38</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank497" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank497" class="ng-binding"><span></span>D2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank498" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank498" class="ng-binding"><span></span>FCM 36 Pak 40</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank499" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank499" class="ng-binding"><span></span>M2 Medium Tank</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank500" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank500" class="ng-binding"><span></span>M22 Locust</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank501" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank501" class="ng-binding"><span></span>М3 лёгкий</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank502" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank502" class="ng-binding"><span></span>M3 Stuart</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank504" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank504" class="ng-binding"><span></span>Marder II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank505" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank505" class="ng-binding"><span></span>Pz.Kpfw. 38 (t)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank506" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank506" class="ng-binding"><span></span>Pz.Kpfw. II Ausf.
                                                J</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank507" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank507" class="ng-binding"><span></span>Pz.Kpfw. II
                                                Luchs</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank508" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank508" class="ng-binding"><span></span>Pz.Kpfw. III Ausf.
                                                A</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank509" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank509" class="ng-binding"><span></span>Pz.Kpfw. S35 739
                                                (f)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank510" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank510" class="ng-binding"><span></span>T-15</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank511" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank511" class="ng-binding"><span></span>T82</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank512" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank512" class="ng-binding"><span></span>БТ-7</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank513" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank513" class="ng-binding"><span></span>БТ-СВ</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank514" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank514" class="ng-binding"><span></span>СУ-76</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank515" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank515" class="ng-binding"><span></span>Т-127</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank516" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank516" class="ng-binding"><span></span>Т-46</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank517" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank517" class="ng-binding"><span></span>105 leFH18B2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank518" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank518" class="ng-binding"><span></span>Sturmpanzer I
                                                Bison</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank519" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank519" class="ng-binding"><span></span>T57</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank520" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank520" class="ng-binding"><span></span>СУ-18</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank521" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank521" class="ng-binding"><span></span>D1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank522" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank522" class="ng-binding"><span></span>Hotchkiss H35</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank523" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank523" class="ng-binding"><span></span>M2 Light Tank</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank524" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank524" class="ng-binding"><span></span>Тетрарх</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank525" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank525" class="ng-binding"><span></span>Panzerjäger I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank526" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank526" class="ng-binding"><span></span>Pz.Kpfw. 35 (t)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank527" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank527" class="ng-binding"><span></span>Pz.Kpfw. II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank528" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank528" class="ng-binding"><span></span>T18</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank529" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank529" class="ng-binding"><span></span>T2 Light Tank</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank530" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank530" class="ng-binding"><span></span>T2 Medium Tank</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank531" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank531" class="ng-binding"><span></span>АТ-1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank532" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank532" class="ng-binding"><span></span>БТ-2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank533" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank533" class="ng-binding"><span></span>Т-26</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank534" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank534" class="ng-binding"><span></span>Leichttraktor</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank535" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank535" class="ng-binding"><span></span>Renault FT</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank536" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank536" class="ng-binding"><span></span>T1 Cunningham</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank537" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank537" class="ng-binding"><span></span>МС-1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank539" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank539" class="ng-binding"><span></span>ИС-8</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank540" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank540" class="ng-binding"><span></span>СТ-I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank541" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank541" class="ng-binding"><span></span>ИС-6</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank542" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank542" class="ng-binding"><span></span>КВ-4</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank543" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank543" class="ng-binding"><span></span>8,8 cm Pak 43 Jagdtiger</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank544" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank544" class="ng-binding"><span></span>КВ-2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank545" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank545" class="ng-binding"><span></span>Т-150</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank546" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank546" class="ng-binding"><span></span>КВ-1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank547" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank547" class="ng-binding"><span></span>AMX 50 Foch</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank548" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank548" class="ng-binding"><span></span>AMX AC mle. 48</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank550" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank550" class="ng-binding"><span></span>T26E4
                                                SuperPershing</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank551" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank551" class="ng-binding"><span></span>Lorraine 155 mle.
                                                51</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank552" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank552" class="ng-binding"><span></span>AMX AC mle. 46</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank553" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank553" class="ng-binding"><span></span>Lorraine 155 mle.
                                                50</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank554" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank554" class="ng-binding"><span></span>ARL V39</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank555" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank555" class="ng-binding"><span></span>Dicker Max</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank556" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank556" class="ng-binding"><span></span>AMX 13 F3 AM</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank557" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank557" class="ng-binding"><span></span>S35 CA</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank558" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank558" class="ng-binding"><span></span>AMX 13 105 AM mle.
                                                50</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank559" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank559" class="ng-binding"><span></span>Somua SAu 40</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank560" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank560" class="ng-binding"><span></span>Lorraine 39L AM</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank561" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank561" class="ng-binding"><span></span>Renault UE 57</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank562" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank562" class="ng-binding"><span></span>Renault FT 75
                                                BS</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank563" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank563" class="ng-binding"><span></span>Renault FT AC</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank564" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank564" class="ng-binding"><span></span>AMX 50 Foch
                                                (155)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank565" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank565" class="ng-binding"><span></span>E 50 Ausf. M</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank566" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank566" class="ng-binding"><span></span>Jagdpanzer E
                                                100</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank567" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank567" class="ng-binding"><span></span>M48A1 Patton</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank568" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank568" class="ng-binding"><span></span>T110E3</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank569" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank569" class="ng-binding"><span></span>T110E4</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank570" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank570" class="ng-binding"><span></span>Объект 268</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank571" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank571" class="ng-binding"><span></span>Т-62А</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank572" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank572" class="ng-binding"><span></span>Jagdpanther II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank573" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank573" class="ng-binding"><span></span>ELC AMX</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank574" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank574" class="ng-binding"><span></span>Matilda Black
                                                Prince</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank575" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank575" class="ng-binding"><span></span>Объект 263</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank576" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank576" class="ng-binding"><span></span>СУ-122-54</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank577" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank577" class="ng-binding"><span></span>СУ-101</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank578" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank578" class="ng-binding"><span></span>Panther/M10</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank579" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank579" class="ng-binding"><span></span>СУ-100М1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank580" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank580" class="ng-binding"><span></span>СУ-122-44</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank581" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank581" class="ng-binding"><span></span>Pz.Kpfw. IV Schmalturm</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank582" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank582" class="ng-binding"><span></span>Наблюдатель</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank583" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank583" class="ng-binding"><span></span>FV215b</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank584" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank584" class="ng-binding"><span></span>FV4202</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank585" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank585" class="ng-binding"><span></span>Conqueror</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank586" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank586" class="ng-binding"><span></span>Centurion Mk.
                                                7/1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank587" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank587" class="ng-binding"><span></span>Caernarvon</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank588" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank588" class="ng-binding"><span></span>FCM 50 t</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank589" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank589" class="ng-binding"><span></span>Centurion Mk. I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank590" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank590" class="ng-binding"><span></span>Black Prince</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank591" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank591" class="ng-binding"><span></span>AT 15A</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank592" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank592" class="ng-binding"><span></span>Comet</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank593" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank593" class="ng-binding"><span></span>Churchill VII</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank594" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank594" class="ng-binding"><span></span>TOG II*</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank595" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank595" class="ng-binding"><span></span>Cromwell</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank596" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank596" class="ng-binding"><span></span>Churchill I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank597" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank597" class="ng-binding"><span></span>Crusader</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank598" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank598" class="ng-binding"><span></span>Covenanter</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank599" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank599" class="ng-binding"><span></span>Matilda</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank600" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank600" class="ng-binding"><span></span>Valentine</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank601" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank601" class="ng-binding"><span></span>Cruiser Mk. II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank602" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank602" class="ng-binding"><span></span>Cruiser Mk. IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank603" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank603" class="ng-binding"><span></span>Vickers Medium Mk. III</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank604" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank604" class="ng-binding"><span></span>Cruiser Mk. III</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank605" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank605" class="ng-binding"><span></span>Cruiser Mk. I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank606" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank606" class="ng-binding"><span></span>T1E6</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank607" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank607" class="ng-binding"><span></span>Vickers Medium Mk.
                                                II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank608" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank608" class="ng-binding"><span></span>Vickers Medium Mk.
                                                I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank609" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank609" class="ng-binding"><span></span>T57 Heavy Tank</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank610" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank610" class="ng-binding"><span></span>T54E1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank611" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank611" class="ng-binding"><span></span>T69</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank612" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank612" class="ng-binding"><span></span>T71</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank613" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank613" class="ng-binding"><span></span>T21</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank614" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank614" class="ng-binding"><span></span>СУ-100Y</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank615" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank615" class="ng-binding"><span></span>121</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank616" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank616" class="ng-binding"><span></span>113</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank617" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank617" class="ng-binding"><span></span>WZ-120</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank618" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank618" class="ng-binding"><span></span>WZ-111 model
                                                1-4</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank619" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank619" class="ng-binding"><span></span>T-34-2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank620" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank620" class="ng-binding"><span></span>WZ-132</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank621" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank621" class="ng-binding"><span></span>110</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank622" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank622" class="ng-binding"><span></span>IS-2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank623" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank623" class="ng-binding"><span></span>T-34-1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank624" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank624" class="ng-binding"><span></span>WZ-131</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank625" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank625" class="ng-binding"><span></span>59-16</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank626" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank626" class="ng-binding"><span></span>Type 58</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank627" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank627" class="ng-binding"><span></span>Type T-34</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank628" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank628" class="ng-binding"><span></span>M5A1 Stuart</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank629" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank629" class="ng-binding"><span></span>Type 2597
                                                Chi-Ha</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank630" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank630" class="ng-binding"><span></span>Vickers Mk. E Type
                                                B</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank631" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank631" class="ng-binding"><span></span>Renault NC-31</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank632" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank632" class="ng-binding"><span></span>FV215b (183)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank633" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank633" class="ng-binding"><span></span>Tortoise</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank634" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank634" class="ng-binding"><span></span>AT 15</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank635" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank635" class="ng-binding"><span></span>AT 7</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank637" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank637" class="ng-binding"><span></span>AT 8</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank638" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank638" class="ng-binding"><span></span>Churchill Gun
                                                Carrier</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank642" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank642" class="ng-binding"><span></span>AT 2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank644" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank644" class="ng-binding"><span></span>Alecto</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank647" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank647" class="ng-binding"><span></span>Pz.Kpfw. I Ausf.
                                                C</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank648" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank648" class="ng-binding"><span></span>Pz.Kpfw. II Ausf.
                                                G</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank649" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank649" class="ng-binding"><span></span>Valentine AT</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank650" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank650" class="ng-binding"><span></span>Pz.Kpfw. I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank651" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank651" class="ng-binding"><span></span>Universal Carrier 2-pdr</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank666" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank666" class="ng-binding"><span></span>VK 72.01 (K)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank667" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank667" class="ng-binding"><span></span>Leopard 1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank668" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank668" class="ng-binding"><span></span>M60</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank669" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank669" class="ng-binding"><span></span>Объект 907</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank670" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank670" class="ng-binding"><span></span>Leopard Prototyp
                                                A</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank671" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank671" class="ng-binding"><span></span>Indien-Panzer</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank672" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank672" class="ng-binding"><span></span>Aufklärungspanzer
                                                Panther</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank673" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank673" class="ng-binding"><span></span>VK 30.01 (D)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank674" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank674" class="ng-binding"><span></span>Excelsior</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank675" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank675" class="ng-binding"><span></span>VK 20.01 (D)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank676" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank676" class="ng-binding"><span></span>Т-80</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank677" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank677" class="ng-binding"><span></span>Sexton I</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank678" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank678" class="ng-binding"><span></span>Т-70</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank679" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank679" class="ng-binding"><span></span>Т-60</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank680" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank680" class="ng-binding"><span></span>Bat.-Châtillon 155
                                                58</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank681" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank681" class="ng-binding"><span></span>Bat.-Châtillon 155
                                                55</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank682" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank682" class="ng-binding"><span></span>M53/M55</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank683" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank683" class="ng-binding"><span></span>G.W. Tiger (P)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank684" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank684" class="ng-binding"><span></span>112</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank685" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank685" class="ng-binding"><span></span>СУ-14-1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank686" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank686" class="ng-binding"><span></span>E 25</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank687" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank687" class="ng-binding"><span></span>M44</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank688" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank688" class="ng-binding"><span></span>СУ-122А</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank689" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank689" class="ng-binding"><span></span>AMX 105 AM mle.
                                                47</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank690" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank690" class="ng-binding"><span></span>Pz.Sfl. IVb</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank691" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank691" class="ng-binding"><span></span>G.Pz. Mk. VI
                                                (e)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank692" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank692" class="ng-binding"><span></span>Conqueror Gun Carriage</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank693" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank693" class="ng-binding"><span></span>FV3805</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank694" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank694" class="ng-binding"><span></span>FV207</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank695" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank695" class="ng-binding"><span></span>T-34-3</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank696" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank696" class="ng-binding"><span></span>Crusader 5.5-in.
                                                SP</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank697" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank697" class="ng-binding"><span></span>FV304</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank698" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank698" class="ng-binding"><span></span>МТ-25</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank699" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank699" class="ng-binding"><span></span>Bishop</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank700" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank700" class="ng-binding"><span></span>Birch Gun</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank701" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank701" class="ng-binding"><span></span>Sexton II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank702" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank702" class="ng-binding"><span></span>ЛТП</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank703" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank703" class="ng-binding"><span></span>Loyd Gun
                                                Carriage</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank704" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank704" class="ng-binding"><span></span>Объект 140</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank705" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank705" class="ng-binding"><span></span>Объект 416</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank706" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank706" class="ng-binding"><span></span>А-44</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank707" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank707" class="ng-binding"><span></span>Т-44-122</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank709" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank709" class="ng-binding"><span></span>Type 64</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank710" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank710" class="ng-binding"><span></span>VK 30.02 (M)</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank711" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank711" class="ng-binding"><span></span>А-43</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank712" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank712" class="ng-binding"><span></span>Type 3 Chi-Nu
                                                Kai</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank713" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank713" class="ng-binding"><span></span>Durchbruchswagen
                                                2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank714" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank714" class="ng-binding"><span></span>Waffenträger auf E 100</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank715" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank715" class="ng-binding"><span></span>Waffenträger auf Pz. IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank716" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank716" class="ng-binding"><span></span>Rhm.-Borsig
                                                Waffenträger</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank717" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank717" class="ng-binding"><span></span>Sturer Emil</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank718" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank718" class="ng-binding"><span></span>Nashorn</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank719" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank719" class="ng-binding"><span></span>Pz.Sfl. IVc</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank720" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank720" class="ng-binding"><span></span>Marder 38T</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank721" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank721" class="ng-binding"><span></span>Light Mk. VIC</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank722" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank722" class="ng-binding"><span></span>T7 Combat Car</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank723" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank723" class="ng-binding"><span></span>STB-1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank724" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank724" class="ng-binding"><span></span>Объект 430</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank725" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank725" class="ng-binding"><span></span>Type 61</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank726" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank726" class="ng-binding"><span></span>Объект 430 Вариант
                                                II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank727" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank727" class="ng-binding"><span></span>STA-1</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank728" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank728" class="ng-binding"><span></span>Type 5 Chi-Ri</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank729" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank729" class="ng-binding"><span></span>Type 4 Chi-To</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank730" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank730" class="ng-binding"><span></span>Type 3 Chi-Nu</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank731" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank731" class="ng-binding"><span></span>Type 1 Chi-He</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank732" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank732" class="ng-binding"><span></span>Type 5 Ke-Ho</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank733" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank733" class="ng-binding"><span></span>Type 97 Chi-Ha</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank734" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank734" class="ng-binding"><span></span>Type 98 Ke-Ni</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank736" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank736" class="ng-binding"><span></span>СУ-76И</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank737" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank737" class="ng-binding"><span></span>Chi-Ni</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank738" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank738" class="ng-binding"><span></span>Type 95 Ha-Go</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank739" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank739" class="ng-binding"><span></span>Renault Otsu</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank741" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank741" class="ng-binding"><span></span>T23E3</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank742" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank742" class="ng-binding"><span></span>Großtraktor -
                                                Krupp</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank743" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank743" class="ng-binding"><span></span>Pz.Kpfw. IV Ausf.
                                                H</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank744" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank744" class="ng-binding"><span></span>StuG III Ausf.
                                                G</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank745" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank745" class="ng-binding"><span></span>Pz.Kpfw. III</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank746" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank746" class="ng-binding"><span></span>Pz.Kpfw. IV Ausf.
                                                D</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank747" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank747" class="ng-binding"><span></span>StuG III Ausf.
                                                B</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank748" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank748" class="ng-binding"><span></span>Pz.Kpfw. IV Ausf.
                                                A</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank749" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank749" class="ng-binding"><span></span>Karl</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank750" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank750" class="ng-binding"><span></span>Type 97 Te-Ke</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank751" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank751" class="ng-binding"><span></span>Т-62А СПОРТ</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank762" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank762" class="ng-binding"><span></span>Spähpanzer Ru
                                                251</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank763" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank763" class="ng-binding"><span></span>Т-54
                                                облегчённый</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank764" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank764" class="ng-binding"><span></span>M41 Walker
                                                Bulldog</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank765" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank765" class="ng-binding"><span></span>ЛТТБ</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank766" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank766" class="ng-binding"><span></span>T37</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank767" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank767" class="ng-binding"><span></span>КВ-85</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank768" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank768" class="ng-binding"><span></span>Т-34-85М</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank769" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank769" class="ng-binding"><span></span>T67</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank770" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank770" class="ng-binding"><span></span>Env_Artillery</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank771" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank771" class="ng-binding"><span></span>M24 Chaffee
                                                Sport</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank772" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank772" class="ng-binding"><span></span>M4A3E8 Fury</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank773" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank773" class="ng-binding"><span></span>Объект 260 обр. 1945 г.</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank774" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank774" class="ng-binding"><span></span>T 55A</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank776" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank776" class="ng-binding"><span></span>Panther mit 8,8 cm L/71</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank777" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank777" class="ng-binding"><span></span>T95E2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank778" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank778" class="ng-binding"><span></span>T28 Concept</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank779" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank779" class="ng-binding"><span></span>Tiger I L/56</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank780" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank780" class="ng-binding"><span></span>StuG IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank781" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank781" class="ng-binding"><span></span>Pz.Kpfw. II Ausf.
                                                D</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank782" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank782" class="ng-binding"><span></span>FV4005 Stage II</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank783" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank783" class="ng-binding"><span></span>FV4004 Conway</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank784" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank784" class="ng-binding"><span></span>AMX Chasseur de
                                                chars</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank785" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank785" class="ng-binding"><span></span>Charioteer</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank786" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank786" class="ng-binding"><span></span>STA-2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank787" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank787" class="ng-binding"><span></span>ИСУ-130</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank788" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank788" class="ng-binding"><span></span>AMX 13 57</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank789" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank789" class="ng-binding"><span></span>Challenger</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank790" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank790" class="ng-binding"><span></span>Achilles</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank791" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank791" class="ng-binding"><span></span>Sherman Firefly</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank792" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank792" class="ng-binding"><span></span>T37</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank793" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank793" class="ng-binding"><span></span>Archer</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank794" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank794" class="ng-binding"><span></span>Sherman III</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank795" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank795" class="ng-binding"><span></span>Т-34</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank796" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank796" class="ng-binding"><span></span>Grant</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank797" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank797" class="ng-binding"><span></span>Stuart I-IV</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank798" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank798" class="ng-binding"><span></span>M2</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank799" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank799" class="ng-binding"><span></span>Мамонт</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank800" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank800" class="ng-binding"><span></span>Берсерк</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
                                        <li ng-repeat="cbx in filter.data.tank.checkboxes" ng-show="cbx.show"
                                            class="ng-scope ng-hide">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="tank801" ng-model="cbx.checked"
                                                   ng-change="filter.update('prevent tank slider update');">
                                            <label for="tank801" class="ng-binding"><span></span>Рейдер</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in filter.data.tank.checkboxes -->
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
                            <div class="column-content"
                                 ng-init="this.maps.checkboxes = (filter.data.map.checkboxes | orderByFirstLetter)">
                                <!-- ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">А</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map31" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map31" class="ng-binding"><span></span>Аэродром</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">В</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map17" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map17" class="ng-binding"><span></span>Вайдпарк</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map23" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map23" class="ng-binding"><span></span>Вестфилд</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map84" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map84" class="ng-binding"><span></span>Виндсторм</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map94" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map94" class="ng-binding"><span></span>Восьмибитная
                                                история</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map103" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map103" class="ng-binding"><span></span>Винтерберг</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Ж</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map60" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map60" class="ng-binding"><span></span>Жемчужная река</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">З</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map38" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map38" class="ng-binding"><span></span>Заполярье</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map86" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map86" class="ng-binding"><span></span>Зимний
                                                Химмельсдорф</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map95" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map95" class="ng-binding"><span></span>Затерянный город</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map109" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map109" class="ng-binding"><span></span>Зимняя битва</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">К</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map1" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map1" class="ng-binding"><span></span>Карелия</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map15" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map15" class="ng-binding"><span></span>Комарин</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Л</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map7" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map7" class="ng-binding"><span></span>Ласвилль</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map14" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map14" class="ng-binding"><span></span>Л. Зигфрида</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map44" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map44" class="ng-binding"><span></span>Лайв Окс</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">М</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map2" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map2" class="ng-binding"><span></span>Малиновка</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map11" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map11" class="ng-binding"><span></span>Мурованка</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map19" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map19" class="ng-binding"><span></span>Монастырь</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map100" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map100" class="ng-binding"><span></span>Миттенгард</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">О</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map96" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map96" class="ng-binding"><span></span>Огненная дуга</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">П</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map3" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map3" class="ng-binding"><span></span>Провинция</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map5" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map5" class="ng-binding"><span></span>Прохоровка</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map28" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map28" class="ng-binding"><span></span>Песчаная река</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map37" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map37" class="ng-binding"><span></span>Перевал</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map42" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map42" class="ng-binding"><span></span>Порт</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Р</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map8" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map8" class="ng-binding"><span></span>Руинберг</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map10" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map10" class="ng-binding"><span></span>Рудники</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map34" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map34" class="ng-binding"><span></span>Редшир</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map36" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map36" class="ng-binding"><span></span>Рыбацкая бухта</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map87" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map87" class="ng-binding"><span></span>Руинберг в огне</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">С</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map35" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map35" class="ng-binding"><span></span>Степи</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map43" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map43" class="ng-binding"><span></span>Северо-Запад</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map53" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map53" class="ng-binding"><span></span>Скрытая деревня</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map73" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map73" class="ng-binding"><span></span>Священная долина</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map85" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map85" class="ng-binding"><span></span>Северогорск</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map92" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map92" class="ng-binding"><span></span>Сталинград</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Т</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map22" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map22" class="ng-binding"><span></span>Топь</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map47" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map47" class="ng-binding"><span></span>Тихий берег</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map63" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map63" class="ng-binding"><span></span>Тундра</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map102" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map102" class="ng-binding"><span></span>Танковые гонки</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">У</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map18" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map18" class="ng-binding"><span></span>Утёс</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Ф</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map33" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map33" class="ng-binding"><span></span>Фьорды</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Х</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map4" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map4" class="ng-binding"><span></span>Химмельсдорф</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map45" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map45" class="ng-binding"><span></span>Хайвей</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map51" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map51" class="ng-binding"><span></span>Хребет Дракона</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map83" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map83" class="ng-binding"><span></span>Харьков</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Ч</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map99" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map99" class="ng-binding"><span></span>Чемпионат
                                                Химмельсдорфа</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Э</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map6" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map6" class="ng-binding"><span></span>Энск</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map13" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map13" class="ng-binding"><span></span>Эрленберг</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map29" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map29" class="ng-binding"><span></span>Эль-Халлуф</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                                <div ng-repeat="(group, checkboxes) in this.maps.checkboxes" class="ng-scope">
                                    <div class="first-letter ng-binding">Ю</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in checkboxes -->
                                        <li ng-repeat="cbx in checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="map39" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="map39" class="ng-binding"><span></span>Южный берег</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: (group, checkboxes) in this.maps.checkboxes -->
                            </div>
                        </div>

                        <div id="tab_2" class="t_container">
                            <div class="t_title ng-binding">Медали</div>
                            <div class="column-content"
                                 ng-init="this.medals = (filter.data.medals.checkboxes | orderByMedalType)">
                                <div style="display: none" class="ng-binding">[{"title":"Герой
                                    битвы","checkboxes":[{"id":34,"title":"Воин","type":"Герой
                                    битвы","checked":false},{"id":35,"title":"Захватчик","type":"Герой
                                    битвы","checked":false},{"id":37,"title":"Защитник","type":"Герой
                                    битвы","checked":false},{"id":38,"title":"Стальная стена","type":"Герой
                                    битвы","checked":false},{"id":39,"title":"Поддержка","type":"Герой
                                    битвы","checked":false},{"id":40,"title":"Разведчик","type":"Герой
                                    битвы","checked":false},{"id":72,"title":"Дозорный","type":"Герой
                                    битвы","checked":false},{"id":227,"title":"Танкист-снайпер","type":"Герой
                                    битвы","checked":false},{"id":228,"title":"Основной калибр","type":"Герой
                                    битвы","checked":false},{"id":232,"title":"Отличник боевой подготовки","type":"Герой
                                    битвы","checked":false},{"id":230,"title":"За отличную стрельбу","type":"Герой
                                    битвы","checked":false}],"position":1},{"title":"Эпические
                                    достижения","checkboxes":[{"id":50,"title":"Медаль Орлика","type":"Эпические
                                    достижения","checked":false},{"id":51,"title":"Медаль Оськина","type":"Эпические
                                    достижения","checked":false},{"id":52,"title":"Медаль Халонена","type":"Эпические
                                    достижения","checked":false},{"id":53,"title":"Медаль Бурды","type":"Эпические
                                    достижения","checked":false},{"id":54,"title":"Медаль Бийота","type":"Эпические
                                    достижения","checked":false},{"id":55,"title":"Медаль Колобанова","type":"Эпические
                                    достижения","checked":false},{"id":56,"title":"Медаль Фадина","type":"Эпические
                                    достижения","checked":false},{"id":73,"title":"Медаль
                                    Рэдли-Уолтерса","type":"Эпические
                                    достижения","checked":false},{"id":74,"title":"Медаль Пула","type":"Эпические
                                    достижения","checked":false},{"id":75,"title":"Медаль Бруно","type":"Эпические
                                    достижения","checked":false},{"id":76,"title":"Медаль Тарцая","type":"Эпические
                                    достижения","checked":false},{"id":77,"title":"Медаль Паскуччи","type":"Эпические
                                    достижения","checked":false},{"id":78,"title":"Медаль Думитру","type":"Эпические
                                    достижения","checked":false},{"id":106,"title":"Медаль
                                    Лехвеслайхо","type":"Эпические
                                    достижения","checked":false},{"id":107,"title":"Медаль Николса","type":"Эпические
                                    достижения","checked":false},{"id":110,"title":"Медаль героев
                                    Расейняя","type":"Эпические достижения","checked":false},{"id":145,"title":"Медаль
                                    де Ланглада","type":"Эпические
                                    достижения","checked":false},{"id":146,"title":"Медаль Тамада
                                    Йошио","type":"Эпические достижения","checked":false},{"id":148,"title":"Медаль
                                    Найдина","type":"Эпические достижения","checked":false},{"id":305,"title":"Медаль
                                    «Поле боя: Арденнская операция 1944 года»","type":"Эпические
                                    достижения","checked":false},{"id":301,"title":"Медаль «Поле боя: бои у озера
                                    Балатон»","type":"Эпические достижения","checked":false},{"id":303,"title":"Медаль
                                    «Поле боя: битва на Курской дуге»","type":"Эпические
                                    достижения","checked":false},{"id":298,"title":"Медаль Гора","type":"Эпические
                                    достижения","checked":false},{"id":300,"title":"Медаль Старка","type":"Эпические
                                    достижения","checked":false}],"position":0},{"title":"Почётные
                                    звания","checkboxes":[{"id":61,"title":"Рейдер","type":"Почётные
                                    звания","checked":false},{"id":62,"title":"Коса смерти","type":"Почётные
                                    звания","checked":false},{"id":64,"title":"Камикадзе","type":"Почётные
                                    звания","checked":false},{"id":147,"title":"Бомбардир","type":"Почётные
                                    звания","checked":false},{"id":237,"title":"Тактик","type":"Почётные
                                    звания","checked":false},{"id":306,"title":"Уроки истории: Арденнская операция 1944
                                    года","type":"Почётные звания","checked":false},{"id":302,"title":"Уроки истории:
                                    бои у озера Балатон","type":"Почётные
                                    звания","checked":false},{"id":304,"title":"Уроки истории: битва на Курской
                                    дуге","type":"Почётные звания","checked":false},{"id":297,"title":"За
                                    контрбатарейную стрельбу","type":"Почётные
                                    звания","checked":false},{"id":299,"title":"Хладнокровный","type":"Почётные
                                    звания","checked":false},{"id":289,"title":"За волю к победе","type":"Почётные
                                    звания","checked":false},{"id":523,"title":"Дуэлянт","type":"Почётные
                                    звания","checked":false},{"id":522,"title":"Боец","type":"Почётные
                                    звания","checked":false},{"id":517,"title":"Непробиваемый","type":"Почётные
                                    звания","checked":false},{"id":521,"title":"Огонь на поражение","type":"Почётные
                                    звания","checked":false}],"position":3},{"title":"Групповые
                                    достижения","checkboxes":[{"id":143,"title":"Братья по оружию","type":"Групповые
                                    достижения","checked":false},{"id":144,"title":"Решающий вклад","type":"Групповые
                                    достижения","checked":false},{"id":236,"title":"Бронетанковый
                                    кулак","type":"Групповые
                                    достижения","checked":false}],"position":2},{"title":"Памятные
                                    знаки","checkboxes":[{"id":150,"title":"Спартанец","type":"Памятные
                                    знаки","checked":false},{"id":151,"title":"Невозмутимый","type":"Памятные
                                    знаки","checked":false},{"id":152,"title":"Счастливчик","type":"Памятные
                                    знаки","checked":false},{"id":233,"title":"Царь горы","type":"Памятные
                                    знаки","checked":false},{"id":286,"title":"Бог войны","type":"Памятные
                                    знаки","checked":false},{"id":296,"title":"Монолит","type":"Памятные
                                    знаки","checked":false},{"id":479,"title":"Бой до последнего","type":"Памятные
                                    знаки","checked":false},{"id":525,"title":"Поджигатель","type":"Памятные
                                    знаки","checked":false},{"id":526,"title":"Костолом","type":"Памятные
                                    знаки","checked":false},{"id":527,"title":"Заговорённый","type":"Памятные
                                    знаки","checked":false},{"id":524,"title":"Взрывотехник","type":"Памятные
                                    знаки","checked":false},{"id":528,"title":"В расчёте!","type":"Памятные
                                    знаки","checked":false}],"position":4}]
                                </div>
                                <!-- ngRepeat: group in this.medals | orderBy: 'position' -->
                                <div ng-repeat="group in this.medals | orderBy: 'position'" style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Эпические достижения</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal50" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal50" class="ng-binding"><span></span>Медаль Орлика</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal51" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal51" class="ng-binding"><span></span>Медаль Оськина</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal52" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal52" class="ng-binding"><span></span>Медаль Халонена</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal53" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal53" class="ng-binding"><span></span>Медаль Бурды</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal54" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal54" class="ng-binding"><span></span>Медаль Бийота</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal55" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal55" class="ng-binding"><span></span>Медаль
                                                Колобанова</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal56" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal56" class="ng-binding"><span></span>Медаль Фадина</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal73" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal73" class="ng-binding"><span></span>Медаль
                                                Рэдли-Уолтерса</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal74" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal74" class="ng-binding"><span></span>Медаль Пула</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal75" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal75" class="ng-binding"><span></span>Медаль Бруно</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal76" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal76" class="ng-binding"><span></span>Медаль Тарцая</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal77" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal77" class="ng-binding"><span></span>Медаль Паскуччи</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal78" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal78" class="ng-binding"><span></span>Медаль Думитру</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal106" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal106" class="ng-binding"><span></span>Медаль
                                                Лехвеслайхо</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal107" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal107" class="ng-binding"><span></span>Медаль Николса</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal110" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal110" class="ng-binding"><span></span>Медаль героев Расейняя</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal145" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal145" class="ng-binding"><span></span>Медаль де
                                                Ланглада</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal146" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal146" class="ng-binding"><span></span>Медаль Тамада
                                                Йошио</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal148" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal148" class="ng-binding"><span></span>Медаль Найдина</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal305" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal305" class="ng-binding"><span></span>Медаль «Поле боя:
                                                Арденнская операция 1944 года»</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal301" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal301" class="ng-binding"><span></span>Медаль «Поле боя: бои
                                                у озера Балатон»</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal303" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal303" class="ng-binding"><span></span>Медаль «Поле боя:
                                                битва на Курской дуге»</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal298" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal298" class="ng-binding"><span></span>Медаль Гора</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal300" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal300" class="ng-binding"><span></span>Медаль Старка</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: group in this.medals | orderBy: 'position' -->
                                <div ng-repeat="group in this.medals | orderBy: 'position'" style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Герой битвы</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal34" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal34" class="ng-binding"><span></span>Воин</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal35" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal35" class="ng-binding"><span></span>Захватчик</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal37" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal37" class="ng-binding"><span></span>Защитник</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal38" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal38" class="ng-binding"><span></span>Стальная стена</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal39" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal39" class="ng-binding"><span></span>Поддержка</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal40" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal40" class="ng-binding"><span></span>Разведчик</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal72" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal72" class="ng-binding"><span></span>Дозорный</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal227" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal227"
                                                   class="ng-binding"><span></span>Танкист-снайпер</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal228" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal228" class="ng-binding"><span></span>Основной
                                                калибр</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal232" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal232" class="ng-binding"><span></span>Отличник боевой
                                                подготовки</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal230" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal230" class="ng-binding"><span></span>За отличную
                                                стрельбу</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: group in this.medals | orderBy: 'position' -->
                                <div ng-repeat="group in this.medals | orderBy: 'position'" style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Групповые достижения</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal143" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal143" class="ng-binding"><span></span>Братья по
                                                оружию</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal144" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal144" class="ng-binding"><span></span>Решающий вклад</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal236" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal236" class="ng-binding"><span></span>Бронетанковый
                                                кулак</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: group in this.medals | orderBy: 'position' -->
                                <div ng-repeat="group in this.medals | orderBy: 'position'" style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Почётные звания</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal61" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal61" class="ng-binding"><span></span>Рейдер</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal62" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal62" class="ng-binding"><span></span>Коса смерти</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal64" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal64" class="ng-binding"><span></span>Камикадзе</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal147" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal147" class="ng-binding"><span></span>Бомбардир</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal237" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal237" class="ng-binding"><span></span>Тактик</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal306" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal306" class="ng-binding"><span></span>Уроки истории:
                                                Арденнская операция 1944 года</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal302" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal302" class="ng-binding"><span></span>Уроки истории: бои у
                                                озера Балатон</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal304" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal304" class="ng-binding"><span></span>Уроки истории: битва
                                                на Курской дуге</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal297" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal297" class="ng-binding"><span></span>За контрбатарейную
                                                стрельбу</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal299" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal299" class="ng-binding"><span></span>Хладнокровный</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal289" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal289" class="ng-binding"><span></span>За волю к
                                                победе</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal523" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal523" class="ng-binding"><span></span>Дуэлянт</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal522" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal522" class="ng-binding"><span></span>Боец</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal517" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal517" class="ng-binding"><span></span>Непробиваемый</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal521" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal521" class="ng-binding"><span></span>Огонь на
                                                поражение</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: group in this.medals | orderBy: 'position' -->
                                <div ng-repeat="group in this.medals | orderBy: 'position'" style="margin-bottom: 25px;"
                                     class="ng-scope">
                                    <div class="t_title ng-binding">Памятные знаки</div>
                                    <ul>
                                        <!-- ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal150" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal150" class="ng-binding"><span></span>Спартанец</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal151" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal151" class="ng-binding"><span></span>Невозмутимый</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal152" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal152" class="ng-binding"><span></span>Счастливчик</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal233" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal233" class="ng-binding"><span></span>Царь горы</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal286" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal286" class="ng-binding"><span></span>Бог войны</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal296" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal296" class="ng-binding"><span></span>Монолит</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal479" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal479" class="ng-binding"><span></span>Бой до
                                                последнего</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal525" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal525" class="ng-binding"><span></span>Поджигатель</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal526" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal526" class="ng-binding"><span></span>Костолом</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal527" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal527" class="ng-binding"><span></span>Заговорённый</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal524" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal524" class="ng-binding"><span></span>Взрывотехник</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                        <li ng-repeat="cbx in group.checkboxes" class="ng-scope">
                                            <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                   id="medal528" ng-model="cbx.checked" ng-change="filter.update();">
                                            <label for="medal528" class="ng-binding"><span></span>В расчёте!</label>
                                        </li>
                                        <!-- end ngRepeat: cbx in group.checkboxes -->
                                    </ul>
                                </div>
                                <!-- end ngRepeat: group in this.medals | orderBy: 'position' -->
                            </div>
                        </div>

                        <div id="tab_3" class="t_container">
                            <div style="display: inline-block; vertical-align: top; margin-right: 60px;">
                                <div class="t_title">Поиск по игроку</div>
                                <div class="m_search-container search-player">
                                    <input class="m_search ng-pristine ng-untouched ng-valid" type="text"
                                           ng-model="filter.search.player.query" ng-change="filter.search.get('player')"
                                           placeholder="введите имя игрока">
                                    <!-- ngIf: filter.search.player.results -->
                                </div>
                            </div>
                            <div style="display: inline-block; vertical-align: top;">
                                <div class="t_title">Поиск по клану</div>
                                <div style="display: none" class="ng-binding">{"query":null,"results":null}</div>
                                <div class="m_search-container search-clan">
                                    <input class="m_search ng-pristine ng-untouched ng-valid" type="text"
                                           ng-model="filter.search.clan.query" ng-change="filter.search.get('clan')"
                                           placeholder="введите название клана">
                                    <!-- ngIf: filter.search.clan.results -->
                                </div>
                            </div>
                        </div>

                        <div id="tab_4" class="t_container">
                            <div class="tf_filters">
                                <div class="t_title ng-binding">Тип боя</div>
                                <ul class="two-column">
                                    <!-- ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type1" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type1" class="ng-binding"><span></span>Случайный бой</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type2" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type2" class="ng-binding"><span></span>Тренировка</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type3" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type3" class="ng-binding"><span></span>Ротный бой</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type4" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type4" class="ng-binding"><span></span>Турнир</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type5" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type5" class="ng-binding"><span></span>ГК</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type6" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type6" class="ng-binding"><span></span>Боевое
                                            обучение</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type7" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type7" class="ng-binding"><span></span>Командный бой</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type8" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type8" class="ng-binding"><span></span>Исторические
                                            бои</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type9" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type9" class="ng-binding"><span></span>Химмельсбол</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type10" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type10" class="ng-binding"><span></span>Вылазка</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.battle_type.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                               id="battle_type11" ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="battle_type11" class="ng-binding"><span></span>Битва за
                                            Укрепрайон</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.battle_type.checkboxes -->
                                </ul>
                            </div>

                            <div class="tf_filters">
                                <div class="t_title ng-binding">Респ</div>
                                <ul>
                                    <!-- ngRepeat: cbx in filter.data.respawn.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.respawn.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="resp1"
                                               ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="resp1" class="ng-binding"><span></span>1</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.respawn.checkboxes -->
                                    <li ng-repeat="cbx in filter.data.respawn.checkboxes" class="ng-scope">
                                        <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid" id="resp2"
                                               ng-model="cbx.checked" ng-change="filter.update();">
                                        <label for="resp2" class="ng-binding"><span></span>2</label>
                                    </li>
                                    <!-- end ngRepeat: cbx in filter.data.respawn.checkboxes -->
                                </ul>
                            </div>

                            <div class="tf_filters">
                                <div class="t_title">Знак классности</div>
                                <ul>
                                    <li>
                                        <input type="checkbox" class="cbx" id="mastery"
                                               ng-checked="routing.compilation.link == 'aceTanker'"
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
                                        <span class="ng-binding">по дате</span>
                                    </div>

                                    <div class="vs_slider">
                                        <div class="frame" style="height: 185px;">
                                            <ul class="slider">
                                                <!-- ngRepeat: (key, title) in filter.sort -->
                                                <li ng-repeat="(key, title) in filter.sort"
                                                    
                                                    class="ng-scope">
                                                    <label class="ng-binding">по кредитам</label>
                                                </li>
                                                <li ng-repeat="(key, title) in filter.sort"
                                                    
                                                    class="ng-scope">
                                                    <label class="ng-binding">по фрагам</label>
                                                </li>
                                                <!-- end ngRepeat: (key, title) in filter.sort -->
                                                <li ng-repeat="(key, title) in filter.sort"
                                                    
                                                    class="ng-scope">
                                                    <label class="ng-binding">по урону</label>
                                                </li>
                                                <!-- end ngRepeat: (key, title) in filter.sort -->
                                                <li ng-repeat="(key, title) in filter.sort"
                                                    
                                                    class="ng-scope">
                                                    <label class="ng-binding">по дате</label>
                                                </li>
                                                <!-- end ngRepeat: (key, title) in filter.sort -->
                                                <li ng-repeat="(key, title) in filter.sort"
                                                    
                                                    class="ng-scope">
                                                    <label class="ng-binding">по опыту</label>
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
                                        <!-- ngIf: filter.areAllSelected(filter.data.version) -->

                                        <!-- ngIf: !filter.areAllSelected(filter.data.version) --><span
                                            ng-if="!filter.areAllSelected(filter.data.version)" class="ng-scope">
                                            <!-- ngRepeat: cbx in filter.getChecked(filter.data.version) --><span
                                            ng-repeat="cbx in filter.getChecked(filter.data.version)"
                                            class="ng-binding ng-scope">
                                                <!-- ngIf: $index > 0 -->0.9.5
                                            </span><!-- end ngRepeat: cbx in filter.getChecked(filter.data.version) -->
                                        </span><!-- end ngIf: !filter.areAllSelected(filter.data.version) -->
                                    </div>

                                    <div id="vs_slider" class="vs_slider">
                                        <div class="frame" style="overflow: hidden;">
                                            <ul class="slider" style="transform: translateZ(0px);">
                                                <li>
                                                    <input type="checkbox" class="cbx">
                                                    <label class="ng-binding">
                                                        Выбрать все
                                                    </label>
                                                </li>
                                                <!-- ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version34" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version34" class="ng-binding">0.9.5</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version33" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version33" class="ng-binding">0.9.4</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version31" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version31" class="ng-binding">0.9.3</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version30" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version30" class="ng-binding">0.9.2</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version29" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version29" class="ng-binding">0.9.1</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version28" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version28" class="ng-binding">0.9.0</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version27" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version27" class="ng-binding">0.8.11</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version26" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version26" class="ng-binding">0.8.10</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version25" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version25" class="ng-binding">0.8.9</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version24" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version24" class="ng-binding">0.8.8</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version23" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version23" class="ng-binding">0.8.7</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version21" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version21" class="ng-binding">0.8.6</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version19" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version19" class="ng-binding">0.8.5</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version17" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version17" class="ng-binding">0.8.4</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version16" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version16" class="ng-binding">0.8.3</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version14" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version14" class="ng-binding">0.8.2</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version13" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version13" class="ng-binding">0.8.1</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version7" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version7" class="ng-binding">0.8.0</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version6" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version6" class="ng-binding">0.7.5</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version5" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version5" class="ng-binding">0.7.4</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version4" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version4" class="ng-binding">0.7.3</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version1" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version1" class="ng-binding">0.7.2</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version2" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version2" class="ng-binding">0.7.1</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version3" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version3" class="ng-binding">0.6.6</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version20" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version20" class="ng-binding">0.4.5</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version18" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version18" class="ng-binding">1.0.4</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version32" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version32" class="ng-binding">0.0.0</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
                                                <li ng-repeat="cbx in filter.data.version.checkboxes" class="ng-scope">
                                                    <input type="checkbox" class="cbx ng-pristine ng-untouched ng-valid"
                                                           id="version22" ng-model="cbx.checked"
                                                           ng-change="filter.update();">
                                                    <label for="version22" class="ng-binding">0.9.9</label>
                                                </li>
                                                <!-- end ngRepeat: cbx in filter.data.version.checkboxes -->
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

                            <span class="tf_s__selectall" >Очистить все фильтры&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>

                            <!-- ngIf: routing.compilation.title -->

                            <!-- ngRepeat: (key, filterType) in filter.data.tank.filters -->
                            <!-- ngIf: filter.selected[key] -->
                            <div ng-repeat="(key, filterType) in filter.data.tank.filters" ng-if="filter.selected[key]"
                                 class="ng-scope">
                                <small class="ng-binding">Уровни:</small>

                                <!-- ngIf: !filter.areAllSelected(filterType) --><span
                                    ng-if="!filter.areAllSelected(filterType)" class="ng-scope">
                                    <!-- ngRepeat: cbx in filter.getChecked(filterType) --><a title="Удалить фильтр"
                                                                                              ng-repeat="cbx in filter.getChecked(filterType)"
                                                                                              
                                                                                              class="ng-binding ng-scope">4</a><!-- end ngRepeat: cbx in filter.getChecked(filterType) -->
                                </span><!-- end ngIf: !filter.areAllSelected(filterType) -->

                                <!-- ngIf: filter.areAllSelected(filterType) -->
                            </div>
                            <!-- end ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data.tank.filters -->
                            <!-- ngIf: filter.selected[key] -->
                            <div ng-repeat="(key, filterType) in filter.data.tank.filters" ng-if="filter.selected[key]"
                                 class="ng-scope">
                                <small class="ng-binding">Нации:</small>

                                <!-- ngIf: !filter.areAllSelected(filterType) --><span
                                    ng-if="!filter.areAllSelected(filterType)" class="ng-scope">
                                    <!-- ngRepeat: cbx in filter.getChecked(filterType) --><a title="Удалить фильтр"
                                                                                              ng-repeat="cbx in filter.getChecked(filterType)"
                                                                                              
                                                                                              class="ng-binding ng-scope">Франция</a><!-- end ngRepeat: cbx in filter.getChecked(filterType) -->
                                </span><!-- end ngIf: !filter.areAllSelected(filterType) -->

                                <!-- ngIf: filter.areAllSelected(filterType) -->
                            </div>
                            <!-- end ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data.tank.filters -->
                            <!-- ngIf: filter.selected[key] -->
                            <div ng-repeat="(key, filterType) in filter.data.tank.filters" ng-if="filter.selected[key]"
                                 class="ng-scope">
                                <small class="ng-binding">Типы:</small>

                                <!-- ngIf: !filter.areAllSelected(filterType) --><span
                                    ng-if="!filter.areAllSelected(filterType)" class="ng-scope">
                                    <!-- ngRepeat: cbx in filter.getChecked(filterType) --><a title="Удалить фильтр"
                                                                                              ng-repeat="cbx in filter.getChecked(filterType)"
                                                                                              
                                                                                              class="ng-binding ng-scope">ПТ</a><!-- end ngRepeat: cbx in filter.getChecked(filterType) -->
                                </span><!-- end ngIf: !filter.areAllSelected(filterType) -->

                                <!-- ngIf: filter.areAllSelected(filterType) -->
                            </div>
                            <!-- end ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data.tank.filters -->

                            <!-- ngRepeat: (key, filterType) in filter.data --><!-- ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data --><!-- ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data --><!-- ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data --><!-- ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data --><!-- ngIf: filter.selected[key] -->
                            <div ng-repeat="(key, filterType) in filter.data" ng-if="filter.selected[key]"
                                 class="ng-scope">
                                <small class="ng-binding">Танки:</small>

                                <!-- ngIf: !filter.areAllSelected(filterType) --><span
                                    ng-if="!filter.areAllSelected(filterType)" class="ng-scope">
                                    <!-- ngRepeat: cbx in filter.getChecked(filterType) --><a title="Удалить фильтр"
                                                                                              ng-repeat="cbx in filter.getChecked(filterType)"
                                                                                              
                                                                                              class="ng-binding ng-scope">Somua
                                SAu 40</a><!-- end ngRepeat: cbx in filter.getChecked(filterType) -->
                                </span><!-- end ngIf: !filter.areAllSelected(filterType) -->

                                <!-- ngIf: filter.areAllSelected(filterType) -->
                            </div>
                            <!-- end ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data --><!-- ngIf: filter.selected[key] -->
                            <div ng-repeat="(key, filterType) in filter.data" ng-if="filter.selected[key]"
                                 class="ng-scope">
                                <small class="ng-binding">Версии:</small>

                                <!-- ngIf: !filter.areAllSelected(filterType) --><span
                                    ng-if="!filter.areAllSelected(filterType)" class="ng-scope">
                                    <!-- ngRepeat: cbx in filter.getChecked(filterType) --><a title="Удалить фильтр"
                                                                                              ng-repeat="cbx in filter.getChecked(filterType)"
                                                                                              
                                                                                              class="ng-binding ng-scope">0.9.5</a><!-- end ngRepeat: cbx in filter.getChecked(filterType) -->
                                </span><!-- end ngIf: !filter.areAllSelected(filterType) -->

                                <!-- ngIf: filter.areAllSelected(filterType) -->
                            </div>
                            <!-- end ngIf: filter.selected[key] -->
                            <!-- end ngRepeat: (key, filterType) in filter.data -->

                        </div>
                    </div>

                </div>


            </div>

        </div>

        <div class="m-item">

            <a href="/streams" ng-class="{active: routing.active.item === 'streams'}" class="m-item_title"
               style="width: 162px;">Трансляции</a>

        </div>

        <div class="m-item">

            <!-- ngIf: competitions.count === 0 -->

            <!-- ngIf: competitions.count != 0 --><a ng-if="competitions.count != 0" ng-href="/competition/47"
                                                     ng-class="{active: routing.active.item === 'competition'}"
                                                     class="m-item_title orange-href ng-binding ng-scope"
                                                     style="width: 171px;" href="/competition/47">Идут конкурсы</a><!-- end ngIf: competitions.count != 0 -->

        </div>


        <div class="m-item_dropdown compilations wgl collapsed">

            <div class="m-item_title" style="width: 153px;" ng-class="{active: routing.active.item === 'wgleague'}">WG
                League
            </div>

            <div class="m-item_container" style="height: 41px;">
                <div>
                    <a href="/wgleague#?league=gold" style="background-position: -217px -39px;">Gold Series</a>
                </div>
            </div>
        </div>

        <div class="m-item_dropdown compilations collapsed">

            <div class="m-item_title" style="width: 162px;" ng-class="{active: routing.active.item === 'compilations'}">
                Подборки
            </div>

            <div class="m-item_container" style="height: 351px;">
                <div>
                    <a >Реплеи с видео</a>
                    <a </a>
                    <a href="/clans">Реплеи кланов</a>
                    <a >Популярные реплеи за неделю</a>
                    <a href="/site/master">График опыта мастеров</a>
                    <a >Максимум
                        урона</a>
                    <a >Максимум
                        опыта</a>
                    <a >Максимум
                        кредитов</a>
                    <a >Максимум
                        фрагов</a>
                </div>
            </div>

        </div>
    </div>


    <!--   *********************   -->
    <!--          CONTENT          -->
    <!--   *********************   -->


    <!--   *********************   -->
    <!--           NEWS            -->
    <!--   *********************   -->


    <div>
        <div class="b-replays" ng-init="dataInitial = true">
            <!-- ngIf: routing.compilation.title -->

            <div class="b-sort b-replays__sort">
                <span class="b-sort__label">Сортировать</span>
                <ul class="b-sort__list b-list">
                    <!-- ngRepeat: (key, title) in filter.sort -->
                    <li ng-repeat="(key, title) in filter.sort" class="b-list__item ng-scope">
                        <a class="b-link" 
                           ng-class="{'b-link_active': selected.filter.sort.type == key}">
                            <span class="b-link__text ng-binding">по кредитам</span>
                            <!-- ngIf: selected.filter.sort.type == key -->
                        </a>
                    </li>
                    <li ng-repeat="(key, title) in filter.sort" class="b-list__item ng-scope">
                        <a class="b-link" 
                           ng-class="{'b-link_active': selected.filter.sort.type == key}">
                            <span class="b-link__text ng-binding">по фрагам</span>
                            <!-- ngIf: selected.filter.sort.type == key -->
                        </a>
                    </li>
                    <!-- end ngRepeat: (key, title) in filter.sort -->
                    <li ng-repeat="(key, title) in filter.sort" class="b-list__item ng-scope">
                        <a class="b-link" 
                           ng-class="{'b-link_active': selected.filter.sort.type == key}">
                            <span class="b-link__text ng-binding">по урону</span>
                            <!-- ngIf: selected.filter.sort.type == key -->
                        </a>
                    </li>
                    <!-- end ngRepeat: (key, title) in filter.sort -->
                    <li ng-repeat="(key, title) in filter.sort" class="b-list__item ng-scope">
                        <a class="b-link b-link_active" 
                           ng-class="{'b-link_active': selected.filter.sort.type == key}">
                            <span class="b-link__text ng-binding">по дате</span>
                            <span ng-if="selected.filter.sort.type == key" class="ng-scope">
                            <ins class="b-sort__dir ng-scope"
                                 ng-if="selected.filter.sort.direction">↓
                            </ins>
                        </span>
                        </a>
                    </li>
                    <!-- end ngRepeat: (key, title) in filter.sort -->
                    <li ng-repeat="(key, title) in filter.sort" class="b-list__item ng-scope">
                        <a class="b-link" 
                           ng-class="{'b-link_active': selected.filter.sort.type == key}">
                            <span class="b-link__text ng-binding">по опыту</span>
                            <!-- ngIf: selected.filter.sort.type == key -->
                        </a>
                    </li>
                    <!-- end ngRepeat: (key, title) in filter.sort -->
                </ul>
            </div>

            <!-- ngIf: dataInitial -->
            <div ng-if="dataInitial" class="ng-scope">
                <ul class="r_list initial" id="battlesContainer">


                </ul>
            </div>
            <!-- end ngIf: dataInitial -->

            <!-- ngIf: !dataInitial -->

            <ul class="pagination replays-pagination" style="height: 29px; overflow: visible;">
                <li 
                    ng-class="{disabled: !pages.prevPage}" class="disabled">
                    ← Назад
                </li>
                <!-- ngRepeat: page in pages.arr -->
                <li 
                    ng-class="{active: page == pages.current}" class="ng-binding ng-scope active">
                    1
                </li>
                <!-- end ngRepeat: page in pages.arr -->
                <li 
                    ng-class="{active: page == pages.current}" class="ng-binding ng-scope">
                    2
                </li>
                <!-- end ngRepeat: page in pages.arr -->
                <li 
                    ng-class="{active: page == pages.current}" class="ng-binding ng-scope">
                    3
                </li>
                <!-- end ngRepeat: page in pages.arr -->
                <li 
                    ng-class="{active: page == pages.current}" class="ng-binding ng-scope">
                    4
                </li>
                <!-- end ngRepeat: page in pages.arr -->
                <li 
                    ng-class="{active: page == pages.current}" class="ng-binding ng-scope">
                    5
                </li>
                <!-- end ngRepeat: page in pages.arr -->
                <li 
                    ng-class="{disabled: !pages.nextPage}" class="">
                    Вперёд →
                </li>
            </ul>

        </div>
    </div>


</div>
</body>

<script id="battleTableViewTemplate" type="x-tmpl-mustache">
                <li class="clearfix">

                    <a class="r-map_85" href="/site/4504448#tihiy_bereg-ritterschvert-somua_sau_40"
                       title="Тихий берег">
                        <img src="http://wotreplays.ru/media/img/maps/canada_a.jpg"></img>
                    </a>

                    <div class="r-info">
                        <h3>
						<a href="/site/4504448#tihiy_bereg-ritterschvert-somua_sau_40">
						Somua SAu 40, {{_source.mapDisplayName}}, Стандартный бой</a></h3>
                        <ul class="r-info_ri">
                            <li><i class="i-16_frags"></i> 5</li>
                            <li><i class="i-16_exp"></i> 840</li>
                            <li><i class="i-16_cr"></i> 25399</li>
                            <li><i class="i-16_dmg"></i> 1217</li>
                            <li><i class="i-16_master"></i> Мастер</li>
                        </ul>
                        <ul class="r-info_ci">
								<li><b>Танк:</b> {{_source.playerVehicle}}</li>
								<li><b>Режим:</b> Встречный бой</li>
								<li><b>Отправил:</b> {{_source.playerName}} <span class="b-date">2015-01-25 в 17:33</span></li>
                        </ul>
                    </div>
                    <div class="r-act">
                        <a href="{{_id}}" class="btn_l-grey">Запустить реплей</a>
                    </div>
                </li>
</script>

<script>
    var battles = ${battles};
    var battleTableViewTemplate = $('#battleTableViewTemplate').html();
	
    Mustache.parse(battleTableViewTemplate);
	var battlesContainer = $('#battlesContainer');
	for (var index in battles) {
	var battle = battles[index];
		battlesContainer.append(Mustache.render(battleTableViewTemplate, battle));
	}
	
</script>
</html>