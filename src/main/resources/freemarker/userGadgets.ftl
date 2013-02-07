<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro homeLogo>
    <h1>
       <@spring.message "i18n.common.sitename" />
       <span><@spring.message "i18n.common.siteslogan" /></span>
   </h1>
   <#if viewer??>
   <div>
   <ul class="menu">
       <li>
           <a href="<@spring.url '/watchedfeeds' />">
               <@spring.message "i18n.common.menu.watchedFeeds" />
           </a>
       </li>
       <li>
           <a href="<@spring.url '/allfeeds' />">
               <@spring.message "i18n.common.menu.allFeeds" />
           </a>
       </li>
       <li>
           <a href="/social/invitations">
               <@spring.message "i18n.common.menu.invitations" />
               - ${viewer.invitationsReceived?size}
           </a>
       </li>
   </ul>
   <ul class="action">
       <li>
           <@formGadgets.profileEditForm />
           <a href="#" class="edit-profile">
               <@spring.message "i18n.common.menu.editProfile" />
           </a>
       </li>
       <li>
           <@formGadgets.passChangeForm />
           <a href="#" class="change-pass">
               <@spring.message "i18n.common.menu.changePassword" />
           </a>
       </li>
   </ul>
   </div>
   </#if>
</#macro>

<#macro userLogo>
    <div>
        <h1>
            <a href="<@spring.url '/users/${owner.id}/posts' />">${owner.displayName}</a>
            <span>${owner.headline!""}</span>
        </h1>
        <ul class="menu">
            <li>
                <a href="<@spring.url '/users/${owner.id}/posts' />">
                    <@spring.message "i18n.user.menu.articles" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/status' />">
                    <@spring.message "i18n.user.menu.status" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/resume' />">
                    <@spring.message "i18n.user.menu.resume" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/impressions' />">
                    <@spring.message "i18n.user.menu.impressions" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/friends' />">
                    <@spring.message "i18n.user.menu.friends" />
                </a>
            </li>
         </ul>
        <ul class="action">
            <#if invitable>
            <li>
                <a class="invite" href="<@spring.url '/users/${owner.id}/invites' />">
                    <@spring.message "i18n.user.action.invite" />
                </a>
            </li>
            <@formGadgets.inviteForm />
            </#if>
        </ul>
    </div>
</#macro>

<#macro showResume>
    <div>
        ${owner.resume!''}
    </div>
    <#if viewer?? && viewer.isSelf(owner.id)>
        <a class="edit-resume" href="<@spring.url '/users/${owner.id}/resume' />">edit</a>
        <@formGadgets.resumeAddForm />
    </#if>
</#macro>

<#macro showImpressions>
    <ul>
        <#if impressions??>
        <#list impressions as impression>
        <li>${impression.content}</li>
        </#list>
        </#if>
    </ul>

    <#if viewer?? && viewer.isFriend(owner.id)>
        <a class="add-impression" href="<@spring.url '/users/${owner.id}/impressions' />">add impression</a>
        <@formGadgets.impressionAddForm />
    </#if>
</#macro>

<#macro showFriends>
    <ul>
        <#list friends as friend>
        <li>
            <a href="/social/users/${friend.id}/posts">${friend.displayName}</a>
        </li>
        </#list>
    </ul>
</#macro>

<#macro showUsers>
    <ul class="users">
        <#list users as user>
        <li>
            <div>
                <p>
                    <a href="/social/users/${user.id}/posts">${user.displayName}</a>
                </p>
                <p>
                    ${user.headline!""}
                </p>
            </div>
        </li>
        </#list>
    </ul>
</#macro>

<#macro showOwnedPlans>
    <#if owner?? && owner.ownedPlans??>
    <div>
        <h4>
            <@spring.message "i18n.topic.info.inProgress" />
        </h4>
        <ul>
        <#list owner.ownedPlans as plan>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

                <div class="ts">
                    <a href="/group/plans/${plan.id}">
                        <@utilGadgets.showTimeRemaining plan.timeRemaining />
                    </a>
                </div>

            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro showArchivedPlans>
    <#if owner?? && owner.archivedPlans??>
    <div>
        <h4>
            <@spring.message "i18n.topic.info.archived" />
        </h4>
        <ul>
        <#list owner.archivedPlans as plan>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

                <div class="ts">
                    <a href="/group/plans/${plan.id}">
                        ${plan.createTime?date} - ${plan.endTime?date}
                    </a>
                </div>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>


