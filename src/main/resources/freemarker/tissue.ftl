<#macro layout title="">
    <#include "header.ftl">
    <div id="mainWrapper">
        <#nested>
    </div>
    <#include "footer.ftl">
</#macro>

<#macro cnaLogo>
    <h1>${owner.displayName}</h1>
    <div>
        <ul class="menu">
            <li><a href="http://www.tissue.com/u2/plan/explore">about me</a></li>
            <li><a href="http://www.tissue.com/u2/plan/exploreTopics">actions</a></li>
        </ul>
        <ul class="action">
            <#if canInvite??>
            <li><a href="http://www.tissue.com/u1/profile/users/${owner.id}/invites">invite</a></li>
            </#if>
        </ul>
    </div>
</#macro>

<#macro dashboardLogo>
    <h1>Tissue Network</h1>
    <div>
        <ul class="menu">
            <li><a href="http://www.tissue.com/u1/profile/dashboard">NewsFeeds</a></li>
            <li><a href="http://www.tissue.com/u1/profile/actions">Actions</a></li>
        </ul>
    </div>
</#macro>

<#macro exploreLogo>
    <h1>Tissue Network</h1>
    <div>
        <ul class="menu">
            <li><a href="http://www.tissue.com/u2/plan/explore">Trends</a></li>
            <li><a href="http://www.tissue.com/u2/plan/exploreTopics">Topics</a></li>
            <li><a href="http://www.tissue.com/u2/plan/exploreTags">Tags</a></li>
            <li><a href="http://www.tissue.com/u2/plan/exploreTimeline">Timeline</a></li>
        </ul>
        <ul class="action">
            <li><a href="http://www.tissue.com/u2/plan/topics">New Topic</a></li>
        </ul>
    </div>
</#macro>

<#macro topicLogo>
  <h1><a href="http://www.tissue.com/u2/plan/topics/${topic.id}">${topic.title}</a></h1>
  <div>
      <ul class="menu">
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/concept">Concepts</a></li>
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/note">Notes</a></li>
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/question">Questions</a></li>
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/tutorial">Tutorials</a></li>
      </ul>
  </div>
</#macro>

<#macro showActivePlan>
    <div id="activePlan">
    <#if activePlan??>
        <#if viewer??>
            <#if activePlan.isOwnerOrMember(viewer.id)>
                <a class="ajx" href="<@spring.url '/plan/plans/${activePlan.id}/posts'/>">new post</a>
            <#else>
                <a href="<@spring.url '/plan/topics/${topic.id}/plans/${activePlan.id}/join'/>">join</a>
            </#if> 
        </#if>

        <h4>Active Study Group</h4>
        <div class="groupInfo">
            <p><a href="<@spring.url '/plan/plans/${activePlan.id}'/>">${activePlan.createTime?date}</a></p>
            <p>duration: ${activePlan.duration} Months</p>
            <p>created by: ${activePlan.user.displayName}</p>
        </div>
        <#if activePlan.members??>
        <div class="groupMembers">
            <#list activePlan.members as member>
                ${member.displayName}
            </#list>
        </div>
        </#if>
     <#else>
        <a class="ajx" href="<@spring.url '/plan/topics/${topic.id}/plans'/>">create plan</a>
    </#if>
    </div>

    <script type="text/javascript">
          $(document).ready(function() {
              $('#activePlan a.ajx').on('click', function(e) {
                  e.preventDefault();
                  $('#content').load(this.href);
              });
          });
    </script>
 
</#macro>

<#macro showDeadPlans>
    <#if topic.deadPlans??>
    <div>
        <h4>Finished Plans</h4>
        <ul>
        <#list topic.deadPlans as plan>
            <li>
                <p class="ajx"><a href="<@spring.url '/plan/plans/${plan.id}' />">${plan.createTime?date}</a></p>
                <p>duration: ${plan.duration} Months</p>
                <p>created by : <a href="http://www.tissue.com/u1/profile/users/${plan.user.id}" target="_top">${plan.user.displayName}</a></p>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>
