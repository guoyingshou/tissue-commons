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
       ${ts.months} months ago
   <#elseif ts.weeks != 0>
       ${ts.weeks} weeks ago
   <#elseif ts.days != 0>
       ${ts.days} days ago
   <#elseif ts.hours != 0>
       ${ts.hours} hours ago
   <#elseif ts.minutes != 0>
       ${ts.minutes} minutes ago
   <#elseif ts.seconds != 0>
       ${ts.seconds} seconds ago
   </#if>
</#macro>

<#macro showTimeRemaining ts>
   <#if ts.months != 0>
       ${ts.months} months 
   <#elseif ts.weeks != 0>
       ${ts.weeks} weeks 
   <#elseif ts.days != 0>
       ${ts.days} days 
   <#elseif ts.hours != 0>
       ${ts.hours} hours 
   <#elseif ts.minutes != 0>
       ${ts.minutes} minutes
   <#elseif ts.seconds !=0 >
       ${ts.seconds} seconds
   </#if>
</#macro>

