<#import 'spring.ftl' as spring />
<#import 'siteGadgets.ftl' as site />

<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />

<#macro exploreHeader>
    <div id="page-logo-wrapper">
        <div id="page-logo">
            <h1>
                <em class="em"><@spring.message "Name.site" /></em>
                <span><@spring.message "Slogan.site" /></span>
            </h1>
        </div>
    </div>

    <div id="page-menu-wrapper">
        <div id="page-menu">
            <ul class="menu">
                <li>
                    <a class="<#if selected = 'trending'>current</#if>" href="<@spring.url '/explore' />">
                        <@spring.message "TrendingText.menu.explore" />
                    </a>
                </li>
                <li>
                    <a class="<#if selected = 'featured'>current</#if>" href="<@spring.url '/featured' />">
                        <@spring.message "FeaturedText.menu.explore" />
                    </a>
                </li>
                <li>
                    <a class="<#if selected = 'topics'>current</#if>" href="<@spring.url '/topics' />">
                        <@spring.message "TopicsText.menu.explore" />
                    </a>
                </li>
                <li>
                    <a class="<#if selected = 'tags'>current</#if>" href="<@spring.url '/tags' />">
                        <@spring.message "TagsText.menu.explore" />
                    </a>
                </li>
            </ul>
            <#if !viewerAccount?? || (!viewerAccount.hasRole('ROLE_EVIL') && (viewerActivePlansCount < 9))>
            <ul class="menu-action">
                <li>
                    <a class="create-topic" href="<@spring.url '/topics/_create' />">
                        <@spring.message "CreateTopicText.menu.explore" />
                    </a>
                </li>
            </ul>
            </#if>
        </div>
    </div>
</#macro>

<#macro topicHeader>
    <div id="page-logo-wrapper">
        <div id="page-logo">
            <h1>
                <a href="<@spring.url '/topics/${topic.id?replace("#","")}/objective' />">${topic.title}</a>
            </h1>
        </div>
    </div>

    <div id="page-menu-wrapper">
        <div id="page-menu">
            <ul class="menu">
                <li>
                    <a class="<#if selected = 'all'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/posts' />">
                        <@spring.message "TopicsText.menu.topic" />
                    </a>
                </li>
                <li>
                    <a class="<#if selected = 'concept'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/concepts' />">
                        <@spring.message "ConceptText.menu.topic" />
                    </a>
                </li>
                <li>
                    <a class="<#if selected = 'note'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#","")}/notes' />">
                        <@spring.message "NoteText.menu.topic" />
                    </a>
                </li>
                <li>
                    <a class="<#if selected = 'tutorial'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/tutorials' />">
                        <@spring.message "TutorialText.menu.topic" />
                    </a>
                </li>
                <li>
                    <a class="<#if selected = 'question'>current</#if>" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions' />">
                        <@spring.message "QuestionText.menu.topic" />
                    </a>
                </li>
            </ul>

            <ul class="plan-meta">
                <#if !topic.deleted && viewerAccount?? && !viewerAccount.hasRole("ROLE_EVIL")>

                <#if topic.activePlan??> 

                <#if isMember?? && isMember>
                <li class="menu-action">
                    <a id="create-article" href="<@spring.url '/topics/${topic.id?replace("#", "")}/articles/_create'/>">
                        <@spring.message "CreateArticleText.menu.topic" />
                    </a>
                    <a id="create-question" href="<@spring.url '/topics/${topic.id?replace("#", "")}/questions/_create'/>">
                        <@spring.message "CreateQuestionText.menu.topic" />
                    </a>
                </li>
                <#elseif viewerAccount.hasRole('ROLE_ADMIN') || (viewerActivePlansCount < 9)>
                <li class="menu-action">
                    <a href="<@spring.url '/plans/${topic.activePlan.id?replace("#", "")}/_join'/>">
                        <@spring.message "JoinPlanText.menu.topic" />
                    </a>
                </li>
                </#if>

                <li class="plan-info">
                    <a href="/group/plans/${topic.activePlan.id?replace("#", "")}/posts">
                        <@site.showTimeRemaining topic.activePlan.timeRemaining />
                    </a>
                    <a class="username" href="/social/users/${topic.activePlan.account.user.id?replace("#", "")}/posts">
                        ${topic.activePlan.account.user.displayName}
                    </a>
                </li>

                <#elseif viewerAccount.hasRole('ROLE_ADMIN') || (viewerActivePlansCount <9) >
                <li class="menu-action">
                    <a href="<@spring.url '/topics/${topic.id?replace("#","")}/plans/_create' />">
                        <@spring.message "HostPlanText.menu.topic" />
                    </a>
                </li>
                </#if>

                </#if>
            </ul>
        </div>
    </div>
