<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#macro layout title="">
    <#include "header.ftl">
    <div id="mainWrapper" class="center">
        <#nested>
    </div>
    <#include "footer.ftl">
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

    <#if viewer??>
        <a class="add-about" href="<@spring.url '/about' />">add</a>
        <@formGadgets.oneItemForm />
        <script type="text/javascript">
            $(document).on('click', 'a.add-about', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $(this).prev().oneItemDialog(url);
            });
        </script>
    </#if>

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
