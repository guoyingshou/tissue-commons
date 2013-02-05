<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />
<#import 'utilGadgets.ftl' as utilGadgets />

<#macro topicLogo title='all'>
  <h1><a href="<@spring.url '/topics/${topic.id}/posts' />">${topic.title}</a></h1>
  <div>
      <ul class="menu">
          <li>
              <a class="<#if title = 'all'>current</#if>" href="<@spring.url '/topics/${topic.id}/posts' />">
                  <@spring.message "i18n.topic.menu.all" />
              </a>
          </li>

          <li>
              <a class="<#if title = 'concept'>current</#if>" href="<@spring.url '/topics/${topic.id}/concept/posts' />">
                  <@spring.message "i18n.topic.menu.concepts" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'note'>current</#if>" href="<@spring.url '/topics/${topic.id}/note/posts' />">
                  <@spring.message "i18n.topic.menu.notes" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'question'>current</#if>" href="<@spring.url '/topics/${topic.id}/question/posts' />">
                  <@spring.message "i18n.topic.menu.questions" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'tutorial'>current</#if>" href="<@spring.url '/topics/${topic.id}/tutorial/posts' />">
                  <@spring.message "i18n.topic.menu.tutorials" />
              </a>
          </li>
          <li>
              <a class="<#if title = 'objective'>current</#if>" href="<@spring.url '/topics/${topic.id}' />">
                  <@spring.message "i18n.topic.menu.objective" />
              </a>
          </li>
    </ul>

    <ul class="action">
    <#if topic.activePlan??>
        <#if viewer??>
            <#if topic.activePlan.isOwner(viewer.id) || topic.activePlan.isMember(viewer.id)>

            <a id="new-post" href="<@spring.url '/plans/${topic.activePlan.id}/posts/_new'/>">
                <@spring.message "i18n.topic.action.post" />
            </a>
<#--
            <#assign plan = topic.activePlan in formGadgets />
            <@formGadgets.postForm />

            <a id="new-post" data-action="<@spring.url '/plans/${topic.activePlan.id}/posts'/>" href="#">
                <@spring.message "i18n.topic.action.post" />
            </a>
            <script type="text/javascript">
                $(document).on('click', 'a#new-post', function(e) {
                    e.preventDefault();
                    $('#content').newPostDialog();
                });
            </script>
            -->

            <#else>
                <a href="<@spring.url '/topics/${topic.id}/plans/${topic.activePlan.id}/join'/>">
                    <@spring.message "i18n.topic.action.joinPlan" />
                </a>
            </#if> 
        </#if>
    <#else>
        <#if viewer??>
        <@formGadgets.planForm />
        <a class="planForm" href="#">
            <@spring.message "i18n.topic.action.createPlan" />
        </a>
        <script type="text/javascript">
            $(document).on('click', 'a.planForm', function(e) {
                e.preventDefault();
                $('#planDia').newPlanDialog();
            });
        </script>
        </#if>
    </#if>
    </u>
  </div>
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
                <a href="/group/topics/${topic.id}">${topic.title}</a>
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
            <@spring.message "i18n.topic.info.plan.live" />
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
            <@spring.message "i18n.topic.info.plan.archive" />
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
            <@spring.message "i18n.topic.info.newTopics" />
        </h4>
        <ul>
        <#list newTopics as topic>
            <li>
                <div class="ts">
                     <a href="/social/users/${topic.user.id}/posts">${topic.user.displayName}</a>
                     <@utilGadgets.showTimeBefore topic.timeBefore />
                </div>
                <div>
                    <a href="/group/topics/${topic.id}">
                        ${topic.title}
                    </a>
                </div>
            </li>
        </#list>
        </ul>
    </div>
</#macro>

