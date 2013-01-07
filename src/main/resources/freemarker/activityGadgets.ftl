<#import 'spring.ftl' as spring />

<#macro showTopicRelatedActivities>
    <#if activities??>
    <ul>
    <#list activities as activity>
        <li>
        type: ${activity.type!"type not set"} 
        <br/>
        published: ${activity.published?datetime} 
        <br/>

        actor: ${activity.actor.displayName} 
        <br/>
        
        object: ${activity.object.displayName!"no displayName"}
        <br/>

        target: ${activity.target.displayName!"no target displayName"}
        <br/><br/>
        </li>
     </#list>
    </ul>
    </#if>
</#macro>

<#--
<#macro showPostEvent event>
    <li>
        <@spring.messageArgs "i18n.event.post" event.messageArgs />
    </li>
</#macro>
-->
