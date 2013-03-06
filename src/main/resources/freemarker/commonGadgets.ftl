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


