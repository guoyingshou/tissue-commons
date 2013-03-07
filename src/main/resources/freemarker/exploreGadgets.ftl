<#import 'spring.ftl' as spring />
<#import 'topicGadgets.ftl' as topicGadgets />

<#macro exploreLogo>
    <h1>
        <@spring.message "Sitename" />
        <span><@spring.message "Siteslogan" />
    </h1>
</#macro>

<#macro exploreMenu page="trending">
    <ul class="menu">
        <li>
            <a class="<#if page = 'trending'>current</#if>" href="<@spring.url '/explore' />">
                <@spring.message "Menu.explore.trending" />
            </a>
        </li>
        <li>
            <a class="<#if page = 'featured'>current</#if>" href="<@spring.url '/featured' />">
                <@spring.message "Menu.explore.featured" />
            </a>
        </li>
        <li>
            <a class="<#if page = 'topics'>current</#if>" href="<@spring.url '/topics' />">
                <@spring.message "Menu.explore.topics" />
            </a>
        </li>
        <li>
            <a class="<#if page = 'tags'>current</#if>" href="<@spring.url '/tags' />">
                <@spring.message "Menu.explore.tags" />
            </a>
        </li>
    </ul>

    <#if viewerAccount??>
    <@topicGadgets.topicForm />
    <ul class="action">
        <li>
            <a class="create-topic" data-action="<@spring.url '/topics/_create' />" href="#">
                <@spring.message "Menu.explore.createTopic" />
            </a>
        </li>
    </ul>
    </#if>
</#macro>
