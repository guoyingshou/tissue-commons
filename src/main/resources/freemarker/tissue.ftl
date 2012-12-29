<#import 'spring.ftl' as spring />

<#macro layout title="">
    <#include "header.ftl">
    <div id="mainWrapper">
        <#nested>
    </div>
    <#include "footer.ftl">
</#macro>
