<#import 'spring.ftl' as spring />
<#import 'formGadgets.ftl' as formGadgets />

<#--
   The messageSource used is defined in siteMessage.properties file.
-->
<#macro exploreLogo>
    <h1>Tissue Network</h1>
    <div>
        <ul class="menu">
            <li><a href="<@spring.url '/explore' />"><@spring.message "i18n.explore.menu.trends" /></a></li>
            <li><a href="<@spring.url '/exploreTopics' />"><@spring.message "i18n.explore.menu.topics" /></a></li>
            <li><a href="<@spring.url '/exploreTags' />"><@spring.message "i18n.explore.menu.tags" /></a></li>
            <li><a href="<@spring.url '/exploreTimeline' />"><@spring.message "i18n.explore.menu.timeline" /></a></li>
        </ul>

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
    </div>
</#macro>
