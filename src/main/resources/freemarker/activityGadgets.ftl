<#import 'spring.ftl' as spring />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro showActivities>
    <#if activities??>
    <ul>
    <#list activities as activity>

        <#if activity.label = 'topic'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe004;"></span>
                <div class="ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.topic" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'plan'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.plan" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'members'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.members" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'concept'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.concept" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'note'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.note" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'tutorial'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                <div>
                    <span><@spring.messageArgs "i18n.activity.tutorial" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'question'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.question" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'postMessage'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.postMessage" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'postMessageComment'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.postMessageComment" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'questionComment'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.questionComment" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'answer'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.answer" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

        <#if activity.label = 'answerComment'>
            <li class="activity-item">
                <span class="activity-icon" data-icon="&#xe001;"></span>
                <div class="activity-ts">
                    <a href="/social/users/${activity.who.id}/posts">
                        ${activity.who.displayName}
                    </a> 
                    <@utilGadgets.showTimeBefore activity.timeBefore />
                </div>
                <div>
                    <span><@spring.messageArgs "i18n.activity.answerComment" activity.messageArgs /></span>
                </div>
            </li>
        </#if>

     </#list>
    </ul>
    </#if>
</#macro>

