<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

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
               <@spring.message "Menu.home.watchedFeeds" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'allFeeds'>current</#if>" href="<@spring.url '/allfeeds' />">
               <@spring.message "Menu.home.allFeeds" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'friends'>current</#if>" href="<@spring.url '/friends' />">
                <@spring.message "Menu.home.friends" />
           </a>
       </li>
       <#if (invitationsReceived?size > 0)>
       <li>
           <a class="<#if selected = 'invitations'>current</#if>" href="/social/invitations">
               <@spring.message "Menu.home.invitations" />
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
                <@spring.message "Menu.user.posts" />
            </a>
        </li>
        <li>
           <a class="<#if selected='status'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#","")}/status' />">
                <@spring.message "Menu.user.status" />
            </a>
        </li>
        <li>
            <a class="<#if selected='impressions'>current</#if>" href="<@spring.url '/users/${owner.id?replace("#", "")}/impressions' />">
                <@spring.message "Menu.user.impressions" />
            </a>
        </li>
    </ul>
    <ul class="action">
        <#if invitable>
        <li>
            <a class="create-invitation" data-action="<@spring.url '/invitations/_create' />" href="#">
                <@spring.message "Menu.user.invite" />
            </a>
        </li>

        <form id="invitationForm" class="dialog pop-420" style="display: none" method="POST">
            <legend>
                <@spring.message "Legend.invitationForm" />
                <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
            </legend>
            <ul>
                <li>
                    <label for="letter">
                        <@spring.message "Label.invitationForm.content" />
                        <span id="failInvite" style="display: none" class="error">
                            <@spring.message "Fail.invitationForm" />
                        </span>
                    </label>
               </li>
               <li>
                   <textarea class="sum" id="content" name="content"></textarea>
               </li>
               <li>
                   <input type="hidden" id="to" name="to" value="${owner.id?replace("#","")}">
               </li>
               <li>
                   <input type="submit" name="submit" value='<@spring.message "Send.button"/>' />
               </li>
            </ul>
        </form>
        </#if>
    </ul>
</#macro>

<#macro settingMenu>
   <ul class="menu">
       <li>
           <a class="<#if selected = 'profile'>current</#if>" href="<@spring.url '/_setting' />">
               <@spring.message "Menu.setting.profile" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'headline'>current</#if>" href="<@spring.url '/_updateHeadline' />">
               <@spring.message "Menu.setting.headline" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'email'>current</#if>" href="<@spring.url '/_updateEmail' />">
                <@spring.message "Menu.setting.email" />
           </a>
       </li>
       <li>
           <a class="<#if selected = 'password'>current</#if>" href="<@spring.url '/_updatePassword' />">
               <@spring.message "Menu.setting.password" />
           </a>
       </li>
   </ul>
</#macro>

<#macro showPlansLearning>
    <#if plans??>
    <div>
        <h4>
            <@spring.message "InProgress.topics" />
        </h4>
        <ul>
        <#list plans as plan>
        <#if !plan.topic.deleted && plan.isActive()>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

                <div class="ts">
                    <a href="/group/plans/${plan.id?replace("#", "")}/posts">
                        <@commonGadgets.showTimeRemaining plan.timeRemaining />
                    </a>
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
    <div>
        <h4>
            <@spring.message "Learned.topics" />
        </h4>
        <ul>
        <#list plans as plan>
        <#if !plan.isActive()>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
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
                <ul class="users">
                    <#list users as user>
                    <li>
                        <div>
                            <p>
                                <a href="/social/users/${user.id?replace("#", "")}/posts">${user.displayName}</a>
                            </p>
                            <p>
                                ${user.headline!""}
                            </p>
                       </div>
                    </li>
                    </#list>
                </ul>
</#macro>

