<#import 'spring.ftl' as spring />
<#import 'tissue.ftl' as tissue />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro signupForm>
<@spring.bind 'account.*' />
<form id="signupForm" class="input-form account" action="<@spring.url '/signup' />" method="post">
    <div class="error">
        <@spring.showErrors "<br/>" />
    </div>

    <legend>
        <@spring.message "i18n.user.signup" />
        <span class="requirement"><@spring.message "i18n.user.signup.requirement" /></span>
    </legend>
    <ul>
        <li>
            <label for="username">
                <@spring.message "i18n.user.username" />
                <span style="display: none" class="error">
                    <@spring.message "Taken.username" />
                </span>
            </label>
            <@spring.formInput "account.username" 'class="sum"' />
        </li>
        <li>
            <label for="password">
                <@spring.message "i18n.user.password" />
                <span class="requirement"><@spring.message "i18n.user.password.requirement" /></span>
            </label>
            <@spring.formPasswordInput "account.password" 'class="sum"' />
        </li>
        <li>
            <label for="confirm">
                <@spring.message "i18n.user.confirm" />
            </label>
            <@spring.formPasswordInput "account.confirm" 'class="sum"' />
        </li>
        <li>
            <label for="email">
                <@spring.message "i18n.user.email" />
                <span style="display: none" class="error">
                    <@spring.message "Taken.email" />
                </span>
            </label>
            <@spring.formInput "account.email" 'class="sum"'/>
        </li>
        <li>
            <label for="displayName">
                <@spring.message "i18n.user.displayName" />
            </label>
            <@spring.formInput "account.displayName" 'class="sum"'/>
        </li>
        <li>
            <label for="headline">
                <@spring.message "i18n.user.headline" />
            </label>
            <@spring.formTextarea "account.headline" "class='sum'" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "i18n.button.signup" />' />
        </li>
    </ul>
</form>
</#macro>

<#macro signinForm>
<form id="signinForm" class="input-form account" action="<@spring.url '/jsc'/>" method="post">
    <#if error??>
    <div>
        <span class="error">
            <@spring.message "Invalid.usernameOrPassword" />
        </span>
    </div>
    </#if>

    <legend>
        <@spring.message "i18n.user.signin" />
    </legend>
    <ul>
        <li>
            <label for="sign-username"><@spring.message "i18n.user.username" /></label>
            <input type="text" class="sum" id="sign-username" name="j_username" size="20" maxlength="50" />
        </li>
        <li>
            <label for="sign-password"><@spring.message "i18n.user.password" /></label>
            <input type="password" class="sum" id="sign-password" name="j_password" size="20" maxlength="50" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "i18n.button.signin" />'/>
        </li>
    </ul>
</form>
</#macro>

<#macro updateEmailForm>
<form id="updateEmailForm" class="dialog pop-420" style="display: none" method="post">
    <legend>
        <@spring.message "i18n.user.updateEmail" />
        <a href="#" class="cancel">
            <span data-icon="&#xe008"></span>
        </a>
    </legend>
    <ul>
        <li>
            <label for="email">
                <@spring.message "i18n.user.email" />
            </label>
            <input class="sum" type="input" id="email" name="email" value="${viewerAccount.email!""}" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "i18n.button.save"/>'/>
        </li>
    </ul>
</form>
</#macro>

<#macro updateProfileForm>
<form id="updateProfileForm" class="dialog pop-420" style="display: none" method="post">
    <legend>
        <@spring.message "i18n.user.updateProfile" />
        <a href="#" class="cancel cancel-profile-edit">
            <span data-icon="&#xe008"></span>
        </a>
    </legend>
    <ul>
        <li>
            <label for="displayName">
                <@spring.message "i18n.user.displayName" />
            </label>
            <input type="input" class="sum" id="displayName" name="displayName" value="${viewerAccount.user.displayName}" />
        </li>
        <li>
            <label for="headline">
                <@spring.message "i18n.user.headline" />
            </label>
            <textarea class="sum" id="headline" name="headline">${viewerAccount.user.headline!""}</textarea>
        </li>
        <li>
            <input type="submit" value='<@spring.message "i18n.button.save" />' />
        </li>
    </ul>
</form>
</#macro>

<#macro updatePasswordForm>
<form id="updatePasswordForm" class="dialog pop-420" style="display:none" method="post">
    <legend>
        <@spring.message "i18n.user.updatePassword" />
        <a href="#" class="cancel cancel-change-pass">
            <span data-icon="&#xe008"></span>
        </a>
    </legend>
    <ul>
        <li>
            <label for="password">
                <@spring.message "i18n.user.password" />
            </label>
            <input type="password" class="sum" id="password" name="password" value="" />
        </li>
        <li>
            <label for="confirm">
                <@spring.message "i18n.user.confirm" />
            </label>
            <input type="password" class="sum" id="confirm" name="confirm" value="" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "i18n.button.save" />'/>
        </li>
    </ul>
</form>
</#macro>

