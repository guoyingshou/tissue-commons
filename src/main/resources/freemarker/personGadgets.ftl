<#import 'formGadgets.ftl' as formGadgets />
<#macro personLogo>
    <div>
        <h1><a href="<@spring.url '/users/${owner.id}' />">${owner.displayName}</a></h1>
        <ul class="profile-menu">
            <li><a href="<@spring.url '/users/${owner.id}' />">Articles</a></li>
            <li><a href="<@spring.url '/users/${owner.id}/status' />">Status</a></li>
            <li><a href="<@spring.url '/users/${owner.id}/resume' />">Resume</a></li>
            <li><a href="<@spring.url '/users/${owner.id}/impressions' />">Impressions</a></li>
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
            <li><a href="<@spring.url '/dashboard' />">NewsFeeds</a></li>
            <li><a href="<@spring.url '/actions' />">Actions</a></li>
        </ul>
    </div>
</#macro>

<#macro showResume>
    <div>
        ${owner.resume!''}
    </div>
    <#if owner.isSame(viewer.id)>
        <a class="edit-resume" href="<@spring.url '/users/${owner.id}/resume' />">edit</a>
        <@formGadgets.oneItemForm />
        <script type="text/javascript">
            $(document).on('click', 'a.edit-resume', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $(this).prev().oneItemDialog(url);
            });
        </script>
    </#if>
</#macro>

<#macro showImpressions>
    <ul>
        <#if impressions??>
        <#list impressions as impression>
        <li>${impression.content}</li>
        </#list>
        </#if>
    </ul>

        <a class="add-impression" href="<@spring.url '/users/${owner.id}/impressions' />">add impression</a>
        <@formGadgets.oneItemForm />
        <script type="text/javascript">
            $(document).on('click', 'a.add-impression', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $(this).prev().oneItemDialog(url);
            });
        </script>

</#macro>
