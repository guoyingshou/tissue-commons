<#import 'spring.ftl' as spring />

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
        <div class="message">
             Are you sure that you really want to delete the selected item?
        </div>
        <div>
            <input type="submit" name="ok" value="Yes" />
        </div>
    </form>
</#macro>

<#macro signupForm>
    <div class="input-form account">
        <form id="signupForm" action="<@spring.url '/signup' />" method="post">
            <legend>
                <@spring.message "i18n.user.signup.legend" />
            </legend>

            <ul>
                <li>
                    <label for="username">
                        <@spring.message "i18n.user.signup.label.username" />
                        <span class="error-empty" style="display: none">
                            <@spring.message "i18n.user.signup.error.empty" />
                        </span>
                        <span class="error-username-taken" style="display: none">
                            <@spring.message "i18n.user.signup.error.userExist" />
                        </span>
                    </label>
                    <input type="text" class="sum" id="username" name="username" value="" />
                </li>

                <li>
                    <label for="password">
                        <@spring.message "i18n.user.signup.label.password" />
                        <span class="error-password-invalid" style="display: none">
                            <@spring.message "i18n.user.signup.error.passwordLength" />
                        </span>
                    </label>
                    <input type="password" class="sum" id="password" name="password" value="" />
                </li>

                <li>
                    <label for="confirm">
                        <@spring.message "i18n.user.signup.label.confirm" />
                        <span class="error-confirm-mismatch" style="display: none">
                            <@spring.message "i18n.user.signup.error.passwordMismatch" />
                        </span>
                    </label>
                    <input type="password" class="sum" id="confirm" name="confirm" value="" />
                </li>

                <li>
                    <label for="email">
                        <@spring.message "i18n.user.signup.label.email" />
                        <span class="error-empty" style="display: none">
                            <@spring.message "i18n.user.signup.error.empty" />
                        </span>
                        <span class="error-email-format" style="display: none">
                            <@spring.message "i18n.user.signup.error.emailFormat" />
                        </span>
                        <span class="error-email-taken" style="display: none">
                            <@spring.message "i18n.user.signup.error.emailExist" />
                        </span>
                    </label>
                    <input type="text" class="sum" id="email" name="email" value="" />
                </li>

                <li>
                    <label for="displayName">
                        <@spring.message "i18n.user.signup.label.displayName" />
                        <span class="error-empty" style="display: none">
                            <@spring.message "i18n.user.signup.error.empty" />
                        </span>
                    </label>
                    <input type="text" class="sum" id="displayName" name="displayName" value="" />
                </li>

                <li>
                    <label for="headline">
                        <@spring.message "i18n.user.signup.label.headline" />
                        <span class="error-empty" style="display: none">
                            <@spring.message "i18n.user.signup.error.empty" />
                        </span>
                    </label>
                    <textarea class="sum" id="headline" name="headline">Engineer, XX company</textarea>
                </li>

                <li>
                    <input type="submit" value='<@spring.message "i18n.user.signup.submit" />' />
                </li>
            </ul>
        </form>
        <script type="text/javascript">

            $('input[type="submit"]').on('click', function(e) {
                e.preventDefault();
                $('input[type="submit"]').attr("disabled", true);
                $(this).validate();
                $('input[type="submit"]').removeAttr("disabled");
            });

            $(document).on('focusin keyup', '#username', function(e) {
                $(this).checkUsernameEmpty();
            });

            $(document).on('focusout', '#username', function(e) {
                $(this).checkUsernameTaken();
            });

            $(document).on('focusin keyup', '#password', function(e) {
                $(this).checkPassword();
            });

            $(document).on('focusin keyup', '#confirm', function(e) {
                $(this).checkPassword();
            });

            $(document).on('focusin keyup', '#email', function(e) {
                $(this).checkEmailFormat();
            });

            $(document).on('focusout', '#email', function(e) {
                $(this).checkEmailTaken();
            });

            $(document).on('focusin keyup', '#displayName', function(e) {
                $(this).checkDisplayNameEmpty();
            });

            $(document).one('focusin', '#headline', function(e) {
                $(this).val('');
                $(this).checkHeadlineEmpty();
            });

            $(document).on('keyup', '#headline', function(e) {
                $(this).checkHeadlineEmpty();
            });

        </script>
    </div>
</#macro>

