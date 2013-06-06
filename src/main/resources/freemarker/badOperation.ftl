<#import "spring.ftl" as spring />
<#import "siteGadgets.ftl" as site />

<#assign title="Error" in site>

<@site.layout>

    <@site.siteLogo />

    <div id="page-main-wrapper">
        <div class="info">
            <@spring.message 'Alert.badOperation' />
        </div>
    </div>

</@site.layout>