</#macro>

<#macro showPlansArchived>
    <#if topic.archivedPlans??>
    <div class="archived-plans">
        <h2>
            <@spring.message "Text.plan.archivedPlans" />
        </h2>
        <ul>
            <#list topic.archivedPlans as plan>
            <li class="plan">
                <div class="ts">
                    <a href="/group/plans/${plan.id?replace("#", "")}/posts">
                        ${plan.createTime?date} - ${plan.endTime?date}
                    </a>
                </div>
                <div>
                    <a class="username" href="/social/users/${plan.account.user.id?replace("#", "")}/posts">
                        ${plan.account.user.displayName}
                    </a>
                </div>
            </li>
            </#list>
        </ul>
    </div>
    </#if>
</#macro>

<#macro replyForm>
<form id="replyForm" class="dialog" style="display:none" method="post">
    <legend>
        <@spring.message 'Legend.replyForm' />
    </legend>
    <ul>
        <li>
            <textarea id="reply-editor" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="<@spring.message 'Text.formInput.submit' />"/>
            <a href="#" class="cancel"><@spring.message 'CancelText.link' /></a>
        </li>
    </ul>
</form>

</#macro>

<#macro questionCommentForm>
<form id="questionCommentForm" class="dialog" style="display:none" method="post">
    <legend>
        <@spring.message 'Legend.questionCommentForm' />
    </legend>
    <ul>
        <li>
            <textarea id="questionComment-editor" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="<@spring.message 'Text.formInput.submit' />"/>
            <a href="#" class="cancel"><@spring.message 'CancelText.link' /></a>
        </li>
    </ul>
</form>
</#macro>

<#macro answerCommentForm>
<form id="answerCommentForm" class="dialog" style="display:none" method="post">
    <legend>
        <@spring.message 'Legend.answerCommentForm' />
    </legend>
    <ul>
        <li>
            <textarea id="answerComment-editor" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="<@spring.message 'Text.formInput.submit' />"/>
            <a href="#" class="cancel"><@spring.message 'CancelText.link' /></a>
        </li>
    </ul>
</form>
</#macro>

<#macro showTopics>
    <#if topics??>
    <ul class="topics">
        <#list topics as topic>
        <li>
            <div class="ts">
                <a class="username" href="/social/users/${topic.account.user.id?replace("#", "")}/posts">
                    ${topic.account.user.displayName}
                </a>
                [ <@site.showTimeBefore topic.timeBefore /> ]
            </div>
            <div class="topic-title">
                <a href="/group/topics/${topic.id?replace("#", "")}/objective">
                   <@site.trim topic.title />
                </a>
            </div>
        </li>
        </#list>
    </ul>
    <#if pager??>
        <@site.showPager />
    </#if>
    </#if>
</#macro>

<#macro showPosts>
<#if posts??>
<ul class="posts">
   <#list posts as post>
   <li class="icon-container">
       <#if post.type == 'concept'>
       <span class="icon" data-icon="&#xe003;"></span>
       <#elseif post.type = 'note'>
       <span class="icon" data-icon="&#xe004;"></span>
       <#elseif post.type = 'tutorial'>
       <span class="icon" data-icon="&#xe005;"></span>
       <#else>
       <span class="icon" data-icon="&#xe006;"></span>
       </#if>

       <div class="ts">
           <a class="username" href="/social/users/${post.account.user.id?replace("#", "")}/posts">
               ${post.account.user.displayName}
           </a>
           [ <@site.showTimeBefore post.timeBefore /> ]
       </div>

       <div class="post-title">
       <#if post.type == 'question'>
           <a href="/group/questions/${post.id?replace("#","")}">
               <@site.trim post.title />
           </a>
       <#else>
           <a href="/group/articles/${post.id?replace("#","")}">
               <@site.trim post.title />
           </a>
       </#if>
       </div>
   </li>
   </#list>
</ul>
</#if>
</#macro>

