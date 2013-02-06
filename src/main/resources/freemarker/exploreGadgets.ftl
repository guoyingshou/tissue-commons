<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#macro exploreLogo title = 'explore'>
    <h1>
        <@spring.message "i18n.common.sitename" />
        <span><@spring.message "i18n.common.siteslogan" />
    </h1>
    <div>
        <ul class="menu">
            <li>
                <a class="<#if title = 'trending'>current</#if>" href="<@spring.url '/explore' />">
                    <@spring.message "i18n.explore.menu.trending" />
                </a>
            </li>
            <li>
                <a class="<#if title = 'featured'>current</#if>" href="<@spring.url '/featured' />">
                    <@spring.message "i18n.explore.menu.featured" />
                </a>
            </li>
            <li>
                <a class="<#if title = 'topics'>current</#if>" href="<@spring.url '/topics' />">
                    <@spring.message "i18n.explore.menu.topics" />
                </a>
            </li>
            <li>
                <a class="<#if title = 'tags'>current</#if>" href="<@spring.url '/tags' />">
                    <@spring.message "i18n.explore.menu.tags" />
                </a>
            </li>
        </ul>

        <@formGadgets.topicForm />
    </div>
</#macro>
