<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro topicForm>
    <form id="topicForm" class="dialog pop-650" style="display:none" method="post">
        <legend>
            <@spring.message "Legend.topicForm" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="title">
                    <@spring.message "Label.topicForm.title" />
                    <span class="error" style="display: none">
                        <@spring.message "NotEmpty.topicForm.title" />
                    </span>
                </label>
                <input type="input" class="sum" id="title" name="title" />
            </li>
            <li>
                <label for="content">
                    <@spring.message "Label.topicForm.objective" />
                    <span class="error" style="display: none">
                        <@spring.message "NotEmpty.topicForm.objective" />
                    </span>
                 </label>
                <textarea class="sum" id="content" name="content"></textarea>
            </li>
            <li>
                <label for="tags">
                    <@spring.message "Label.topicForm.tags" />
                    <span class="error" style="display: none">
                        <@spring.message "NotEmpty.topicForm.tags" />
                    </span>
                 </label>
                <input type="input" class="sum" id="tags" name="tags" />
            </li>
            <li>
                <input type="hidden" name="type" value="topic" />
            </li>
 
            <li>
                <input type="submit" value="<@spring.message 'Submit.button'/>" />
            </li>
        </ul>
    </form>
</#macro>

<#macro createPlanForm>
    <form id="createPlanForm" class="dialog pop-320" style="display:none" action="<@spring.url '/topics/${topic.id?replace("#", "")}/plans/_create' />" method="post">
        <legend>
            <@spring.message 'Legend.planForm' />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>

        <ul>
            <li>
                <label>
                    <input type="radio" name="duration" checked value="1" />
                    <@spring.message 'Label.planForm.duration1' />
                </label>
            </li>
            <li>
                <label>
                    <input type="radio" name="duration" value="3" />
                    <@spring.message 'Label.planForm.duration2' />
                </label>
            </li>
            <li>
                <label>
                    <input type="radio" name="duration" value="6" />
                    <@spring.message 'Label.planForm.duration3' />
                </label>
            </li>
            <li>
                <input type="submit" value="<@spring.message 'Submit.button'/>" />
            </li>
        </ul>
    </form>
</#macro>

<#macro exploreLogo>
    <h1>
        <@spring.message "Sitename" />
        <span><@spring.message "Siteslogan" />
    </h1>
</#macro>

<#macro exploreMenu selected="trending">
    <ul class="menu">
        <li>
            <a class="<#if selected = 'trending'>current</#if>" href="<@spring.url '/explore' />">
                <@spring.message "Menu.explore.trending" />
            </a>
        </li>
        <li>
            <a class="<#if selected = 'featured'>current</#if>" href="<@spring.url '/featured' />">
                <@spring.message "Menu.explore.featured" />
            </a>
        </li>
        <li>
            <a class="<#if selected = 'topics'>current</#if>" href="<@spring.url '/topics' />">
                <@spring.message "Menu.explore.topics" />
            </a>
        </li>
        <li>
            <a class="<#if selected = 'tags'>current</#if>" href="<@spring.url '/tags' />">
                <@spring.message "Menu.explore.tags" />
            </a>
        </li>
    </ul>

    <#if viewerAccount??>
    <@topicGadgets.topicForm />
    <ul class="action">
        <li>
            <a class="create-topic" data-action="<@spring.url '/topics/_create' />" href="#">
                <@spring.message "Menu.explore.createTopic" />
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

<#macro topicMenu selected='all'>
  <ul class="menu">
      <li>
          <a class="<#if selected = 'all'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/posts' />">
              <@spring.message "Menu.posts.all" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'concept'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/concepts' />">
              <@spring.message "Menu.posts.concept" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'note'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#","")}/notes' />">
              <@spring.message "Menu.posts.note" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'tutorial'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/tutorials' />">
              <@spring.message "Menu.posts.tutorial" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'question'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions' />">
              <@spring.message "Menu.posts.question" />
          </a>
      </li>
      <li>
          <a class="<#if selected = 'objective'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/objective' />">
              <@spring.message "Menu.topic.objective" />
          </a>
      </li>
</ul>

<ul class="action">
    <#if viewerAccount??>
    <#if !topic.isDeleted() && topic.activePlan??>
    <li>
        <#if isMember || topic.activePlan.isOwner(viewerAccount.id) >
        <a id="create-article" href="<@spring.url '/topics/${topic.id?replace("#", "")}/articles/_form'/>">
            <@spring.message "Create.post" />
        </a>
        <a id="create-question" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions/_form'/>">
            <@spring.message "Create.question" />
        </a>
        <#else>
        <a href="<@spring.url '/topics/${topic.id?replace("#", "")}/plans/${topic.activePlan.id?replace("#", "")}/_join'/>">
            <@spring.message "Join.plan" />
        </a>
        </#if> 
    </li>
    <#else>
    <li>
        <@createPlanForm />
        <a class="create-plan" href="#">
            <@spring.message "Host.plan" />
        </a>
    </li>
    </#if>
    </#if>
</u>
</#macro>

<#macro showTopicObjective>
    <div class="ts">
        <span>
            ${topic.account.user.displayName}
            [ <@commonGadgets.showTimeBefore topic.timeBefore /> ]
        </span>
    </div>
    <div class="tags">
        <#list topic.tags as tag>
            <span><a href="<@spring.url '/tags/${tag}' />">${tag}</a></span>
        </#list>
    </div>
    <div class="content">
        ${topic.content}
    </div>

    <#if !topic.deleted>
    <@commonGadgets.deleteConfirmForm />
    <#if viewerAccount?? && topic.isOwner(viewerAccount.id)>
        <@topicForm />

        <a class="update-topic" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/_update' />" href="#">
           <@spring.message 'Update.topic' />
        </a>
        <a class="delete" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'Delete.topic' />
        </a>
    <#else>
        <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'Delete.topic' />
            </a>
        </@sec.authorize>
    </#if>
    </#if>
</#macro>

<#macro showTopics>
    <ul>
    <#list topics as topic>
        <li>
            <div class="ts">
                <a href="/social/users/${topic.account.user.id?replace("#", "")}/posts">${topic.account.user.displayName}</a>
                [ <@commonGadgets.showTimeBefore topic.timeBefore /> ]
            </div>
            <div class="title">
                <a href="/group/topics/${topic.id?replace("#", "")}/objective">${topic.title}</a>
            </div>
        </li>
    </#list>
    </ul>
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
    <div>
        <h4>
            <@spring.message "Live.topic.plan" />
        </h4>
        <div class="ts">
            <a href="/group/plans/${topic.activePlan.id?replace("#", "")}/posts">
                <@commonGadgets.showTimeRemaining topic.activePlan.timeRemaining />
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
    <div>
        <h4>
            <@spring.message "Archived.topic.plans" />
        </h4>
        <ul>
        <#list topic.archivedPlans as plan>
            <li>
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
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro showNewTopics>
    <div>
        <h4>
            <@spring.message "Latest.topics" />
        </h4>
        <ul>
        <#list newTopics as topic>
            <li>
                <div class="ts">
                     <a href="/social/users/${topic.account.user.id?replace("#", "")}/posts">${topic.account.user.displayName}</a>
                     <@commonGadgets.showTimeBefore topic.timeBefore />
                </div>
                <div>
                    <a href="/group/topics/${topic.id?replace("#", "")}/posts">
                        ${topic.title}
                    </a>
                </div>
            </li>
        </#list>
        </ul>
    </div>
</#macro>

