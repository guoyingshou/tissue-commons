<#import 'userGadgets.ftl' as userGadgets />

<#macro layout>
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
        <div id="page-header-wrapper">
            <div id="page-header" class="page-center">
                <ul class="nav-left nav-item">
                    <#if viewerAccount??>
                        <li><a href="/social/dashboard"><@spring.message "Nav.header.home" /></a></li>
                    <#else>
                        <li><a href="/social/home"><@spring.message "Nav.header.home" /></a></li>
                    </#if>
                    <li><a href="/group/explore"><@spring.message "Nav.header.explore" /></a></li>
                    <li><a href="/social/about"><@spring.message "Nav.header.about" /></a></li>
                </ul>

                <#if viewerAccount??>
                <#--
                <@userGadgets.updateEmailForm />
                <@userGadgets.updateProfileForm />
                <@userGadgets.updatePasswordForm />
                -->

                <ul class="nav-right nav-item">
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li>
                        <a href="/social/_setting">
                            <@spring.message "Nav.header.setting" />
                        </a>
                        <#--
                        <ul class="dropdown-menu" style="display: none">
                            <li>
                                <a class="update-email" data-action="<@spring.url '/_updateEmail' />" href="#">
                                    <@spring.message "Nav.header.updateEmail" />
                                </a>
                            </li>
                            <li>
                                <a class="update-profile" data-action="<@spring.url '/_updateProfile' />" href="#">
                                    <@spring.message "Nav.header.updateProfile" />
                                </a>
                            </li>
                            <li>
                                <a class="update-password" data-action="<@spring.url '/_updatePassword' />" href="#">
                                    <@spring.message "Nav.header.updatePassword" />
                                </a>
                             </li>
                        </ul>
                        -->
                    </li>
                    <li><a href="/social/users/${viewerAccount.user.id?replace("#", "")}/posts">${viewerAccount.user.displayName}</a></li>
                    <li><a href="/social/signout"><@spring.message "Nav.header.signout" /></a></li>
                </ul>
                <#else>
                <ul class="nav-right nav-item">
                    <#if locale == 'zh_CN'>
                    <li><a href="?locale=en_US">English</a></li>
                    <#else>
                    <li><a href="?locale=zh_CN">中文</a></li>
                    </#if>
                    <li><a href="/social/dashboard"><@spring.message "Nav.header.signin" /></a></li>
                    <li><a class="signup" href="/social/signup"><@spring.message "Nav.header.signup" /></a></li>
                </ul>
                </#if>
            </div>
        </div>

        <#nested>

        <div id="page-footer-wrapper">
            <div id="page-footer" class="page-center">
                <p>Copyritht @2012 Tissue | Powered by JinZhouLin</p>
            </div>
        </div>
    </body>
</html>
</#macro>

<#macro showPager>
    <#assign pages = (pager.total / pager.size)?ceiling />
    <#if (pages > 1)>
        <div class="pager">
           <#if (pager.current > 1)>
              <a href="?page=${pager.current-1}&size=${pager.size}">prev</a>
           </#if>

           <#if (pages <= 6)>
              <#list 1..pages as page>
                  <#if (page = pager.current)>
                      <span class="cur">
                  <#else> 
                      <span>
                  </#if>
                  <a href="?page=${page}&size=${pager.size}">${page}</a></span>
              </#list>
           <#else>
              <#if ((pager.current - 2) <= 2)>
                  <#list 1..5 as page>
                      <#if (page = pager.current)>
                          <span class="cur">
                      <#else>
                          <span>
                      </#if>
                          <a href="?page=${page}&size=${pager.size}">${page}</a></span>
                  </#list>
                  ...<span>${pages}</span>
              <#elseif ((pages - pager.current) <= 2)>
                  <span>1</span>...
                  <#list (pages - 4)..pages as page>
                      <#if (page = pager.current)>
                          <span class="cur">
                      <#else>
                          <span>
                      </#if> 
                      <a href="?page=${page}&size=${pager.size}">${page}</a></span>
                  </#list>
              <#else>
                  <span>1</span>...
                  <#list (pager.current - 2)..(pager.current +2) as page>
                      <#if (page = pager.current)>
                          <span class="cur">
                      <#else>
                          <span>
                      </#if>
                      <a href="?page=${page}&size=${pager.size}">${page}</a></span>
                  </#list>
                  ...<span>${pages}</span>
              </#if>
           </#if>

           <#if (pager.current < pages)>
              <a href="?page=${pager.current+1}&size=${pager.size}">next</a>
           </#if>
        </div>
    </#if>
