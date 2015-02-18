<#include "site.ftl">

<@site>

<div class="main clearfix" id="baseCtrl">
    <div class="progress-bar">
        <span style="width: 0"></span>
    </div>
    <div class="main-menu clearfix" style="margin-bottom: 319px;">
        <div class="m-item_dropdown expanded" id="helper-1">
            <div class="m-item_container">
                <div class="tabs clearfix">
                    <div class="t_labels">
                        <div class="t_label active" data-target="tab_0">
                            <i class="i-24_tank"></i>
                            ${translate.tab_tanks}
                        </div>
                        <div class="t_label" data-target="tab_1">
                            <i class="i-24_map"></i>
                            ${translate.tab_maps}
                        </div>
                        <div class="t_label" data-target="tab_2">
                            <i class="i-24_medal2"></i>
                            ${translate.tab_medals}
                        </div>
                        <div class="t_label" data-target="tab_3">
                            <i class="i-24_ppl"></i>
                            ${translate.tab_user}
                        </div>
                        <div class="t_label" data-target="tab_4">
                            <i class="i-24_gear"></i>
                            ${translate.tab_other}
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
                            <a href="./search.do">
                                <span class="tf_s__selectall">${translate.facet_clear}<i></i></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="b-replays">
            <div class="b-sort b-replays__sort">
                <span class="b-sort__label">${translate.sort}:</span>
                <ul class="b-sort__list b-list">
                    <#list sortTypes as sortType>
                        <li class="b-list__item">
                            <a class="b-link">
                                <div class="b-link__text" id="${sortType.name()}">
                                    ${sortType.getName()}
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

<#include "battlesTable.mustache" />
<#include "battlesTile.mustache" />

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
        return queryParams.join('&');
    };

    var onFacetsChanged = function () {
        getData(buildQueryUrl());
    };

    window.addEventListener('popstate', function () {
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
            url: './search_ajax.do?' + query,
            async: true,
            dataType: "json",
            cache: false,
            success: function (data) {
                if (currentDataNumber > appliedDataNumber) {
                    history.pushState(data, null, location.pathname + '?' + query);
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
        battles = data;
    };

    var renewCheckboxes = function () {
        var queryParams = parseUrlParams();
        for (var i in facets)
            facets[i].setSelected(queryParams);
    };

    function FieldFacet(id, facetData) {
        this.id = id;
        $.extend(this, facetData);
        var facetContainer = document.getElementById(this.id);
        facetContainer.innerHTML = this.template(this);
    }

    FieldFacet.prototype.template = Handlebars.compile($('#fieldFacetTemplate').html());
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
        var selectedValues = queryParams[this.id] ? queryParams[this.id] : [];
        for (var value in this.values)
            $('#' + this.id + ' #' + value).prop('checked', selectedValues.indexOf(value) != -1);
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
        $('.b-replays__sort a').on('click', $.proxy(this.onClick, this));
    }

    SortFacet.prototype.defaultSort = '${defaultSort.name()}';
    SortFacet.prototype.defaultOrder = '${defaultOrder.name()}';

    SortFacet.prototype.onClick = function (event) {
        var param = {
            sortType: event.target.id,
            sortOrder: 'DESC'
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
        if (!queryParams.sortType)
            queryParams.sortType = this.defaultSort;
        if (this.sort != queryParams.sortType)
            $('.b-replays__sort #' + this.sort).removeClass('b-link_active');
        this.sort = queryParams.sortType;
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
    facets.push(new SortFacet());

    history.replaceState(battles, null);
    applyData(battles);
    renewCheckboxes();

    var renewProgress = function() {
        $.ajax({
            url: '/indexer_state.do',
            async: true,
            dataType: "json",
            cache: false,
            success: function (data) {
                if (data.completed == data.total) {
                    $('.progress-bar').css('display', 'none');
                } else {
                    var progress = Math.ceil(data.completed / data.total * 100);
                    $('.progress-bar span')[0].style.width = progress + '%';
                }
            }
        });
    };

    window.setInterval(renewProgress, 500);

</script>
</@site>