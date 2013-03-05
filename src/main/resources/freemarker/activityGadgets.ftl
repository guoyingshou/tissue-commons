<#import 'spring.ftl' as spring />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro showActivities>
    <#if activities??>
    <ul>
    <#list activities as activity>

        <#if activity.label = 'topic'>
        <@topicActivity activity />
        </#if>

        <#if activity.label = 'hostGroup'>
        <@hostGroupActivity activity />
        </#if>

        <#if activity.label = 'joinGroup'>
        <@joinGroupActivity activity />
        </#if>

        <#if activity.label = 'concept'>
        <@conceptActivity activity />
        </#if>

        <#if activity.label = 'note'>
        <@noteActivity activity />
        </#if>

        <#if activity.label = 'tutorial'>
        <@tutorialActivity activity />
        </#if>

        <#if activity.label = 'question'>
        <@questionActivity activity />
        </#if>

        <#if activity.label = 'postMessage'>
        <@postMessageActivity activity />
        </#if>

        <#if activity.label = 'postMessageComment'>
        <@postMessageCommentActivity activity />
        </#if>

        <#if activity.label = 'questionComment'>
        <@questionCommentActivity activity />
        </#if>

        <#if activity.label = 'answer'>
        <@answerActivity activity />
        </#if>

        <#if activity.label = 'answerComment'>
        <@answerCommentActivity activity />
        </#if>

     </#list>
    </ul>
    </#if>
</#macro>

<#macro actorInfo activity code>
<span class="activity-icon" data-icon="${code}"></span>
<div class="activity-ts">
    <a href="/social/users/${activity.who.id?replace("#", "")}/posts">
        ${activity.who.displayName}
    </a> 
    <@utilGadgets.showTimeBefore activity.timeBefore />
</div>
</#macro>

<#macro topicActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.topic" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro hostGroupActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe001;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.hostGroup" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro joinGroupActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe001;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.joinGroup" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro conceptActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe002;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.concept" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro noteActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe003;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.note" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro tutorialActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.tutorial" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro questionActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.question" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro postMessageActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.postMessage" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro postMessageCommentActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.postMessageComment" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro questionCommentActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.questionComment" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro answerActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.answer" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro answerCommentActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe001;" />
    <div>
        <span><@spring.messageArgs "i18n.activity.answerComment" activity.messageArgs /></span>
    </div>
</li>
</#macro>
