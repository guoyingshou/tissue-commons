<#import 'spring.ftl' as spring />
<#import 'userGadgets.ftl' as userGadgets />

<!doctype html>
<html>
    <head>
        <title>${title}</title>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
        <script type="text/javascript" src="/jquery/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="/tissue/js/common.js"></script>
        <script type="text/javascript" src="/tissue/js/user.js"></script>
        <#if myscripts??>
        <#list myscripts as myscript>
        <script type="text/javascript" src="${myscript}"></script>
        </#list>
        </#if>
         
        <link type="text/css" rel="stylesheet" href="/tissue/css/common.css"></link>

        <#if mystyles??>
        <#list mystyles as style>
        <link rel='stylesheet' type='text/css' media='screen' href='${style}' />
        </#list>
        </#if>

    </head>
    <body>
        <div id="headerWrapper" class="wrapper">
            <div id="header" class="center">
                <ul class="nav-left nav-item">
                    <#if viewer??>
                        <li><a href="/social/dashboard"><@spring.message "i18n.common.menu.home" /></a></li>
                    <#else>
                        <li><a href="/social/home"><@spring.message "i18n.common.menu.home" /></a></li>
                    </#if>
                    <li><a href="/group/explore"><@spring.message "i18n.common.menu.explore" /></a></li>
                    <li><a href="/social/about"><@spring.message "i18n.common.menu.about" /></a></li>
                </ul>

                <#if viewer??>
                <@userGadgets.contactEditForm />
                <@userGadgets.profileEditForm />
                <@userGadgets.passChangeForm />

                <ul class="nav-right nav-item">
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li>
                        <a href="#">
                            <@spring.message "i18n.common.menu.setting" />
                        </a>
                        <ul class="dropdown-menu" style="display: none">
                            <li>
                                <a class="edit-contact" data-action="<@spring.url '/_updateContact' />" href="#">
                                    <@spring.message "i18n.user.updateContact" />
                                </a>
                            </li>
                            <li>
                                <a class="edit-profile" data-action="<@spring.url '/_updateProfile' />" href="#">
                                    <@spring.message "i18n.user.updateProfile" />
                                </a>
                            </li>
                            <li>
                                <a class="change-pass" data-action="<@spring.url '/_updatePassword' />" href="#">
                                    <@spring.message "i18n.user.updatePassword" />
                                </a>
                             </li>
                        </ul>
                    </li>
                    <li><a href="/social/users/${viewer.id?replace("#", "")}/posts">${viewer.displayName}</a></li>
                    <li><a href="/social/signout"><@spring.message "i18n.common.menu.signout" /></a></li>
                </ul>
                <#else>
                <ul class="nav-right nav-item">
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li><a href="/social/dashboard"><@spring.message "i18n.common.menu.signin" /></a></li>
                    <li><a class="signup" href="/social/signup"><@spring.message "i18n.common.menu.signup" /></a></li>
                </ul>
                </#if>
            </div>
        </div>
