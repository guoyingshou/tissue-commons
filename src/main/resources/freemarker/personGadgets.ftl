<#macro personLogo>
    <h1>${owner.displayName}</h1>
    <div>
        <ul class="menu">
            <li><a href="#">about me</a></li>
            <li><a href="#">actions</a></li>
        </ul>
        <ul class="action">
            <#if canInvite??>
            <li><a href="<@spring.url '/users/${owner.id}/invites' />">invite</a></li>
            </#if>
        </ul>
    </div>
</#macro>

<#macro dashboardLogo>
    <h1>Tissue Network</h1>
    <div>
        <ul class="menu">
            <li><a href="/profile/dashboard">NewsFeeds</a></li>
            <li><a href="/profile/actions">Actions</a></li>
        </ul>
    </div>
</#macro>