</#macro>

<#macro showTimeBefore ts>
   <#if ts.years != 0>
       ${ts.years} 
       <#if ts.years = 1> 
           <@spring.message "Before.ts.year" />
       <#else>
           <@spring.message "Before.ts.years" />
       </#if>
   <#elseif ts.months != 0>
       ${ts.months} 
       <#if ts.months = 1> 
           <@spring.message "Before.ts.month" />
       <#else>
           <@spring.message "Before.ts.months" />
       </#if>
   <#elseif ts.weeks != 0>
       ${ts.weeks} 
       <#if ts.weeks = 1> 
           <@spring.message "Before.ts.week" />
       <#else>
           <@spring.message "Before.ts.weeks" />
       </#if>
   <#elseif ts.days != 0>
       ${ts.days} 
       <#if ts.days = 1> 
           <@spring.message "Before.ts.day" />
       <#else>
           <@spring.message "Before.ts.days" />
       </#if>
   <#elseif ts.hours != 0>
       ${ts.hours} 
       <#if ts.hours = 1> 
           <@spring.message "Before.ts.hour" />
       <#else>
           <@spring.message "Before.ts.hours" />
       </#if>
   <#elseif ts.minutes != 0>
       ${ts.minutes} 
       <#if ts.minutes = 1> 
           <@spring.message "Before.ts.minute" />
       <#else>
           <@spring.message "Before.ts.minutes" />
       </#if>
   <#elseif ts.seconds != 0>
       ${ts.seconds} 
       <#if ts.seconds = 1> 
           <@spring.message "Before.ts.second" />
       <#else>
           <@spring.message "Before.ts.seconds" />
       </#if>
   </#if>
</#macro>

<#macro showTimeRemaining ts>
   <#if ts.months != 0>
       <#assign args = [ts.months] />
       <#if ts.months == 1>
           <@spring.messageArgs "End.ts.month" args/>
       <#else>
           <@spring.messageArgs "End.ts.months" args/> 
       </#if>
   <#elseif ts.weeks != 0>
       <#assign args = [ts.weeks] />
       <#if ts.weeks == 1>
           <@spring.messageArgs "End.ts.week" args/>
       <#else>
           <@spring.messageArgs "End.ts.weeks" args/> 
       </#if>
   <#elseif ts.days != 0>
       <#assign args = [ts.days] />
       <#if ts.days == 1>
           <@spring.messageArgs "End.ts.day" args/>
       <#else>
           <@spring.messageArgs "End.ts.days" args/> 
       </#if>
   <#elseif ts.hours != 0>
       <#assign args = [ts.hours] />
       <#if ts.hours == 1>
           <@spring.messageArgs "End.ts.hour" args/>
       <#else>
           <@spring.messageArgs "End.ts.hours" args/> 
       </#if>
   <#elseif ts.minutes != 0>
       <#assign args = [ts.minutes] />
       <#if ts.minutes == 1>
           <@spring.messageArgs "End.ts.minute" args/>
       <#else>
           <@spring.messageArgs "End.ts.minutes" args/> 
       </#if>
   <#elseif ts.seconds !=0 >
       <#assign args = [ts.seconds] />
       <#if ts.seconds == 1>
           <@spring.messageArgs "End.ts.second" args/>
       <#else>
           <@spring.messageArgs "End.ts.seconds" args/> 
       </#if>
   </#if>
</#macro>

<#macro deleteConfirmForm>
<form id="deleteConfirmForm" class="dialog pop-320" style="display:none" method="post">
    <legend>
        Warning
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <div class="message">
          Are you sure that you really want to delete the selected item?
    </div>
    <div>
        <input type="submit" name="ok" value="Yes" />
    </div>
</form>
</#macro>


