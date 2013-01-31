<#import 'spring.ftl' as spring />

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
   <#if ts.months != 0>
       ${ts.months} 
       <#if ts.months = 1> 
           <@spring.message "i18n.common.ts.month.before" />
       <#else>
           <@spring.message "i18n.common.ts.months.before" />
       </#if>
   <#elseif ts.weeks != 0>
       ${ts.weeks} 
       <#if ts.weeks = 1> 
           <@spring.message "i18n.common.ts.week.before" />
       <#else>
           <@spring.message "i18n.common.ts.weeks.before" />
       </#if>
   <#elseif ts.days != 0>
       ${ts.days} 
       <#if ts.days = 1> 
           <@spring.message "i18n.common.ts.day.before" />
       <#else>
           <@spring.message "i18n.common.ts.days.before" />
       </#if>
   <#elseif ts.hours != 0>
       ${ts.hours} 
       <#if ts.hours = 1> 
           <@spring.message "i18n.common.ts.hour.before" />
       <#else>
           <@spring.message "i18n.common.ts.hours.before" />
       </#if>
   <#elseif ts.minutes != 0>
       ${ts.minutes} 
       <#if ts.minutes = 1> 
           <@spring.message "i18n.common.ts.minute.before" />
       <#else>
           <@spring.message "i18n.common.ts.minutes.before" />
       </#if>
   <#elseif ts.seconds != 0>
       ${ts.seconds} 
       <#if ts.seconds = 1> 
           <@spring.message "i18n.common.ts.second.before" />
       <#else>
           <@spring.message "i18n.common.ts.seconds.before" />
       </#if>
   </#if>
</#macro>

<#macro showTimeRemaining ts>
   <#if ts.months != 0>
       <#assign args = [ts.months] />
       <#if ts.months == 1>
           <@spring.messageArgs "i18n.common.ts.month" args/>
       <#else>
           <@spring.messageArgs "i18n.common.ts.months" args/> 
       </#if>
   <#elseif ts.weeks != 0>
       <#assign args = [ts.weeks] />
       <#if ts.weeks == 1>
           <@spring.messageArgs "i18n.common.ts.week" args/>
       <#else>
           <@spring.messageArgs "i18n.common.ts.weeks" args/> 
       </#if>
   <#elseif ts.days != 0>
       <#assign args = [ts.days] />
       <#if ts.days == 1>
           <@spring.messageArgs "i18n.common.ts.day" args/>
       <#else>
           <@spring.messageArgs "i18n.common.ts.days" args/> 
       </#if>
   <#elseif ts.hours != 0>
       <#assign args = [ts.hours] />
       <#if ts.hours == 1>
           <@spring.messageArgs "i18n.common.ts.hours" args/>
       <#else>
           <@spring.messageArgs "i18n.common.ts.hours" args/> 
       </#if>
   <#elseif ts.minutes != 0>
       <#assign args = [ts.minutes] />
       <#if ts.minutes == 1>
           <@spring.messageArgs "i18n.common.ts.minutes" args/>
       <#else>
           <@spring.messageArgs "i18n.common.ts.minutes" args/> 
       </#if>
   <#elseif ts.seconds !=0 >
       <#assign args = [ts.seconds] />
       <#if ts.seconds == 1>
           <@spring.messageArgs "i18n.common.ts.second" args/>
       <#else>
           <@spring.messageArgs "i18n.common.ts.seconds" args/> 
       </#if>
   </#if>
</#macro>

