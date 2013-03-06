<#import 'spring.ftl' as spring />
<#import 'topicGadgets.ftl' as topicGadgets />

<#macro exploreLogo>
    <h1>
        <@spring.message "i18n.common.sitename" />
        <span><@spring.message "i18n.common.siteslogan" />
    </h1>
</#macro>

<#macro exploreMenu page="trending">
    <ul class="menu">
        <li>
            <a class="<#if page = 'trending'>current</#if>" href="<@spring.url '/explore' />">
                <@spring.message "i18n.explore.menu.trending" />
            </a>
        </li>
        <li>
            <a class="<#if page = 'featured'>current</#if>" href="<@spring.url '/featured' />">
                <@spring.message "i18n.explore.menu.featured" />
            </a>
        </li>
        <li>
            <a class="<#if page = 'topics'>current</#if>" href="<@spring.url '/topics' />">
                <@spring.message "i18n.explore.menu.topics" />
            </a>
        </li>
        <li>
            <a class="<#if page = 'tags'>current</#if>" href="<@spring.url '/tags' />">
                <@spring.message "i18n.explore.menu.tags" />
            </a>
        </li>
    </ul>

    <#if viewerAccount??>
    <@topicGadgets.topicForm />
    <ul class="action">
        <li>
            <a class="create-topic" data-action="<@spring.url '/topics/_create' />" href="#">
                <@spring.message "i18n.explore.action.createTopic" />
            </a>
        </li>
    </ul>
    </#if>
</#macro>
