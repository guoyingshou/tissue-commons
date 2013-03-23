<#import 'spring.ftl' as spring />

<#macro updateEmailForm>
<@spring.bind "emailForm.*" />
<form id="updateEmailForm" method="post" action="/social/_updateEmail">
    <div class="error">
        <@spring.showErrors "<br>" />
    </div>
    <legend>
        <@spring.message "Legend.emailForm" />
    </legend>
    <ul>
        <li>
            <label for="email">
                <@spring.message "Label.emailForm.email" />
            </label>
            <@spring.formInput "emailForm.email" 'class="sum"' />
        </li>
        <li>
            <input type="submit" value='<@spring.message "Save.button"/>'/>
        </li>
    </ul>
</form>
</#macro>

<#macro updateHeadlineForm>
<@spring.bind "headlineForm.*" />
<form id="updateHeadlineForm" method="post" action="/social/_updateHeadline">

    <div class="error">
        <@spring.showErrors "<br>" />
    </div>
 
    <legend>
        <@spring.message "Legend.headlineForm" />
    </legend>
    <ul>
        <li>
            <label for="displayName">
                <@spring.message "Label.headlineForm.displayName" />
            </label>
            <@spring.formInput "headlineForm.displayName" 'class="sum"' />
        </li>
        <li>
            <label for="headline">
                <@spring.message "Label.headlineForm.headline" />
            </label>
            <@spring.formTextarea "headlineForm.headline" 'class="sum"' />
            <#--
            <textarea class="sum" id="headline" name="headline">${viewerAccount.user.headline!""}</textarea>
            -->
        </li>
        <li>
            <input type="submit" value='<@spring.message "Save.button" />' />
        </li>
    </ul>
</form>
</#macro>

<#macro updatePasswordForm>

<@spring.bind "passwordForm.*" />

<form id="updatePasswordForm" method="post" action="/social/_updatePassword">
    <div class="error">
        <@spring.showErrors "<br>" />
    </div>
     <legend>
        <@spring.message "Legend.passwordForm" />
    </legend>
    <ul>
        <li>
            <label for="password">
                <@spring.message "Label.passwordForm.password" />
            </label>
            <@spring.formPasswordInput "passwordForm.password" 'class="sum"' />
        </li>
        <li>
            <label for="confirm">
                <@spring.message "Label.passwordForm.confirm" />
            </label>
            <@spring.formPasswordInput "passwordForm.confirm" 'class="sum"' />
        </li>
        <li>
            <input type="submit" value='<@spring.message "Save.button" />'/>
        </li>
    </ul>
</form>
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

<#macro showProfile>
    <div>
        fjdaj
    </div>
</#macro>

