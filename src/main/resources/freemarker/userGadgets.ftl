<#import 'spring.ftl' as spring />
<#import 'tissue.ftl' as tissue />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro signupForm>
    <div class="input-form account">
        <form id="signupForm" action="<@spring.url '/signup' />" method="post">
            <legend>
                <@spring.message "i18n.user.signup" />
            </legend>

            <ul>
                <li>
                    <label for="username">
                        <@spring.message "i18n.user.username" />
                        <span style="display: none">
                            <@spring.message "i18n.user.error.usernameInvalid" />
                        </span>
                    </label>
                    <input type="text" class="sum" id="username" name="username" value="" />
                </li>

                <li>
                    <label for="password">
                        <@spring.message "i18n.user.password" />
                        <span style="display: none">
                            <@spring.message "i18n.user.error.passwordInvalid" />
                        </span>
                    </label>
                    <input type="password" class="sum" id="password" name="password" value="" />
                </li>

                <li>
                    <label for="confirm">
                        <@spring.message "i18n.user.confirm" />
                        <span style="display: none">
                            <@spring.message "i18n.user.error.passwordMismatch" />
                        </span>
                    </label>
                    <input type="password" class="sum" id="confirm" name="confirm" value="" />
                </li>

                <li>
                    <label for="email">
                        <@spring.message "i18n.user.email" />
                        <span style="display: none">
                            <@spring.message "i18n.user.error.emailInvalid" />
                        </span>
                    </label>
                    <input type="text" class="sum" id="email" name="email" value="" />
                </li>

                <li>
                    <label for="displayName">
                        <@spring.message "i18n.user.displayName" />
                        <span style="display: none">
                            <@spring.message "i18n.user.error.empty" />
                        </span>
                    </label>
                    <input type="text" class="sum" id="displayName" name="displayName" value="" />
                </li>

                <li>
                    <label for="headline">
                        <@spring.message "i18n.user.headline" />
                        <span style="display: none">
                            <@spring.message "i18n.user.error.empty" />
                        </span>
                    </label>
                    <textarea class="sum" id="headline" name="headline">Engineer, XX company</textarea>
                </li>

                <li>
                    <input type="submit" value='<@spring.message "i18n.user.button.signup.submit" />' />
                </li>
            </ul>
        </form>
    </div>
</#macro>

<#macro signinForm>
<div id="signinForm" class="input-form account">
    <form action="<@spring.url '/jsc'/>" method="post">
        <legend>
            <@spring.message "i18n.user.signin" />
            <#if error??>
                <span>
                    <@spring.message "i18n.user.error.signin" />
                </span>
            </#if>
        </legend>
        <ul>
            <li>
                <label for="username"><@spring.message "i18n.user.username" /></label>
                <input type="text" class="sum" id="username" name="j_username" size="20" maxlength="50" />
            </li>
            <li>
                <label for="password"><@spring.message "i18n.user.password" /></label>
                <input type="password" class="sum" id="password" name="j_password" size="20" maxlength="50" />
            </li>
            <li>
                <input type="submit" value='<@spring.message "i18n.user.button.signin.submit" />'/>
            </li>
        </ul>
    </form>
</div>
</#macro>

<#macro contactEditForm>
    <div id="contactEditForm" class="dialog pop-420" style="display: none">
        <form method="post">
            <legend>
                <@spring.message "i18n.user.changeContact" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
            <ul>
                <li>
                    <label for="email">
                        <@spring.message "i18n.user.email" />
                        <span style="display:none">
                            <@spring.message "i18n.user.error.empty" />
                        </span>
                    </label>
                    <input class="sum" type="input" id="email" name="email" value="${viewer.email!""}" />
                </li>

                <li>
                    <input type="submit" value='<@spring.message "i18n.user.button.save"/>'/>
                </li>
            </ul>
        </form>

<#--
        <script type="text/javascript">
            $(document).one('click', 'a.edit-contact', function(e) {
                e.preventDefault();
                $(this).changeContactDialog();
            });
        </script>
        -->
    </div>
</#macro>

<#macro profileEditForm>
    <div id="profileEditForm" class="dialog pop-420" style="display: none">
        <form method="post">
            <legend>
                <@spring.message "i18n.user.changeProfile" />
                <a href="#" class="cancel cancel-profile-edit"><span data-icon="&#xe008"></span></a>
            </legend>
            <ul>
                    <li>
                        <label for="displayName">
                            <@spring.message "i18n.user.displayName" />
                            <span style="display:none">
                                <@spring.message "i18n.user.error.empty" />
                            </span>
                        </label>
                        <input type="input" class="sum" id="displayName" name="displayName" value="${viewer.displayName}" />
                    </li>
                    <li>
                        <label for="headline">
                            <@spring.message "i18n.user.headline" />
                            <span style="display:none">
                                <@spring.message "i18n.user.error.empty" />
                            </span>
                        </label>
                        <textarea class="sum" id="headline" name="headline">${viewer.headline!""}</textarea>
                    </li>
                    <li>
                        <input type="submit" value='<@spring.message "i18n.user.button.save" />' />
                    </li>
            </ul>
        </form>

