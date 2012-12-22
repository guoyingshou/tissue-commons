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

        <div id="topicDia" style="display: none">
            <form action="<@spring.url '/plan/topics' />" method="post">
                <fieldset>
                    <legend>Your Topic</legend>
                    <ul>
                        <li>
                            <label for="title">title</label>
                            <input type="input" id="title" name="title" />
                        </li>
                        <li>
                            <label for="editor">Objective</label>
                            <textarea id="editor" name="content"></textarea>
                        </li>
                        <li>
                            <label for="tags">tags</label>
                            <input type="input" id="tags" name="tags" />
                        </li>
                        <li>
                            <input type="submit" value="submit" />
                        </li>
                    </ul>
                </fieldset>
            </form>
            <div><a href="#" class="cancel">cancel</a></div>
        </div>

        <ul class="action">
            <li><a class="topicForm" href="#">New Topic</a></li>

            <script type="text/javascript">

                $(document).on('click', 'a.topicForm', function(e) {
                    e.preventDefault();
                    $('#contentInner').newTopicDialog();
                });

            </script>
        </ul>
    </div>
</#macro>

<#macro topicLogo>
  <h1><a href="http://www.tissue.com/u2/plan/topics/${topic.id}/posts">${topic.title}</a></h1>
  <div>
      <ul class="menu">
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/concept/posts">Concepts</a></li>
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/note/posts">Notes</a></li>
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/question/posts">Questions</a></li>
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}/tutorial/posts">Tutorials</a></li>
          <li><a class="ajx" href="/u2/plan/topics/${topic.id}">Objective</a></li>
      </ul>
  </div>
</#macro>

<#macro showActivePlan>

    <div id="activePlan">
    <#if activePlan??>
        <#if viewer??>
            <#if activePlan.isOwnerOrMember(viewer.id)>
            <div id="postDia" style="display: none">
                <form method="post" action="<@spring.url '/plan/plans/${activePlan.id}/posts'/>">
                    <fieldset>
                        <legend>Post Type</legend>
                        <label>Concept <input type="radio" name="type" value="concept" /></label>
                        <label>Note <input type="radio" name="type" value="note" /></label>
                        <label>Question <input type="radio" name="type" value="question" /></label>
                        <label>Tutorial <input type="radio" name="type" value="tutorial" /></label>
                    </fieldset>
                    <fieldset>
                        <legend>Your Post</legend>
                        <ul>
                            <li>
                                <label for="title">title</label>
                                <input type="input" id="title" name="title" />
                            </li>
                            <li>
                                <label for="editor">content</label>
                                <textarea id="editor" name="content"></textarea>
                            </li>
                            <li>
                                <input type="submit" value="submit" />
                            </li>
                        </ul>
                    </fieldset>
                </form>
                <div><a href="#" class="cancel">cancel</a></div>
            </div>

            <a class="postForm" data-action="<@spring.url '/plan/plans/${activePlan.id}/posts'/>" href="#">new post</a>

            <script type="text/javascript">
                $(document).on('click', 'a.postForm', function(e) {
                    e.preventDefault();
                    //$('#contentInner').newPostDialog($(this).data("action"));
                    $('#contentInner').newPostDialog();
                });
            </script>
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
        <div id="planDia" style="display: none">
            <form action="<@spring.url '/plan/topics/${topic.id}/plans' />" method="post">
                <fieldset>
                    <legend>Please Select A Duration</legend>
                    <ul>
                        <li>
                            <label><input type="radio" name="duration" value="1" />1 Mon</label>
                        </li>
                        <li>
                            <label><input type="radio" name="duration" value="3" />3 Mon</label>
                        </li>
                        <li>
                            <label><input type="radio" name="duration" value="6" />6 Mon</label>
                        </li>
                    </ul>
                </fieldset>
                <input type="submit" value="submit" />
            </form>
            <div><a href="#" class="cancel">cancel</a></div>
        </div>

        <a class="planForm" href="#">create plan</a>

        <script type="text/javascript">
            $(document).on('click', 'a.planForm', function(e) {
                e.preventDefault();
                var options = {
                    name: "planForm"
                };
                $('#planDia').newPlanDialog();
            });
        </script>
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
