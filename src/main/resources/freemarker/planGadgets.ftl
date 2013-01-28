<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#macro showLiveGroup>
    <div id="active-group">
    <#if topic.activePlan??>
        <h4>Live Study Group</h4>
        <div class="group-info">
            <p><a href="<@spring.url '/plans/${topic.activePlan.id}'/>">${topic.activePlan.createTime?date}</a></p>
            <p>duration: ${topic.activePlan.duration} Months</p>
            <p>created by: ${topic.activePlan.user.displayName}</p>
        </div>
    </#if>
    </div>
</#macro>

<#macro showArchivedGroup>
    <#if topic.deadPlans??>
    <div>
        <h4>Archived Group</h4>
        <ul>
        <#list topic.deadPlans as plan>
            <li>
                <p class="ajx"><a href="<@spring.url '/plans/${plan.id}' />">${plan.createTime?date}</a></p>
                <p>duration: ${plan.duration} Months</p>
                <p>created by : <a href="/social/users/${plan.user.id}" target="_top">${plan.user.displayName}</a></p>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>


