<#import 'spring.ftl' as spring />
<#import 'utilGadgets.ftl' as utilGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro postForm>
        <form id="post-form" method="post" action="<@spring.url '/plans/${topic.activePlan.id?replace("#", "")}/posts/_create'/>">
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
                        <input type="submit" value="<@spring.message 'i18n.button.publish'/>" />
                    </li>
                </ul>
            </fieldset>
        </form>
        <script type="text/javascript">
            CKEDITOR.replace("editor");
        </script>
</#macro>

<#macro postEditForm>
    <div id="postEditForm" class="dialog pop-650" style="display: none">
        <form method="post">
            <legend>
                <@spring.message "i18n.topic.post" />
                <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
            </legend>
            <ul>
                <li>
                    <label for="title">
                        <@spring.message "i18n.topic.post.title" />
                        <span style="display:none">
                            <@spring.message "i18n.error.empty" />
                        </span>
                    </label>
                    <input type="input" class="sum" id="title" name="title" />
                </li>
                <li>
                    <label for="editor">
                        <@spring.message "i18n.topic.post.content" />
                        <span style="display:none">
                            <@spring.message "i18n.error.empty" />
                        </span>
                    </label>
                    <textarea id="editor" name="content"></textarea>
                </li>
                <li>
                    <input type="submit" value="<@spring.message 'i18n.button.submit' />" />
                </li>
            </ul>
        </form>
    </div>
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
           <a href="/social/users/${post.user.id?replace("#", "")}/posts">${post.user.displayName}</a>
           [ <@utilGadgets.showTimeBefore post.timeBefore /> ]
       </div>
       <div class="title has-icon-before">
           <a href="/group/posts/${post.id?replace("#","")}" class="post">${post.title}</a>
       </div>
   </li>
   </#list>
</ul>
</#macro>

