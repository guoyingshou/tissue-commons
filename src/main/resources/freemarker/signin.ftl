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
                <span class="alert">
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
                    <@spring.message "NewUser.signinForm" />
                </span>
            </div>
            </#if>
            </#if>

            <legend>
                <@spring.message "signinForm" />
            </legend>
            <ul>
                <li>
                    <label for="sign-username">
                        <@spring.message "Signin.usernameOrPassword" />
                    </label>
                    <input type="text" id="sign-username" name="j_username" size="20" maxlength="50" />
                </li>
                <li>
                    <label for="sign-password">
                        <@spring.message "Signin.password" />
                    </label>
                    <input type="password" id="sign-password" name="j_password" size="20" maxlength="50" />
                </li>
                <li>
                    <input type="submit" value='<@spring.message "Signin.button" />'/>
                </li>
            </ul>
         </form>
    </div>

</@site.layout>

