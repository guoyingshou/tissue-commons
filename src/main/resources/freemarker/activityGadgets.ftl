<#import 'spring.ftl' as spring />

<#macro showActivities>
    <#if activities??>
    <ul>
    <#list activities as activity>
        <li>
        label: ${activity.label!"label not set"} 
        <br/>
        published: ${activity.createTime?datetime} 
        <br/>

        who: ${activity.who.displayName} 
        <br/>
        
        what: ${activity.what.displayName!"no displayName"}
        <br/>

        to: ${activity.to.displayName!"no displayName"}
        <br/>

        where: ${activity.where.displayName!"no displayName"}
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
