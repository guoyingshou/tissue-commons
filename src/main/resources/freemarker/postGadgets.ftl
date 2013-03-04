<#import 'spring.ftl' as spring />
<#import 'utilGadgets.ftl' as utilGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro postForm>
<@spring.bind "post.*" />
<form id="createPostForm" method="post" action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/_create'/>">
    <div class="error">
        <@spring.showErrors "<br>" />
        <span style="display: none">
            <@spring.message 'NotNull.post.type' />
        </span>
    </div>
    <fieldset class="post-type">
        <legend>
            <@spring.message 'i18n.topic.post.type' />
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
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.post.title' />
                    </span>
                </label>

                <@spring.formInput "post.title" 'class="sum"' />
            </li>
            <li>
                <label for="content">
                    <@spring.message "i18n.topic.post.content" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.post.content' />
                    </span>
                </label>
                <@spring.formTextarea "post.content" 'class="sum"' />
            </li>
            <li>
                <input type="submit" value="<@spring.message 'i18n.button.publish'/>" />
            </li>
        </ul>
    </fieldset>
</form>
<script type="text/javascript">
    CKEDITOR.replace("content");
</script>
</#macro>

<#macro updatePostForm>
    <form id="updatePostForm" class="dialog pop-650" style="display:none" method="post">
        <legend>
            <@spring.message "i18n.topic.post" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="title">
                    <@spring.message "i18n.topic.post.title" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.post.title' />
                    </span>
                 </label>
                <input type="input" class="sum" id="title" name="title" />
            </li>
            <li>
                <label for="content">
                    <@spring.message "i18n.topic.post.content" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.post.content' />
                    </span>
                 </label>
                <textarea id="content" name="content"></textarea>
            </li>
            <li>
                <input type="submit" value="<@spring.message 'i18n.button.submit' />" />
            </li>
        </ul>
    </form>
</#macro>

<#macro deletePostForm>
    <form id="deletePostForm" class="dialog pop-650" style="display:none" method="post">
        <legend>
            <@spring.message "i18n.topic.post.delete" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="reason">
                    <@spring.message "i18n.topic.post.delete.reason" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.reason' />
                    </span>
                 </label>
                 <textarea id="reason" name="content"></textarea>
            </li>
            <li>
                <input type="submit" value="<@spring.message 'i18n.button.submit' />"/>
            </li>
        </ul>
    </form>
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
           <a href="/social/users/${post.account.user.id?replace("#", "")}/posts">${post.account.user.displayName}</a>
           [ <@utilGadgets.showTimeBefore post.timeBefore /> ]
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
        [ <@utilGadgets.showTimeBefore post.timeBefore /> ] 
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
        <a class="delete-post action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />" href="#">
            <@spring.message 'i18n.action.delete' />
        </a>
        <a class="update-post action" data-type="${post.type}" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/_update' />" href="#">
            <@spring.message 'i18n.action.edit' />
        </a>

        <a class="create-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/messages/_create' />" data-target="ul.messages" href="#">
            <@spring.message 'i18n.action.addMessage' />
        </a>
    <#elseif post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
       <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete-post action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'i18n.action.delete' />
            </a>
        </@sec.authorize>
        <a class="create-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/messages/_create' />" data-target="ul.messages" href="#">
            <@spring.message 'i18n.action.addMessage' />
        </a>
     <#else>
        <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete-post action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'i18n.action.delete' />
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
            [ <@utilGadgets.showTimeBefore msg.timeBefore /> ]
        </div>

        <div id="message-${msg.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
            ${msg.content}
        </div>

        <div class="response">
        <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive()>
        <#if msg.isOwner(viewerAccount.id)>
            <a class="delete-item action" data-action="<@spring.url '/topics/${topic.id?replace("#","")}/messages/${msg.id?replace("#","")}/_delete' />" href="#">
                <@spring.message 'i18n.action.delete' />
            </a>
            <a class="update-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/messages/${msg.id?replace("#", "")}/_update' />" data-target="#message-${msg.id?replace("#", "")?replace(":", "-")}-content" href="#">
                <@spring.message 'i18n.action.edit' />
            </a>
        </#if>
        <#if post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
            <a class="create-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/messages/${msg.id?replace("#", "")}/comments/_create' />" data-target="#message-${msg.id?replace("#", "")?replace(":", "-")}-comments" href="#">
                <@spring.message 'i18n.action.reply' />
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
                    [ <@utilGadgets.showTimeBefore comment.timeBefore /> ]
                </div>

                <div id="message-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                    ${comment.content}
                </div>

                <div class="response">
                <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive() && comment.isOwner(viewerAccount.id)>
                    <a class="delete-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/messageComments/${comment.id?replace("#", "")}/_delete' />" href="#">
                        <@spring.message 'i18n.action.delete' />
                    </a>
                    <a class="update-item action" data-action="<@spring.url '/messageComments/${comment.id?replace("#", "")}/_update"}' />" data-target="#message-comment-${comment.id?replace("#","")?replace(":", "-")}-content" href="#">
                        <@spring.message 'i18n.action.edit' />
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
    <@deletePostForm />
    <@tissue.oneItemForm />
    <@tissue.confirmForm />
