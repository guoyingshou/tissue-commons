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
            <#if canInvite>
            <li><a href="http://www.tissue.com/u1/profile/users/${owner.id}/invites">invite</a></li>
            </#if>
            <#--
            <li><a href="http://www.tissue.com/u1/profile/users/${owner.id}/messages">send message</a></li>
            -->
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
      <ul class="action">
          <li>
              <#if topic.activePlan??>
                  <#if topic.activePlan.isOwnerOrMember(viewer.id)>
                      <a class="ajx" href="<@spring.url '/plan/plans/${topic.activePlan.id}/posts'/>">new post</a>
                  <#else>
                      <a href="<@spring.url '/plan/topics/${topic.id}/plans/${topic.activePlan.id}/join'/>">join</a>
                  </#if>
              <#else>
                  <a class="ajx" href="<@spring.url '/plan/topics/${topic.id}/plans'/>">create plan</a>
              </#if>
          </li>
      </ul>
  </div>
</#macro>

<#macro showActivePlan>
    <div>
        <h4>Active Plan</h4>
        <#if topic.activePlan??>
            <p><a class="ajx" href="<@spring.url '/plan/plans/${topic.activePlan.id}'/>">${topic.activePlan.createTime?date}</a></p>
            <p>duration: ${topic.activePlan.duration} Months</p>
            <p>created by: ${topic.activePlan.user.displayName}</p>
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
                <p class="ajx"><a href="<@spring.url '/plan/plans/${plan.id}' />">${plan.createTime?date}</a></p>
                <p>duration: ${plan.duration} Months</p>
                <p>created by : <a href="http://www.tissue.com/u1/profile/users/${plan.user.id}" target="_top">${plan.user.displayName}</a></p>
            </li>
        </#list>
        </ul>
    </div>
    </#if>
</#macro>
