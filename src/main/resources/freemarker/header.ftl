<#import 'spring.ftl' as spring />

<!doctype html>
<html>
    <head>
        <title>${title}</title>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
        <script type="text/javascript" src="/jquery/jquery-1.8.3.min.js"></script>
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
        <div id="headerWrapper">
            <div id="header">
                <ul class="nav">
                    <li><a href="http://www.tissue.com/profile/home"><@spring.message "i18n.common.menu.home" /></a></li>
                    <li><a href="http://www.tissue.com/group/explore"><@spring.message "i18n.common.menu.explore" /></a></li>
                    <li><a href="#"><@spring.message "i18n.common.menu.about" /></a></li>
                </ul>

                <#if viewer??>
                <ul class="userbox">
                    <li>
                    <a href="http://www.tissue.com/profile/invitations"><@spring.message "i18n.common.menu.invitations" /><#if invitationsCount??>(${invitationsCount})</#if></a>
                    </li>
                    <li><a href="http://www.tissue.com/profile/friends"><@spring.message "i18n.common.menu.friends" /></a></li>
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li><a href="http://www.tissue.com/profile/users/${viewer.id}">${viewer.displayName}</a></li>
                    <li><a href="http://www.tissue.com/profile/signout"><@spring.message "i18n.common.menu.signout" /></a></li>
                </ul>
                <#else>
                <ul class="userbox">
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li><a href="http://www.tissue.com/profile/dashboard"><@spring.message "i18n.common.menu.signin" /></a></li>
                    <li><a href="http://www.tissue.com/profile/signup"><@spring.message "i18n.common.menu.signup" /></a></li>
                </ul>
                </#if>
            </div>
        </div>
