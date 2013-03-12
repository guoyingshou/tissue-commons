<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro postForm>
<@spring.bind "post.*" />
<form id="createPostForm" method="post" action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/_create'/>">
    <div class="error">
        <@spring.showErrors "<br>" />
        <span style="display: none">
            <@spring.message 'NotNull.postForm.type' />
        </span>
    </div>
    <fieldset class="post-type">
        <legend>
            <@spring.message 'Legend.postForm.type' />
        </legend>

        <label>
            <@spring.message 'Label.postForm.concept' />
            <input type="radio" name="type" value="concept" />
        </label>
        <label>
            <@spring.message 'Label.postForm.note' />
            <input type="radio" name="type" value="note" />
        </label>
        <label>
            <@spring.message 'Label.postForm.tutorial' />
            <input type="radio" name="type" value="tutorial" />
        </label>
    </fieldset>

    <fieldset>
        <legend>
            <@spring.message "Legend.postForm" />
        </legend>

        <ul>
            <li>
                <label for="title">
                    <@spring.message "Label.postForm.title" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.postForm.title' />
                    </span>
                </label>

                <@spring.formInput "post.title" 'class="sum"' />
            </li>
            <li>
                <label for="content">
                    <@spring.message "Label.postForm.content" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.postForm.content' />
                    </span>
                </label>
                <@spring.formTextarea "post.content" 'class="sum"' />
            </li>
            <li>
                <input type="submit" value="<@spring.message 'Publish.button'/>" />
            </li>
        </ul>
    </fieldset>
</form>
<script type="text/javascript">
    CKEDITOR.replace("content", {
        filebrowserUploadUrl: '/media/images/_create' 
    });
</script>
</#macro>

<#macro updatePostForm>
    <form id="updatePostForm" class="dialog pop-650" style="display:none" method="post">
        <legend>
            <@spring.message "Legend.postForm" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="title">
                    <@spring.message "Label.postForm.title" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.postForm.title' />
                    </span>
                 </label>
                <input type="input" class="sum" id="title" name="title" />
            </li>
            <li>
                <label for="content">
                    <@spring.message "Label.postForm.content" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.postForm.content' />
                    </span>
                 </label>
                <textarea id="content" name="content"></textarea>
            </li>
            <li>
                <input type="submit" value="<@spring.message 'Submit.button' />" />
            </li>
        </ul>
    </form>
</#macro>

<#macro postMessageForm>
<form id="postMessageForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Message
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro postMessageCommentForm>
<form id="postMessageCommentForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Message comment
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>


<#--
<#macro questionCommentForm>
<form id="questionCommentForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Question Comment
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro answerForm>
<form id="answerForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Answer
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro answerCommentForm>
<form id="answerCommentForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Answer comment
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>
-->

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
           <a href="/social/users/${post.account.user.id?replace("#", "")}/posts">${post.account.user.displayName}</a>
           [ <@commonGadgets.showTimeBefore post.timeBefore /> ]
       </div>
       <div class="title has-icon-before">
           <a href="/group/topics/${post.plan.topic.id?replace("#", "")}/posts/${post.id?replace("#","")}" class="post">${post.title}</a>
       </div>
   </li>
   </#list>
</ul>
</#macro>

<#macro showPostDetail>
<div class="post">
    <div class="item-ts">
        <a href="/social/users/${post.account.user.id?replace("#", "")}/posts">
            ${post.account.user.displayName} 
        </a>
        [ <@commonGadgets.showTimeBefore post.timeBefore /> ] 
    </div>

    <h3 class="item-title">
        ${post.title}
        <#if post.deleted>
           <span>[ closed ]</span>
        </#if>
    </h3>

    <div class="item-content">
        ${post.content}
    </div>

    <div class="response">
    <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive()>
    <#if post.isOwner(viewerAccount.id)>
        <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />" href="#">
            <@spring.message 'Delete.post' />
        </a>
        <a class="update-post action" data-type="${post.type}" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/_update' />" href="#">
            <@spring.message 'Update.post' />
        </a>

        <a class="create-postMessage action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/messages/_create' />" href="#">
            <@spring.message 'AddMessage.post' />
        </a>
    <#elseif post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
       <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'Delete.post' />
            </a>
        </@sec.authorize>
        <a class="create-postMessage action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/messages/_create' />" href="#">
            <@spring.message 'AddMessage.post' />
        </a>
     <#else>
        <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'Delete.post' />
            </a>
        </@sec.authorize>
     </#if>
    </#if>
    </div>
