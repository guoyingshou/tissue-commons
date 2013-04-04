<#import 'spring.ftl' as spring />
<#import 'siteGadgets.ftl' as site />

<#macro showActivities>
    <#if activities??>
    <ul class="activities">
    <#list activities as activity>
        <#if activity.label = 'topic'>
            <@activityItem activity "&#xe004;" "Activity.topic" />
        </#if>

        <#if activity.label = 'plan'>
            <@activityItem activity "&#xe001;" "Activity.plan" />
        </#if>

        <#if activity.label = 'member'>
            <@activityItem activity "&#xe001;" "Activity.member" />
        </#if>

        <#if activity.label = 'concept'>
            <@activityItem activity "&#xe005;" "Activity.concept" />
        </#if>

        <#if activity.label = 'note'>
            <@activityItem activity "&#xe005;" "Activity.note" />
        </#if>

        <#if activity.label = 'tutorial'>
            <@activityItem activity "&#xe005;" "Activity.tutorial" />
        </#if>

        <#if activity.label = 'question'>
            <@activityItem activity "&#xe005;" "Activity.question" />
        </#if>

        <#if activity.label = 'message'>
            <@activityItem activity "&#xe005;" "Activity.message" />
        </#if>

        <#if activity.label = 'messageComment'>
            <@activityItem activity "&#xe005;" "Activity.messageComment" />
        </#if>

        <#if activity.label = 'questionComment'>
            <@activityItem activity "&#xe005;" "Activity.questionComment" />
        </#if>

        <#if activity.label = 'answer'>
            <@activityItem activity "&#xe005;" "Activity.answer" />
        </#if>

        <#if activity.label = 'answerComment'>
            <@activityItem activity "&#xe005;" "Activity.answerComment" />
        </#if>
     </#list>
    </ul>
    </#if>
</#macro>

<#macro activityItem activity iconCode messageKey>
    <li class="icon-container">
        <span class="icon" data-icon="${iconCode}"></span>
        <div class="ts">
            <em>
                <a href="/social/users/${activity.who.id?replace("#", "")}/posts">
                    ${activity.who.displayName}
                </a> 
            </em>
            [ <@site.showTimeBefore activity.timeBefore /> ]
        </div>

        <div>
            <@spring.messageArgs messageKey activity.messageArgs />
        </div>
    </li>
</#macro>

