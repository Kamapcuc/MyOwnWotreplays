<#include "site.ftl">
<#include "table.ftl">

<@site>

<div class="main clearfix view-replay">

    <div class="main-menu clearfix" style="margin-bottom: 30px;">
    </div>

    <div class="b-overlay" id="overlay-container" style="display:none"></div>


    <div id="replayView" class="b-page-content b-page-content_wide">

        <div class="b-replay__hat clearfix">
            <div class="b-replay__buttons">
                <a href="http://wotreplays.ru/site/download/4563201" class="btn_l-orange">${translate.run}</a>
            </div>
        </div>

        <div class="b-replay b-replay_detail">
            <div class="wtst">
                <div class="b-tabs-wrap clearfix">
                    <dl class="b-tabs">
                        <dt id="wtst_self" class="b-tabs__label">${translate.result_tab_self}</dt>
                        <dd class="b-tabs__tab b-tabs__tab-active">
                            <div class="b-tabs__tab-in combat_effect">
                                <div class="wtst_head wtst_head__${battle.result}">
                                    <div class="wtst_head_title">${translate.get(battle.result)}!</div>
                                    <div class="wtst_head_subtitle">
                                        <!--Все танки противника уничтожены-->
                                    </div>
                                    <div class="wtst_head_ribbon clearfix">
                                        <table class="wtst_head_awards">
                                            <tbody>
                                                <tr>

                                                    <#assign flagOnce=true/>
                                                    <#macro tableBreak>
                                                        <#assign flagOnce=false/>
                                                    <#-- start of dirty cheat -->
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="wtst_head_overall">
                                            <div class="wtst_head_credits">${battle.credits?string["###,###,###"]}</div>
                                            <div class="wtst_head_experience">${battle.xp?string["###,###,###"]}</div>
                                        </div>
                                        <table class="wtst_head_awards">
                                            <tbody>
                                                <tr>
                                                    <#-- end of dirty cheat -->
                                                    </#macro>

                                                    <#if battle.medals?size == 0>
                                                        <@tableBreak/>
                                                    </#if>

                                                    <#list battle.medals as medal>
                                                        <#if (medal.section == 'epic' || medal.section == 'battle') && flagOnce>
                                                            <@tableBreak/>
                                                        </#if>

                                                        <td>
                                                            <div class="medal">
                                                                <img src="/resources/img/medals/${medal.image}"
                                                                     alt="${medal.name_i18n}" class="wtst_head_awards_item">
                                                                <#if medal.section == 'epic'>
                                                                    <div class="yellow-ribbon"></div>
                                                                </#if>
                                                                <div class="medal_tooltip animationDelay">
                                                                    <div class="medal-title">${medal.name_i18n}</div>
                                                                    <div class="medal-info">
                                                                    ${medal.condition_i18n?replace('\n', '<br/>')}
                                                                    <br/>
                                                                    ${medal.description_i18n?replace('\n', '<br/>')}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>

                                                        <#if !medal_has_next && flagOnce>
                                                            <@tableBreak/>
                                                        </#if>
                                                    </#list>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="wtst_half wtst_half__left">
                                    <div class="wtst-title__panel wtst-title__gradient">${battle.map.name_i18n} –
                                        Стандартный бой
                                    </div>
                                    <div class="result_map">
                                        <div class="result_map_frame">
                                            <img src="/resources/img/maps/thumb/${battle.map.id}.png"
                                                 alt="${battle.map.name_i18n}">
                                        </div>
                                        <img class="result_map_tank" alt="${battle.tank.name_i18n}"
                                             src="/resources/img/tanks/big/${battle.tank.image}">

                                        <div class="result_map_user">
                                            <div class="result_map_user_name"
                                                 title="${battle.playerName} [TRIKS]">${battle.playerName}
                                                [TRIKS]
                                            </div>
                                            <time class="result_map_user_timestamp">${battle.battleDate}</time>
                                            <div class="result_map_tank_model"
                                                 title="${battle.tank.name_i18n}">${battle.tank.name_i18n}</div>
                                            <div class="result_map_survive">
                                                <!--Выжил-->
                                            </div>
                                        </div>
                                        <table class="result_map_awards">
                                            <thead>
                                            <tr>
                                                <th colspan="2">${translate.result_wo_premium}</th>
                                                <th class="active">${translate.result_premium}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th>${translate.result_credits}</th>
                                                <td class="r_cr ">0</td>
                                                <td class="r_cr active ">${battle.credits?string["###,###,###"]}</td>
                                            </tr>
                                            <tr>
                                                <th>${translate.result_xp}</th>
                                                <td class="r_xp ">0</td>
                                                <td class="r_xp active">${battle.xp?string["###,###,###"]}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="wtst_half wtst_half__right">
                                    <div class="wtst-title__panel wtst-title__gradient">${translate.result_self_efficiency}</div>
                                    <table class="c_table">
                                        <tbody>
                                            <#list battle.battleEfficiency as playerHarm>
                                                <tr><td colspan="8" class="c_sep"></td></tr>
                                                <tr>
                                                    <#if playerHarm.clanAbbrev == ''>
                                                        <#assign playerHarmName = playerHarm.name />
                                                    <#else>
                                                        <#assign playerHarmName = playerHarm.name + '&nbsp;[' + playerHarm.clanAbbrev + ']'/>
                                                    </#if>
                                                    <td class="c_n txt_e">${playerHarmName}</td>
                                                    <td class="c_t txt_e" title="R106_KV85"
                                                        style="background-image: url(/img/results/Tanks_small/ussr-R106_KV85.png)">
                                                        ${playerHarm.tank}
                                                    </td>

                                                    <#if playerHarm.fire != 0>
                                                        <td class="ce ce_k" title="${translate.result_self_kill}"></td>
                                                    <#else>
                                                        <td class="ce ce_k" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#if playerHarm.crits != 0>
                                                        <td class="ce ce_d" title="${translate.result_self_damage}: ${playerHarm.damageDealt}"></td>
                                                    <#else>
                                                        <td class="ce ce_d" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#if playerHarm.crits != 0>
                                                        <td class="ce ce_ch" title="${translate.result_self_critical}: ${playerHarm.crits}">
                                                            <div class="ce_c">${playerHarm.crits}</div>
                                                        </td>
                                                    <#else>
                                                        <td class="ce ce_ch" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#assign assistedDamage = playerHarm.damageAssistedTrack + playerHarm.damageAssistedRadio />
                                                    <#if assistedDamage != 0>
                                                        <td class="ce ce_da" title="${translate.result_self_assist}: ${assistedDamage}"></td>
                                                    <#else>
                                                        <td class="ce ce_da" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#if playerHarm.spotted != 0>
                                                        <td class="ce ce_s" title="${translate.result_self_see}"></td>
                                                    <#else>
                                                        <td class="ce ce_s" style="opacity: 0.2"></td>
                                                    </#if>
                                                </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </dd>

                        <dt id="wtst_team" class="b-tabs__label active">${translate.result_tab_team}</dt>
                        <dd class="b-tabs__tab wtst_team active">
                            <div class="b-tabs__tab-in">
                                <div class="wtst_half wtst_half__left">
                                    <h2>${translate.result_table_allies}</h2>
                                    <@memberTable team=battle.allies/>
                                    <div class="wtst_popup wtst_popup__user"></div>
                                </div>

                                <div class="wtst_half wtst_half__right">
                                    <h2>${translate.result_table_enemies}</h2>
                                    <@memberTable team=battle.enemies/>
                                    <div class="wtst_popup wtst_popup__user"></div>
                                </div>

                            </div>
                        </dd>

                        <dt id="wtst_report" class="b-tabs__label">${translate.result_tab_detail}</dt>
                        <dd class="b-tabs__tab">
                            <div class="b-tabs__tab-in">
                                <div class="wtst-column wtst-column__overall">
                                    <div class="wtst-title__panel">${translate.result_statistics}</div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>${translate.result_stats_shots}</td>
                                                <td>54</td>
                                            </tr>
                                            <tr class="t_sub">
                                                <td class="wtst-tbl_lbl ">${translate.result_stats_hits}</td>
                                                <td>39</td>
                                            </tr>
                                            <tr class="t_sub">
                                                <td>${translate.result_stats_bomb}</td>
                                                <td class="t_null">0</td>
                                            </tr>
                                            <tr class="t_sub">
                                                <td>${translate.result_stats_pierce}</td>
                                                <td>33</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_damage}</td>
                                                <td>3683</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_received}</td>
                                                <td>4</td>
                                            </tr>

                                            <tr class="t_sub">
                                                <td>${translate.result_stats_taken}</td>
                                                <td>4</td>
                                            </tr>

                                            <tr class="t_sub">
                                                <td>${translate.result_stats_avoid}</td>
                                                <td class="t_null">0</td>
                                            </tr>

                                            <tr>
                                                <td>${translate.result_stats_fragments}</td>
                                                <td class="t_null">0</td>
                                            </tr>

                                            <tr>
                                                <td>${translate.result_stats_armor}</td>
                                                <td class="t_null">0</td>
                                            </tr>

                                            <tr>
                                                <td>${translate.result_stats_friendly}</td>
                                                <td class="t_null">0/0</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_spotted}</td>
                                                <td>1</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_damaged}</td>
                                                <td>12</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_frags}</td>
                                                <td>10</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_assist}</td>
                                                <td>137</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_capture}</td>
                                                <td>100</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_defence}</td>
                                                <td>98</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_stats_distance}</td>
                                                <td>4,37</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="wtst-column wtst-column__stats">
                                    <div class="wtst-title__panel">
                                        ${translate.result_credits}
                                        <span class="wtst-title__premium">
                                            ${translate.result_premium}
                                        </span>
                                    </div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>${translate.result_credits_received}</td>
                                                <td class="r_cr t_null ">36&nbsp;805</td>
                                                <td class="t_div"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_cr ">55&nbsp;207</td>
                                                <td class="t_div"></td>
                                            </tr>
                                            <tr class="t_div">
                                                <td>&nbsp;</td>
                                                <td></td>
                                                <td></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_credits_penalty}</td>
                                                <td class="r_cr   t_null">0</td>
                                                <td class="t_div"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_cr  ">0</td>
                                                <td class="t_div"></td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_credits_compensation}</td>
                                                <td class="r_cr t_null">0</td>
                                                <td class="t_div"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_cr ">0</td>
                                                <td class="t_div"></td>
                                            </tr>
                                            <tr class="t_div">
                                                <td>&nbsp;</td>
                                                <td></td>
                                                <td></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_credits_repair}</td>
                                                <td class="t_neg r_cr t_null">-3&nbsp;790</td>
                                                <td class="t_div"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="t_neg r_cr ">-3&nbsp;790</td>
                                                <td class="t_div"></td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_credits_ammunition}</td>
                                                <td class="t_neg r_cr t_null">-47&nbsp;340</td>
                                                <td class="r_g t_null">0</td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="t_neg r_cr ">-47&nbsp;340</td>
                                                <td class="r_g ">0</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_credits_consumables}</td>
                                                <td class="r_cr t_neg  t_null">-3&nbsp;000</td>
                                                <td class="r_g t_null">0</td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_cr t_neg ">-3&nbsp;000</td>
                                                <td class="r_g ">0</td>
                                            </tr>
                                            <tr class="t_div">
                                                <td>&nbsp;</td>
                                                <td></td>
                                                <td></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="wtst-tbl_lbl__summary">${translate.result_total}:</td>
                                                <td class="t_neg r_cr t_null">-17&nbsp;325</td>
                                                <td class="r_g t_null">0</td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_cr  ">1&nbsp;077</td>
                                                <td class="r_g  ">0</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="wtst-column_divider"></div>
                                <div class="wtst-column wtst-column__overall">
                                    <div class="wtst-title__panel">${translate.result_time}</div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>${translate.result_time_start}</td>
                                                <td>07:28</td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_time_duration}</td>
                                                <td>14  50 </td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_time_death}</td>
                                                <td>14 49 </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="wtst-column wtst-column__stats">
                                    <div class="wtst-title__panel">${translate.result_xp}</div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>${translate.result_xp_received}</td>
                                                <td class="r_xp t_null">1719</td>
                                                <td class="r_fxp t_null">85</td>
                                                <td class="t_ss">&nbsp;</td>
                                                <td class="t_sb">&nbsp;</td>
                                                <td class="r_xp ">2578</td>
                                                <td class="r_fxp ">127</td>
                                            </tr>


                                            <tr class="t_div">
                                                <td>&nbsp;</td>
                                                <td></td>
                                                <td></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>${translate.result_xp_penalty}</td>
                                                <td class="r_xp t_null">0</td>
                                                <td class="t_div"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_xp ">0</td>
                                                <td class="t_div"></td>
                                            </tr>
                                            <tr class="t_div">
                                                <td>&nbsp;</td>
                                                <td></td>
                                                <td></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td class="wtst-tbl_lbl__summary">${translate.result_total}:</td>
                                                <td class="r_xp t_null">1719</td>
                                                <td class="t_div t_null"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_xp ">2578</td>
                                                <td class="t_div "></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- column -->
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>

            <!-- b-tabs < -->
            <ul class="b-replay__info b-replay__added-info clearfix b-list">
                <li class="b-list__item">
                    <span class="b-label">${translate.result_date}:</span>
                    ${battle.battleDate}
                </li>
                <li class="b-list__item">
                    <span class="b-label">${translate.result_version}:</span>
                    ${battle.version}
                </li>
                <li class="b-list__item">
                    <span class="b-label">${translate.result_battle_type}:</span> ??????
                </li>
                <li class="b-list__item b-replay__img-wrap">
                    <img src="/resources/img/maps/plan/${battle.map.id}.jpg" alt=""
                         class="b-replay__img">
                    <span class="b-replay__img-descr">
                        <span class="b-label">${translate.result_spawn}: </span>${battle.respawn}
                    </span>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">

    </script>

</div>

<script type="text/javascript">
    function tab() {
        if ($(this).hasClass("active")) return;

        $(this).closest(".b-tabs")
                .find(".b-tabs__label").removeClass("active").end()
                .find(".b-tabs__tab").removeClass("active");

        $(this)
                .next().addClass("active").end()
                .addClass("active");

        window.location.hash = $(this).attr('id').substring(5);
    }

    var $tabs = $(".b-tabs__label");

    if (window.location.hash) {
        var hashes = [],
                hash = window.location.hash.substr(1);
        $.each($tabs, function () {
            hashes.push($(this).attr('id').substring(5));
        });
        tab.apply(hashes.indexOf(hash) != -1 ? $('#wtst_' + hash) : $tabs[0]);
    }
    else
        tab.apply($tabs[0]);

    $tabs.on("click", tab);
</script>

</@site>