</div>

<ul class="messages">
<#if post.messages??>
<#list post.messages as msg>
    <li class="message">
        <div class="item-ts">
            <a href="/social/users/${msg.account.user.id?replace("#","")}/posts">
                ${msg.account.user.displayName}  
            </a>
            [ <@commonGadgets.showTimeBefore msg.timeBefore /> ]
        </div>

        <div id="message-${msg.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
            ${msg.content}
        </div>

        <div class="response">
        <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive()>
        <#if msg.isOwner(viewerAccount.id)>
            <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#","")}/posts/${post.id?replace("#","")}/messages/${msg.id?replace("#","")}/_delete' />" href="#">
                <@spring.message 'Delete.message' />
            </a>
            <a class="update-postMessage action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/messages/${msg.id?replace("#", "")}/_update' />" data-target="#message-${msg.id?replace("#", "")?replace(":", "-")}-content" href="#">
                <@spring.message 'Update.message' />
            </a>
        </#if>
        <#if post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
            <a class="create-postMessageComment action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/messages/${msg.id?replace("#", "")}/comments/_create' />" href="#">
                <@spring.message 'Reply.message' />
            </a>
        </#if>
        </#if>
        </div>

        <ul id="message-${msg.id?replace("#", "")?replace(":", "-")}-comments" class="comments">
        <#if msg.comments??>
        <#list msg.comments as comment>
            <li class="comment">
                <div class="item-ts"> 
                    <a href="/social/users/${comment.account.user.id?replace("#", "")}/posts">
                        ${comment.account.user.displayName} 
                    </a>
                    [ <@commonGadgets.showTimeBefore comment.timeBefore /> ]
                </div>

                <div id="message-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                    ${comment.content}
                </div>

                <div class="response">
                <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive() && comment.isOwner(viewerAccount.id)>
                    <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/messages/${msg.id?replace("#","")}/messageComments/${comment.id?replace("#", "")}/_delete' />" href="#">
                        <@spring.message 'Delete.reply' />
                    </a>
                    <a class="update-postMessageComment action" data-action="<@spring.url '/topics/${topic.id?replace("#","")}/posts/${post.id?replace("#","")}/messages/${msg.id?replace("#","")}/messageComments/${comment.id?replace("#", "")}/_update"}' />" data-target="#message-comment-${comment.id?replace("#","")?replace(":", "-")}-content" href="#">
                        <@spring.message 'Update.reply' />
                    </a>
                </#if>
                </div>
            </li>
        </#list>
        </#if>
        </ul>
    </li>
    </#list>
    </#if>
</ul>

<#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive() && (post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id))>
    <@updatePostForm />
    <@postMessageForm />
    <@postMessageCommentForm />
    <@commonGadgets.deleteConfirmForm />
<#else>
    <@sec.authorize access="hasRole('ROLE_ADMIN')">
        <@updatePostForm />
        <@postMessageForm />
        <@postMessageCommentForm />
        <@commonGadgets.deleteConfirmForm />
    </@sec.authorize>
</#if>
</#macro>

