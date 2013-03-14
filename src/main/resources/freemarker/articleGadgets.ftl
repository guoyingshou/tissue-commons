<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro articleForm>
<@spring.bind "articleForm.*" />
<form id="createArticleForm" method="post" action="<@spring.url '/topics/${topic.id?replace("#", "")}/articles/_create'/>">
    <div class="error">
        <@spring.showErrors "<br>" />
        <span style="display: none">
            <@spring.message 'NotNull.articleForm.type' />
        </span>
    </div>
    <fieldset class="post-type">
        <legend>
            <@spring.message 'Legend.articleForm.type' />
        </legend>

        <label>
            <@spring.message 'Label.articleForm.concept' />
            <input type="radio" name="type" value="concept" />
        </label>
        <label>
            <@spring.message 'Label.articleForm.note' />
            <input type="radio" name="type" value="note" />
        </label>
        <label>
            <@spring.message 'Label.articleForm.tutorial' />
            <input type="radio" name="type" value="tutorial" />
        </label>
    </fieldset>

    <fieldset>
        <legend>
            <@spring.message "Legend.articleForm" />
        </legend>

        <ul>
            <li>
                <label for="title">
                    <@spring.message "Label.articleForm.title" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.articleForm.title' />
                    </span>
                </label>

                <@spring.formInput "articleForm.title" 'class="sum"' />
            </li>
            <li>
                <label for="content">
                    <@spring.message "Label.articleForm.content" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.articleForm.content' />
                    </span>
                </label>
                <@spring.formTextarea "articleForm.content" 'class="sum"' />
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

<#--
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
-->

<#macro showArticleDetail>
<div class="article">
    <div class="item-ts">
        <a href="/social/users/${article.account.user.id?replace("#", "")}/posts">
            ${article.account.user.displayName} 
        </a>
        [ <@commonGadgets.showTimeBefore article.timeBefore /> ] 
    </div>

    <h3 class="item-title">
        ${article.title}
        <#if article.deleted>
           <span>[ closed ]</span>
        </#if>
    </h3>

    <div class="item-content">
        ${article.content}
    </div>

<#--
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
        <a class="create-message action" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/${post.id?replace("#","")}/messages/_create' />" href="#">
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
    -->
</div>

<#--
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

-->
</#macro>

