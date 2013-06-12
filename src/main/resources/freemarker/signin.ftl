<#import "spring.ftl" as spring />
<#import "siteGadgets.ftl" as site />

<#assign title="signin" in site>

<@site.layout>

    <@site.siteLogo/>

    <div id="page-main-wrapper">
        <form id="signinForm" action="<@spring.url '/jsc'/>" method="post">
            <#if t??>
            <#if t == 'e'>
            <div>
                <span class="error">
                    <@spring.message "Fail.signinForm" />
                </span>
            </div>
            <#elseif t == 'r'>
            <div>
                <span class="alert">
                    <@spring.message "Success.resetPassword" />
                </span>
            </div>
            <#elseif t == 'n'>
            <div>
                <span class="alert">
                    <@spring.message "Success.signupForm" />
                </span>
            </div>
            </#if>
            </#if>

            <legend>
                <@spring.message "Legend.signinForm" />
            </legend>
            <ul>
                <li>
                    <label for="sign-username">
                        <@spring.message "Label.usernameOrPassword" />
                    </label>
                    <input type="text" id="sign-username" name="j_username" size="20" maxlength="50" />
                </li>
                <li>
                    <label for="sign-password">
                        <@spring.message "Label.password" />
                        <a href="/social/resetRequest"><@spring.message "ForgetText.password" /></a>
                    </label>
                    <input type="password" id="sign-password" name="j_password" size="20" maxlength="50" />
                </li>
                <li>
                    <input type="submit" value='<@spring.message "SigninText.submit" />'/>
                </li>
            </ul>
         </form>
    </div>

</@site.layout>