<#--
        <script type="text/javascript">
            $(document).one('click', 'a.edit-profile', function(e) {
                e.preventDefault();
                $(this).changeProfileDialog();
            });
        </script>
        -->
    </div>
</#macro>

<#macro passChangeForm>
<div id="passChangeForm" class="dialog pop-420" style="display: none">
    <form method="post">
        <legend>
            <@spring.message "i18n.user.changePassword" />
            <a href="#" class="cancel cancel-change-pass"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="password">
                    <@spring.message "i18n.user.password" />
                    <span style="display:none">
                        <@spring.message "i18n.user.error.passwordInvalid" />
                    </span>
                </label>
                <input type="password" class="sum" id="password" name="password" value="" />
            </li>

            <li>
                <label for="confirm">
                    <@spring.message "i18n.user.confirm" />
                    <span style="display:none">
                        <@spring.message "i18n.user.error.passwordMismatch" />
                    </span>
                </label>
                <input type="password" class="sum" id="confirm" name="confirm" value="" />
            </li>

            <li>
                <input type="submit" value='<@spring.message "i18n.user.button.save" />'/>
            </li>
        </ul>
    </form>
    <#--
       <script type="text/javascript">
          $(document).one('click', 'a.change-pass', function(e) {
              e.preventDefault();
              $(this).changePassDialog();
          });
       </script>
       -->
</div>
</#macro>

<#macro inviteForm>
    <div id="inviteForm" class="dialog pop-420" style="display: none">
        <form method="POST">
            <legend>
                <@spring.message "i18n.user.invite" />
                <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
            </legend>
            <ul>
                <li>
                    <label for="letter">
                        <@spring.message "i18n.user.inviteLetter" />
                        <span style="display:none">
                            <@spring.message "i18n.user.error.empty" />
                        </span>
                    </label>
                </li>
                <li>
                    <textarea class="sum" id="letter" name="content"></textarea></p>
                </li>
                <li>
                    <input type="submit" name="submit" value='<@spring.message "i18n.user.button.invite.submit"/>' />
                </li>
            </ul>
        </form>
    </div>
</#macro>

<#macro impressionAddForm>
    <@tissue.oneItemForm />
    <script type="text/javascript">
            $(document).on('click', 'a.add-impression', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $(this).prev().oneItemDialog(url);
            });
    </script>
</#macro>

<#macro resumeAddForm>
    <@tissue.oneItemForm />
    <script type="text/javascript">
            $(document).on('click', 'a.edit-resume', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $(this).prev().oneItemDialog(url);
            });
    </script>
</#macro>

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
               <@spring.message "i18n.user.home.watchedFeeds" />
           </a>
       </li>
       <li>
           <a href="<@spring.url '/allfeeds' />">
               <@spring.message "i18n.user.home.allFeeds" />
           </a>
       </li>
       <li>
           <a href="/social/invitations">
               <@spring.message "i18n.user.home.invitations" />
               - ${viewer.invitationsReceived?size}
           </a>
       </li>
   </ul>
   </div>
   </#if>
</#macro>

<#macro userLogo>
    <div>
        <h1>
            <a href="<@spring.url '/users/${owner.id}/posts' />">${owner.displayName}</a>
            <span>${owner.headline!""}</span>
        </h1>
        <ul class="menu">
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
        <ul class="action">
            <#if invitable>
            <li>
                <a class="invite" data-action="<@spring.url '/users/${owner.id}/invites' />" href="#">
                    <@spring.message "i18n.user.invite" />
                </a>
            </li>
            <@inviteForm />
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
        <@resumeAddForm />
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
        <@impressionAddForm />
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
        <h4>
            <@spring.message "i18n.topic.info.inProgress" />
        </h4>
        <ul>
        <#list owner.ownedPlans as plan>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

                <div class="ts">
                    <a href="/group/plans/${plan.id}">
                        <@utilGadgets.showTimeRemaining plan.timeRemaining />
                    </a>
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
        <h4>
            <@spring.message "i18n.topic.info.archived" />
        </h4>
        <ul>
        <#list owner.archivedPlans as plan>
            <li>
                <div class="topic-title-icon">
                    ${plan.topic.title}
                </div>

                <div class="ts">
                    <a href="/group/plans/${plan.id}">
                        ${plan.createTime?date} - ${plan.endTime?date}
                    </a>
                </div>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>


