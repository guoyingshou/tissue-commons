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

    <#if viewerAccount?? && (viewerActivePlansCount < 9)>
    <ul class="menu-action">
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
      <a href="<@spring.url '/topics/${topic.id?replace("#","")}/objective' />">${topic.title}</a>
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
</ul>

<ul class="plan-meta">
    <#if topic.deleted>
        <li>
            Deleted
        </li>

    <#elseif topic.activePlan??>

    <#if isMember>

    <li class="menu-action">
            <a id="create-article" href="<@spring.url '/topics/${topic.id?replace("#", "")}/articles/_create'/>">
                <@spring.message "topic.createArticle" />
            </a>
            <a id="create-question" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions/_create'/>">
                <@spring.message "topic.createQuestion" />
            </a>
    </li>

    <#elseif viewerAccount?? && (viewerActivePlansCount < 9)>

    <li class="menu-action">
            <a href="<@spring.url '/plans/${topic.activePlan.id?replace("#", "")}/_join'/>">
                <@spring.message "topic.joinPlan" />
            </a>
    </li>

    </#if>

    <li class="plan-active">
        <a href="/group/plans/${topic.activePlan.id?replace("#", "")}/posts">
            <@site.showTimeRemaining topic.activePlan.timeRemaining />
        </a>
        [<a href="/social/users/${topic.activePlan.account.user.id?replace("#", "")}/posts">
            ${topic.activePlan.account.user.displayName}
        </a>]
    </li>

    <#elseif viewerAccount?? && (viewerActivePlansCount <9) >
    <li class="menu-action">
            <a href="<@spring.url '/topics/${topic.id?replace("#","")}/plans/_create' />">
                <@spring.message "topic.hostPlan" />
            </a>
    </li>
    </#if>
</ul>

</#macro>

<#macro topicHeader>
    <div id="page-logo-wrapper">
        <div id="page-logo">
            <@topicLogo />
        </div>
    </div>

    <div id="page-menu-wrapper">
        <div id="page-menu">
            <@topicMenu />
        </div>
    </div>
</#macro>

<#macro showPlansArchived>
    <#if topic.archivedPlans??>
    <div class="archived">
        <h4>
            <@spring.message "ArchivedPlans" />
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

<#macro replyForm>
<form id="replyForm" class="dialog" style="display:none" method="post">
    <legend>
        <@spring.message 'Reply' />
    </legend>
    <ul>
        <li>
            <textarea id="reply-editor" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="<@spring.message 'Submit.button' />"/>
            <a href="#" class="cancel"><@spring.message 'Cancel' /></a>
        </li>
    </ul>
</form>

</#macro>

<#macro questionCommentForm>
<form id="questionCommentForm" class="dialog" style="display:none" method="post">
    <legend>
        Question Comment
    </legend>
    <ul>
        <li>
            <textarea id="questionComment-editor" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
            <a href="#" class="cancel"><@spring.message 'Cancel' /></a>
        </li>
    </ul>
</form>
</#macro>

<#macro answerCommentForm>
<form id="answerCommentForm" class="dialog" style="display:none" method="post">
    <legend>
        Answer comment
    </legend>
    <ul>
        <li>
            <textarea id="answerComment-editor" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
            <a href="#" class="cancel"><@spring.message 'Cancel' /></a>
        </li>
    </ul>
</form>
</#macro>

<#macro showPosts>
<ul class="posts">
   <#list posts as post>
   <li class="icon-container">
       <#if post.type == 'concept'>
       <span class="icon" data-icon="&#xe003;"></span>
       <#elseif post.type = 'note'>
       <span class="icon" data-icon="&#xe004;"></span>
       <#elseif post.type = 'tutorial'>
       <span class="icon" data-icon="&#xe005;"></span>
       <#else>
       <span class="icon" data-icon="&#xe006;"></span>
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

