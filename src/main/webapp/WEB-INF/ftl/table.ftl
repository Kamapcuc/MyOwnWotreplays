<#macro memberTable team>
<table class="c_table wtst_team_table">
    <thead>
        <tr>
            <th class="th_sq header" title="${translate.result_table_header_platoon}"></th>
            <th class="th_n header"  title="${translate.result_table_header_player}"></th>
            <th class="th_t header"  title="${translate.result_table_header_tank}"></th>
            <th class="th_d header"  title="${translate.result_table_header_damage}"></th>
            <th class="th_k header"  title="${translate.result_table_header_frags}"></th>
            <th class="th_xp header" title="${translate.result_table_header_experience}"></th>
            <th class="th_a header"></th>
        </tr>
    </thead>

    <tbody>

        <#--<tr>-->
            <#--<td class="c_sq"></td>-->
            <#--<td class="c_n txt_e" title="_uRKa_GuN_ [TRIKS]">-->
                <#--_uRKa_GuN_ [TRIKS]-->
            <#--</td>-->
            <#--<td class="c_t txt_e" title="Type 4 Chi-To"-->
                <#--style="background-image: url(/resources/img/japan-Chi_To.png)">-->
                <#--Type 4 Chi-To-->
            <#--</td>-->
            <#--<td class="c_h">3683</td>-->
            <#--<td class="c_k">10</td>-->
            <#--<td class="r_xp">1719</td>-->
            <#--<td class="c_a">-->
                <#--<span class="achievements tooltip">-->
                    <#--<span class="count">6</span>-->
                    <#--<span class="tooltip-container" style="display: none;">-->
                        <#--"Медаль Пула"-->
                        <#--<br>"Основной калибр"-->
                        <#--<br>"Воин"-->
                        <#--<br>"Захватчик"-->
                        <#--<br>"Защитник"-->
                        <#--<br>"Медаль Колобанова"-->
                    <#--</span>-->
                <#--</span>-->
            <#--</td>-->
        <#--</tr>-->
        <#list team as member>
            <tr class="c_d">
                <td class="c_sq"></td>
                <#if member.clanAbbrev??>
                    <#assign memberName = member.name/>
                <#else>
                    <#assign memberName = member.name + "&nbsp" + member.clanAbbrev/>
                </#if>
                <td class="c_n txt_e" title="${memberName}">
                    ${memberName}
                </td>
                <#if member.tank??>
                    <td class="c_t txt_e" title="${member.tank.name_i18n}"
                        style="background-image: url(/resources/img/vehicles/small/${member.tank.image})">
                    ${member.tank.name_i18n}
                    </td>
                <#else>
                    <td class="c_t txt_e"></td>
                </#if>
                <td class="c_h">274</td>
                <td class="c_k">0</td>
                <td class="r_xp">265</td>
                <td class="c_a"></td>
            </tr>
        </#list>
    </tbody>
</table>
</#macro>