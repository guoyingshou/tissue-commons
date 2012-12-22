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
                    <li><a href="http://www.tissue.com/u1/profile/home">Home</a></li>
                    <li><a href="http://www.tissue.com/u2/plan/explore">Explore</a></li>
                    <li><a href="#">About</a></li>
                </ul>

                <#if viewer??>
                <ul class="userbox">
                    <li>
                    <a href="http://www.tissue.com/u1/profile/invitations">Invitations<#if invitationsCount??>(${invitationsCount})</#if></a>
                    </li>
                    <li><a href="http://www.tissue.com/u1/profile/friends">Friends</a></li>
                    <li><a href="?locale=en_US">English</a></li>
                    <li><a href="?locale=zh_CN">Chinese</a></li>
                    <li><a href="http://www.tissue.com/u1/profile/users/${viewer.id}">${viewer.displayName}</a></li>
                    <li><a href="http://www.tissue.com/u1/profile/signout">sign out</a></li>
                </ul>
                <#else>
                <ul class="userbox">
                    <li><a href="?locale=en_US">English</a></li>
                    <li><a href="?locale=zh_CN">Chinese</a></li>
                    <li><a href="http://www.tissue.com/u1/profile/dashboard">sign in</a></li>
                    <li><a href="http://www.tissue.com/u1/profile/signup">sign up</a></li>
                </ul>
                </#if>
            </div>
        </div>
