<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#--
   The messageSource used is defined in siteMessage.properties file.
-->
<#macro exploreLogo>
    <h1>
        <@spring.message "i18n.common.sitename" />
        <span><@spring.message "i18n.common.siteslogan" />
    </h1>
    <div>
        <ul class="menu">
            <li><a href="<@spring.url '/explore' />"><@spring.message "i18n.explore.menu.trending" /></a></li>
            <li><a href="<@spring.url '/featured' />"><@spring.message "i18n.explore.menu.featured" /></a></li>
            <li><a href="<@spring.url '/topics' />"><@spring.message "i18n.explore.menu.topics" /></a></li>
            <li><a href="<@spring.url '/tags' />"><@spring.message "i18n.explore.menu.tags" /></a></li>
            <#if viewer??>
            <li><a href="<@spring.url '/timeline' />"><@spring.message "i18n.explore.menu.timeline" /></a></li>
            </#if>
        </ul>

        <#if viewer??>
        <ul class="action">
            <li><a class="topicForm" href="#"><@spring.message "i18n.explore.action.createTopic" /></a></li>
            <li><@formGadgets.topicForm /></li>
            <li>
                <script type="text/javascript">
                    $(document).on('click', 'a.topicForm', function(e) {
                        e.preventDefault();
                        $('#contentInner').newTopicDialog();
                    });
                </script>
            </li>
        </ul>
        </#if>
    </div>
</#macro>
