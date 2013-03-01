<#import 'spring.ftl' as spring />
<#import 'utilGadgets.ftl' as utilGadgets />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#--
   topicForm is used for create as well as update
 -->
<#macro topicForm>
    <form id="topicForm" class="dialog pop-650" style="display:none" method="post">
        <legend>
            <@spring.message "i18n.topic" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="title">
                    <@spring.message "i18n.topic.title" />
                </label>
                <input type="input" class="sum" id="title" name="title" />
            </li>
            <li>
                <label for="editor">
                    <@spring.message "i18n.topic.objective" />
                </label>
                <textarea class="sum" id="editor" name="content"></textarea>
            </li>
            <li>
                <label for="tags">
                   <@spring.message "i18n.topic.tags" />
                </label>
                <input type="input" class="sum" id="tags" name="tags" />
            </li>
            <li>
                <input type="submit" value="<@spring.message 'i18n.button.submit'/>" />
            </li>
        </ul>
    </form>
</#macro>

<#macro deleteTopicForm>
    <form id="deleteTopicForm" class="dialog pop-650" style="display:none" method="post">
        <legend>
            <@spring.message "i18n.topic.delete" />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>
        <ul>
            <li>
                <label for="reason">
                    <@spring.message "i18n.topic.delete.reason" />
                </label>
                <textarea id="reason" name="content"></textarea>
            </li>
            <li>
                <input type="submit" value="<@spring.message 'i18n.button.submit' />"/>
            </li>
        </ul>
    </form>
</#macro>

<#macro createPlanForm>
    <form id="createPlanForm" class="dialog pop-320" style="display:none" action="<@spring.url '/topics/${topic.id?replace("#", "")}/plans/_create' />" method="post">
        <legend>
            <@spring.message 'i18n.topic.plan.duration' />
            <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
        </legend>

        <ul>
            <li>
                <label>
                    <input type="radio" name="duration" checked value="1" />
                    <@spring.message 'i18n.topic.plan.duration.1month' />
                </label>
            </li>
            <li>
                <label>
                    <input type="radio" name="duration" value="3" />
                    <@spring.message 'i18n.topic.plan.duration.3month' />
                </label>
            </li>
            <li>
                <label>
                    <input type="radio" name="duration" value="6" />
                    <@spring.message 'i18n.topic.plan.duration.6month' />
                </label>
            </li>
            <li>
                <input type="submit" value="<@spring.message 'i18n.button.submit'/>" />
            </li>
        </ul>
    </form>
</#macro>

<#macro topicLogo title='posts'>
  <h1>
      <a href="<@spring.url '/topics/${topic.id?replace("#","")}/posts' />">${topic.title}</a>
  </h1>
  <div>
      <ul class="menu">
          <li>
              <a class="<#if title = 'posts'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/posts' />">
                  <@spring.message "i18n.topic.post.all" />
              </a>
          </li>

          <li>
              <a class="<#if title = 'concept'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/concept/posts' />">
                  <@spring.message "i18n.topic.post.concept" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'note'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#","")}/note/posts' />">
                  <@spring.message "i18n.topic.post.note" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'question'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/question/posts' />">
                  <@spring.message "i18n.topic.post.question" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'tutorial'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/tutorial/posts' />">
                  <@spring.message "i18n.topic.post.tutorial" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'objective'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/objective' />">
                  <@spring.message "i18n.topic.objective" />
              </a>
          </li>
    </ul>

    <ul class="action">
        <#if !topic.isDeleted() && viewerAccount?? && topic.activePlan??>
        <li>
            <#if topic.activePlan.isOwner(viewerAccount.id) || topic.activePlan.isMember(viewerAccount.id)>
                <a id="create-post" href="<@spring.url '/topics/${topic.id?replace("#", "")}/posts/_form'/>">
                    <@spring.message "i18n.topic.post.create" />
                </a>
            <#else>
                <a href="<@spring.url '/topics/${topic.id?replace("#", "")}/plans/${topic.activePlan.id?replace("#", "")}/_join'/>">
                    <@spring.message "i18n.topic.plan.joinPlan" />
                </a>
            </#if> 
        </li>
        <#else>
        <li>
            <@createPlanForm />
            <a class="create-plan" href="#">
                <@spring.message "i18n.topic.plan.hostPlan" />
            </a>
        </li>
        </#if>
    </u>
  </div>
</#macro>

<#macro showTopicDetails>
    <div class="ts">
        <span>
            ${topic.account.user.displayName}
            [ <@utilGadgets.showTimeBefore topic.timeBefore /> ]
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
    <@deleteTopicForm />
    <#if viewerAccount?? && topic.isOwner(viewerAccount.id)>
        <@topicForm />

        <a class="update-topic" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/_update' />" href="#">
           <@spring.message 'i18n.action.edit' />
        </a>
        <a class="delete-topic" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'i18n.topic.delete' />
        </a>
    <#else>
        <@sec.authorize access="hasRole('ROLE_ADMIN')">
            <a class="delete-topic" data-action="<@spring.url '/topics/${topic.id?replace("#", "")}/_delete' />" href="#">
                <@spring.message 'i18n.topic.delete' />
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
                [ <@utilGadgets.showTimeBefore topic.timeBefore /> ]
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
        <@showLivePlan />
        <@showArchivedPlans />
    </#if>
</#macro>

<#macro showLivePlan>
    <#if topic.activePlan??>
    <div>
        <h4>
            <@spring.message "i18n.topic.plan.live" />
        </h4>
        <div class="ts">
            <a href="/group/topics/${topic.id?replace("#","")}/plans/${topic.activePlan.id?replace("#", "")}">
                <@utilGadgets.showTimeRemaining topic.activePlan.timeRemaining />
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

<#macro showArchivedPlans>
    <#if topic.archivedPlans??>
    <div>
        <h4>
            <@spring.message "i18n.topic.plan.archived" />
        </h4>
        <ul>
        <#list topic.archivedPlans as plan>
            <li>
                <div class="ts">
                    <a href="/group/topics/${topic.id?replace("#","")}/plans/${plan.id?replace("#", "")}">
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
            <@spring.message "i18n.topic.newTopics" />
        </h4>
        <ul>
        <#list newTopics as topic>
            <li>
                <div class="ts">
                     <a href="/social/users/${topic.account.user.id?replace("#", "")}/posts">${topic.account.user.displayName}</a>
                     <@utilGadgets.showTimeBefore topic.timeBefore />
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

