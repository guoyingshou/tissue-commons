<#import 'spring.ftl' as spring />
<#import 'siteGadgets.ftl' as site />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro exploreLogo>
    <h1>
        <@spring.message "Sitename" />
        <span><@spring.message "Siteslogan" />
    </h1>
</#macro>

<#macro exploreMenu>
    <ul class="menu">
        <li>
            <a class="<#if selected = 'trending'>current</#if>" href="<@spring.url '/explore' />">
                <@spring.message "explore.trending" />
            </a>
        </li>
        <li>
            <a class="<#if selected = 'featured'>current</#if>" href="<@spring.url '/featured' />">
                <@spring.message "explore.featured" />
            </a>
        </li>
        <li>
            <a class="<#if selected = 'topics'>current</#if>" href="<@spring.url '/topics' />">
                <@spring.message "explore.topics" />
            </a>
        </li>
        <li>
            <a class="<#if selected = 'tags'>current</#if>" href="<@spring.url '/tags' />">
                <@spring.message "explore.tags" />
            </a>
        </li>
    </ul>

    <#if viewerAccount??>
    <ul class="action">
        <li>
            <a class="create-topic" href="<@spring.url '/topics/_create' />">
                <@spring.message "explore.createTopic" />
            </a>
        </li>
    </ul>
    </#if>
</#macro>

<#macro topicLogo>
  <h1>
      <a href="<@spring.url '/topics/${topic.id?replace("#","")}/posts' />">${topic.title}</a>
  </h1>
</#macro>

<#macro topicMenu>
  <ul class="menu">
      <li>
          <a class="<#if selected = 'all'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/posts' />">
              <@spring.message "topic.all" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'concept'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/concepts' />">
              <@spring.message "topic.concept" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'note'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#","")}/notes' />">
              <@spring.message "topic.note" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'tutorial'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/tutorials' />">
              <@spring.message "topic.tutorial" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'question'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions' />">
              <@spring.message "topic.question" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'objective'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/objective' />">
              <@spring.message "topic.objective" />
          </a>
      </li>
</ul>

<ul class="action">
    <#if viewerAccount??>
    <#if !topic.isDeleted() && topic.activePlan??>
    <li>
        <#if isMember || topic.activePlan.isOwner(viewerAccount.id) >
        <a id="create-article" href="<@spring.url '/topics/${topic.id?replace("#", "")}/articles/_create'/>">
            <@spring.message "topic.createArticle" />
        </a>
        <a id="create-question" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions/_create'/>">
            <@spring.message "topic.createQuestion" />
        </a>
        <#else>
        <a href="<@spring.url '/plans/${topic.activePlan.id?replace("#", "")}/_join'/>">
            <@spring.message "topic.joinPlan" />
        </a>
        </#if> 
    </li>
    <#else>
    <li>
        <a href="<@spring.url '/topics/${topic.id?replace("#","")}/plans/_create' />">
            <@spring.message "topic.hostPlan" />
        </a>
    </li>
    </#if>
    </#if>
</u>
</#macro>

<#macro showPlanSidebar>
    <#if topic.deleted>
       <div>closed</div>
    <#else>
        <@showPlanLive />
        <@showPlansArchived />
    </#if>
</#macro>

<#macro showPlanLive>
    <#if topic.activePlan??>
    <div class="active">
        <h4>
            <@spring.message "Live.topic.plan" />
        </h4>

        <div class="ts">
            <a href="/group/plans/${topic.activePlan.id?replace("#", "")}/posts">
                <@site.showTimeRemaining topic.activePlan.timeRemaining />
            </a>
        </div>

        <div>
            <a href="/social/users/${topic.activePlan.account.user.id?replace("#", "")}/posts">
                ${topic.activePlan.account.user.displayName}
            </a>
        </div>

        <div>
            ${topic.activePlan.account.user.headline!""}
        </div>
    </div>
    </#if>
</#macro>

<#macro showPlansArchived>
    <#if topic.archivedPlans??>
    <div class="archived">
        <h4>
            <@spring.message "Archived.topic.plans" />
        </h4>
        <#list topic.archivedPlans as plan>
        <div class="plan">
            <div class="ts">
                <a href="/group/plans/${plan.id?replace("#", "")}/posts">
                    ${plan.createTime?date} - ${plan.endTime?date}
                </a>
            </div>
            <div>
                <a href="/social/users/${plan.account.user.id?replace("#", "")}/posts">
                    ${plan.account.user.displayName}
                </a>
            </div>
            <div>
                ${plan.account.user.headline!""}
            </div>
        </div>
        </#list>
    </div>
    </#if>
</#macro>

<#macro messageForm>
<form id="messageForm" class="dialog pop-650" style="display:none" method="post">
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

<#macro replyForm>
<form id="replyForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Reply
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

<#macro showPosts>
<ul class="posts">
   <#list posts as post>
   <li class="icon-container">
       <#if post.type == 'concept'>
       <span class="icon" data-icon="&#xe007;"></span>
       <#elseif post.type = 'note'>
       <span class="icon" data-icon="&#xe008;"></span>
       <#elseif post.type = 'question'>
       <span class="icon" data-icon="&#xe009;"></span>
       <#else>
       <span class="icon" data-icon="&#xe01c;"></span>
       </#if>

       <div class="ts">
           <a href="/social/users/${post.account.user.id?replace("#", "")}/posts">${post.account.user.displayName}</a>
           [ <@site.showTimeBefore post.timeBefore /> ]
       </div>

       <div>
       <#if post.type == 'question'>
           <a href="/group/questions/${post.id?replace("#","")}" class="post">${post.title}</a>
       <#else>
           <a href="/group/articles/${post.id?replace("#","")}" class="post">${post.title}</a>
       </#if>
       </div>
   </li>
   </#list>
</ul>
</#macro>

