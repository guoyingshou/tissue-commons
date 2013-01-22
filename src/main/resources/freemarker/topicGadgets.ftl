<#macro showTopics>
    <ul>
    <#list topics as topic>
        <li>
            <a href="/group/topics/${topic.id}">${topic.title}</a>
            Created By: <a href="/social/users/${topic.user.id}/posts">${topic.user.displayName}</a>
        </li>
    </#list>
    </ul>
</#macro>

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
  </div>
</#macro>
