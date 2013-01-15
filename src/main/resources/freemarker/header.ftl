<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<!doctype html>
<html>
    <head>
        <title>${title}</title>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
        <script type="text/javascript" src="/jquery/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="/tissue/js/pop.js"></script>
        <#if myscripts??>
        <#list myscripts as myscript>
        <script type="text/javascript" src="${myscript}"></script>
        </#list>
        </#if>
         
        <link type="text/css" rel="stylesheet" href="/tissue/css/common.css"></link>
        <link type="text/css" rel="stylesheet" href="/tissue/css/pop.css"></link>

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
                    <li><a href="/social/home"><@spring.message "i18n.common.menu.home" /></a></li>
                    <li><a href="/group/explore"><@spring.message "i18n.common.menu.explore" /></a></li>
                    <li><a href="/social/about"><@spring.message "i18n.common.menu.about" /></a></li>
                </ul>

                <#if viewer??>
                <ul class="userbox">
                    <li>
                        <a href="/social/invitations">
                            <@spring.message "i18n.common.menu.invitations" />
                            - ${viewer.invitationsReceived?size}
                        </a>
                    </li>
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li><a href="/social/users/${viewer.id}">${viewer.displayName}</a></li>
                    <li><a href="/social/signout"><@spring.message "i18n.common.menu.signout" /></a></li>
                </ul>
                <#else>
                <ul class="userbox">
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li><a href="/social/dashboard"><@spring.message "i18n.common.menu.signin" /></a></li>
                    <li><a class="signup" href="/social/signup"><@spring.message "i18n.common.menu.signup" /></a></li>
                </ul>
                <@formGadgets.signupForm />
                <script type="text/javascript">
                    $(document).on('click', 'a.signup', function(e) {
                        e.preventDefault();
                        $(this).registerDialog();
                    });
                </script>
                </#if>
            </div>
        </div>
