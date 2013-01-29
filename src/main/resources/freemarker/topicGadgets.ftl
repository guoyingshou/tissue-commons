<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#macro topicLogo>
  <h1><a href="<@spring.url '/topics/${topic.id}/posts' />">${topic.title}</a></h1>
  <div>
      <ul class="menu">
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/concept/posts' />"><@spring.message "i18n.topic.menu.concepts" /></a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/note/posts' />"><@spring.message "i18n.topic.menu.notes" /></a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/question/posts' />"><@spring.message "i18n.topic.menu.questions" /></a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/tutorial/posts' />"><@spring.message "i18n.topic.menu.tutorials" /></a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}' />"><@spring.message "i18n.topic.menu.objective" /></a></li>
    </ul>

    <ul class="action">
    <#if topic.activePlan??>
        <#if viewer??>
            <#if topic.activePlan.isOwner(viewer.id) || topic.activePlan.isMember(viewer.id)>

            <#assign plan = topic.activePlan in formGadgets />
            <@formGadgets.postForm />

            <a class="icon-post" data-icon="&#xe000;" data-action="<@spring.url '/plans/${topic.activePlan.id}/posts'/>" href="#">new post</a>
            <script type="text/javascript">
                $(document).on('click', 'a.icon-post', function(e) {
                    e.preventDefault();
                    $('#content').newPostDialog();
                });
            </script>

            <#else>
                <a class="icon-join" href="<@spring.url '/topics/${topic.id}/plans/${topic.activePlan.id}/join'/>">join</a>
            </#if> 
        </#if>
    <#else>
        <#if viewer??>
        <@formGadgets.planForm />
        <a class="planForm" href="#">create plan</a>
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
            <div class="title">
                <a href="/group/topics/${topic.id}">${topic.title}</a>
            </div>
            <div class="ts">
                <a href="/social/users/${topic.user.id}/posts">${topic.user.displayName}</a>
                <span>${topic.createTime?datetime}</span>
            </div>
        </li>
    </#list>
    </ul>
</#macro>

<#macro showLivePlan>
    <#if topic.activePlan??>
    <#assign plan = topic.activePlan />
    <div>

        <h4>In progress</h4>
        <div class="plan-endtime ts">
        <#if plan.months != 0>
            ${plan.months} <@spring.message 'i18n.common.months' />
        <#elseif plan.weeks != 0>
            ${plan.weeks} <@spring.message 'i18n.common.weeks' />
        <#elseif plan.days != 0>
            ${plan.days} <@spring.message 'i18n.common.days' />
        <#elseif plan.hours != 0>
            ${plan.hours} <@spring.message 'i18n.common.hours' />
        <#elseif plan.minutes != 0>
            ${plan.minutes} <@spring.message 'i18n.common.minutes' />
        </#if>
        </div>

        <div>
            ${plan.user.displayName}
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
        <h4>Archived</h4>
        <ul>
        <#list topic.archivedPlans as plan>
            <li>
                <div class="plan-duration ts">
                    ${plan.createTime?date} - ${plan.endTime?date}
                </div>
                <div>
                    ${plan.user.displayName}
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


