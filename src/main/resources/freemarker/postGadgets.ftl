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

    <div class="article">
        <h3 class="article-title">${post.title}</h3>
        <div class="article-author">${post.user.displayName}</div>
        <div class="article-content">${post.content}</div>
        <a class="post-edit" data-action="<@spring.url '/posts/${post.id}' />" href="#">edit</a>
    </div>

    <h2>Messages: </h2>

    <ul class="messages">
    <#if post.messages??>
        <#list post.messages as msg>
        <li class="messageItem">

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
    <div class="message-actions">
        <a class="msg-add" data-action="<@spring.url '/posts/${post.id}/messages' />" href="#">add message</a>
    </div>
    </#if>

    <script type="text/javascript">

        $(document).on('click', 'a.post-edit', function(e) {
            e.preventDefault();
            $('div.article').editPostDialog($(this).data("action"));
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
    <div class="article">
        <h3>title: ${post.title}</h3>
        <p class="author">user: ${post.user.displayName}</p>
        <p class="entry">content: ${post.content}</p>
        <p><a class="edit" href="<@spring.url '/posts/${post.id}/edit' />">edit</a></p>
    </div>

    <#if post.comments??>
    <div class="commentList">
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

    <div class="commentAction">
        <p><a class="comment" href="#">comment</a></p>
        <form class="commentForm" action="<@spring.url '/posts/${post.id}/comments'/>" method="post">
            <textarea name="content"></textarea>
            <input type="submit" value="submit" />
        </form>
    </div>
 
    <div class="answersList">
        <#if post.answers??>
            <h2>answers: </h2>
            <ul>
                <#list post.answers as answer>
                    <li>
                        <div>
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
                        </div>
                        <div>
                            <p><a class="comment" href="#">comment</a></p>
                            <form class="commentForm" action= "<@spring.url '/posts/${post.id}/answers/${answer.id}/comments'/>" method="post">
                                    <textarea name="content"></textarea>
                                    <input type="submit" value="submit" />
                            </form>
                        </div>
                    </li>
                </#list>
            </ul>
        </#if>
    </div>

    <div class="answerAction">
        <form id="answerForm" action="<@spring.url '/posts/${post.id}/answers'/>" method="post" > 
            <fieldset>
                <legend>Your Answer </legend>
                <textarea id="answer" name="content" cols="60" rows="20"></textarea>
                <input type="submit" value="submit" />
            </fieldset>
        </form>

        <script type="text/javascript">
            $(document).ready(function() {
                CKEDITOR.replace('answer');

                $('.commentForm').hide();
                $('a.comment').on('click', function() {
                    $target = $(this).parent().next();
                    $target.toggle();
                    return false;
                });
            });
        </script>
    </div>
</#macro>

