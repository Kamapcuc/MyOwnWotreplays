<?xml version='1.0' encoding='UTF-8' ?>
<html lang="ru">
<head>
    <title>My Own WoTReplays</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" media="all">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta charset="UTF-8">
    <script src="resources/js/handlebars-v2.0.0.js"></script>
    <script src="resources/js/jquery-2.1.3.min.js"></script>
    <script src="resources/js/search.js"></script>
    <link rel="icon" type="image/png" href="/resources/img/favicon.ico"/>
</head>
<body>

<header>
    <div class="header-menu clearfix">
        <ul>
        <#list languages as lang>
            <li>
                <a href="/search.do?lang=${lang.id}">
                    <img src="/resources/img/flags/${lang.flag}"/>${lang.name}
                </a>
            </li>
        </#list>
        </ul>
    </div>
</header>

<div style="height: 23px; display: none">
${indexer.getCompleted()}/${indexer.getTotal()}
</div>
<div class="main clearfix" id="baseCtrl">
    <div class="main-menu clearfix" style="margin-bottom: 319px;">
        <div class="m-item_dropdown expanded" id="helper-1">
            <div class="m-item_container">
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
                        <div id="tab_0" class="t_container active" style="padding: 0;">
                            <div class="tank-filter">
                                <div class="tf_filters" id="tankNation">
                                <#-- NATION FACET -->
                                </div>
                                <div class="tf_filters two-column" id="tankLevel">
                                <#-- LEVEL FACET -->
                                </div>
                                <div class="tf_filters" id="tankClass">
                                <#-- CLASS FACET -->
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
                                            <label for="tank798"><span></span>M2</label>
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
                            <div class="tf_filters three-column" id="map">
                            <#-- MAP FACET -->
                            </div>
                        </div>
                        <div id="tab_2" class="t_container"></div>
                        <div id="tab_3" class="t_container"></div>
                        <div id="tab_4" class="t_container"></div>
                    </div>
                    <div class="tabs-bottom">
                        <div class="selected-filters">
                            <span class="tf_s__selectall">Очистить все фильтры</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="b-replays">
            <div class="b-sort b-replays__sort">
                <span class="b-sort__label">Сортировать:</span>
                <ul class="b-sort__list b-list">
                <#list sortTypes as sortType>
                    <li class="b-list__item">
                        <a class="b-link" onclick="sortFacet.onClick(event);">
                            <div class="b-link__text" id="${sortType.name()}">
                            ${sortType.getDescription()}
                                <ins class="b-sort__dir"></ins>
                            </div>
                        </a>
                    </li>
                </#list>
                </ul>
            </div>
            <div id="battlesContainer">
            <#-- BATTLES LIST -->
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
            <a class="r-map_85" href="view.do?id={{_id}}&lang=${language}"
               title="{{map.name}}" style="background-image: url('/resources/img/maps/plan/{{map._id}}.jpg');">
            </a>

            <div class="r-info">
                <h3>
                    <a href="view.do?id={{_id}}&lang=${language}">
                        {{tank.shortName_i18n}}, {{map.name_i18n}}, Стандартный бой
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
                    <li><b>Танк:</b> {{tank.shortName_i18n}}</li>
                    <li><b>Играл:</b> {{playerName}}</li>
                    <li><b>Версия:</b> {{version}}</li>
                    <li><b>Дата:</b> {{date}}</li>
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
            <div class="mrr_head" style="background-image: url(/resources/img/maps/thumb/{{map._id}}.png)"
                 title="{{map.name_i18n}}">
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
                         alt="Медаль Пула" title="Медаль Пула" class="wtst_head_awards_item" />
                    <div class="yellow-ribbon"></div>
                </div>
            </div>
            <div class="mrr_info">
                <div class="mrr_title">{{playerName}} на {{tank.shortName_i18n}}</div>
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

