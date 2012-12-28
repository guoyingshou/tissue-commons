<#import 'spring.ftl' as spring />

<#macro showTopicRelatedEvents>
    <ul>
    <#list events as event>
        <#if event.type = "topic">
            <@showTopicEvent event />
        </#if>
        <#if event.type = "plan">
            <@showPlanEvent event />
        </#if>
         <#if event.type = "members">
            <@showPlanMembersEvent event />
        </#if>
        <#if event.type = "concept" || event.type = "note" || event.type = "tutorial">
            <@showPostEvent event />
        </#if>
        <#if event.type = "postMessage">
            <@showPostMessageEvent event />
        </#if>
         <#if event.type = "postMessageComment">
            <@showPostMessageCommentEvent event />
        </#if>
        <#if event.type = "question">
            <@showQuestionEvent event />
        </#if>
          <#if event.type = "questionComment">
            <@showQuestionCommentEvent event />
        </#if>
        <#if event.type = "answer">
            <@showAnswerEvent event />
        </#if>
        <#if event.type = "answerComment">
            <@showAnswerCommentEvent event />
        </#if>
     </#list>
    </ul>
</#macro>

<#macro showLatestEvents>
    <ul>
    <#list events as event>
        <#if event.type = "topic">
            <@showTopicEvent event />
        </#if>
        <#if event.type = "plan">
            <@showPlanEvent event />
        </#if>
         <#if event.type = "members">
            <@showPlanMembersEvent event />
        </#if>
     </#list>
    </ul>
</#macro>

<#macro showTopicEvent event>
    <li>
        <@spring.messageArgs "i18n.event.topicMessage" event.messageArgs />
    </li>
</#macro>

<#macro showPlanEvent event>
    <li>
        <@spring.messageArgs "i18n.event.planMessage" event.messageArgs />
    </li>
</#macro>

<#macro showPlanMembersEvent event>
    <li>
        <@spring.messageArgs "i18n.event.memberMessage" event.messageArgs />
    </li>
</#macro>

<#macro showPostEvent event>
    <li>
        <@spring.messageArgs "i18n.event.postMessage" event.messageArgs />
    </li>
</#macro>

<#macro showPostMessageEvent event>
    <li>
        <@spring.messageArgs "i18n.event.postMessageMessage" event.messageArgs />
    </li>
</#macro>

<#macro showPostMessageCommentEvent event>
    <li>
        <@spring.messageArgs "i18n.event.postMessageCommentMessage" event.messageArgs />
    </li>
</#macro>

<#macro showQuestionEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        asked a question: <a href="/group/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showQuestionCommentEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        has commented a question: <a href="/group/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAnswerEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        answer a question: <a href="/group/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAnswerCommentEvent event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        has commented an answer in question: <a href="/group/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showFriendsEvents>
    <ul>
    <#list events as event>
 
        <#if event.type = 'accept'>
            <@showAcceptEvents event />
        </#if>
        <#if event.type = 'accepted'>
            <@showAcceptedEvents event />
        </#if>

    </#list>
</#macro>

<#macro showAcceptEvents event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        become a friend with <a href="/profile/users/${event.object.id}">${event.object.displayName}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAcceptedEvents event>
    <li>
        <a href="/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        <#if viewer.id = event.object.id>
            has accepted my invitation
        <#else>
            become a friend with <a href="/profile/users/${event.object.id}">${event.object.displayName}</a> 
        </#if>
        at : ${event.published?datetime}
    </li>
</#macro>


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
 
        <#--
        $(document).on('click', 'a.msg-comment-del', function(e) {
            e.preventDefault();

            var action = $(this).data("action");
            console.log(action);
        });
          -->
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

<#macro showPager>
    <#assign pages = (pager.total / pager.size)?ceiling />
    <#if (pages > 1)>
        <div class="pager">
           <#if (pager.current > 1)>
              <a href="?page=${pager.current-1}&size=${pager.size}">prev</a>
           </#if>

           <#if (pages <= 6)>
              <#list 1..pages as page>
                  <#if (page = pager.current)>
                      <span class="cur">
                  <#else> 
                      <span>
                  </#if>
                  <a href="?page=${page}&size=${pager.size}">${page}</a></span>
              </#list>
           <#else>
              <#if ((pager.current - 2) <= 2)>
                  <#list 1..5 as page>
                      <#if (page = pager.current)>
                          <span class="cur">
                      <#else>
                          <span>
                      </#if>
                          <a href="?page=${page}&size=${pager.size}">${page}</a></span>
                  </#list>
                  ...<span>${pages}</span>
              <#elseif ((pages - pager.current) <= 2)>
                  <span>1</span>...
                  <#list (pages - 4)..pages as page>
                      <#if (page = pager.current)>
                          <span class="cur">
                      <#else>
                          <span>
                      </#if> 
                      <a href="?page=${page}&size=${pager.size}">${page}</a></span>
                  </#list>
              <#else>
                  <span>1</span>...
                  <#list (pager.current - 2)..(pager.current +2) as page>
                      <#if (page = pager.current)>
                          <span class="cur">
                      <#else>
                          <span>
                      </#if>
                      <a href="?page=${page}&size=${pager.size}">${page}</a></span>
                  </#list>
                  ...<span>${pages}</span>
              </#if>
           </#if>

           <#if (pager.current < pages)>
              <a href="?page=${pager.current+1}&size=${pager.size}">next</a>
           </#if>
        </div>
    </#if>
</#macro>


