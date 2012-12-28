<#import 'spring.ftl' as spring />

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
            <li><a href="/group/explore">about me</a></li>
            <li><a href="/group/exploreTopics">actions</a></li>
        </ul>
        <ul class="action">
            <#if canInvite??>
            <li><a href="<@spring.url '/users/${owner.id}/invites' />">invite</a></li>
            </#if>
        </ul>
    </div>
</#macro>

<#macro dashboardLogo>
    <h1>Tissue Network</h1>
    <div>
        <ul class="menu">
            <li><a href="/profile/dashboard">NewsFeeds</a></li>
            <li><a href="/profile/actions">Actions</a></li>
        </ul>
    </div>
</#macro>

<#macro exploreLogo>

    <h1>Tissue Network</h1>
    <div>
        <ul class="menu">
            <li><a href="<@spring.url '/explore' />">Trends</a></li>
            <li><a href="<@spring.url '/exploreTopics' />">Topics</a></li>
            <li><a href="<@spring.url '/exploreTags' />">Tags</a></li>
            <li><a href="<@spring.url '/exploreTimeline' />">Timeline</a></li>
        </ul>

        <div id="topicDia" style="display: none">
            <form action="<@spring.url '/topics' />" method="post">
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
  <h1><a href="<@spring.url '/topics/${topic.id}/posts' />">${topic.title}</a></h1>
  <div>
      <ul class="menu">
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/concept/posts' />">Concepts</a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/note/posts' />">Notes</a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/question/posts' />">Questions</a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}/tutorial/posts' />">Tutorials</a></li>
          <li><a class="ajx" href="<@spring.url '/topics/${topic.id}">Objective' /></a></li>
      </ul>
  </div>
</#macro>

