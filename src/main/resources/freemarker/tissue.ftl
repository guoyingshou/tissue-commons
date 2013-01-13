<#import 'spring.ftl' as spring />

<#macro layout title="">
    <#include "header.ftl">
    <div id="mainWrapper">
        <#nested>
    </div>
    <#include "footer.ftl">
</#macro>

<#macro slogan>
    <div class="slogan">
        <ul>
            <li>
                在线社会化学习工具
            </li>
            <li>
                新一代的职业人士的社交网络平台：
                <ul>
                    <li>分享学习方法</li>
                    <li>交流学习经验</li>
                    <li>展示个人能力</li>
                    <li>获取更多机会</li>
                </ul>
            </li>
        </ul>
    </div>
</#macro>