<#macro showPostDetail>
<div>
    <div class="ts">
        <a href="/social/users/${post.user.id?replace("#", "")}/posts">
            ${post.user.displayName} 
        </a>
        [ <@utilGadgets.showTimeBefore post.timeBefore /> ] 
    </div>

    <h3 class="title">
        ${post.title}
        <#if post.deleted>
           <span>[ closed ]</span>
        </#if>
    </h3>
    <div class="content">${post.content}</div>

    <#if !(topic.deleted || post.deleted)>
    <@sec.authorize access="hasRole('ROLE_ADMIN')">
        <a href="<@spring.url '/posts/${post.id?replace("#", "")}/_delete' />">Delete Post</a>
    </@sec.authorize>
    </#if>

    <#if !(topic.deleted ||post.deleted) && viewer?? && post.plan.isActive()>
    <#if post.isOwner(viewer.id)>
        <a class="post-edit" data-type="${post.type}" data-action="<@spring.url '/posts/${post.id?replace("#","")}/_update' />" href="#">
            <@spring.message 'i18n.action.edit' />
        </a>
    </#if>
    <#if post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id)>
        <a class="item-add" data-action="<@spring.url '/posts/${post.id?replace("#","")}/messages/_create' />" data-target="ul.messages" href="#">
            <@spring.message 'i18n.action.addMessage' />
        </a>
    </#if>
    </#if>
    </div>

    <ul class="messages">
    <#if post.messages??>
        <#list post.messages as msg>
        <li class="message-item">
            <div class="ts">
                <a href="/social/users/${msg.user.id?replace("#","")}/posts">
                    ${msg.user.displayName}  
                </a>
                [ <@utilGadgets.showTimeBefore msg.timeBefore /> ]
            </div>
            <div id="message-${msg.id?replace("#", "")?replace(":", "-")}-content">${msg.content}</div>

            <#if !(topic.deleted || post.deleted) && viewer?? && post.plan.isActive()>
            <#if msg.isOwner(viewer.id)>
            <a class="item-edit" data-action="<@spring.url '/messages/${msg.id?replace("#", "")}/_update' />" data-target="#message-${msg.id?replace("#", "")?replace(":", "-")}-content" href="#">
                <@spring.message 'i18n.action.edit' />
            </a>
            <a class="del" data-action="<@spring.url '/messages/${msg.id?replace("#","")}/_delete' />" href="#">
                <@spring.message 'i18n.action.delete' />
            </a>
            </#if>
            <#if post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id)>
            <a class="item-add" data-action="<@spring.url '/messages/${msg.id?replace("#", "")}/comments/_create' />" data-target="#message-${msg.id?replace("#", "")?replace(":", "-")}-comments" href="#">
                <@spring.message 'i18n.action.reply' />
            </a>
            </#if>
            </#if>

            <ul id="message-${msg.id?replace("#", "")?replace(":", "-")}-comments">
            <#if msg.comments??>
            <#list msg.comments as comment>
                <li class="message-comment">
                    <div class="ts"> 
                        <a href="/social/users/${comment.user.id?replace("#", "")}/posts">
                            ${comment.user.displayName} 
                        </a>
                        [ <@utilGadgets.showTimeBefore comment.timeBefore /> ]
                    </div>

                    <div id="message-comment-${comment.id?replace("#", "")?replace(":", "-")}-content">${comment.content}</div>

                    <#if !(topic.deleted || post.deleted) && viewer?? && post.plan.isActive() && comment.isOwner(viewer.id)>
                    <a class="item-edit" data-action="<@spring.url '/messageComments/${comment.id?replace("#", "")}/_update"}' />" data-target="#message-comment-${comment.id?replace("#","")?replace(":", "-")}-content" href="#">
                        <@spring.message 'i18n.action.edit' />
                    </a>
                    <a class="del" data-action="<@spring.url '/messageComments/${comment.id?replace("#", "")}/_delete' />" href="#">
                        <@spring.message 'i18n.action.delete' />
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

    <#if !(topic.deleted || post.deleted) && viewer?? && post.plan.isActive() && (post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id))>
    <@postEditForm />
    <@tissue.oneItemForm />
    <@tissue.confirmForm />
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

        <#if !(topic.deleted || post.deleted)>
        <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a href="<@spring.url '/posts/${post.id?replace("#", "")}/_delete' />">Delete Post</a>
        </@sec.authorize>
        </#if>


        <#if !(topic.deleted || post.deleted)>
        <#if viewer?? && post.plan.isActive()>
        <#if post.isOwner(viewer.id)>
                <a class="post-edit" data-action="<@spring.url '/posts/${post.id?replace("#", "")}' />" href="#">
                    <@spring.message 'i18n.action.edit' />
                </a>
        </#if>
        <#if post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id)>
                <a class="item-add" data-action="<@spring.url '/posts/${post.id?replace("#", "")}/questionComments/_create' />" data-target="#question-comments" href="#">
                    <@spring.message 'i18n.action.comment' />
                </a>
                <a class="item-add" data-action="<@spring.url '/posts/${post.id?replace("#", "")}/answers/_create' />" data-target="#answers" href="#">
                    <@spring.message 'i18n.action.answer' />
                </a>
        </#if>
        </#if>
        </#if>
    </div>

    <ul id="question-comments">
        <#if post.comments??>
        <#list post.comments as questionComment>
        <li>
            <div class="ts">
                ${questionComment.user.displayName} 
                [ <@utilGadgets.showTimeBefore questionComment.timeBefore /> ]
            </div>

            <div id="question-comment-${questionComment.id?replace("#","")?replace(":", "-")}-content">${questionComment.content}</div>

            <#if !(topic.deleted || post.deleted) && viewer?? && post.plan.isActive() && questionComment.isOwner(viewer.id)>
                <a class="item-edit" data-action="<@spring.url '/questionComments/${questionComment.id?replace("#", "")}/_update' />" data-target="#question-comment-${questionComment.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'i18n.action.edit' />
                </a>
                <a class="del" data-action="<@spring.url '/questionComments/${questionComment.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'i18n.action.delete' />
                </a>
            </#if>
        </li>
        </#list>
        </#if>
    </ul>

    <ul id="answers">
    <#if post.answers??>
        <#list post.answers as answer>
        <li class="answer-item">

            <div class="ts">
                ${answer.user.displayName} 
                [ <@utilGadgets.showTimeBefore answer.timeBefore /> ]
            </div>

            <div id="answer-${answer.id?replace("#", "")?replace(":", "-")}-content">${answer.content}</div>

            <#if !(topic.deleted || post.deleted) && viewer?? && post.plan.isActive()>
                <#if answer.isOwner(viewer.id)>
                <a class="item-edit" data-action="<@spring.url '/answers/${answer.id?replace("#", "")}/_update' />" data-target="#answer-${answer.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'i18n.action.edit' />
                </a>
                <a class="del" data-action="<@spring.url '/answers/${answer.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'i18n.action.delete' />
                </a>
                </#if>
                <#if post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id)>
                <a class="item-add" data-action="<@spring.url '/answers/${answer.id?replace("#", "")}/comments/_create' />" data-target="#answer-${answer.id?replace("#", "")?replace(":","-")}-comments" href="#">
                    <@spring.message 'i18n.action.comment' />
                </a>
                </#if>
            </#if>

            <ul id="answer-${answer.id?replace("#", "")?replace(":", "-")}-comments">
            <#if answer.comments??>
            <#list answer.comments as comment>
                <li class="answer-comment-item">
                    <div class="ts">
                        ${comment.user.displayName} 
                        [ <@utilGadgets.showTimeBefore comment.timeBefore /> ]
                    </div>

                    <div id="answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content">${comment.content}</div>

                    <#if !(topic.deleted ||post.deleted) && viewer?? && post.plan.isActive() && comment.isOwner(viewer.id)>
                         <a class="item-edit" data-action="<@spring.url '/answerComments/${comment.id?replace("#", "")}/_update'/>" data-target="#answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" href="#">
                            <@spring.message 'i18n.action.edit' />
                        </a>
                        <a class="del" data-action="<@spring.url '/answerComments/${comment.id?replace("#","")}/_delete' />" href="#">
                            <@spring.message 'i18n.action.delete' />
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

    <#if !(topic.deleted || post.deleted) && viewer?? && post.plan.isActive() && (post.plan.isOwner(viewer.id) || post.plan.isMember(viewer.id))>
    <@postEditForm />
    <@tissue.oneItemForm />
    <@tissue.confirmForm />
     </#if>
</#macro>


