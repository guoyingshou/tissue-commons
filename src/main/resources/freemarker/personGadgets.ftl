<#import 'formGadgets.ftl' as formGadgets />

<#macro homeLogo>
  <div>
    <h1>
       <@spring.message "i18n.common.sitename" />
       <span><@spring.message "i18n.common.siteslogan" /></span>
   </h1>
   <#if viewer??>
   <ul>
       <li>
           <a href="<@spring.url '/watchedfeeds' />">
                watched
           </a>
       </li>
       <li>
           <a href="<@spring.url '/allfeeds' />">
                all
           </a>
       </li>
   </ul>
   </#if>
 </div>
</#macro>

<#macro personLogo>
    <div>
        <h1><a href="<@spring.url '/users/${owner.id}' />">${owner.displayName}</a></h1>
        <ul class="submenu-more">
            <li>
                <a href="<@spring.url '/users/${owner.id}/posts' />">
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
            <#if viewer?? && owner.isSelf(viewer.id)>
            <li>
                <a href="<@spring.url '/invitations' />">
                    <@spring.message "i18n.user.menu.invitations" />
                </a>
            </li>
            </#if>
         </ul>
        <ul class="submenu-action">
            <#if owner.invitable>
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

<#macro showFriends>
    <ul>
        <#list friends as friend>
        <li>
            <a href="/social/users/${friend.id}/posts">${friend.displayName}</a>
        </li>
        </#list>
    </ul>
</#macro>

<#macro showUsers>
    <ul>
        <#list users as user>
        <li>
            <a href="/social/users/${user.id}/posts">${user.displayName}</a>
        </li>
        </#list>
    </ul>
</#macro>

<#macro showPlansOwned>
    <#if owner?? && owner.plans??>
    <div>
        <h4>Topics ${owner.displayName} is learning</h4>
        <ul>
        <#list owner.plans as plan>
            <li>
                <span>${plan.topic.title}</span>
                <span>${plan.createTime?datetime}</span>
                <span>${plan.duration}</span>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>

