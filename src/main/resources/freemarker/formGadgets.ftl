<#import 'spring.ftl' as spring />

<#macro signupForm>
    <div id="signupForm" class="dialog pop-normal" style="display: none">
        <form action="<@spring.url '/signup' />" method="post">
            <fieldset> 
                <legend>Create your free personal account</legend>
                <ul>
                    <li>
                        <label for="username">Username</label>
                        <input type="input" id="username" name="username" value="" />
                        <#--
                        <@spring.formInput path="account.username" attributes="id='username' class='ac'" />
                        <p><@spring.showErrors "" /></p>
                        -->
                    </li>

                    <li>
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" value="" />
                        <#--
                        <@spring.formPasswordInput path="account.password" attributes="id='password' class='ac'" />
                        <p><@spring.showErrors "" /></p>
                        -->
                    </li>

                    <li>
                        <label for="confirm">Confirm Password</label>
                        <input type="password" id="confirm" name="confirm" value="" />

                        <#--
                        <@spring.formPasswordInput path="account.confirm" attributes="id='confirm' class='ac'" />
                        <p><@spring.showErrors "" /></p>
                        -->
                    </li>

                    <li>
                        <label for="displayName">DisplayName</label>
                        <input type="input" id="displayName" name="displayName" value="" />
                        <#--
                        <@spring.formInput path="account.displayName" attributes="id='displayName' class='ac'" />
                        <p><@spring.showErrors "" /></p>
                        -->
                    </li>

                    <li>
                        <label for="headline">Headline</label>
                        <textarea id="headline" name="headline"></textarea>
                        <#--
                        <p><@spring.showErrors "" /></p>
                        -->
                    </li>


                    <li>
                        <label for="email">Email</label>
                        <input type="input" id="email" name="email" value="" />
                        <#--
                        <@spring.formInput path="account.email" attributes="id='email' class='ac'" />
                        <p><@spring.showErrors "" /></p>
                        -->
                    </li>

                    <li>
                        <input type="submit" value="create an account" />
                    </li>
                </ul>
                <a class="cancel" href="#">cancel</a>
            </fieldset>
        </form>
    </div>
</#macro>

<#macro signinForm>
<div id="signinForm">
    <form action="<@spring.url '/jsc'/>" method="post">
        <legend>Sign In</legend>
        <ul>
            <li>
                <label for="username">User Name</label>
                <input type="text" id="username" name="j_username" size="20" maxlength="50" />
            </li>
            <li>
                <label for="password">Password</label>
                <input type="password" id="password" name="j_password" size="20" maxlength="50" />
            </li>
            <li>
                <input type="submit" value="Login"/>
            </li>
        </ul>
    </form>
</div>
</#macro>

<#macro editProfileForm>
    <div id="editProfileForm" class="dialog pop-normal" style="display: none">
        <form action="<@spring.url '/users/${viewer.id}' />" method="post">
            <fieldset> 
                <legend>Update profile</legend>
                <ul>
                    <li>
                        <label for="displayName">DisplayName</label>
                        <input type="input" id="displayName" name="displayName" value="${viewer.displayName}" />
                    </li>

                    <li>
                        <label for="headline">Headline</label>
                        <textarea id="headline" name="headline">${viewer.headline!""}</textarea>
                    </li>

                    <li>
                        <label for="email">Email</label>
                        <input type="input" id="email" name="email" value="${viewer.email}" />
                    </li>

                    <li>
                        <input type="submit" value="save" />
                    </li>
                </ul>
                <a class="cancel" href="#">cancel</a>
            </fieldset>
        </form>
    </div>
</#macro>

<#macro changePassForm>
<div id="changePassForm" class="dialog pop-normal" style="display: none">
    <form action="<@spring.url '/users/${viewer.id}/pass'/>" method="post">
        <legend>Change Password</legend>
        <ul>
            <li>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="" />
            </li>

            <li>
                <label for="confirm">Confirm Password</label>
                <input type="password" id="confirm" name="confirm" value="" />
            </li>

            <li>
                <input type="submit" value="Change"/>
            </li>
        </ul>
        <a class="cancel" href="#">cancel</a>
    </form>
</div>
</#macro>

<#macro inviteForm>
    <div id="inviteForm" class="dialog pop-normal" style="display: none">
        <form>
            <ul>
                <li>
                    <label for="letter">invitation letter</label>
                </li>
                <li>
                    <textarea id="letter" name="content"></textarea></p>
                </li>
                <li>
                    <input type="submit" name="submit" value="submit" />
                </li>
            </ul>
        </form>
        <a href="#" class="cancel">cancel</a>
    </div>
</#macro>

<#macro topicForm>
    <div id="topicForm" class="dialog pop-normal" style="display: none">
        <form action="<@spring.url '/topics' />" method="post">
            <fieldset>
                <legend>Your Topic</legend>
                <ul>
                    <li>
                        <label for="title">title</label>
                        <input type="input" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">Objective</label>
                        <textarea id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <label for="tags">tags</label>
                        <input type="input" id="tags" name="tags" />
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
            </fieldset>
        </form>
        <a href="#" class="cancel">cancel</a>
    </div>
</#macro>

<#macro topicEditForm>
    <div id="topicEditForm" class="dialog pop-normal" style="display: none">
        <form>
            <ul>
                <li>
                    <textarea id="editor" name="content"></textarea>
                </li>
                <li>
                    <input id="tags" type="input" name="tags" />
                </li>
                <li>
                    <input type="submit" value="submit"/>
                </li>
            </ul>
        </form>
        <div>
            <a href="#" class="cancel">cancel</a>
        </div>
    </div>
</#macro>

<#macro planForm>
    <div id="planForm" class="dialog pop-medium" style="display: none">
        <form action="<@spring.url '/topics/${topic.id}/plans' />" method="post">
            <fieldset>
                <legend>Please Select A Duration</legend>
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
            </fieldset>
            <input type="submit" value="submit" />
        </form>
        <div><a href="#" class="cancel">cancel</a></div>
    </div>
</#macro>

<#macro postForm>
    <div id="postForm" class="dialog pop-normal" style="display: none">
        <form method="post" action="<@spring.url '/plans/${plan.id}/posts'/>">
            <fieldset>
                <legend>Post Type</legend>
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
            </fieldset>
        </form>
        <div><a href="#" class="cancel">cancel</a></div>
    </div>
</#macro>

<#macro postEditForm>
    <div id="postEditForm" class="dialog pop-normal" style="display: none">
        <form method="post">
            <fieldset>
                <legend>Your Post</legend>
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
            </fieldset>
        </form>
        <div><a href="#" class="cancel">cancel</a></div>
    </div>
</#macro>

<#macro oneItemForm>
    <div id="oneItemForm" class="dialog pop-normal" style="display: none">
        <form>
            <ul>
                <li>
                    <textarea id="editor" name="content"></textarea>
                </li>
                <li>
                    <input type="submit" value="submit"/>
                </li>
            </ul>
        </form>
        <a href="#" class="cancel">cancel</a>
    </div>
</#macro>

<#macro confirmForm>
    <form id="confirmForm" class="dialog pop-small" style="display:none">
        <div>
            <input type="submit" name="ok" value="OK" />
            <input type="submit" name="cancel" value="Cancel" />
        </div>
    </form>
</#macro>
