<#import 'spring.ftl' as spring />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro postForm>
    <div id="post-form">
        <form method="post" action="<@spring.url '/plans/${topic.activePlan.id}/posts'/>">
            <fieldset class="post-type">
                <legend>
                    <@spring.message 'i18n.topic.post.type' />
                    <span style="display: none">
                        <@spring.message 'i18n.error.postTypeNotSelect' />
                    </span>
                </legend>

                <label>
                    <@spring.message 'i18n.topic.post.concept' />
                    <input type="radio" name="type" value="concept" />
                </label>
                <label>
                    <@spring.message 'i18n.topic.post.note' />
                    <input type="radio" name="type" value="note" />
                </label>
                <label>
                    <@spring.message 'i18n.topic.post.question' />
                    <input type="radio" name="type" value="question" />
                </label>
                <label>
                    <@spring.message 'i18n.topic.post.tutorial' />
                    <input type="radio" name="type" value="tutorial" />
                </label>
            </fieldset>

            <fieldset>
                <legend>
                    <@spring.message "i18n.topic.post" />
                </legend>
                <ul>
                    <li>
                        <label for="title">
                            <@spring.message "i18n.topic.post.title" />
                            <span style="display: none">
                                <@spring.message "i18n.error.empty" />
                            </span>
                        </label>
                        <input type="input" class="sum" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">
                            <@spring.message "i18n.topic.post.content" />
                            <span style="display: none">
                                <@spring.message "i18n.error.empty" />
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
            $('form', '#post-form').on('submit', function(e) {
                return $(this).post();
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
                        <label for="title">
                            title
                            <span style="display:none">cann't be empty</span>
                        </label>
                        <input type="input" class="sum" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">
                            content
                            <span style="display:none">cann't be empty</span>
                        </label>
                        <textarea id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
        </form>
    </div>

    <script type="text/javascript">
        $(document).on('click', 'a.post-edit', function(e) {
            e.preventDefault();
            $(this).editPostDialog();
        });
    </script>
</#macro>

<#macro messageAddEditForm>
    <@tissue.oneItemForm />
    <@tissue.confirmForm />

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

<#macro commentAnswerAddEditForm>
    <@tissue.oneItemForm />
    <@tissue.confirmForm />
    <script type="text/javascript">

            $(document).on('click', 'a.question-comment-add', function(e) {
                e.preventDefault();
            
                var url = $(this).data("action");
                $('ul.question-comments').oneItemDialog(url);
            });
 
            $(document).on('click', 'a.answer-add', function(e) {
                e.preventDefault();
                $('ul.answers').oneItemDialog($(this).data("action"));
            });

            $(document).on('click', 'a.answer-comment-add', function(e) {
                e.preventDefault();

                var id = $(this).data("id");
                var url = "<@spring.url '/answers/' />" + id + "/comments";

                var selector = "ul.answer-comments-" + id;
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

<#macro showPosts posts>
<ul id="posts">
   <#list posts as post>
       <li class="container-has-icon">
           <div class="icon">
           <#if post.type == 'concept'>
               <span data-icon="&#xe007;"></span>
           <#elseif post.type = 'note'>
               <span data-icon="&#xe008;"></span>
           <#elseif post.type = 'question'>
               <span data-icon="&#xe009;"></span>
           <#else>
               <span data-icon="&#xe01c;"></span>
           </#if>
           </div>

           <div class="ts has-icon-before">
               <a href="/social/users/${post.user.id}/posts">${post.user.displayName}</a>
               [ <@utilGadgets.showTimeBefore post.timeBefore /> ]
           </div>
           <div class="title has-icon-before">
               <a href="/group/posts/${post.id}" class="post">${post.title}</a>
           </div>
       </li>
   </#list>
</ul>
</#macro>

<#macro showPostDetail>
    <div>
        <div class="ts">
            <a href="/social/users/${post.user.id}/posts">
                ${post.user.displayName} 
            </a>
            [ <@utilGadgets.showTimeBefore post.timeBefore /> ]
        </div>

        <h3 class="title">${post.title}</h3>
        <div class="content">${post.content}</div>

        <#if viewer?? && post.plan.isActive()>
            <#if post.isOwner(viewer.id)>
                <a class="post-edit" data-type="${post.type}" data-action="<@spring.url '/posts/${post.id}/update' />" href="#">
                    edit
                </a>
            </#if>
            <#if post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id)>
                <a class="msg-add" data-action="<@spring.url '/posts/${post.id}/messages' />" href="#">
                    add message
                </a>
            </#if>
        </#if>
    </div>

    <ul class="messages">
    <#if post.messages??>
        <#list post.messages as msg>
        <li class="message-item">

            <div class="ts">
                <a href="/social/users/${msg.user.id}/posts">
                    ${msg.user.displayName}  
                </a>
                [ <@utilGadgets.showTimeBefore msg.timeBefore /> ]
            </div>

            <div class="content">${msg.content}</div>

            <#if viewer?? && post.plan.isActive()>
                <#if msg.isOwner(viewer.id)>
                    <a class="one-item-edit" data-action="<@spring.url '/messages/${msg.id}' />" href="#">
                        edit
                    </a>
                    <a class="del" data-action="<@spring.url '/messages/${msg.id}/delete' />" href="#">
                        delete
                    </a>
                </#if>
                <#if post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id)>
                    <a class="msg-comment-add" data-id="${msg.id}" href="#">comment</a>
                </#if>
            </#if>

            <ul class="message-comments-${msg.id}">
            <#if msg.comments??>
            <#list msg.comments as comment>
                <li class="message-comment-item">
                    <div class="ts"> 
                        <a href="/social/users/${comment.user.id}/posts">
                            ${comment.user.displayName} 
                        </a>
                        [ <@utilGadgets.showTimeBefore comment.timeBefore /> ]
                    </div>

                    <div class="content">${comment.content}</div>

                    <#if viewer?? && post.plan.isActive() && comment.isOwner(viewer.id)>
                        <a class="one-item-edit" data-action="<@spring.url '/messageComments/${comment.id}' />" href="#">
                            edit
                        </a>
                        <a class="del" data-action="<@spring.url '/messageComments/${comment.id}/delete' />" href="#">
                            delete
                        </a>
                    </#if>
                </li>
            </#list>
            </#if>
            </ul>
        </li>
        </#list>
        </#if>
    </ul>

    <#if viewer?? && post.plan.isActive() && (post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id))>
        <@postEditForm />
        <@messageAddEditForm />
    </#if>
</#macro>

<#macro showQuestionDetail>
    <div class="question">
        <div class="ts">
            ${post.user.displayName} 
            [ <@utilGadgets.showTimeBefore post.timeBefore /> ]
        </div>

        <h3 class="title">${post.title}</h3>
        <div class="content">${post.content}</div>

        <#if viewer?? && post.plan.isActive()>
            <#if post.isOwner(viewer.id)>
                <a class="post-edit" data-action="<@spring.url '/posts/${post.id}' />" href="#">
                    edit
                </a>
            </#if>
            <#if post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id)>
                <a class="question-comment-add" data-action="<@spring.url '/posts/${post.id}/questionComments' />" href="#">
                    comment
                </a>
                <a class="answer-add" data-action="<@spring.url '/posts/${post.id}/answers' />" href="#">
                    add answer
                </a>
            </#if>
        </#if>
    </div>

    <ul class="question-comments">
        <#if post.comments??>
        <#list post.comments as questionComment>
        <li>
            <div class="ts">
                ${questionComment.user.displayName} 
                [ <@utilGadgets.showTimeBefore questionComment.timeBefore /> ]
            </div>

            <div class="content">${questionComment.content}</div>

            <#if viewer?? && post.plan.isActive() && questionComment.isOwner(viewer.id)>
                <a class="one-item-edit" data-action="<@spring.url '/questionComments/${questionComment.id}' />" href="#">
                    edit
                </a>
                <a class="del" data-action="<@spring.url '/questionComments/${questionComment.id}/delete' />" href="#">
                    delete
                </a>
            </#if>
        </li>
        </#list>
        </#if>
    </ul>

    <ul class="answers">
    <#if post.answers??>
        <#list post.answers as answer>
        <li class="answer-item">

            <div class="ts">
                ${answer.user.displayName} 
                [ <@utilGadgets.showTimeBefore answer.timeBefore /> ]
            </div>

            <div class="content">${answer.content}</div>

            <#if viewer?? && post.plan.isActive()>
                <#if answer.isOwner(viewer.id)>
                    <a class="one-item-edit" data-action="<@spring.url '/answers/${answer.id}' />" href="#">
                        edit
                    </a>
                    <a class="del" data-action="<@spring.url '/answers/${answer.id}/delete' />" href="#">
                        delete
                    </a>
                </#if>
                <#if post.plan.isOwner(viewer.di) || post.plan.isMember(viewer.id)>
                    <a class="answer-comment-add" data-id="${answer.id}" href="#">
                        comment
                    </a>
                </#if>
            </#if>

            <ul class="answer-comments-${answer.id}">
            <#if answer.comments??>
            <#list answer.comments as comment>
                <li class="answer-comment-item">
                    <div class="ts">
                        ${comment.user.displayName} 
                        [ <@utilGadgets.showTimeBefore comment.timeBefore /> ]
                    </div>

                    <div class="conent">${comment.content}</div>

                    <#if viewer?? && post.plan.isActive() && comment.isOwner(viewer.id)>
                        <a class="one-item-edit" data-action="<@spring.url '/answerComments/${comment.id}' />" href="#">
                            edit
                        </a>
                        <a class="del" data-action="<@spring.url '/answerComments/${comment.id}/delete' />" href="#">
                            delete
                        </a>
                    </#if>
                </li>
            </#list>
            </#if>
            </ul>
        </li>
        </#list>
        </#if>
    </ul>

    <#if viewer?? && post.plan.isActive() && (post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id))>
        <@postEditForm />
        <@commentAnswerAddEditForm />
    </#if>
</#macro>


