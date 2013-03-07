<#macro layout>
    <#include "header.ftl">
    <#nested>
    <#include "footer.ftl">
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

<#macro slogan>
    <div class="slogan">
        <h3>在线社会化学习工具</h3>
        <div class="slogan-item">
            <div>分享学习方法</div>
            <div>交流学习经验</div>
            <div>展示个人能力</div>
            <div>获取更多机会</div>
        </div>
    </div>
</#macro>

<#macro aboutForm>
<form id="aboutForm" class="dialog pop-650" style="display: none" method="post">
    <legend>
        About
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro aboutLogo>
  <div>
    <h1>
       <@spring.message "i18n.common.sitename" />
       <span><@spring.message "i18n.common.siteslogan" /></span>
   </h1>
 </div>
</#macro>

<#macro showAbout>
    <ul>
        <#if abouts??>
        <#list abouts as about>
        <li>${about.content}</li>
        </#list>
        </#if>
    </ul>

    <#if viewerAccount??>
        <@aboutForm/>
        <a class="add-about" data-action="<@spring.url '/about/_create' />" href="#">add</a>
    </#if>
</#macro>