<#else>
    <@sec.authorize access="hasRole('ROLE_ADMIN')">
        <@updatePostForm />
        <@deletePostForm />
        <@tissue.oneItemForm />
        <@tissue.confirmForm />
    </@sec.authorize>
</#if>
</#macro>

<#macro showQuestionDetail>
    <div class="post">
        <div class="item-ts">
            <a href="/social/users/${post.account.user.id?replace("#","")}/posts">
                ${post.account.user.displayName} 
            </a>
            [ <@utilGadgets.showTimeBefore post.timeBefore /> ]
        </div>

        <h3 class="item-title">${post.title}</h3>
        <div class="item-content">
            ${post.content}
        </div>

        <div class="response">
        <#if !(topic.deleted || post.deleted)>
        <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete-post action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_delete' />">
                <@spring.message 'i18n.action.delete' />
            </a>
        </@sec.authorize>
        </#if>

        <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive()>
        <#if post.isOwner(viewerAccount.id)>
            <a class="update-post action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/_update' />" href="#">
                <@spring.message 'i18n.action.edit' />
            </a>
        </#if>
        <#if post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
            <a class="create-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/questionComments/_create' />" data-target="ul.question-comments" href="#">
                <@spring.message 'i18n.action.comment' />
            </a>
            <a class="create-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#", "")}/answers/_create' />" data-target="ul.answers" href="#">
                <@spring.message 'i18n.action.answer' />
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
                [ <@utilGadgets.showTimeBefore questionComment.timeBefore /> ]
            </div>

            <div id="question-comment-${questionComment.id?replace("#","")?replace(":", "-")}-content" class="item-content">
                ${questionComment.content}
            </div>

            <div class="response">
            <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive() && questionComment.isOwner(viewerAccount.id)>
                <a class="delete-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/questionComments/${questionComment.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'i18n.action.delete' />
                </a>
                <a class="update-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/questionComments/${questionComment.id?replace("#", "")}/_update' />" data-target="#question-comment-${questionComment.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'i18n.action.edit' />
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
                [ <@utilGadgets.showTimeBefore answer.timeBefore /> ]
            </div>
            <div id="answer-${answer.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                ${answer.content}
            </div>

            <div class="response">
            <#if !(topic.deleted || post.deleted) && viewerAccount?? && post.plan.isActive()>
            <#if answer.isOwner(viewerAccount.id)>
                <a class="delete-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/answers/${answer.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'i18n.action.delete' />
                </a>
                <a class="update-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/answers/${answer.id?replace("#", "")}/_update' />" data-target="#answer-${answer.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'i18n.action.edit' />
                </a>
            </#if>
            <#if post.plan.isOwner(viewerAccount.id) || post.plan.isMember(viewerAccount.id)>
                <a class="create-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/answers/${answer.id?replace("#", "")}/comments/_create' />" data-target="#answer-${answer.id?replace("#", "")?replace(":","-")}-comments" href="#">
                    <@spring.message 'i18n.action.comment' />
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
                        [ <@utilGadgets.showTimeBefore comment.timeBefore /> ]
                    </div>

                    <div id="answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                        ${comment.content}
                    </div>

                    <div class="response">
                    <#if !(topic.deleted ||post.deleted) && viewerAccount?? && post.plan.isActive() && comment.isOwner(viewerAccount.id)>
                        <a class="delete-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/answerComments/${comment.id?replace("#","")}/_delete' />" href="#">
                            <@spring.message 'i18n.action.delete' />
                        </a>
                         <a class="update-item action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/answerComments/${comment.id?replace("#", "")}/_update'/>" data-target="#answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" href="#">
                            <@spring.message 'i18n.action.edit' />
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
    <@deletePostForm />
    <@tissue.oneItemForm />
    <@tissue.confirmForm />
<#else>
    <@sec.authorize access="hasRole('ROLE_ADMIN')">
        <@updatePostForm />
        <@deletePostForm />
        <@tissue.oneItemForm />
        <@tissue.confirmForm />
    </@sec.authorize>
</#if>
</#macro>


