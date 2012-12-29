<#import 'spring.ftl' as spring />

<#macro showPostList posts>
<ul id="postList">
   <#list posts as post>
       <li>
           <span><a href="http://www.tissue.com/group/posts/${post.id}" class="post">${post.title}</a></span>
           <span><a href="http://www.tissue.com/profile/users/${post.user.id}">${post.user.displayName}</a></span>
       </li>
   </#list>
</ul>
</#macro>

<#macro showPostDetail>

    <div>
        <h3 class="post-title">${post.title}</h3>
        <div class="post-author">${post.user.displayName}</div>
        <div class="post-content">${post.content}</div>
        <a class="post-edit" data-action="<@spring.url '/posts/${post.id}' />" href="#">edit</a>
    </div>

    <h2>Messages: </h2>

    <ul class="messages">
    <#if post.messages??>
        <#list post.messages as msg>
        <li class="post-messages">

            <div>${msg.content}</div>

            <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
            <a data-action="<@spring.url '/messages/${msg.id}' />" class="one-item-edit" href="#">edit</a>
            <a data-id="${msg.id}" class="msg-comment-add" href="#">comment</a>
            </#if>

            <ul class="messageComments-${msg.id}">
            <#if msg.comments??>
            <#list msg.comments as comment>
                <li class="messageCommentItem">
                    <div>${comment.content}</div>
                    <a class="one-item-edit" data-action="<@spring.url '/messageComments/${comment.id}' />" href="#">edit</a>
                    <a class="msg-comment-del" data-action="<@spring.url '/messageComments/${comment.id}/delete' />" href="#">delete</a>
                </li>
            </#list>
            </#if>
            </ul>
        </li>
        </#list>
        </#if>
    </ul>

    <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
    <div>
        <a class="msg-add" data-action="<@spring.url '/posts/${post.id}/messages' />" href="#">add message</a>
    </div>
    </#if>

    <script type="text/javascript">

        $(document).on('click', 'a.post-edit', function(e) {
            e.preventDefault();
            var options = {
                type: "${post.type}",
                url: $(this).data("action")
            };

            $(this).closest('div').editPostDialog(options);
        });
 
        $(document).on('click', 'a.msg-add', function(e) {
            e.preventDefault();
            $('ul.messages').oneItemDialog($(this).data("action"));
        });
 
        $(document).on('click', 'a.one-item-edit', function(e) {
            e.preventDefault();
            $(this).prev().oneItemDialog($(this).data("action"));
        });

        $(document).on('click', 'a.msg-comment-add', function(e) {
            e.preventDefault();

            var id = $(this).data("id");
            var url = "<@spring.url '/messages/' />" + id + "/comments";

            var selector = "ul.messageComments-" + id;
            var target = $(selector);
            if(target.length == 0) {
                target = $('<ul class="' + selector + '"/>'); 
            }
            target.oneItemDialog(url);
        });

    </script>

</#macro>

<#macro showQuestionDetail>
    <div>
        <h3 class="post-title">${post.title}</h3>
        <div class="post-author">${post.user.displayName}</div>
        <div class="post-content">${post.content}</div>

        <a class="post-edit" data-action="<@spring.url '/posts/${post.id}' />" href="#">edit</a>
        <a class="question-comment-add" href="#">comment</a></p>
    </div>

    <#if post.comments??>
    <div class="post-comments">
        <h2>comments: </h2>
        <ul>
            <#list post.comments as questionComment>
                <li>
                    <div>${questionComment.content}</div>
                </li>
            </#list>
        </ul>
    </div>
    </#if>

    <h2>Answers: </h2>
    <#if post.answers??>
    <ul>
        <#list post.answers as answer>
        <li>
            <div>${answer.content}</div>
            <div>
            <#if answer.answerComments??>
                <ul>
                <#list answer.answerComments as comment>
                    <li>${comment.content}</li>
                </#list>
                </ul>
            </#if>
            </div>

            <a class="post-answer-comment-edit" data-action="<@spring.url '/posts/${post.id}/answers/${answer.id}/comments'/>" href="#">comment</a>
        </li>
        </#list>
    </ul>
    </#if>

    <div>
        <a class="post-answer-add" data-action="<@spring.url '/posts/${post.id}/answers' />" href="#">add answer</a>
    </div>
 
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