<#macro signinForm>
<div id="signinForm" class="input-form account">
    <form action="<@spring.url '/jsc'/>" method="post">
        <legend>
            <@spring.message "i18n.user.signin.legend" />
            <#if error??>
                <span>
                    <@spring.message "i18n.user.signin.error" />
                </span>
            </#if>
        </legend>
        <ul>
            <li>
                <label for="username"><@spring.message "i18n.user.signin.label.username" /></label>
                <input type="text" class="sum" id="username" name="j_username" size="20" maxlength="50" />
            </li>
            <li>
                <label for="password"><@spring.message "i18n.user.signin.label.password" /></label>
                <input type="password" class="sum" id="password" name="j_password" size="20" maxlength="50" />
            </li>
            <li>
                <input type="submit" value='<@spring.message "i18n.user.signin.submit" />'/>
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
    <#if viewer??>
    <ul class="action">
        <li>
            <a class="topicForm" href="#">
                <@spring.message "i18n.explore.action.createTopic" />
            </a>
        </li>
        <li>
            <div id="topicForm" class="dialog pop-650" style="display: none">
                <form action="<@spring.url '/topics' />" method="post">
                    <legend>
                        Your Topic
                        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
                    </legend>
                    <ul>
                        <li>
                            <label for="title">
                                title
                                <span class="error-empty" style="display: none">cann't by empty</span>
                            </label>
                            <input type="input" class="sum" id="title" name="title" />
                        </li>
                        <li>
                            <label for="editor">
                                Objective
                                <span class="error-empty" style="display: none">cann't by empty</span>
                            </label>
                            <textarea class="sum" id="editor" name="content"></textarea>
                        </li>
                        <li>
                            <label for="tags">
                                tags
                                <span class="error-empty" style="display: none">cann't by empty</span>
                            </label>
                            <input type="input" class="sum" id="tags" name="tags" />
                        </li>
                        <li>
                            <input type="submit" value="submit" />
                            <span class="tips"> All fields are required </span>
                        </li>
                    </ul>
                </form>
            </div>
        </li>
        <li>
                <script type="text/javascript">
                    $(document).on('click', 'a.topicForm', function(e) {
                        e.preventDefault();
                        $('#contentInner').newTopicDialog();
                    });
                </script>
 
        </li>
    </ul>
    </#if>
</#macro>

<#macro topicEditForm>
    <div id="topicEditForm" class="dialog pop-650" style="display: none">
        <form>
            <legend>
                Edit Topic Objective 
                <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
            </legend>
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
    <div class="input-form">
        <form id="post-form" method="post" action="<@spring.url '/plans/${topic.activePlan.id}/posts'/>">
            <fieldset class="post-type">
                <legend>
                    Type
                    <span class="type-error-info" style="display: none">
                        Please select a type
                    </span>
                </legend>

                <label>Concept <input type="radio" name="type" value="concept" /></label>
                <label>Note <input type="radio" name="type" value="note" /></label>
                <label>Question <input type="radio" name="type" value="question" /></label>
                <label>Tutorial <input type="radio" name="type" value="tutorial" /></label>
            </fieldset>

            <fieldset>
                <legend>Your Post</legend>
                <ul>
                    <li>
                        <label for="title">
                            title 
                            <span class="title-error-info" style="display: none">
                                Title cann't by empty
                            </span>
                        </label>
                        <input type="input" class="sum" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">
                            content
                            <span class="content-error-info" style="display: none">
                                Content cann't by empty
                            </span>
                         </label>
                        <textarea id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
            </fieldset>
        </form>
    <script type="text/javascript">
        CKEDITOR.replace("editor");

        $(document).on('submit', 'form#post-form', function(e) {
            e.preventDefault();

            var ftype = true;
            var ftitle = true;
            var fcontent = true;

            if($('input[name="type"]').is(':checked')) {
                $('span.type-error-info').hide();
                ftype = true;

            }
            else {
                $('span.type-error-info').show();
                ftype = false;
            }

            if($('#title').val() == "") {
                $('span.title-error-info').show();
                ftitle = false;
            }
            else {
                $('span.title-error-info').hide();
                ftitle = true;
            }

            var content = CKEDITOR.instances.editor.getData();

            if(content == "") {
                $('span.content-error-info').show();
                fcontent = false;
            }
            else {
                $('span.content-error-info').hide();
                fcontent = true;
            }

            if(ftype && ftitle && fcontent) {
                this.submit();
            }

        });
    </script>

     </div>
</#macro>

<#macro postEditForm>
    <div id="postEditForm" class="dialog pop-650" style="display: none">
        <form method="post">
                <legend>Your post 
                    <span class="op-error-info" style="display: none">Error</span>
                    <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
                </legend>
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
        </form>
    </div>

    <#--
      An anchor with class of 'post-edit' anywhere in a page can trigger the 
      display of the form therein the relavent action.
      -->
        <script type="text/javascript">
            $(document).on('click', 'a.post-edit', function(e) {
                e.preventDefault();
                var options = {
                    type: "${post.type}",
                    url: $(this).data("action")
                };

                $(this).closest('div').editPostDialog(options);
            });

        </script>

</#macro>

<#macro messageForm>
    <@oneItemForm />
    <@confirmForm />

        <script type="text/javascript">
            $(document).on('click', 'a.msg-add', function(e) {
                e.preventDefault();
                $('ul.messages').oneItemDialog($(this).data("action"));
            });


            $(document).on('click', 'a.msg-comment-add', function(e) {
                e.preventDefault();

                var id = $(this).data("id");
                var url = "<@spring.url '/messages/' />" + id + "/comments";

                var selector = "ul.message-comments-" + id;
                var target = $(selector);
                if(target.length == 0) {
                    target = $('<ul class="' + selector + '"/>'); 
                }
                target.oneItemDialog(url);
            });

            $(document).on('click', 'a.one-item-edit', function(e) {
                e.preventDefault();
                $(this).prev().oneItemDialog($(this).data("action"));
            });

            $(document).on('click', 'a.del', function(e) {
                e.preventDefault();
                $(this).delDialog();
            });
        </script>
</#macro>
