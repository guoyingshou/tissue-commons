<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#macro showActivePlan>
    <div id="active-group">
    <#if activePlan??>
        <#if viewer??>
            <#if activePlan.isOwner(viewer.id) || activePlan.isMember(viewer.id)>

            <#assign plan = activePlan in formGadgets />
            <@formGadgets.postForm />

            <a class="icon-post" data-action="<@spring.url '/plans/${activePlan.id}/posts'/>" href="#">new post</a>

            <script type="text/javascript">
                $(document).on('click', 'a.icon-post', function(e) {
                    e.preventDefault();
                    $('#content').newPostDialog();
                });
            </script>
            <#else>
                <a class="icon-join" href="<@spring.url '/topics/${topic.id}/plans/${activePlan.id}/join'/>">join</a>
            </#if> 
        </#if>

        <h4>Active Study Group</h4>
        <div class="group-info">
            <p><a href="<@spring.url '/plans/${activePlan.id}'/>">${activePlan.createTime?date}</a></p>
            <p>duration: ${activePlan.duration} Months</p>
            <p>created by: ${activePlan.user.displayName}</p>
        </div>
        <#if activePlan.members??>
        <div class="group-members">
            <#list activePlan.members as member>
                ${member.displayName}
            </#list>
        </div>
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
    </div>
</#macro>

<#macro showDeadPlans>
    <#if topic.deadPlans??>
    <div>
        <h4>Finished Plans</h4>
        <ul>
        <#list topic.deadPlans as plan>
            <li>
                <p class="ajx"><a href="<@spring.url '/plans/${plan.id}' />">${plan.createTime?date}</a></p>
                <p>duration: ${plan.duration} Months</p>
                <p>created by : <a href="/profile/users/${plan.user.id}" target="_top">${plan.user.displayName}</a></p>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>


