<#import 'spring.ftl' as spring />
<#import 'siteGadgets.ftl' as site />

<#macro homeLogo>
    <h1>
       <@spring.message "Sitename" />
       <span><@spring.message "Siteslogan" /></span>
   </h1>
</#macro>

<#macro homeMenu>
   <#if viewerAccount??>
   <ul class="menu">
       <li>
           <a class="<#if selected = 'watchedFeeds'>current</#if>" href="<@spring.url '/dashboard' />">
               <@spring.message "home.watchedFeeds" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'allFeeds'>current</#if>" href="<@spring.url '/allfeeds' />">
               <@spring.message "home.allFeeds" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'friends'>current</#if>" href="<@spring.url '/friends' />">
                <@spring.message "home.friends" />
           </a>
       </li>
       <#if (invitationsReceived?size > 0)>
       <li>
           <a class="<#if selected = 'invitations'>current</#if>" href="/social/invitations">
               <@spring.message "home.invitations" />
               - ${invitationsReceived?size}
           </a>
       </li>
       </#if>
   </ul>
   </#if>
</#macro>

<#macro userLogo>
    <h1>
        <a href="<@spring.url '/users/${owner.id?replace("#","")}/posts' />">${owner.displayName}</a>
        <span>${owner.headline!""}</span>
    </h1>
</#macro>

<#macro userMenu>
    <ul class="menu">
        <li>
            <a class="<#if selected='posts'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#", "")}/posts' />">
                <@spring.message "user.posts" />
            </a>
        </li>
        <li>
           <a class="<#if selected='status'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#","")}/status' />">
                <@spring.message "user.status" />
            </a>
        </li>
        <li>
            <a class="<#if selected='impressions'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#", "")}/impressions' />">
                <@spring.message "user.impressions" />
            </a>
        </li>
    </ul>

    <#if invitable>
    <ul class="action">
        <li>
            <a href="<@spring.url '/users/${owner.id?replace("#","")}/invitations/_create' />">
                <@spring.message "user.invite" />
            </a>
        </li>
    </ul>
    </#if>
</#macro>

<#macro settingMenu>
   <ul class="menu">
       <li>
           <a class="<#if selected = 'profile'>current</#if>" href="<@spring.url '/_setting' />">
               <@spring.message "setting.profile" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'headline'>current</#if>" href="<@spring.url '/_updateHeadline' />">
               <@spring.message "setting.headline" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'email'>current</#if>" href="<@spring.url '/_updateEmail' />">
                <@spring.message "setting.email" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'password'>current</#if>" href="<@spring.url '/_updatePassword' />">
               <@spring.message "setting.password" />
           </a>
       </li>
   </ul>
</#macro>

<#macro aboutMenu>
   <ul class="menu">
       <li>
           <a class="<#if selected = 'praise'>current</#if>" href="<@spring.url '/praise' />">
               <@spring.message "about.praise" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'vision'>current</#if>" href="<@spring.url '/about' />">
               <@spring.message "about.vision" />
           </a>
       </li>
   </ul>
</#macro>

<#macro showPlansLearning>
    <#if plans??>
    <div class="active">
        <h4>
            <@spring.message "InProgress.topics" />
        </h4>
        <#list plans as plan>
        <#if !plan.topic.deleted && plan.isActive()>
        <div class="plan">
            <div>
                <a href="/group/topics/${plan.topic.id?replace("#","")}/posts">
                    ${plan.topic.title}
                </a>
            </div>

<#--
            <div>
                <a href="/social/users/${plan.account.user.id?replace("#","")}/posts">
                    ${plan.account.user.displayName}
                </a>
            </div>

            <div>
                ${plan.account.user.headline!""}
            </div>
            -->

            <div class="ts">
                <a href="/group/plans/${plan.id?replace("#", "")}/posts">
                    <@site.showTimeRemaining plan.timeRemaining />
                </a>
            </div>
        </div>
        </#if>
        </#list>
    </div>
    </#if>
</#macro>

<#macro showPlansLearned>
    <#if plans??>
    <div class="archived">
        <h4>
            <@spring.message "Learned.topics" />
        </h4>

        <#list plans as plan>
        <#if !plan.isActive()>
        <div class="plan">
            <div>
                <a href="/group/topics/${plan.topic.id?replace("#","")}/posts">
                    ${plan.topic.title}
                </a>
            </div>
            <div class="ts">
                <a href="/group/plans/${plan.id?replace("#", "")}/posts">
                    ${plan.createTime?date} - ${plan.endTime?date}
                </a>
            </div>
        </div>
        </#if>
        </#list>
    </div>
    </#if>
</#macro>

<#macro showUsers>
    <ul class="users">
        <#list users as user>
        <li>
            <div>
                <a href="/social/users/${user.id?replace("#", "")}/posts">${user.displayName}</a>
            </div>
            <div>
                ${user.headline!""}
            </div>
        </li>
        </#list>
    </ul>
</#macro>

