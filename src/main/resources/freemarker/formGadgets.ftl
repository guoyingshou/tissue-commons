<#import 'spring.ftl' as spring />

<#macro signupForm>
    <div id="signupForm" class="account">
        <form action="<@spring.url '/signup' />" method="post">
            <legend>
                <@spring.message "i18n.common.signup.legend" />
            </legend>

            <ul>
                <li>
                    <label for="username">
                        <@spring.message "i18n.common.signup.label.username" />
                        <span class="empty" style="display: none">Cann't by empty</span>
                        <span class="taken" style="display: none">Username been taken</span>
                    </label>
                    <input type="text" class="sum" data-v="0" id="username" name="username" value="" />
                </li>

                <li>
                    <label for="password">
                        <@spring.message "i18n.common.signup.label.password" />
                        <span class="empty" style="display: none">Cann't by empty</span>
                        <span class="short" style="display: none">Password too short</span>
                    </label>
                    <input type="password" class="sum" data-v="0" id="password" name="password" value="" />
                </li>

                <li>
                    <label for="confirm">
                        <@spring.message "i18n.common.signup.label.confirm" />
                        <span class="mismatch" style="display: none">Password mis-match</span>
                    </label>
                    <input type="password" class="sum" data-v="0" id="confirm" name="confirm" value="" />
                </li>

                <li>
                    <label for="email">
                        <@spring.message "i18n.common.signup.label.email" />
                        <span class="empty" style="display: none">Cann't by empty</span>
                        <span class="taken" style="display: none">Email is already taken</span>
                    </label>
                    <input type="text" class="sum" data-v="0" id="email" name="email" value="" />
                </li>

                <li>
                    <label for="displayName">
                        <@spring.message "i18n.common.signup.label.displayName" />
                        <span class="empty" style="display: none">Cann't by empty</span>
                    </label>
                    <input type="text" class="sum" data-v="0" id="displayName" name="displayName" value="" />
                </li>

                <li>
                    <label for="headline">
                        <@spring.message "i18n.common.signup.label.headline" />
                        <span class="empty" style="display: none">Cann't by empty</span>
                    </label>
                    <textarea class="sum" data-v="0" id="headline" name="headline">Engineer, XX company</textarea>
                </li>

                <li>
                    <input type="submit" disabled="true" value='<@spring.message "i18n.common.signup.submit" />' />
                </li>
            </ul>
        </form>
        <script type="text/javascript">

            $('form .sum').one('keydown', function(e) {
                $(this).val("");
            });

            $('form .sum').on('keyup focusout', function(e) {
                $(this).checkEmpty();
            });

            $('#username').on('focusout', function(e) {
                $(this).checkUsernameTaken();
            });

            $('#password').on('keyup', function(e) {
                $(this).checkLength();
            });

            $('#confirm').on('keyup', function(e) {
                $(this).checkMatch();
            });

            $('#email').on('focusout', function(e) {
                $(this).checkEmailTaken();
            });

        </script>
    </div>
</#macro>

<#macro signinForm>
<div id="signinForm" class="account">
    <form action="<@spring.url '/jsc'/>" method="post">
        <legend>
            <@spring.message "i18n.common.signin.legend" />
        </legend>
        <ul>
            <li>
                <#if error??>
                    <@spring.message "i18n.common.signin.error" />
                </#if>
            </li>
            <li>
                <label for="username"><@spring.message "i18n.common.signin.label.username" /></label>
                <input type="text" class="sum" id="username" name="j_username" size="20" maxlength="50" />
            </li>
            <li>
                <label for="password"><@spring.message "i18n.common.signin.label.password" /></label>
                <input type="password" class="sum" id="password" name="j_password" size="20" maxlength="50" />
            </li>
            <li>
                <input type="submit" value='<@spring.message "i18n.common.signin.submit" />'/>
            </li>
        </ul>
    </form>
</div>
</#macro>

<#macro editProfileForm>
    <div id="editProfileForm" class="dialog pop-420" style="display: none">
        <form action="<@spring.url '/users/${viewer.id}' />" method="post">
            <legend>Edit profile <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
            <ul>
                    <li>
                        <label for="displayName">DisplayName</label>
                        <input type="input" class="sum" id="displayName" name="displayName" value="${viewer.displayName}" />
                    </li>

                    <li>
                        <label for="headline">Headline</label>
                        <textarea class="sum" id="headline" name="headline">${viewer.headline!""}</textarea>
                    </li>

                    <li>
                        <label for="email">Email</label>
                        <input class="sum" type="input" id="email" name="email" value="${viewer.email}" />
                    </li>

                    <li>
                        <input type="submit" value="save" />
                    </li>
            </ul>
        </form>
    </div>
