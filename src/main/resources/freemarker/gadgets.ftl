<#macro showEvents>
    <ul>
    <#list events as event>
        <#if event.type = "topic">
            <@showTopicEvent event />
        </#if>
        <#if event.type = "plan">
            <@showPlanEvent event />
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

<#macro showConceptEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a concept: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showNoteEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a note: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
        at : ${event.published?datetime}
    </li>
</#macro>

<#macro showTutorialEvent event>
    <li>
        <a href="http://www.tissue.com/u1/profile/users/${event.actor.id}">${event.actor.displayName}</a> 
        created a tutorial: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
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
        asked a question: <a href="http://www.tissue.com/u2/plan/topics/${event.target.id}/posts/${event.object.id}">${event.object.title}</a> 
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




<#macro showPagedNav>
    <#if (pagedData.totalPages > 1)>
    <div>
        <#if (pagedData.currentPage > 1)>
        <span>
            <a href="?page=${pagedData.currentPage -1}&pageSize=${pagedData.pageSize}<#if type??>&type=${type}</#if><#if currentPlan??>&plan=${currentPlan.id}</#if>">prev</a>
        </span> 
        <#if (pagedData.startPage !=1)>
        <span>
            <a href="?page=1&pageSize=${pagedData.pageSize}<#if type??>&type=${type}</#if><#if currentPlan??>&plan=${currentPlan.id}</#if>">1</a></span><span>...</span>
        </#if>
        </#if>

        <#list pagedData.pagesList as page>
        
        <#if (page = pagedData.currentPage)>
        <span class="selected">
            <a href="?page=${page}&pageSize=${pagedData.pageSize}<#if type??>&type=${type}</#if><#if currentPlan??>&plan=${currentPlan.id}</#if>">${page}</a>
        </span>
        <#else>
        <span>
            <a href="?page=${page}&pageSize=${pagedData.pageSize}<#if type??>&type=${type}</#if><#if currentPlan??>&plan=${currentPlan.id}</#if>">${page}</a>
        </span>
        </#if>

       </#list>

       <#if (pagedData.endPage < pagedData.totalPages)>
       <span>...</span>
       <span>
           <a href="?page=${pagedData.totalPages}&pageSize=${pagedData.pageSize}<#if type??>&type=${type}</#if><#if currentPlan??>&plan=${currentPlan.id}</#if>">${pagedData.totalPages}</a>
       </span>
       </#if>
       <#if (pagedData.currentPage < pagedData.totalPages) >
       <span>
           <a href="?page=${pagedData.currentPage + 1}&pageSize=${pagedData.pageSize}<#if type??>&type=${type}</#if><#if currentPlan??>&plan=${currentPlan.id}</#if>">next</a>
       </span>
       </#if>
    </div>
    </#if>
</#macro>

<#macro showPagedTopics>
    <div class="pagedTopics">
        <ul>
            <#list pagedData.pagedItems as topic>
                <li>
                   <a href="http://www.tissue.com/u2/plan/topics/${topic.id}">${topic.title}</a>
                </li>
            </#list>
        </u>
    </div>
    <@showPagedNav />
</#macro>

<#macro showPagedPosts>
    <div class="pagedPosts">
        <ul>
            <#list pagedData.pagedItems as post>
                <li>
                   <a href="?post=${post.id}">${post.title}</a>
                </li>
            </#list>
        </u>
    </div>
    <@showPagedNav />
</#macro>
