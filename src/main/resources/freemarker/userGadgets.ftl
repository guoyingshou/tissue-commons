<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#macro signupForm>

<@spring.bind 'signupForm.*' />

<form id="signupForm" class="input-form account" action="<@spring.url '/signup' />" method="post">
    <div class="error">
        <@spring.showErrors "<br/>" />
    </div>

    <legend>
        <@spring.message "Legend.signupForm" />
        <span class="requirement">
            <@spring.message "Require.signupForm" />
        </span>
    </legend>
    <ul>
        <li>
            <label for="username">
                <@spring.message "Label.signupForm.username" />
                <span style="display: none" class="error">
                    <@spring.message "Taken.signupForm.username" />
                </span>
            </label>
            <@spring.formInput "signupForm.username" 'class="sum"' />
        </li>
        <li>
            <label for="password">
                <@spring.message "Label.signupForm.password" />
                <span class="requirement">
                    <@spring.message "Size.signupForm.password" />
                </span>
            </label>
            <@spring.formPasswordInput "signupForm.password" 'class="sum"' />
        </li>
        <li>
            <label for="confirm">
                <@spring.message "Label.signupForm.confirm" />
            </label>
            <@spring.formPasswordInput "signupForm.confirm" 'class="sum"' />
        </li>
        <li>
            <label for="email">
                <@spring.message "Label.signupForm.email" />
                <span style="display: none" class="error">
                    <@spring.message "Taken.signupForm.email" />
                </span>
            </label>
            <@spring.formInput "signupForm.email" 'class="sum"'/>
        </li>
        <li>
            <label for="displayName">
                <@spring.message "Label.signupForm.displayName" />
            </label>
            <@spring.formInput "signupForm.displayName" 'class="sum"'/>
        </li>
        <li>
            <label for="headline">
                <@spring.message "Label.signupForm.headline" />
            </label>
            <@spring.formTextarea "signupForm.headline" "class='sum'" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "Signup.button" />' />
        </li>
    </ul>
</form>
</#macro>

<#macro signinForm>
<form id="signinForm" class="input-form account" action="<@spring.url '/jsc'/>" method="post">
    <#if error??>
    <div>
        <span class="error">
            <@spring.message "Invalid.signinForm" />
        </span>
    </div>
    </#if>

    <legend>
        <@spring.message "Legend.signinForm" />
    </legend>
    <ul>
        <li>
            <label for="sign-username"><@spring.message "Label.signinForm.username" /></label>
            <input type="text" class="sum" id="sign-username" name="j_username" size="20" maxlength="50" />
        </li>
        <li>
            <label for="sign-password"><@spring.message "Label.signinForm.password" /></label>
            <input type="password" class="sum" id="sign-password" name="j_password" size="20" maxlength="50" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "Signin.button" />'/>
        </li>
    </ul>
</form>
</#macro>

<#macro updateEmailForm>
<form id="updateEmailForm" class="dialog pop-420" style="display: none" method="post">
    <legend>
        <@spring.message "Legend.emailForm" />
        <a href="#" class="cancel">
            <span data-icon="&#xe008"></span>
        </a>
    </legend>
    <ul>
        <li>
            <label for="email">
                <@spring.message "Label.emailForm.email" />
                <span style="display: none" class="error">
                    <@spring.message "NotValid.emailForm.email" />
                </span>
            </label>
            <input class="sum" type="input" id="email" name="email" value="${viewerAccount.email!""}" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "Save.button"/>'/>
        </li>
    </ul>
</form>
</#macro>

<#macro updateProfileForm>
<form id="updateProfileForm" class="dialog pop-420" style="display: none" method="post">
    <legend>
        <@spring.message "Legend.profileForm" />
        <a href="#" class="cancel cancel-profile-edit">
            <span data-icon="&#xe008"></span>
        </a>
    </legend>
    <div id="failUpdateProfile" class="error" style="display: none">
        <@spring.message "Fail.profileForm" />
    </div>
    <ul>
        <li>
            <label for="displayName">
                <@spring.message "Label.profileForm.displayName" />
                <span id="empty-displayName" class="error" style="display: none">
                    <@spring.message "NotEmpty.profileForm.displayName" />
                </span>
            </label>
            <input type="input" class="sum" id="displayName" name="displayName" value="${viewerAccount.user.displayName}" />
        </li>
        <li>
            <label for="headline">
                <@spring.message "Label.profileForm.headline" />
                <span id="empty-headline" class="error" style="display: none">
                    <@spring.message "NotEmpty.profileForm.headline" />
                </span>
            </label>
            <textarea class="sum" id="headline" name="headline">${viewerAccount.user.headline!""}</textarea>
        </li>
        <li>
            <input type="submit" value='<@spring.message "Save.button" />' />
        </li>
    </ul>
