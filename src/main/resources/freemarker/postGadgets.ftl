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
        <div class="post-content">${post.content}</div>
        <div class="post-author">${post.user.displayName} published: ${post.createTime?datetime}</div>

        <#if viewer?? && post.plan.isActive() && post.isOwner(viewer.id)>
        <a class="post-edit" data-action="<@spring.url '/posts/${post.id}' />" href="#">edit</a>
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
        </#if>
    </div>

    <h2>Messages: </h2>

    <ul class="messages">
    <#if post.messages??>
        <#list post.messages as msg>
        <li class="message-item">

            <div>${msg.content}</div>
            <div>${msg.user.displayName}  published: ${msg.createTime?datetime}</div>

            <#if viewer?? && post.plan.isActive() && msg.isOwner(viewer.id)>
            <a class="one-item-edit" data-action="<@spring.url '/messages/${msg.id}' />" href="#">edit</a>
            <a class="del" data-action="<@spring.url '/messages/${msg.id}/delete' />" href="#">delete</a>
            </#if>

            <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
            <a class="msg-comment-add" data-id="${msg.id}" href="#">comment</a>
            </#if>

            <ul class="message-comments-${msg.id}">
            <#if msg.comments??>
            <#list msg.comments as comment>
                <li class="message-comment-item">
                    <div>${comment.content}</div>
                    <div> ${comment.user.displayName}    published: ${comment.createTime?datetime}</div>

                    <#if viewer?? && post.plan.isActive() && comment.isOwner(viewer.id)>
                    <a class="one-item-edit" data-action="<@spring.url '/messageComments/${comment.id}' />" href="#">edit</a>
                    <a class="del" data-action="<@spring.url '/messageComments/${comment.id}/delete' />" href="#">delete</a>
                    </#if>
                </li>
            </#list>
            </#if>
            </ul>
        </li>
        </#list>
        </#if>
    </ul>

    <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
    <script type="text/javascript">
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
    </script>
    </#if>

    <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
    <a class="msg-add" data-action="<@spring.url '/posts/${post.id}/messages' />" href="#">add message</a>
    <script type="text/javascript">
        $(document).on('click', 'a.msg-add', function(e) {
            e.preventDefault();
            $('ul.messages').oneItemDialog($(this).data("action"));
        });

        $(document).on('click', 'a.one-item-edit', function(e) {
            e.preventDefault();
            $(this).prev().prev().oneItemDialog($(this).data("action"));
        });

        $(document).on('click', 'a.del', function(e) {
            e.preventDefault();
            $(this).delDialog($(this).data("action"));
        });
    </script>
    </#if>

</#macro>

<#macro showQuestionDetail>
    <div class="question">
        <h3 class="post-title">${post.title}</h3>
        <div class="post-content">${post.content}</div>
        <div class="post-author">${post.user.displayName} published: ${post.createTime?datetime}</div>

        <#if viewer?? && post.plan.isActive() && post.isOwner(viewer.id)>
        <a class="post-edit" data-action="<@spring.url '/posts/${post.id}' />" href="#">edit</a>
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
        </#if>
        
        <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
        <a class="question-comment-add" data-action="<@spring.url '/posts/${post.id}/questionComments' />" href="#">comment</a></p>
        <script type="text/javascript">
            $(document).on('click', 'a.question-comment-add', function(e) {
                e.preventDefault();
            
                var url = $(this).data("action");
                $('ul.post-comments').oneItemDialog(url);
            });
        </script>
         </#if>
    </div>

    <#if post.comments??>
    <ul class="question-comments">
        <#list post.comments as questionComment>
        <li>
            <div>${questionComment.content}</div>
            <div>${questionComment.user.displayName} published: ${questionComment.createTime?datetime}</div>

            <#if viewer?? && post.plan.isActive() && questionComment.isOwner(viewer.id)>
            <a class="one-item-edit" data-action="<@spring.url '/questionComments/${questionComment.id}' />" href="#">edit</a>
            <a class="del" data-action="<@spring.url '/questionComments/${questionComment.id}/delete' />" href="#">delete</a>
            </#if>
         </li>
         </#list>
    </ul>
    </#if>

    <h2>Answers: </h2>
    <ul class="answers">
    <#if post.answers??>
        <#list post.answers as answer>
        <li class="answer-item">

            <div>${answer.content}</div>
            <div>${answer.user.displayName} published: ${answer.createTime?datetime}</div>

            <#if viewer?? && post.plan.isActive() && answer.isOwner(viewer.id)>
            <a class="one-item-edit" data-action="<@spring.url '/answers/${answer.id}' />" href="#">edit</a>
            <a class="del" data-action="<@spring.url '/answers/${answer.id}/delete' />" href="#">delete</a>
            </#if>

            <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
            <a class="answer-comment-add" data-id="${answer.id}" href="#">comment</a>
            </#if>

            <ul class="answer-comments-${answer.id}">
            <#if answer.comments??>
            <#list answer.comments as comment>
                <li class="answer-comment-item">
                    <div>${comment.content}</div>
                    <div>${comment.user.displayName} published: ${comment.createTime?datetime}</div>

                    <#if viewer?? && post.plan.isActive() && comment.isOwner(viewer.id)>
                    <a class="one-item-edit" data-action="<@spring.url '/answerComments/${comment.id}' />" href="#">edit</a>
                    <a class="del" data-action="<@spring.url '/answerComments/${comment.id}/delete' />" href="#">delete</a>
                    </#if>
                </li>
            </#list>
            </#if>
            </ul>
        </li>
        </#list>
        </#if>
    </ul>

    <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
    <script type="text/javascript">
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
    </script>
    </#if>

    <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
    <a class="answer-add" data-action="<@spring.url '/posts/${post.id}/answers' />" href="#">add answer</a>
    <script type="text/javascript">
        $(document).on('click', 'a.answer-add', function(e) {
            e.preventDefault();
            $('ul.answers').oneItemDialog($(this).data("action"));
        });

        $(document).on('click', 'a.one-item-edit', function(e) {
            e.preventDefault();
            $(this).prev().prev().oneItemDialog($(this).data("action"));
        });

        $(document).on('click', 'a.del', function(e) {
            e.preventDefault();
            $(this).delDialog($(this).data("action"));
        });
    </script>
    </#if>

</#macro>

