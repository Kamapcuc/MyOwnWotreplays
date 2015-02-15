<#include "site.ftl">

<@site>

<div class="main clearfix view-replay" id="baseCtrl">

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
                                <div class="wtst_head wtst_head__win">
                                    <div class="wtst_head_title">Победа!</div>
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

                                                    <#if battle.medal?size == 0>
                                                        <@tableBreak/>
                                                    </#if>

                                                    <#list battle.medal as medal>
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
                                            <time class="result_map_user_timestamp">${battle.date}</time>
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
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="Sancio_89 ">Sancio_89</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/ussr-R106_KV85.png)"
                                                title="R106_KV85">
                                                КВ-85
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 502">
                                            </td>

                                            <td class="ce ce_ch" title="Вы нанесли критических повреждений: 1">
                                                <div class="ce_c">1</div>

                                            </td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="dima60905 ">dima60905</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/france-ELC_AMX.png)"
                                                title="ELC_AMX">
                                                ELC AMX
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 253">
                                            </td>

                                            <td class="ce ce_ch" style="opacity: 0.2"></td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="maximus77766 ">maximus77766</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/france-ARL_44.png)"
                                                title="ARL_44">
                                                ARL 44
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 62">
                                            </td>

                                            <td class="ce ce_ch" title="Вы нанесли критических повреждений: 1">
                                                <div class="ce_c">1</div>

                                            </td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="1990xxxx ">1990xxxx</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/ussr-T-34-85.png)"
                                                title="T-34-85">
                                                Т-34-85
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 106">
                                            </td>

                                            <td class="ce ce_ch" title="Вы нанесли критических повреждений: 1">
                                                <div class="ce_c">1</div>

                                            </td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="HanTeR_snajpe ">HanTeR_snajpe</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/usa-M18_Hellcat.png)"
                                                title="M18_Hellcat">
                                                M18 Hellcat
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 570">
                                            </td>

                                            <td class="ce ce_ch" style="opacity: 0.2"></td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="lalaka0404 [HVYML]">lalaka0404 [HVYML]</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/usa-M18_Hellcat.png)"
                                                title="M18_Hellcat">
                                                M18 Hellcat
                                            </td>
                                            <td class="ce ce_k" style="opacity: 0.2"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 232">
                                            </td>

                                            <td class="ce ce_ch" style="opacity: 0.2"></td>

                                            <td class="ce ce_da"
                                                title="По вашим разведданным союзники нанесли очков урона: 100"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="David_Belle ">David_Belle</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/france-S_35CA.png)"
                                                title="S_35CA">
                                                S35 CA
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 256">
                                            </td>

                                            <td class="ce ce_ch" title="Вы нанесли критических повреждений: 1">
                                                <div class="ce_c">1</div>

                                            </td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="D_e_en [-KOI-]">D_e_en [-KOI-]</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/germany-DickerMax.png)"
                                                title="DickerMax">
                                                Dicker Max
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 423">
                                            </td>

                                            <td class="ce ce_ch" style="opacity: 0.2"></td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="MrGotor ">MrGotor</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/germany-Nashorn.png)"
                                                title="Nashorn">
                                                Nashorn
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 417">
                                            </td>

                                            <td class="ce ce_ch" title="Вы нанесли критических повреждений: 1">
                                                <div class="ce_c">1</div>

                                            </td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="LAWRIK1 ">LAWRIK1</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/germany-Pz_IV_AusfH.png)"
                                                title="Pz_IV_AusfH">
                                                Pz.Kpfw. IV Ausf. H
                                            </td>
                                            <td class="ce ce_k" style="opacity: 0.2"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 243">
                                            </td>

                                            <td class="ce ce_ch" title="Вы нанесли критических повреждений: 3">
                                                <div class="ce_c">3</div>

                                            </td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="12345renat12345 ">12345renat12345</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/germany-JagdPzIV.png)"
                                                title="JagdPzIV">
                                                Jagdpanzer IV
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 600">
                                            </td>

                                            <td class="ce ce_ch" style="opacity: 0.2"></td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" title="Вы обнаружили этот танк противника"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>
                                        <tr>
                                            <td class="c_n txt_e" title="Ruzil2505 ">Ruzil2505</td>
                                            <td class="c_t txt_e"
                                                style="background-image: url(/img/results/Tanks_small/france-BDR_G1B.png)"
                                                title="BDR_G1B">
                                                BDR G1 B
                                            </td>
                                            <td class="ce ce_k" title="Вы уничтожили этот танк противника"></td>

                                            <td class="ce ce_d" title="Вы нанесли урона: 19">
                                            </td>

                                            <td class="ce ce_ch" style="opacity: 0.2"></td>

                                            <td class="ce ce_da" style="opacity: 0.2"></td>

                                            <td class="ce ce_s" style="opacity: 0.2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="c_sep"></td>
                                        </tr>

                                        <!--getTouchedPlayers-->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </dd>


                        <!--       ВТОРАЯ ВКЛАДКА - КОМАНДНЫЕ РЕЗУЛЬТАТЫ       -->


                        <dt id="wtst_team" class="b-tabs__label active">Командный результат</dt>
                        <dd class="b-tabs__tab wtst_team active">
                            <div class="b-tabs__tab-in">
                                <div class="wtst_half wtst_half__left">
                                    <h2>Наши</h2>
                                    <table class="c_table wtst_team_table">
                                        <thead>
                                        <tr>
                                            <th class="th_sq header" title="Взвод"></th>
                                            <th class="th_n header" title="Игрок"></th>
                                            <th class="th_t header" title="Танк"></th>
                                            <th class="th_d header" title="Урон"></th>
                                            <th class="th_k header" title="Уничтожил танков"></th>
                                            <th class="th_xp header" title="Опыт"></th>
                                            <th class="th_a header"></th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <tr uid="2466372">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="_uRKa_GuN_ [TRIKS]">
                                                _uRKa_GuN_ [TRIKS]
                                            </td>
                                            <td class="c_t txt_e" title="Type 4 Chi-To"
                                                style="background-image: url(/resources/img/japan-Chi_To.png)">
                                                Type 4 Chi-To
                                            </td>
                                            <td class="c_h">3683</td>
                                            <td class="c_k">10</td>
                                            <td class="r_xp">1719</td>
                                            <td class="c_a">
                                                                                                                    <span class="achievements tooltip">
                                                                                                                            <span class="count">6</span>
                                                                                                                            <span class="tooltip-container"
                                                                                                                                  style="display: none;">"Медаль Пула"<br>"Основной калибр"<br>"Воин"<br>"Захватчик"<br>"Защитник"<br>"Медаль Колобанова"</span>
                                                        </span>
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466373">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="Niochem">
                                                Niochem
                                            </td>
                                            <td class="c_t txt_e" title="Sherman Firefly"
                                                style="background-image: url(/img/results/Tanks_small/uk-GB19_Sherman_Firefly.png)">
                                                Sherman Firefly
                                            </td>
                                            <td class="c_h">274</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">265</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466347">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="wovow51rus">
                                                wovow51rus
                                            </td>
                                            <td class="c_t txt_e" title="FV304"
                                                style="background-image: url(/img/results/Tanks_small/uk-GB77_FV304.png)">
                                                FV304
                                            </td>
                                            <td class="c_h">674</td>
                                            <td class="c_k">2</td>
                                            <td class="r_xp">425</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466348">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="100no100">
                                                100no100
                                            </td>
                                            <td class="c_t txt_e" title="M18 Hellcat"
                                                style="background-image: url(/img/results/Tanks_small/usa-M18_Hellcat.png)">
                                                M18 Hellcat
                                            </td>
                                            <td class="c_h">0</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">211</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466375">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="Alex_SK_">
                                                Alex_SK_
                                            </td>
                                            <td class="c_t txt_e" title="M18 Hellcat"
                                                style="background-image: url(/img/results/Tanks_small/usa-M18_Hellcat.png)">
                                                M18 Hellcat
                                            </td>
                                            <td class="c_h">0</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">252</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466360">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="To_I_oT [IXBEK]">
                                                To_I_oT [IXBEK]
                                            </td>
                                            <td class="c_t txt_e" title="M4A3E8 Sherman"
                                                style="background-image: url(/img/results/Tanks_small/usa-M4A3E8_Sherman.png)">
                                                M4A3E8 Sherman
                                            </td>
                                            <td class="c_h">561</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">364</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466354">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="igorstare73">
                                                igorstare73
                                            </td>
                                            <td class="c_t txt_e" title="КВ-85"
                                                style="background-image: url(/img/results/Tanks_small/ussr-R106_KV85.png)">
                                                КВ-85
                                            </td>
                                            <td class="c_h">1018</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">478</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466346">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="150mixanik150">
                                                150mixanik150
                                            </td>
                                            <td class="c_t txt_e" title="СУ-100"
                                                style="background-image: url(/img/results/Tanks_small/ussr-SU-100.png)">
                                                СУ-100
                                            </td>
                                            <td class="c_h">433</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">319</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466350">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="Fragilerock">
                                                Fragilerock
                                            </td>
                                            <td class="c_t txt_e" title="Т-34-85"
                                                style="background-image: url(/img/results/Tanks_small/ussr-T-34-85.png)">
                                                Т-34-85
                                            </td>
                                            <td class="c_h">155</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">269</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466368">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="Mr_Krabozavr">
                                                Mr_Krabozavr
                                            </td>
                                            <td class="c_t txt_e" title="Т-34-85"
                                                style="background-image: url(/img/results/Tanks_small/ussr-T-34-85.png)">
                                                Т-34-85
                                            </td>
                                            <td class="c_h">1397</td>
                                            <td class="c_k">2</td>
                                            <td class="r_xp">662</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466364">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="slava73_geroj">
                                                slava73_geroj
                                            </td>
                                            <td class="c_t txt_e" title="BDR G1 B"
                                                style="background-image: url(/img/results/Tanks_small/france-BDR_G1B.png)">
                                                BDR G1 B
                                            </td>
                                            <td class="c_h">0</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">209</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466366">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="Rosset">
                                                Rosset
                                            </td>
                                            <td class="c_t txt_e" title="ELC AMX"
                                                style="background-image: url(/img/results/Tanks_small/france-ELC_AMX.png)">
                                                ELC AMX
                                            </td>
                                            <td class="c_h">0</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">287</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466349">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="Vovchik365">
                                                Vovchik365
                                            </td>
                                            <td class="c_t txt_e" title="Crusader"
                                                style="background-image: url(/img/results/Tanks_small/uk-GB20_Crusader.png)">
                                                Crusader
                                            </td>
                                            <td class="c_h">74</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">237</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466353">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="ivan6677men">
                                                ivan6677men
                                            </td>
                                            <td class="c_t txt_e" title="AT 2"
                                                style="background-image: url(/img/results/Tanks_small/uk-GB73_AT2.png)">
                                                AT 2
                                            </td>
                                            <td class="c_h">171</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">332</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466374">

                                            <td class="c_sq"></td>
                                            <td class="c_n txt_e" title="Fufel_2015">
                                                Fufel_2015
                                            </td>
                                            <td class="c_t txt_e" title="Pz.Kpfw. IV Ausf. H"
                                                style="background-image: url(/img/results/Tanks_small/germany-Pz_IV_AusfH.png)">
                                                Pz.Kpfw. IV Ausf. H
                                            </td>
                                            <td class="c_h">100</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">246</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>

                                    <div class="wtst_popup wtst_popup__user"></div>

                                </div>

                                <div class="wtst_half wtst_half__right">
                                    <h2>Враги</h2>
                                    <table class="c_table wtst_team_table">
                                        <thead>
                                        <tr>
                                            <th class="th_sq header" title="Взвод"></th>
                                            <th class="th_n header" title="Игрок"></th>
                                            <th class="th_t header" title="Танк"></th>
                                            <th class="th_d header" title="Урон"></th>
                                            <th class="th_k header" title="Уничтожил танков"></th>
                                            <th class="th_xp header" title="Опыт"></th>
                                            <th class="th_a header"></th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr uid="2466361">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="tigromans">
                                                tigromans
                                            </td>


                                            <td class="c_t txt_e" title="M41 HMC"
                                                style="background-image: url(/img/results/Tanks_small/usa-M41.png)">
                                                M41 HMC
                                            </td>
                                            <td class="c_h">748</td>
                                            <td class="c_k">2</td>
                                            <td class="r_xp">291</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466371">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="maximus77766">
                                                maximus77766
                                            </td>


                                            <td class="c_t txt_e" title="ARL 44"
                                                style="background-image: url(/img/results/Tanks_small/france-ARL_44.png)">
                                                ARL 44
                                            </td>
                                            <td class="c_h">1196</td>
                                            <td class="c_k">1</td>
                                            <td class="r_xp">313</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466356">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="D_e_en [-KOI-]">
                                                D_e_en [-KOI-]
                                            </td>


                                            <td class="c_t txt_e" title="Dicker Max"
                                                style="background-image: url(/img/results/Tanks_small/germany-DickerMax.png)">
                                                Dicker Max
                                            </td>
                                            <td class="c_h">1276</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">431</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466359">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="12345renat12345">
                                                12345renat12345
                                            </td>


                                            <td class="c_t txt_e" title="Jagdpanzer IV"
                                                style="background-image: url(/img/results/Tanks_small/germany-JagdPzIV.png)">
                                                Jagdpanzer IV
                                            </td>
                                            <td class="c_h">109</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">112</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466365">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="HanTeR_snajpe">
                                                HanTeR_snajpe
                                            </td>


                                            <td class="c_t txt_e" title="M18 Hellcat"
                                                style="background-image: url(/img/results/Tanks_small/usa-M18_Hellcat.png)">
                                                M18 Hellcat
                                            </td>
                                            <td class="c_h">747</td>
                                            <td class="c_k">3</td>
                                            <td class="r_xp">288</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466367">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="lalaka0404 [HVYML]">
                                                lalaka0404 [HVYML]
                                            </td>


                                            <td class="c_t txt_e" title="M18 Hellcat"
                                                style="background-image: url(/img/results/Tanks_small/usa-M18_Hellcat.png)">
                                                M18 Hellcat
                                            </td>
                                            <td class="c_h">690</td>
                                            <td class="c_k">1</td>
                                            <td class="r_xp">217</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466351">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="MrGotor">
                                                MrGotor
                                            </td>


                                            <td class="c_t txt_e" title="Nashorn"
                                                style="background-image: url(/img/results/Tanks_small/germany-Nashorn.png)">
                                                Nashorn
                                            </td>
                                            <td class="c_h">637</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">220</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466369">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="Sancio_89">
                                                Sancio_89
                                            </td>


                                            <td class="c_t txt_e" title="КВ-85"
                                                style="background-image: url(/img/results/Tanks_small/ussr-R106_KV85.png)">
                                                КВ-85
                                            </td>
                                            <td class="c_h">418</td>
                                            <td class="c_k">1</td>
                                            <td class="r_xp">255</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466370">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="1990xxxx">
                                                1990xxxx
                                            </td>


                                            <td class="c_t txt_e" title="Т-34-85"
                                                style="background-image: url(/img/results/Tanks_small/ussr-T-34-85.png)">
                                                Т-34-85
                                            </td>
                                            <td class="c_h">568</td>
                                            <td class="c_k">3</td>
                                            <td class="r_xp">341</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466362">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="Rokkichiz">
                                                Rokkichiz
                                            </td>


                                            <td class="c_t txt_e" title="Т-34-85"
                                                style="background-image: url(/img/results/Tanks_small/ussr-T-34-85.png)">
                                                Т-34-85
                                            </td>
                                            <td class="c_h">534</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">196</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466358">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="Ruzil2505">
                                                Ruzil2505
                                            </td>


                                            <td class="c_t txt_e" title="BDR G1 B"
                                                style="background-image: url(/img/results/Tanks_small/france-BDR_G1B.png)">
                                                BDR G1 B
                                            </td>
                                            <td class="c_h">348</td>
                                            <td class="c_k">1</td>
                                            <td class="r_xp">273</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466363">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="dima60905">
                                                dima60905
                                            </td>


                                            <td class="c_t txt_e" title="ELC AMX"
                                                style="background-image: url(/img/results/Tanks_small/france-ELC_AMX.png)">
                                                ELC AMX
                                            </td>
                                            <td class="c_h">525</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">189</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466357">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="3_14_T_O_H [A_TW]">
                                                3_14_T_O_H [A_TW]
                                            </td>


                                            <td class="c_t txt_e" title="КВ-1С"
                                                style="background-image: url(/img/results/Tanks_small/ussr-KV-1s.png)">
                                                КВ-1С
                                            </td>
                                            <td class="c_h">450</td>
                                            <td class="c_k">1</td>
                                            <td class="r_xp">247</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466352">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="LAWRIK1">
                                                LAWRIK1
                                            </td>


                                            <td class="c_t txt_e" title="Pz.Kpfw. IV Ausf. H"
                                                style="background-image: url(/img/results/Tanks_small/germany-Pz_IV_AusfH.png)">
                                                Pz.Kpfw. IV Ausf. H
                                            </td>
                                            <td class="c_h">0</td>
                                            <td class="c_k">0</td>
                                            <td class="r_xp">89</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>
                                        <tr class="c_d" uid="2466355">

                                            <td class="c_sq"></td>


                                            <td class="c_n txt_e" title="David_Belle">
                                                David_Belle
                                            </td>


                                            <td class="c_t txt_e" title="S35 CA"
                                                style="background-image: url(/img/results/Tanks_small/france-S_35CA.png)">
                                                S35 CA
                                            </td>
                                            <td class="c_h">428</td>
                                            <td class="c_k">1</td>
                                            <td class="r_xp">276</td>
                                            <td class="c_a">
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <div class="wtst_popup wtst_popup__user"></div>
                                </div>

                            </div>
                        </dd>

                        <!--       ТРЕТЬЯ ВКЛАДКА - ПОДРОБНЫЕ РЕЗУЛЬТАТЫ        -->

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
                    ${battle.date}
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

</body>

<script>
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