<#import 'spring.ftl' as spring />
<#import 'siteGadgets.ftl' as site />

<#macro showActivities>
    <#if activities??>
    <ul class="activities">
    <#list activities as activity>
        <#if activity.label = 'topic'>
            <@activityItem activity "&#xe000;" "Activity.topic" />
        </#if>

        <#if activity.label = 'plan'>
            <@activityItem activity "&#xe002;" "Activity.plan" />
        </#if>

        <#if activity.label = 'member'>
            <@activityItem activity "&#xe001;" "Activity.member" />
        </#if>

        <#if activity.label = 'concept'>
            <@activityItem activity "&#xe003;" "Activity.concept" />
        </#if>

        <#if activity.label = 'note'>
            <@activityItem activity "&#xe004;" "Activity.note" />
        </#if>

        <#if activity.label = 'tutorial'>
            <@activityItem activity "&#xe005;" "Activity.tutorial" />
        </#if>

        <#if activity.label = 'question'>
            <@activityItem activity "&#xe006;" "Activity.question" />
        </#if>

        <#if activity.label = 'message'>
            <@activityItem activity "&#xe007;" "Activity.message" />
        </#if>

        <#if activity.label = 'messageComment'>
            <@activityItem activity "&#xe008;" "Activity.messageComment" />
        </#if>

        <#if activity.label = 'questionComment'>
            <@activityItem activity "&#xe009;" "Activity.questionComment" />
        </#if>

        <#if activity.label = 'answer'>
            <@activityItem activity "&#xe00a;" "Activity.answer" />
        </#if>

        <#if activity.label = 'answerComment'>
            <@activityItem activity "&#xe00b;" "Activity.answerComment" />
        </#if>
     </#list>
    </ul>
    </#if>
</#macro>

<#macro activityItem activity iconCode messageKey>
    <li class="icon-container">
        <span class="icon" data-icon="${iconCode}"></span>
        <div class="ts">
            <a class="username" href="/social/users/${activity.who.id?replace("#", "")}/posts">
                ${activity.who.displayName}
            </a> 
            [ <@site.showTimeBefore activity.timeBefore /> ]
        </div>

        <div class="activity">
            <@spring.messageArgs messageKey activity.messageArgs />
        </div>
    </li>
</#macro>

