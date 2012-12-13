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
        <#if event.type = "concept">
            <@showConceptEvent event />
        </#if>
        <#if event.type = "note">
            <@showNoteEvent event />
        </#if>
        <#if event.type = "tutorial">
            <@showTutorialEvent event />
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
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a topic: <a href="http://www.tissue.com/u2/plan/topics/${event.object.id}">${event.object.title}</a> 
        at: ${event.published?datetime}
    </li>
</#macro>

<#macro showPlanEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a plan in <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}"> ${event.target.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showPlanMembersEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        joined a plan in <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}"> ${event.target.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showConceptEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a concept: <a href="http://www.tissue.com/u2/plan/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showNoteEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a note: <a href="http://www.tissue.com/u2/plan/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showTutorialEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a tutorial: <a href="http://www.tissue.com/u2/plan/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showPostMessageEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        leave a message to: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showPostMessageCommentEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        has commented a message in: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>


<#macro showQuestionEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        asked a question: <a href="http://www.tissue.com/u2/plan/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showQuestionCommentEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        has commented a question: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAnswerEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        answer a question: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAnswerCommentEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        has commented an answer in question: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
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
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        become a friend with <a href="http://www.tissue.com/u1/profile/users/${event.object.id}">${event.object.displayName}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showAcceptedEvents event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        <#if viewer.id = event.object.id>
            has accepted my invitation
        <#else>
            become a friend with <a href="http://www.tissue.com/u1/profile/users/${event.object.id}">${event.object.displayName}</a> 
        </#if>
        at : ${event.published?datetime}
    </li>
</#macro>


<#macro showPostList posts>
<ul id="postList">
   <#list posts as post>
       <li>
           <span><a href="/u2/plan/posts/${post.id}" class="post">${post.title}</a></span>
           <span><a href="/u1/profile/users/${post.user.id}">${post.user.displayName}</a></span>
       </li>
   </#list>
</ul>
</#macro>

<#macro showPostDetail>
<div id="postDetail">
    <h3>title: ${post.title}</h3>
    <p class="author">user: ${post.user.displayName}</p>
    <p class="entry">content: ${post.content}</p>

    <div class="message">
        <#if post.messages??>
            <h2>Messages: </h2>
            <ul>
                <#list post.messages as msg>
                    <li>
                        <div>
                            <div>${msg.content}</div>

                            <div>
                                <#if msg.comments??>
                                    <ul>
                                        <#list msg.comments as comment>
                                            <li>${comment.content}</li>
                                        </#list>
                                    </ul>
                                </#if>
                            </div>
                        </div>
                        <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
                        <div>
                            <p><a class="comment" href="#">comment</a></p>
                            <form class="commentForm" action= "<@spring.url '/plan/posts/${post.id}/messages/${msg.id}/comments'/>" method="post">
                                    <textarea name="content"></textarea>
                                    <input type="submit" value="submit" />
                            </form>
                        </div>
                        </#if>
                    </li>
                </#list>
            </ul>
        </#if>
    </div>

    <#if viewer?? && post.plan.isActive() && post.plan.isOwnerOrMember(viewer.id)>
    <form id="messageForm" action="<@spring.url '/plan/posts/${post.id}/messages' />" method="post"> 
        <fieldset>
            <legend>Leave a message</legend>
            <textarea id="messagecontent" name="content" cols="60" rows="20"></textarea>
            <input type="submit" value="submit" />
        </fieldset>
    </form>

    <script type="text/javascript">
            $(document).ready(function() {
                CKEDITOR.replace('messagecontent');

                $('.commentForm').hide();
                $('a.comment').on('click', function() {
                    $target = $(this).parent().next();
                    $target.toggle();
                    return false;
                });
            });
    </script>

    </#if>
</div>

</#macro>


<#macro showQuestionDetail>
<div id="questionDetail">
    <h3>title: ${post.title}</h3>
    <p class="author">user: ${post.user.displayName}</p>
    <p class="entry">content: ${post.content}</p>
    <#if post.comments??>
        <div>
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

    <div>
        <p><a class="comment" href="#">comment</a></p>
        <form class="commentForm" action="<@spring.url '/plan/questions/${post.id}/comments'/>" method="post">
            <textarea name="content"></textarea>
            <input type="submit" value="submit" />
        </form>
    </div>
 
    <div class="answers">
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
                            <form class="commentForm" action= "<@spring.url '/plan/posts/${post.id}/answers/${answer.id}/comments'/>" method="post">
                                    <textarea name="content"></textarea>
                                    <input type="submit" value="submit" />
                            </form>
                        </div>
                    </li>
                </#list>
            </ul>
        </#if>
    </div>

    <form id="answerForm" action="<@spring.url '/plan/posts/${post.id}/answers'/>" method="post" > 
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

           <#if (pages < 7)>
              <#list 1..pages as page>
                  <#if (page = pager.current)>
                      <span class="cur">
                  <#else> 
                      <span>
                  </#if>
                  <a href="?page=${page}&size=${pager.size}">${page}</a></span>
              </#list>
           <#else>
              <#if (pager.current < 5)>
                  <#list 1..5 as page>
                      <#if (page = pager.current)>
                          <span class="cur">
                      <#else>
                          <span>
                      </#if>
                          <a href="?page=${page}&size=${pager.size}">${page}</a></span>
                  </#list>
                  ...<span>${pages}</span>
              <#else>
                  <#if ((pager.current +3) >= pages)>
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
           </#if>

           <#if (pager.current < pages)>
              <a href="?page=${pager.current+1}&size=${pager.size}">next</a>
           </#if>
        </div>
    </#if>
</#macro>