<#macro inviteForm>
<form id="inviteForm" class="dialog pop-420" style="display: none" method="POST">
    <legend>
        <@spring.message "i18n.user.invite" />
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <label for="letter">
                <@spring.message "i18n.user.inviteLetter" />
                <span style="display:none" class="error">
                    <@spring.message "i18n.error.inviteLetterEmpty" />
                </span>
            </label>
        </li>
        <li>
            <textarea class="sum" id="letter" name="content"></textarea></p>
        </li>
        <li>
            <input type="submit" name="submit" value='<@spring.message "i18n.button.send"/>' />
        </li>
    </ul>
</form>
</#macro>

<#macro homeLogo>
    <h1>
       <@spring.message "i18n.common.sitename" />
       <span><@spring.message "i18n.common.siteslogan" /></span>
   </h1>
   <#if viewerAccount??>
   <div>
   <ul class="menu">
       <li>
           <a href="<@spring.url '/dashboard' />">
               <@spring.message "i18n.user.home.watchedFeeds" />
           </a>
       </li>
       <li>
           <a href="<@spring.url '/allfeeds' />">
               <@spring.message "i18n.user.home.allFeeds" />
           </a>
       </li>
       <li>
           <a href="/social/invitations">
               <@spring.message "i18n.user.home.invitations" />
               - ${invitationsReceived?size}
           </a>
       </li>
   </ul>
   </div>
   </#if>
</#macro>

<#macro userLogo>
    <div>
        <h1>
            <a href="<@spring.url '/users/${owner.id?replace("#","")}/posts' />">${owner.displayName}</a>
            <span>${owner.headline!""}</span>
        </h1>
        <ul class="menu">
            <li>
                <a href="<@spring.url '/users/${owner.id?replace("#", "")}/posts' />">
                    <@spring.message "i18n.user.menu.articles" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id?replace("#","")}/status' />">
                    <@spring.message "i18n.user.menu.status" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id?replace("#", "")}/resume' />">
                    <@spring.message "i18n.user.menu.resume" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id?replace("#", "")}/impressions' />">
                    <@spring.message "i18n.user.menu.impressions" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id?replace("#", "")}/friends' />">
                    <@spring.message "i18n.user.menu.friends" />
                </a>
            </li>
         </ul>
        <ul class="action">
            <#if invitable>
            <li>
                <a class="invite" data-action="<@spring.url '/users/${owner.id?replace("#", "")}/invites/_create' />" href="#">
                    <@spring.message "i18n.user.invite" />
                </a>
            </li>
            <@inviteForm />
            </#if>
        </ul>
    </div>
</#macro>

<#macro showResume>
    <div class="resume">
        ${owner.resume!''}
    </div>
    <#if viewerAccount?? && viewerAccount.user.id == owner.id>
        <@tissue.oneItemForm />
        <a class="edit-resume" data-action="<@spring.url '/users/${owner.id?replace("#", "")}/resume/_create' />" data-target="div.resume" href="#">edit</a>
    </#if>
</#macro>

<#macro showImpressions>
    <ul class="impressions">
        <#if impressions??>
        <#list impressions as impression>
        <li>${impression.content}</li>
        </#list>
        </#if>
    </ul>

    <#if viewerAccount?? && isFriend>
        <@tissue.oneItemForm />
        <a class="add-impression" data-action="<@spring.url '/users/${owner.id?replace("#", "")}/impressions/_create' />" data-target="ul.impressions" href="#">add impression</a>
    </#if>
</#macro>

<#macro showInvitations>
    <ul>
    <#list invitationsReceived as invitation>
        <li>
            <div>${invitation.invitor.displayName}</div>
            <div>${invitation.createTime?date}</div>
            <div>${invitation.content}</div>
            <div class="intention">
                <a class="process-invite" data-action="<@spring.url '/invitations/${invitation.id?replace("#", "")}/_accept' />" href="#">
                        Accept
                </a>
                <a class="process-invite" data-action="<@spring.url '/invitations/${invitation.id?replace("#","")}/_decline' />" href="#">
                    Decline
                </a>
            </div>
        </li>
     </#list>
     </ul>
</#macro>

<#macro showFriends>
    <ul>
        <#list friends as friend>
        <li>
            <a href="/social/users/${friend.id?replace("#", "")}/posts">${friend.displayName}</a>
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

<#macro showLearningPlans>
    <#if plans??>
    <div>
        <h4>
            <@spring.message "i18n.topic.inProgress" />
        </h4>
        <ul>
        <#list plans as plan>
        <#if !plan.topic.deleted && plan.isActive()>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

                <div class="ts">
                    <a href="/group/topics/${plan.topic.id?replace("#", "")}/plans/${plan.id?replace("#", "")}">
                        <@utilGadgets.showTimeRemaining plan.timeRemaining />
                    </a>
                </div>
            </li>
        </#if>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro showLearnedPlans>
    <#if plans??>
    <div>
        <h4>
            <@spring.message "i18n.topic.learned" />
        </h4>
        <ul>
        <#list plans as plan>
        <#if !plan.isActive()>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

                <div class="ts">
                    <a href="/group/topics/${plan.topic.id?replace("#","")}/plans/${plan.id?replace("#", "")}">
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


