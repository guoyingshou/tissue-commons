<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#macro showActivities>
    <#if activities??>
    <ul>
    <#list activities as activity>

        <#if activity.label = 'topic'>
        <@topicActivity activity />
        </#if>

        <#if activity.label = 'plan'>
        <@hostGroupActivity activity />
        </#if>

        <#if activity.label = 'member'>
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

        <#if activity.label = 'message'>
        <@postMessageActivity activity />
        </#if>

        <#if activity.label = 'messageComment'>
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
    <@commonGadgets.showTimeBefore activity.timeBefore />
</div>
</#macro>

<#macro topicActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "Activity.topic" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro hostGroupActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe001;" />
    <div>
        <span><@spring.messageArgs "Activity.plan" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro joinGroupActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe001;" />
    <div>
        <span><@spring.messageArgs "Activity.member" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro conceptActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe002;" />
    <div>
        <span><@spring.messageArgs "Activity.concept" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro noteActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe003;" />
    <div>
        <span><@spring.messageArgs "Activity.note" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro tutorialActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "Activity.tutorial" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro questionActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "Activity.question" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro postMessageActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "Activity.message" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro postMessageCommentActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "Activity.messageComment" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro questionCommentActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "Activity.questionComment" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro answerActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe004;" />
    <div>
        <span><@spring.messageArgs "Activity.answer" activity.messageArgs /></span>
    </div>
</li>
</#macro>

<#macro answerCommentActivity activity>
<li class="activity-item">
    <@actorInfo activity "&#xe001;" />
    <div>
        <span><@spring.messageArgs "Activity.answerComment" activity.messageArgs /></span>
    </div>
</li>
</#macro>