<script id="fieldFacetTemplate" type="text/x-handlebars-template">
    <div class="tf_title">
        <div>{{name}}</div>
    </div>
    <ul>
        {{#each values}}
        <li>
            <input type="checkbox" class="cbx" id="{{@key}}" onchange="onFacetsChanged(event)">
            <label for="{{@key}}">
                <span></span>{{this}}&nbsp;
                <small></small>
            </label>
        </li>
        {{/each}}
    </ul>
</script>

<script>
    var battlesTableTemplate = Handlebars.compile($('#battlesTableTemplate').html());
    var battlesTileTemplate = Handlebars.compile($('#battlesTileTemplate').html());
    var battlesTemplate = battlesTableTemplate;

    var battlesContainer = $('#battlesContainer');

    var battles = ${battlesData};
    var facetsData = ${facetsData};

    var queryNumber = 0;
    var appliedDataNumber = 0;

    var facets = [];

    var buildQueryUrl = function () {
        var queryParams = [];
        for (var i in facets) {
            var queryParam = facets[i].getQueryParam();
            if (queryParam)
                queryParams.push(queryParam);
        }
        queryParams.push('lang=${language}');
        return queryParams.join('&');
    };

    var onFacetsChanged = function () {
        getData(buildQueryUrl());
    };

    window.addEventListener('popstate', function(event) {
        applyData(history.state);
        renewCheckboxes();
    });

    var parseUrlParams = function () {
        var result = {};
        var search = window.location.search;
        if (search) {
            var query = window.location.search.substring(1);
            var vars = query.split('&');
            for (var i = 0; i < vars.length; i++) {
                var variable = vars[i];
                if (variable) {
                    var pair = vars[i].split('=');
                    result[pair[0]] = pair[1].split(',');
                }
            }
        }
        return result;
    };

    var getData = function (query) {
        var currentDataNumber = ++queryNumber;
        $.ajax({
            url: '/search_ajax.do?' + query,
            async: true,
            dataType: "json",
            cache: false,
            success: function (data) {
                if (currentDataNumber > appliedDataNumber) {
                    history.pushState(data, null, location.pathname + '?' + query)
                    applyData(data);
                    currentDataNumber = appliedDataNumber;
                }
            }
        });
    };

    var applyData = function (data) {
        battlesContainer.html(battlesTemplate(data));
        for (var i in facets) {
            var facet = facets[i];
            facet.setResult(data.facets[facet.id]);
        }
    };

    var renewCheckboxes = function() {
        var queryParams = parseUrlParams();
        for (var i in facets)
            facets[i].setSelected(queryParams);
    };

    function FieldFacet(id, facetData) {
        this.id = id;
        $.extend(this, facetData);
        var facetContainer = document.getElementById(id);
        var funcName = 'on' + id + 'Change';
        window[funcName] = this.onClick;
        facetContainer.innerHTML = this.template(this);
    }

    FieldFacet.prototype.template = Handlebars.compile($('#fieldFacetTemplate').html())
    FieldFacet.prototype.getQueryParam = function () {
        var result = [];
        for (var value in this.values)
            if ($('#' + this.id + ' #' + value).prop('checked'))
                result.push(value);
        if (result.length > 0)
            return this.id + '=' + result.join(',');
        else
            return null;
    };

    FieldFacet.prototype.setSelected = function (queryParams) {
        var values = queryParams[this.id];
        if (values)
            for (var i in values)
                $('#' + this.id + ' #' + values[i]).prop('checked', true);
    };

    FieldFacet.prototype.setResult = function (data) {
        for (var value in this.values) {
            var count = data[value];
            var label = $('#' + this.id + ' label[for=' + value + ']');
            if (count) {
                label.find('small').html('(' + data[value] + ')');
                label.removeClass('disabled');
            } else
                label.addClass('disabled');
        }
    };

    function SortFacet() {
        this.sort = this.defaultSort;
        this.order = this.defaultOrder;
    }

    SortFacet.prototype.defaultSort = '${defaultSort.name()}';
    SortFacet.prototype.defaultOrder = '${defaultOrder.name()}';

    SortFacet.prototype.onClick = function (event) {
        var param = {
            sortType : event.target.id,
            sortOrder : 'DESC'
        };
        if (this.sort == param.sortType)
            param.sortOrder = (this.order == 'ASC') ? 'DESC' : 'ASC';

        this.setSelected(param);
        onFacetsChanged();
    };

    SortFacet.prototype.getQueryParam = function () {
        var result = [];
        if (this.sort != this.defaultSort)
            result.push('sortType=' + this.sort);
        if (this.order != this.defaultOrder)
            result.push('sortOrder=' + this.order);
        return result.join("&");
    };

    SortFacet.prototype.setSelected = function (queryParams) {
        if (queryParams.sortType) {
            if (this.sort != queryParams.sortType)
                $('.b-replays__sort #' + this.sort).removeClass('b-link_active');
            this.sort = queryParams.sortType;
        }
        if (queryParams.sortOrder)
            this.order = queryParams.sortOrder;
        var ref = $('.b-replays__sort #' + this.sort);
        ref.addClass('b-link_active');
        ref.find('.b-sort__dir').html((this.order == 'DESC') ? '↑' : '↓');
    };

    SortFacet.prototype.setResult = function () {
        //doNothing
    };

    for (var facetKey in facetsData) {
        var facetData = facetsData[facetKey];
        var facet;
        switch (facetData.type) {
            case 'field':
                facet = new FieldFacet(facetKey, facetData);
                break;
        }
        facets.push(facet);
    }
    var sortFacet = new SortFacet();
    facets.push(sortFacet);

    history.replaceState(battles);
    applyData(battles);
    renewCheckboxes();

</script>
</html>