</#macro>

<#macro changePassForm>
<div id="changePassForm" class="dialog pop-420" style="display: none">
    <form action="<@spring.url '/users/${viewer.id}/pass'/>" method="post">
        <legend>Change password <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
        <ul>
            <li>
                <label for="password">Password</label>
                <input type="password" class="sum" id="password" name="password" value="" />
            </li>

            <li>
                <label for="confirm">Confirm Password</label>
                <input type="password" class="sum" id="confirm" name="confirm" value="" />
            </li>

            <li>
                <input type="submit" value="Change"/>
            </li>
        </ul>
    </form>
</div>
</#macro>

<#macro inviteForm>
    <div id="inviteForm" class="dialog pop-420" style="display: none">
        <form>
            <legend>Invite <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
            <ul>
                <li>
                    <label for="letter">invitation letter</label>
                </li>
                <li>
                    <textarea class="sum" id="letter" name="content"></textarea></p>
                </li>
                <li>
                    <input type="submit" name="submit" value="submit" />
                </li>
            </ul>
        </form>
    </div>
</#macro>

<#macro topicForm>
    <div id="topicForm" class="dialog pop-650" style="display: none">
        <form action="<@spring.url '/topics' />" method="post">
                <legend>Your Topic<a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
                <ul>
                    <li>
                        <label for="title">title</label>
                        <input type="input" class="sum" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">Objective</label>
                        <textarea class="sum" id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <label for="tags">tags</label>
                        <input type="input" class="sum" id="tags" name="tags" />
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
        </form>
    </div>
</#macro>

<#macro topicEditForm>
    <div id="topicEditForm" class="dialog pop-650" style="display: none">
        <form>
            <legend>Edit Topic Objective <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
            <ul>
                <li>
                    <textarea id="editor" name="content"></textarea>
                </li>
                <li>
                    <input class="sum" id="tags" type="input" name="tags" />
                </li>
                <li>
                    <input type="submit" value="submit"/>
                </li>
            </ul>
        </form>
    </div>
</#macro>

<#macro planForm>
    <div id="planForm" class="dialog pop-320" style="display: none">
        <form action="<@spring.url '/topics/${topic.id}/plans' />" method="post">
                <legend>Please select a duration <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
                <ul>
                    <li>
                        <label><input type="radio" name="duration" value="1" />1 Mon</label>
                    </li>
                    <li>
                        <label><input type="radio" name="duration" value="3" />3 Mon</label>
                    </li>
                    <li>
                        <label><input type="radio" name="duration" value="6" />6 Mon</label>
                    </li>
                </ul>
            <input type="submit" value="submit" />
        </form>
    </div>
</#macro>

<#macro postForm>
    <div id="postForm" class="dialog pop-650" style="display: none">
        <form method="post" action="<@spring.url '/plans/${plan.id}/posts'/>">
            <fieldset class="post-type">
                <legend>Type <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
                <label>Concept <input type="radio" name="type" value="concept" /></label>
                <label>Note <input type="radio" name="type" value="note" /></label>
                <label>Question <input type="radio" name="type" value="question" /></label>
                <label>Tutorial <input type="radio" name="type" value="tutorial" /></label>
            </fieldset>

            <fieldset>
                <legend>Your Post</legend>
                <ul>
                    <li>
                        <label for="title">title</label>
                        <input type="input" class="sum" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">content</label>
                        <textarea id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
            </fieldset>
        </form>
    </div>
</#macro>

<#macro postEditForm>
    <div id="postEditForm" class="dialog pop-650" style="display: none">
        <form method="post">
                <legend>Your post <a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
                <ul>
                    <li>
                        <label for="title">title</label>
                        <input type="input" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">content</label>
                        <textarea id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
        </form>
    </div>
</#macro>

<#macro oneItemForm>
    <div id="oneItemForm" class="dialog pop-650" style="display: none">
        <form>
            <legend><a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
            <ul>
                <li>
                    <textarea id="editor" name="content"></textarea>
                </li>
                <li>
                    <input type="submit" value="submit"/>
                </li>
            </ul>
        </form>
    </div>
</#macro>

<#macro confirmForm>
    <form id="confirmForm" class="dialog pop-320" style="display:none">
        <legend>confirm<a href="#" class="cancel"><span data-icon="&#xe008"></span></a></legend>
        <div>
            <input type="submit" name="ok" value="OK" />
            <input type="submit" name="cancel" value="Cancel" />
        </div>
    </form>
</#macro>
