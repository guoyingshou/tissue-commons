<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

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
    <ul class="action">
        <li>
            <a class="create-topic" href="<@spring.url '/topics/_create' />">
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

<#macro topicMenu>
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
        <a id="create-article" href="<@spring.url '/topics/${topic.id?replace("#", "")}/articles/_create'/>">
            <@spring.message "Create.post" />
        </a>
        <a id="create-question" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions/_create'/>">
            <@spring.message "Create.question" />
        </a>
        <#else>
        <a href="<@spring.url '/plans/${topic.activePlan.id?replace("#", "")}/_join'/>">
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

