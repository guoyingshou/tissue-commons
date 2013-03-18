<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro questionForm>
<@spring.bind "questionForm.*" />
<form id="createQuestionForm" method="post" action="<@spring.url '/topics/${topic.id?replace("#", "")}/questions/_create'/>">
    <div class="error">
        <@spring.showErrors "<br>" />
    </div>
    <fieldset>
        <legend>
            <@spring.message "Legend.questionForm" />
        </legend>

        <ul>
            <li>
                <label for="title">
                    <@spring.message "Label.questionForm.title" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.questionForm.title' />
                    </span>
                </label>

                <@spring.formInput "questionForm.title" 'class="sum"' />
            </li>
            <li>
                <label for="content">
                    <@spring.message "Label.questionForm.content" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.questionForm.content' />
                    </span>
                </label>
                <@spring.formTextarea "questionForm.content" 'class="sum"' />
            </li>
            <li>
                <input type="hidden" name="type" value="question" />
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

<#macro updateQuestionForm>
    <form id="updateQuestionForm" class="dialog pop-650" style="display:none" method="post">
        <legend>
            <@spring.message "Legend.questionForm" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="title">
                    <@spring.message "Label.questionForm.title" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.questionForm.title' />
                    </span>
                 </label>
                <input type="input" class="sum" id="title" name="title" />
            </li>
            <li>
                <label for="content">
                    <@spring.message "Label.questionForm.content" />
                    <span style="display: none" class="error">
                        <@spring.message 'NotEmpty.questionForm.content' />
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

<#macro showQuestions questions>
<ul id="questions">
   <#list questions as question>
   <li class="container-has-icon">
       <div class="icon">
           <span data-icon="&#xe009;"></span>
       </div>

       <div class="ts has-icon-before">
           <a href="/social/users/${question.account.user.id?replace("#", "")}/questions">${question.account.user.displayName}</a>
           [ <@commonGadgets.showTimeBefore question.timeBefore /> ]
       </div>
       <div class="title has-icon-before">
           <a href="/group/questions/${question.id?replace("#","")}" class="post">${question.title}</a>
       </div>
   </li>
   </#list>
</ul>
</#macro>

