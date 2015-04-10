﻿<#include "site.ftl">
<#include "table.ftl">

<@site>

<div class="main clearfix view-replay">

    <div class="main-menu clearfix" style="margin-bottom: 30px;">
    </div>

    <div class="b-overlay" id="overlay-container" style="display:none"></div>


    <div id="replayView" class="b-page-content b-page-content_wide">

        <div class="b-replay__hat clearfix">
            <div class="b-replay__buttons">
                <a href="http://wotreplays.ru/site/download/4563201" class="btn_l-orange">Запустить</a>
            </div>
        </div>

        <div class="b-replay b-replay_detail">


            <div class="wtst">
                <div class="b-tabs-wrap clearfix">
                    <dl class="b-tabs">

                        <!--       ПЕРВАЯ ВКЛАДКА - ОБЩИЕ РЕЗУЛЬТАТЫ        -->

                        <dt id="wtst_self" class="b-tabs__label">Личный результат</dt>
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
                                                <th colspan="2">Без премиума</th>
                                                <th class="active">С премиумом</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th>Кредиты</th>
                                                <td class="r_cr ">0</td>
                                                <td class="r_cr active ">${battle.credits?string["###,###,###"]}</td>
                                            </tr>
                                            <tr>
                                                <th>Опыт</th>
                                                <td class="r_xp ">0</td>
                                                <td class="r_xp active">${battle.xp?string["###,###,###"]}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a href="http://wotreplays.ru/site/4563201#wtst_report"
                                       class="result_btn result_btn__sticky">Подробный отчёт</a>
                                </div>
                                <div class="wtst_half wtst_half__right">
                                    <div class="wtst-title__panel wtst-title__gradient">Боевая эффективность</div>
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
                                                        <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>
                                                    <#else>
                                                        <td class="ce ce_k" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#if playerHarm.crits != 0>
                                                        <td class="ce ce_d" title="Вы нанесли критических повреждений: ${playerHarm.damageDealt}"></td>
                                                    <#else>
                                                        <td class="ce ce_d" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#if playerHarm.crits != 0>
                                                        <td class="ce ce_ch" title="Вы нанесли критических повреждений: ${playerHarm.crits}">
                                                            <div class="ce_c">${playerHarm.crits}</div>
                                                        </td>
                                                    <#else>
                                                        <td class="ce ce_ch" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#assign assistedDamage = playerHarm.damageAssistedTrack + playerHarm.damageAssistedRadio />
                                                    <#if assistedDamage != 0>
                                                        <td class="ce ce_da" title="По вашим разведданным союзники нанесли очков урона: ${assistedDamage}"></td>
                                                    <#else>
                                                        <td class="ce ce_da" style="opacity: 0.2"></td>
                                                    </#if>

                                                    <#if playerHarm.spotted != 0>
                                                        <td class="ce ce_s" title="Вы обнаружили этот танк противника"></td>
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

                        <dt id="wtst_team" class="b-tabs__label active">Командный результат</dt>
                        <dd class="b-tabs__tab wtst_team active">
                            <div class="b-tabs__tab-in">
                                <div class="wtst_half wtst_half__left">
                                    <h2>Наши</h2>
                                    <@memberTable team=battle.allies/>
                                    <div class="wtst_popup wtst_popup__user"></div>
                                </div>

                                <div class="wtst_half wtst_half__right">
                                    <h2>Враги</h2>
                                    <@memberTable team=battle.enemies/>
                                    <div class="wtst_popup wtst_popup__user"></div>
                                </div>

                            </div>
                        </dd>

                        <dt id="wtst_report" class="b-tabs__label">Подробный отчёт</dt>
                        <dd class="b-tabs__tab">
                            <div class="b-tabs__tab-in">
                                <div class="wtst-column wtst-column__overall">
                                    <div class="wtst-title__panel">Статистика</div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>Произведено выстрелов</td>
                                                <td>54</td>
                                            </tr>
                                            <tr class="t_sub">
                                                <td class="wtst-tbl_lbl ">прямых попаданий</td>
                                                <td>39</td>
                                            </tr>
                                            <tr class="t_sub">
                                                <td>осколочно-фугасных повреждений</td>
                                                <td class="t_null">0</td>
                                            </tr>
                                            <tr class="t_sub">
                                                <td>пробитий</td>
                                                <td>33</td>
                                            </tr>
                                            <tr>
                                                <td>Нанесено урона</td>
                                                <td>3683</td>
                                            </tr>
                                            <tr>
                                                <td>Получено попаданий</td>
                                                <td>4</td>
                                            </tr>

                                            <tr class="t_sub">
                                                <td>пробитий</td>
                                                <td>4</td>
                                            </tr>

                                            <tr class="t_sub">
                                                <td>не нанесших урон</td>
                                                <td class="t_null">0</td>
                                            </tr>

                                            <tr>
                                                <td>Получено попаданий осколками</td>
                                                <td class="t_null">0</td>
                                            </tr>

                                            <tr>
                                                <td>Урон, заблокированный броней</td>
                                                <td class="t_null">0</td>
                                            </tr>

                                            <tr>
                                                <td>Урон союзникам (уничтожено/повреждений)</td>
                                                <td class="t_null">0/0</td>
                                            </tr>
                                            <tr>
                                                <td>Обнаружено машин противника</td>
                                                <td>1</td>
                                            </tr>
                                            <tr>
                                                <td>Повреждено машин противника</td>
                                                <td>12</td>
                                            </tr>
                                            <tr>
                                                <td>Уничтожено машин противника</td>
                                                <td>10</td>
                                            </tr>
                                            <tr>
                                                <td>Урон по вашим разведданным</td>
                                                <td>137</td>
                                            </tr>
                                            <tr>
                                                <td>Очки захвата базы</td>
                                                <td>100</td>
                                            </tr>
                                            <tr>
                                                <td>Очки защиты базы</td>
                                                <td>98</td>
                                            </tr>
                                            <tr>
                                                <td>Пройдено километров</td>
                                                <td>4,37</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="wtst-column wtst-column__stats">
                                    <div class="wtst-title__panel">Кредиты <span
                                            class="wtst-title__premium">С премиумом</span></div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>Начислено за бой</td>
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
                                                <td>Штраф за урон союзникам</td>
                                                <td class="r_cr   t_null">0</td>
                                                <td class="t_div"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="r_cr  ">0</td>
                                                <td class="t_div"></td>
                                            </tr>
                                            <tr>
                                                <td>Компенсация за урон от союзников</td>
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
                                                <td>Автоматический ремонт техники</td>
                                                <td class="t_neg r_cr t_null">-3&nbsp;790</td>
                                                <td class="t_div"></td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="t_neg r_cr ">-3&nbsp;790</td>
                                                <td class="t_div"></td>
                                            </tr>
                                            <tr>
                                                <td>Автопополнение боекомплекта</td>
                                                <td class="t_neg r_cr t_null">-47&nbsp;340</td>
                                                <td class="r_g t_null">0</td>
                                                <td class="t_ss"></td>
                                                <td class="t_sb"></td>
                                                <td class="t_neg r_cr ">-47&nbsp;340</td>
                                                <td class="r_g ">0</td>
                                            </tr>
                                            <tr>
                                                <td>Автопополнение снаряжения</td>
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
                                                <td class="wtst-tbl_lbl__summary">Итого:</td>
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
                                    <div class="wtst-title__panel">Время</div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>Начало боя</td>
                                                <td>07:28</td>
                                            </tr>
                                            <tr>
                                                <td>Продолжительность боя</td>
                                                <td>14 мин 50 с</td>
                                            </tr>
                                            <tr>
                                                <td>Время в бою до уничтожения</td>
                                                <td>14 мин 49 с</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="wtst-column wtst-column__stats">
                                    <div class="wtst-title__panel">Опыт</div>
                                    <div class="wtst-tbl_frame">
                                        <table class="wtst-tbl">
                                            <tbody>
                                            <tr>
                                                <td>Начислено за бой</td>
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
                                                <td>Штраф за урон союзникам</td>
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
                                                <td class="wtst-tbl_lbl__summary">Итого:</td>
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
                    <span class="b-label">Дата:</span>
                    ${battle.battleDate}
                </li>
                <li class="b-list__item">
                    <span class="b-label">Версия:</span>
                    ${battle.version}
                </li>
                <li class="b-list__item">
                    <span class="b-label">Тип боя:</span> Случайный бой
                </li>
                <li class="b-list__item b-replay__img-wrap">
                    <img src="/resources/img/maps/plan/${battle.map.id}.jpg" alt=""
                         class="b-replay__img">
                    <span class="b-replay__img-descr">
                        <span class="b-label">Респ: </span>${battle.respawn}
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