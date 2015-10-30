<#include "site.ftl">

<@site>

<div class="main clearfix">
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

<#include "templates/battlesTable.mustache" />
<#include "templates/battlesTile.mustache" />
<#include "templates/fieldFacet.mustache" />

<script type="text/javascript">

    function FacetsController(facetsData) {
        this.askedQueryNumber = 0;
        this.appliedQueryNumber = 0;
        this.battlesTemplate = this.battlesTableTemplate;
        this.facets = [];
        this.facets.push(new SortFacet(this));
        this.facets.push(new PageFacet(this));

        for (var facetKey in facetsData) {
            var facetData = facetsData[facetKey];
            var facet = new window[facetData.type](facetKey, facetData);

//            switch (facetData.type) {
//                case 'field':
//                    facet = new FieldFacet(facetKey, facetData);
//                    break;
//            }
            this.facets.push(facet);
        }
        window.addEventListener('popstate', $.proxy(this.applyHistoryState, this));
    }

    FacetsController.prototype.battlesContainer = $('#battlesContainer');
    FacetsController.prototype.battlesTableTemplate = Handlebars.compile($('#battlesTableTemplate').html());
    FacetsController.prototype.battlesTileTemplate = Handlebars.compile($('#battlesTileTemplate').html());

    FacetsController.prototype.getQuery = function () {
        var queryParams = [];
        for (var i in this.facets) {
            var queryParam = this.facets[i].getQueryParams();
            if (queryParam)
                queryParams.push(queryParam);
        }
        return queryParams.join('&');
    };

    FacetsController.prototype.parseUrlParams = function () {
        var result = {};
        var search = location.search;
        if (search) {
            var query = search.substring(1);
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

    FacetsController.prototype.reloadData = function () {
        var query = this.getQuery();
        var method = (query.indexOf('page=') != -1)? './paginate.do?' : './search_ajax.do?';
        var queryNumber = ++this.askedQueryNumber;
        $.ajax({
            url: method + query,
            async: true,
            dataType: "json",
            cache: false,
            success: $.proxy(function (data) {
                this.applyData(data, queryNumber, query);
            }, this)
        });
    };

    FacetsController.prototype.applyData = function (data, queryNumber, query) {
        if (queryNumber > this.appliedQueryNumber) {
            history.pushState(data, null, location.pathname + '?' + query);
            this.invalidate();
            this.appliedQueryNumber = queryNumber;
        }
    };

    FacetsController.prototype.invalidate = function (data) {
        this.redrawBattles();
        for (var i in this.facets)
            this.facets[i].redraw();
    };

    FacetsController.prototype.redrawBattles = function () {
        var content = this.battlesTemplate(history.state);
        this.battlesContainer.html(content);
    };

    FacetsController.prototype.changeView = function () {
        if (this.battlesTemplate == this.battlesTableTemplate)
            this.battlesTemplate = this.battlesTileTemplate;
        else
            this.battlesTemplate = this.battlesTableTemplate;
        $('.battles_view').toggleClass('active');
        this.redrawBattles();
    };

    FacetsController.prototype.applyHistoryState = function () {
        this.invalidate();
        var queryParams = this.parseUrlParams();
        for (var i in this.facets)
            this.facets[i].setStateFromUrl(queryParams);
    };

    <#include "facets/abstractFacet.js" />
    <#include "facets/fieldFacet.js" />
    <#include "facets/sortFacet.js" />
    <#include "facets/pageFacet.js" />

    var facetsController = new FacetsController(${facetsData});
    history.replaceState(${battlesData}, null);
    facetsController.applyHistoryState();

    var renewProgress = function() {
        $.ajax({
            url: '/indexer_state.do',
            async: true,
            dataType: "json",
            cache: false,
            success: function (data) {
                if (data.completed == data.total) {
                    $('.progress-bar').css('display', 'none');
                    clearInterval(progressTimerId);
                } else {
                    var progress = Math.floor(data.completed / data.total * 100);
                    $('.progress-bar span')[0].style.width = progress + '%';
                }
            }
        });
    };
    var progressTimerId = setInterval(renewProgress, 500);

</script>
</@site>