<#macro showQuestionDetail>
    <div class="question">
        <div class="item-ts">
            <a href="/social/users/${question.account.user.id?replace("#","")}/questions">
                ${question.account.user.displayName} 
            </a>
            [ <@commonGadgets.showTimeBefore question.timeBefore /> ]
            <#if !(topic.deleted || question.deleted)>
            <@sec.authorize access="hasRole('ROLE_ADMIN')">
                <a class="delete  action" data-action="<@spring.url '/questions/${question.id?replace("#", "")}/_delete' />">
                    <@spring.message 'Delete.question' />
                </a>
            </@sec.authorize>
            </#if>
        </div>

        <h3 class="item-title">${question.title}</h3>
        <div class="item-content">
            ${question.content}
        </div>

        <div class="response">
        <#if !(topic.deleted || question.deleted) && isMember>
            <a class="create-questionComment action" data-action="<@spring.url '/questions/${question.id?replace("#", "")}/questionComments/_create' />" href="#">
                <@spring.message 'Comment.question' />
            </a>
            <a class="create-answer action" data-action="<@spring.url '/questions/${question.id?replace("#", "")}/answers/_create' />" href="#">
                <@spring.message 'Answer.question' />
            </a>

            <#if question.isOwner(viewerAccount.id)>
            <a class="update-question action" data-action="<@spring.url '/questions/${question.id?replace("#", "")}/_update' />" href="#">
                <@spring.message 'Update.question' />
            </a>
            </#if>
        </#if>
        </div>
    </div>

    <ul class="question-comments">
    <#if question.comments??>
    <#list question.comments as questionComment>
        <li class="comment">
            <div class="item-ts">
                <a href="/social/users/${questionComment.account.user.id?replace("#","")}/questions">
                    ${questionComment.account.user.displayName} 
                </a>
                [ <@commonGadgets.showTimeBefore questionComment.timeBefore /> ]
            </div>

            <div id="question-comment-${questionComment.id?replace("#","")?replace(":", "-")}-content" class="item-content">
                ${questionComment.content}
            </div>

            <div class="response">
            <#if !(topic.deleted || question.deleted) && isMember && questionComment.isOwner(viewerAccount.id)>
                <a class="delete action" data-action="<@spring.url '/questionComments/${questionComment.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'Delete.comment' />
                </a>
                <a class="update-questionComment action" data-action="<@spring.url '/questionComments/${questionComment.id?replace("#", "")}/_update' />" data-target="#question-comment-${questionComment.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'Update.comment' />
                </a>
            </#if>
            </div>
        </li>
    </#list>
    </#if>
    </ul>

    <ul class="answers">
    <#if question.answers??>
    <#list question.answers as answer>
        <li class="answer">
            <div class="item-ts">
                <a href="/social/users/${answer.account.user.id?replace("#","")}/questions">
                    ${answer.account.user.displayName} 
                </a>
                [ <@commonGadgets.showTimeBefore answer.timeBefore /> ]
            </div>
            <div id="answer-${answer.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                ${answer.content}
            </div>

            <div class="response">
            <#if !(topic.deleted || question.deleted) && isMember>
                <a class="create-answerComment action" data-action="<@spring.url '/answers/${answer.id?replace("#", "")}/comments/_create' />" href="#">
                    <@spring.message 'Comment.answer' />
                </a>

                <#if answer.isOwner(viewerAccount.id)>
                <a class="delete action" data-action="<@spring.url '/answers/${answer.id?replace("#", "")}/_delete' />" href="#">
                    <@spring.message 'Delete.answer' />
                </a>
                <a class="update-answer action" data-action="<@spring.url '/answers/${answer.id?replace("#", "")}/_update' />" data-target="#answer-${answer.id?replace("#", "")?replace(":", "-")}-content" href="#">
                    <@spring.message 'Update.answer' />
                </a>
                </#if>
            </#if>
            </div>

            <ul id="answer-${answer.id?replace("#", "")?replace(":", "-")}-comments" class="comments">
            <#if answer.comments??>
            <#list answer.comments as comment>
                <li class="comment">
                    <div class="item-ts">
                        <a href="/social/users/${comment.account.user.id?replace("#","")}/questions">
                            ${comment.account.user.displayName} 
                        </a>
                        [ <@commonGadgets.showTimeBefore comment.timeBefore /> ]
                    </div>

                    <div id="answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" class="item-content">
                        ${comment.content}
                    </div>

                    <div class="response">
                    <#if !(topic.deleted ||question.deleted) && isMember && comment.isOwner(viewerAccount.id)>
                        <a class="delete action" data-action="<@spring.url '/answers/${answer.id?replace("#","")}/comments/${comment.id?replace("#","")}/_delete' />" href="#">
                            <@spring.message 'Delete.comment' />
                        </a>
                         <a class="update-answerComment action" data-action="<@spring.url '/answers/${answer.id?replace("#","")}/comments/${comment.id?replace("#", "")}/_update'/>" data-target="#answer-comment-${comment.id?replace("#", "")?replace(":", "-")}-content" href="#">
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

<#if !(topic.deleted || question.deleted) && isMember>
    <@updateQuestionForm />
    <@questionCommentForm />
    <@answerForm />
    <@answerCommentForm />
    <@commonGadgets.deleteConfirmForm />
<#else>
    <@sec.authorize access="hasRole('ROLE_ADMIN')">
        <@updateQuestionForm />
        <@questionCommentForm />
        <@answerForm />
        <@answerCommentForm />
        <@commonGadgets.deleteConfirmForm />
    </@sec.authorize>
</#if>
</#macro>

