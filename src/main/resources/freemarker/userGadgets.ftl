<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#macro homeLogo>
    <h1>
       <@spring.message "i18n.common.sitename" />
       <span><@spring.message "i18n.common.siteslogan" /></span>
   </h1>
   <#if viewer??>
   <div>
   <ul class="menu">
       <li>
           <a href="<@spring.url '/watchedfeeds' />">
               <@spring.message "i18n.common.menu.watchedFeeds" />
           </a>
       </li>
       <li>
           <a href="<@spring.url '/allfeeds' />">
               <@spring.message "i18n.common.menu.allFeeds" />
           </a>
       </li>
       <li>
           <a href="/social/invitations">
               <@spring.message "i18n.common.menu.invitations" />
               - ${viewer.invitationsReceived?size}
           </a>
       </li>
   </ul>
   <ul class="action">
       <li>fdafa</li>
       <li>bbb</li>
   </ul>
   </div>
   </#if>
</#macro>

<#macro personLogo>
    <div>
        <h1>
            <a href="<@spring.url '/users/${owner.id}/posts' />">${owner.displayName}</a>
            <span>${owner.headline!""}</span>
        </h1>
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
         </ul>
        <ul class="submenu-action">
            <#if invitable>
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
    <ul class="users">
        <#list users as user>
        <li>
            <div>
                <p>
                    <a href="/social/users/${user.id}/posts">${user.displayName}</a>
                </p>
                <p>
                    ${user.headline!""}
                </p>
            </div>
        </li>
        </#list>
    </ul>
</#macro>

<#macro showOwnedPlans>
    <#if owner?? && owner.ownedPlans??>
    <div>
        <h4>In progress</h4>
        <ul>
        <#list owner.ownedPlans as plan>
            <li>
                <div class="plan-endtime ts">
                    <#if plan.months != 0>
                        ${plan.months} <@spring.message 'i18n.common.months' />
                    <#elseif plan.weeks != 0>
                        ${plan.weeks} <@spring.message 'i18n.common.weeks' />
                    <#elseif plan.days != 0>
                        ${plan.days} <@spring.message 'i18n.common.days' />
                    <#elseif plan.hours != 0>
                        ${plan.hours} <@spring.message 'i18n.common.hours' />
                    <#elseif plan.minutes != 0>
                        ${plan.minutes} <@spring.message 'i18n.common.minutes' />
                    </#if>
                </div>

                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro showArchivedPlans>
    <#if owner?? && owner.archivedPlans??>
    <div>
        <h4>Archived</h4>
        <ul>
        <#list owner.archivedPlans as plan>
            <li>
                <div class="plan-duration ts">
                    ${plan.createTime?date} - ${plan.endTime?date}
                </div>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro showNewTopics>
    <div>
        <h4>New Topics</h4>
        <ul>
        <#list newTopics as topic>
            <li>
                <div class="ts">
                     <a href="/social/users/${topic.user.id}">${topic.user.displayName}</a>
                     <span>${topic.createTime?datetime}</span>
                </div>
                <div>${topic.title}</div>
            </li>
        </#list>
        </ul>
    </div>
</#macro>

