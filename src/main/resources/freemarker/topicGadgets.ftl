<#import 'spring.ftl' as spring />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro topicForm>
    <#if viewer??>
        <div id="topicForm" class="dialog pop-650" style="display: none">
            <form method="post">
                <legend>
                    <@spring.message "i18n.topic" />
                    <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
                </legend>
                <ul>
                    <li>
                        <label for="title">
                            <@spring.message "i18n.topic.title" />
                            <span style="display: none">
                                <@spring.message "i18n.error.empty" />
                            </span>
                        </label>
                        <input type="input" class="sum" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">
                            <@spring.message "i18n.topic.objective" />
                            <span style="display: none">
                                <@spring.message "i18n.error.empty" />
                            </span>
                        </label>
                        <textarea class="sum" id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <label for="tags">
                            <@spring.message "i18n.topic.tags" />
                            <span style="display: none">
                                <@spring.message "i18n.error.empty" />
                            </span>
                        </label>
                        <input type="input" class="sum" id="tags" name="tags" />
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
            </form>
        </div>
    </#if>
</#macro>

<#macro planForm>
    <div id="planForm" class="dialog pop-320" style="display: none">
        <form action="<@spring.url '/topics/${topic.id}/plans' />" method="post">
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
                </ul>
            <input type="submit" value="<@spring.message 'i18n.button.submit'/>" />
        </form>
    </div>
</#macro>

<#macro topicLogo title='posts'>
  <h1><a href="<@spring.url '/topics/${topic.id}/posts' />">${topic.title}</a></h1>
  <div>
      <ul class="menu">
          <li>
              <a class="<#if title = 'posts'>current</#if>" href="<@spring.url '/topics/${topic.id}/posts' />">
                  <@spring.message "i18n.topic.post.all" />
              </a>
          </li>

          <li>
              <a class="<#if title = 'concept'>current</#if>" href="<@spring.url '/topics/${topic.id}/concept/posts' />">
                  <@spring.message "i18n.topic.post.concept" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'note'>current</#if>" href="<@spring.url '/topics/${topic.id}/note/posts' />">
                  <@spring.message "i18n.topic.post.note" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'question'>current</#if>" href="<@spring.url '/topics/${topic.id}/question/posts' />">
                  <@spring.message "i18n.topic.post.question" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'tutorial'>current</#if>" href="<@spring.url '/topics/${topic.id}/tutorial/posts' />">
                  <@spring.message "i18n.topic.post.tutorial" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'objective'>current</#if>" href="<@spring.url '/topics/${topic.id}/objective' />">
                  <@spring.message "i18n.topic.objective" />
              </a>
          </li>
    </ul>

    <ul class="action">
    <#if topic.activePlan??>
        <#if viewer??>
            <#if topic.activePlan.isOwner(viewer.id) || topic.activePlan.isMember(viewer.id)>
                <a id="new-post" href="<@spring.url '/plans/${topic.activePlan.id}/posts/_form'/>">
                    <@spring.message "i18n.topic.post.createPost" />
                </a>
            <#else>
                <a href="<@spring.url '/topics/${topic.id}/plans/${topic.activePlan.id}/join'/>">
                    <@spring.message "i18n.topic.plan.joinPlan" />
                </a>
            </#if> 
        </#if>
    <#else>
        <#if viewer??>
        <@planForm />
        <a class="plan-create" href="#">
            <@spring.message "i18n.topic.plan.hostPlan" />
        </a>
        </#if>
    </#if>
    </u>
  </div>
</#macro>

<#macro showTopicDetails>
           <div class="ts">
               <span>
                   ${topic.user.displayName}
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

           <#if viewer?? && topic.isOwner(viewer.id) >
               <@topicForm />
               <a class="topic-edit" data-action="<@spring.url '/topics/${topic.id}/update' />" href="#">
                   <@spring.message 'i18n.action.edit' />
               </a>
           </#if>
</#macro>

<#macro showTopics>
    <ul>
    <#list topics as topic>
        <li>
            <div class="ts">
                <a href="/social/users/${topic.user.id}/posts">${topic.user.displayName}</a>
                [ <@utilGadgets.showTimeBefore topic.timeBefore /> ]
            </div>
            <div class="title">
                <a href="/group/topics/${topic.id}/objective">${topic.title}</a>
            </div>
        </li>
    </#list>
    </ul>
</#macro>

<#macro showLivePlan>
    <#if topic.activePlan??>
    <#assign plan = topic.activePlan />
    <div>
        <h4>
            <@spring.message "i18n.topic.plan.live" />
        </h4>
        <div class="ts">
            <a href="/group/plans/${topic.activePlan.id}">
                <@utilGadgets.showTimeRemaining topic.activePlan.timeRemaining />
            </a>
        </div>

        <div>
            <a href="/social/users/${plan.user.id}/posts">
                ${plan.user.displayName}
            </a>
        </div>
        <div>
            ${plan.user.headline!""}
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
                    <a href="/group/plans/${plan.id}">
                        ${plan.createTime?date} - ${plan.endTime?date}
                    </a>
                </div>
                <div>
                    <a href="/social/users/${plan.user.id}/posts">
                        ${plan.user.displayName}
                    </a>
                </div>
                <div>
                    ${plan.user.headline!""}
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
                     <a href="/social/users/${topic.user.id}/posts">${topic.user.displayName}</a>
                     <@utilGadgets.showTimeBefore topic.timeBefore />
                </div>
                <div>
                    <a href="/group/topics/${topic.id}/posts">
                        ${topic.title}
                    </a>
                </div>
            </li>
        </#list>
        </ul>
    </div>
</#macro>

