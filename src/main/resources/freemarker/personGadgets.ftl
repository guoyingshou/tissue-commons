<#import 'formGadgets.ftl' as formGadgets />
<#macro personLogo>
    <div>
        <h1><a href="<@spring.url '/users/${owner.id}' />">${owner.displayName}</a></h1>
        <ul class="submenu-more">
            <li>
                <a href="<@spring.url '/users/${owner.id}' />">
                    <@spring.message "i18n.user.menu.articles" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/status' />">
                    <@spring.message "i18n.user.menu.status" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/resume' />">
                    <@spring.message "i18n.user.menu.resume" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/impressions' />">
                    <@spring.message "i18n.user.menu.impressions" />
                </a>
            </li>
            <li>
                <a href="<@spring.url '/users/${owner.id}/friends' />">
                    <@spring.message "i18n.user.menu.friends" />
                </a>
            </li>
        </ul>
        <ul class="submenu-action">
            <#if viewer?? && viewer.canInvite(owner.id)>
            <li><a class="invite" href="<@spring.url '/users/${owner.id}/invites' />">invite</a></li>
            <@formGadgets.inviteForm />
            <script type="text/javascript">
                $(document).on('click', 'a.invite', function(e) {
                    e.preventDefault();
                    $(this).inviteDialog();
                });
            </script>
            </#if>
        </ul>
    </div>
</#macro>

<#macro dashboardLogo>
    <h1>
        <@spring.message "i18n.common.sitename" />
    </h1>
    <#--
    <div>
        <ul class="menu">
            <li><a href="<@spring.url '/dashboard' />">NewsFeeds</a></li>
            <li><a href="<@spring.url '/actions' />">Actions</a></li>
        </ul>
    </div>
    -->
</#macro>

<#macro showResume>
    <div>
        ${owner.resume!''}
    </div>
    <#if viewer?? && viewer.isSelf(owner.id)>
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

    <#if viewer?? && viewer.isFriend(owner.id)>
        <a class="add-impression" href="<@spring.url '/users/${owner.id}/impressions' />">add impression</a>
        <@formGadgets.oneItemForm />
        <script type="text/javascript">
            $(document).on('click', 'a.add-impression', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $(this).prev().oneItemDialog(url);
            });
        </script>
    </#if>

</#macro>
