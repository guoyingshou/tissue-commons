<#import 'spring.ftl' as spring />

<#macro showTopicRelatedEvents>
    <ul>
    <#list events as event>
        <#if event.type = "topic">
            <@showTopicEvent event />
        </#if>
        <#if event.type = "plan">
            <@showPlanEvent event />
        </#if>
         <#if event.type = "members">
            <@showPlanMembersEvent event />
        </#if>
        <#if event.type = "concept" || event.type = "note" || event.type = "tutorial">
            <@showPostEvent event />
        </#if>
        <#if event.type = "postMessage">
            <@showPostMessageEvent event />
        </#if>
         <#if event.type = "postMessageComment">
            <@showPostMessageCommentEvent event />
        </#if>
        <#if event.type = "question">
            <@showQuestionEvent event />
        </#if>
          <#if event.type = "questionComment">
            <@showQuestionCommentEvent event />
        </#if>
        <#if event.type = "answer">
            <@showAnswerEvent event />
        </#if>
        <#if event.type = "answerComment">
            <@showAnswerCommentEvent event />
        </#if>
     </#list>
    </ul>
</#macro>

<#macro showLatestEvents>
    <ul>
    <#list events as event>
        <#if event.type = "topic">
            <@showTopicEvent event />
        </#if>
        <#if event.type = "plan">
            <@showPlanEvent event />
        </#if>
         <#if event.type = "members">
            <@showPlanMembersEvent event />
        </#if>
     </#list>
    </ul>
</#macro>

<#macro showTopicEvent event>
    <li>
        <@spring.messageArgs "i18n.event.topic" event.messageArgs />
    </li>
</#macro>

<#macro showPlanEvent event>
    <li>
        <@spring.messageArgs "i18n.event.plan" event.messageArgs />
    </li>
</#macro>

<#macro showPlanMembersEvent event>
    <li>
        <@spring.messageArgs "i18n.event.members" event.messageArgs />
    </li>
</#macro>

<#macro showPostEvent event>
    <li>
        <@spring.messageArgs "i18n.event.post" event.messageArgs />
    </li>
</#macro>

<#macro showPostMessageEvent event>
    <li>
        <@spring.messageArgs "i18n.event.postMessage" event.messageArgs />
    </li>
</#macro>

<#macro showPostMessageCommentEvent event>
    <li>
        <@spring.messageArgs "i18n.event.postMessageComment" event.messageArgs />
    </li>
</#macro>

<#macro showQuestionEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        asked a question: <a href="/group/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showQuestionCommentEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        has commented a question: <a href="/group/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAnswerEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        answer a question: <a href="/group/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAnswerCommentEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        has commented an answer in question: <a href="/group/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showFriendsEvents>
    <ul>
    <#list events as event>
 
        <#if event.type = 'accept'>
            <@showAcceptEvents event />
        </#if>
        <#if event.type = 'accepted'>
            <@showAcceptedEvents event />
        </#if>

    </#list>
</#macro>

<#macro showAcceptEvents event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        become a friend with <a href="/profile/users/${event.object.id}">${event.object.displayName}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAcceptedEvents event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        <#if viewer.id = event.object.id>
            has accepted my invitation
        <#else>
            become a friend with <a href="/profile/users/${event.object.id}">${event.object.displayName}</a> 
        </#if>
        at : ${event.published?datetime}
    </li>
</#macro>