<#--
<#macro showQuestionDetail>
    <div class="post">
        <div class="item-ts">
            <a href="/social/users/${post.account.user.id?replace("#","")}/posts">
                ${post.account.user.displayName} 
            </a>
            [ <@commonGadgets.showTimeBefore post.timeBefore /> ]
        </div>

        <h3 class="item-title">${post.title}</h3>
        <div class="item-content">
            ${post.content}
        </div>

        <div class="response">
        <#if !(topic.deleted || post.deleted)>
        <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete  action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />">
                <@spring.message 'Delete.question' />
            </a>
        </@sec.authorize>
        </#if>

        <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive()>
        <#if post.isOwner(viewerAccount.id)>
            <a class="update-post action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_update' />" href="#">
                <@spring.message 'Update.question' />
            </a>
        </#if>
        <#if post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
            <a class="create-questionComment action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/questionComments/_create' />" href="#">
                <@spring.message 'Comment.question' />
            </a>
            <a class="create-answer action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/answers/_create' />" href="#">
                <@spring.message 'Answer.question' />
            </a>
        </#if>
        </#if>
        </div>
    </div>

    <ul class="question-comments">
    <#if post.comments??>
    <#list post.comments as questionComment>
        <li class="comment">
            <div class="item-ts">
                <a href="/social/users/${questionComment.account.user.id?replace("#","")}/posts">
                    ${questionComment.account.user.displayName} 
                </a>
                [ <@commonGadgets.showTimeBefore questionComment.timeBefore /> ]
            </div>

            <div id="question-comment-${questionComment.id?replace("#","")?replace(":", "-")}-content" class="item-content">
                ${questionComment.content}
            </div>

            <div class="response">
            <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive() && questionComment.isOwner(viewerAccount.id)>
                <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/questionComments/${questionComment.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'Delete.comment' />
                </a>
                <a class="update-questionComment action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/questionComments/${questionComment.id?replace("#", "")}/_update' />" data-target="#question-comment-${questionComment.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'Update.comment' />
                </a>
            </#if>
            </div>
        </li>
    </#list>
    </#if>
    </ul>

    <ul class="answers">
    <#if post.answers??>
    <#list post.answers as answer>
        <li class="answer">
            <div class="item-ts">
                <a href="/social/users/${answer.account.user.id?replace("#","")}/posts">
                    ${answer.account.user.displayName} 
                </a>
                [ <@commonGadgets.showTimeBefore answer.timeBefore /> ]
            </div>
            <div id="answer-${answer.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                ${answer.content}
            </div>

            <div class="response">
            <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive()>
            <#if answer.isOwner(viewerAccount.id)>
                <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/answers/${answer.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'Delete.answer' />
                </a>
                <a class="update-answer action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/answers/${answer.id?replace("#", "")}/_update' />" data-target="#answer-${answer.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'Update.answer' />
                </a>
            </#if>
            <#if post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
                <a class="create-answerComment action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/answers/${answer.id?replace("#", "")}/comments/_create' />" href="#">
                    <@spring.message 'Comment.answer' />
                </a>
            </#if>
            </#if>
            </div>

            <ul id="answer-${answer.id?replace("#", "")?replace(":", "-")}-comments" class="comments">
            <#if answer.comments??>
            <#list answer.comments as comment>
                <li class="comment">
                    <div class="item-ts">
                        <a href="/social/users/${comment.account.user.id?replace("#","")}/posts">
                            ${comment.account.user.displayName} 
                        </a>
                        [ <@commonGadgets.showTimeBefore comment.timeBefore /> ]
                    </div>

                    <div id="answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                        ${comment.content}
                    </div>

                    <div class="response">
                    <#if !(topic.deleted ||post.deleted) && viewerAccount?? && post.plan.isActive() && comment.isOwner(viewerAccount.id)>
                        <a class="delete action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/answers/${answer.id?replace("#","")}/comments/${comment.id?replace("#","")}/_delete' />" href="#">
                            <@spring.message 'Delete.comment' />
                        </a>
                         <a class="update-answerComment action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/answers/${answer.id?replace("#","")}/comments/${comment.id?replace("#", "")}/_update'/>" data-target="#answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" href="#">
                            <@spring.message 'Update.comment' />
                        </a>
                    </#if>
                    </div>
                </li>
            </#list>
            </#if>
            </ul>
        </li>
        </#list>
        </#if>
    </ul>

<#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive() && (post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id))>
    <@updatePostForm />
    <@questionCommentForm />
    <@answerForm />
    <@answerCommentForm />
    <@commonGadgets.deleteConfirmForm />
<#else>
    <@sec.authorize access="hasRole('ROLE_ADMIN')">
        <@updatePostForm />
        <@questionCommentForm />
        <@answerForm />
        <@answerCommentForm />
        <@commonGadgets.deleteConfirmForm />
    </@sec.authorize>
</#if>
</#macro>
-->