</form>
</#macro>

<#macro updatePasswordForm>
<form id="updatePasswordForm" class="dialog pop-420" style="display:none" method="post">
    <legend>
        <@spring.message "Legend.passwordForm" />
        <a href="#" class="cancel cancel-change-pass">
            <span data-icon="&#xe008"></span>
        </a>
    </legend>
    <ul>
        <li>
            <label for="password">
                <@spring.message "Label.passwordForm.password" />
                <span id="failUpdatePassword" style="display:none" class="error">
                    <@spring.message "Fail.passwordForm" />
                </span>
            </label>
            <input type="password" class="sum" id="password" name="password" value="" />
        </li>
        <li>
            <label for="confirm">
                <@spring.message "Label.passwordForm.confirm" />
            </label>
            <input type="password" class="sum" id="confirm" name="confirm" value="" />
        </li>
        <li>
            <input type="submit" value='<@spring.message "Save.button" />'/>
        </li>
    </ul>
</form>
</#macro>

<#macro resetRequestForm>
<@spring.bind "resetForm.*" />
<form id="resetRequestForm" method="post" action="<@spring.url '/resetRequest' />">

    <div class="error">
        <@spring.showErrors "<br>" />
    </div>

    <legend>
        <@spring.message "Legend.resetRequestForm" />
    </legend>
    <ul>
        <li>
            <label for="email">
                <@spring.message "Label.resetRequestForm.email" />
            </label>
            <@spring.formInput 'resetForm.email' 'class="sum"' />
        </li>
        <li>
            <input type="submit" value='<@spring.message "Submit.button"/>'/>
        </li>
    </ul>
</form>
</#macro>

<#macro resetPasswordForm>
<@spring.bind 'passwordForm.*' />
<form id="resetPasswordForm" method="post" action="<@spring.url '/reset/${code}'/>">
    <div class="error">
        <@spring.showErrors "<br>" />
    </div>

    <legend>
        <@spring.message "Legend.resetPasswordForm" />
    </legend>
    <ul>
        <li>
            <label for="password">
                <@spring.message "Label.resetPasswordForm.password" />
            </label>
            <@spring.formPasswordInput "passwordForm.password" 'class="sum"' />
        </li>
        <li>
            <label for="confirm">
                <@spring.message "Label.resetPasswordForm.confirm" />
            </label>
            <@spring.formPasswordInput 'passwordForm.confirm' 'class="sum"' />
        </li>

        <li>
            <input type="submit" value='<@spring.message "Save.button" />'/>
        </li>
    </ul>
</form>
</#macro>

<#macro invitationForm>
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
</#macro>

<#macro impressionForm>
<form id="impressionForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Impression
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="hidden" id="to" name="to" value="${owner.id?replace('#','')}">
        </li>
 
        <li>
           <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

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
        <@invitationForm />
        </#if>
    </ul>
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
        <@impressionForm />
        <a class="add-impression" data-action="<@spring.url '/impressions/_create' />" data-target="ul.impressions" href="#">add impression</a>
    </#if>
</#macro>

<#macro showInvitations>
    <ul>
    <#list invitationsReceived as invitation>
        <#assign target = "li.invitation-${invitation.id?replace('#','')?replace(':', '-')}">
        <li class="${target}">
            <div>${invitation.account.user.displayName}</div>
            <div>${invitation.createTime?date}</div>
            <div>${invitation.content}</div>
            <div class="action">
                <a href="<@spring.url '/invitations/${invitation.id?replace("#", "")}/_accept' />">
                   <@spring.message "Accept.invitation" />
                </a>
                <a href="<@spring.url '/invitations/${invitation.id?replace("#","")}/_decline' />">
                   <@spring.message "Decline.invitation" />
                </a>
             <#--
                <a class="process-invitation" data-action="<@spring.url '/invitations/${invitation.id?replace("#", "")}/_accept' />" data-target="${target}" href="#">
                   <@spring.message "Accept.invitation" />
                </a>
                <a class="process-invitation" data-action="<@spring.url '/invitations/${invitation.id?replace("#","")}/_decline' />" data-target="${target}" href="#">
                   <@spring.message "Decline.invitation" />
                </a>
                -->
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


