<#import "spring.ftl" as spring />
<#import "siteGadgets.ftl" as site />

<#assign title="Sign out" in site>

<@site.layout>

    <iframe src="/social/cleanup" style="display:none"></iframe>
    <iframe src="/group/cleanup" style="display:none"></iframe>

    <@site.siteLogo />

    <div id="page-main-wrapper">
        <div class="info">
            Sign out!
        </div>
    </div>

</@site.layout>

