<#import 'spring.ftl' as spring />
<#import 'siteGadgets.ftl' as site />

<#macro homeLogo>
    <h1>
       <@spring.message "Name.site" />
       <span><@spring.message "Slogan.site" /></span>
   </h1>
</#macro>

<#macro ownerLogo>
    <h1>
        <a href="<@spring.url '/users/${owner.id?replace("#","")}/posts' />">${owner.displayName}</a>
        <span>${owner.headline!""}</span>
    </h1>
</#macro>

<#macro ownerMenu>
    <ul class="menu">
        <li>
            <a class="<#if selected='posts'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#", "")}/posts' />">
                <@spring.message "PostsText.menu.owner" />
            </a>
        </li>
        <li>
           <a class="<#if selected='status'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#","")}/status' />">
                <@spring.message "StatusText.menu.owner" />
            </a>
        </li>
        <li>
            <a class="<#if selected='impressions'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#", "")}/impressions' />">
                <@spring.message "ImpressionsText.menu.owner" />
            </a>
        </li>
    </ul>

    <#if invitable>
    <ul class="menu-action">
        <li>
            <a href="<@spring.url '/users/${owner.id?replace("#","")}/invitations/_create' />">
                <@spring.message "InviteText.menu.owner" />
            </a>
        </li>
    </ul>
    </#if>
</#macro>

<#macro viewerMenu>
<div id="page-menu-wrapper">
    <div id="page-menu">
 
   <#if viewerAccount??>
   <ul class="menu">
       <li>
           <a class="<#if selected = 'watchedFeeds'>current</#if>" href="<@spring.url '/dashboard' />">
               <@spring.message "WatchedFeedsText.menu.home" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'allFeeds'>current</#if>" href="<@spring.url '/allfeeds' />">
               <@spring.message "FeedsText.menu.home" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'friends'>current</#if>" href="<@spring.url '/friends' />">
                <@spring.message "FriendsText.menu.home" />
           </a>
       </li>
       <#--
       <#if !viewerAccount.hasRole('ROLE_EVIL') && (invitations?size > 0)>
       -->
       <li>
           <a class="<#if selected = 'invitations'>current</#if>" href="/social/invitations">
               <@spring.message "InvitationsText.menu.home" />
           </a>
       </li>
   </ul>
   </#if>

    </div>
</div>
</#macro>

<#macro settingMenu>
   <ul class="menu">
       <li>
           <a class="<#if selected = 'profile'>current</#if>" href="<@spring.url '/_setting' />">
               <@spring.message "ProfileText.menu.setting" />
           </a>
       </li>
       <#if viewerAccount?? && !viewerAccount.hasRole("ROLE_EVIL")>
       <li>
           <a class="<#if selected = 'headline'>current</#if>" href="<@spring.url '/_updateHeadline' />">
               <@spring.message "HeadlineText.menu.setting" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'email'>current</#if>" href="<@spring.url '/_updateEmail' />">
                <@spring.message "EmailText.menu.setting" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'password'>current</#if>" href="<@spring.url '/_updatePassword' />">
               <@spring.message "PasswordText.menu.setting" />
           </a>
       </li>
       </#if>
   </ul>
</#macro>

<#macro showPlansLearning>
    <#if plans??>
    <div class="active-plans">
        <h2>
            <@spring.message "InProgressTopicsText.owner" />
        </h2>
        <ul class="plan">
            <#list plans as plan>
            <#if !plan.topic.deleted && plan.isActive()>
            <li>
                <div class="topic-title">
                    <a href="/group/topics/${plan.topic.id?replace("#","")}/posts">
                        <@site.trim plan.topic.title />
                    </a>
                </div>

                <div class="ts">
                    <@site.showTimeRemaining plan.timeRemaining />
                </div>
            </li>
            </#if>
            </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro showPlansLearned>
    <#if plans??>
    <div class="archived-plans">
        <h2>
            <@spring.message "LearnedTopicsText.owner" />
        </h2>

        <ul class="plan">
            <#list plans as plan>
            <#if !plan.isActive()>
            <li>
                <div class="topic-title">
                    <a href="/group/topics/${plan.topic.id?replace("#","")}/posts">
                        <@site.trim plan.topic.title />
                    </a>
                </div>
                <div class="ts">
                    <a href="/group/plans/${plan.id?replace("#", "")}/posts">
                        ${plan.createTime?date} - ${plan.endTime?date}
                    </a>
                </div>
            </li>
            </#if>
            </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro showUsers>
    <#if users??>
    <ul class="users">
        <#list users as user>
        <li>
            <div class="ts">
                <a class="username" href="/social/users/${user.id?replace("#", "")}/posts">${user.displayName}</a>
            </div>
            <div class="headline">
                <#if (user.headline?length > 36)>
                    ${user.headline?substring(0,36)}...
                <#else>
                    ${user.headline}
                </#if>
            </div>
        </li>
        </#list>
    </ul>
    </#if>
</#macro>

