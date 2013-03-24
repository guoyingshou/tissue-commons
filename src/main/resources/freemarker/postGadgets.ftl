<#import 'spring.ftl' as spring />
<#import 'commonGadgets.ftl' as commonGadgets />

<#macro showPosts>
<ul id="posts">
   <#list posts as post>
   <li class="container-has-icon">
       <div class="icon">
       <#if post.type == 'concept'>
           <span data-icon="&#xe007;"></span>
       <#elseif post.type = 'note'>
           <span data-icon="&#xe008;"></span>
       <#elseif post.type = 'question'>
           <span data-icon="&#xe009;"></span>
       <#else>
           <span data-icon="&#xe01c;"></span>
       </#if>
       </div>

       <div class="ts has-icon-before">
           <a href="/social/users/${post.account.user.id?replace("#", "")}/posts">${post.account.user.displayName}</a>
           [ <@commonGadgets.showTimeBefore post.timeBefore /> ]
       </div>
       <div class="title has-icon-before">
       <#if post.type == 'question'>
           <a href="/group/questions/${post.id?replace("#","")}" class="post">${post.title}</a>
       <#else>
           <a href="/group/articles/${post.id?replace("#","")}" class="post">${post.title}</a>
       </#if>
       </div>
   </li>
   </#list>
</ul>
</#macro>

<#macro messageForm>
<form id="messageForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Message
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro replyForm>
<form id="replyForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Reply
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro questionCommentForm>
<form id="questionCommentForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Question Comment
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro answerForm>
<form id="answerForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Answer
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>

<#macro answerCommentForm>
<form id="answerCommentForm" class="dialog pop-650" style="display:none" method="post">
    <legend>
        Answer comment
        <a href="#" class="cancel"><span data-icon="&#xe008"></span></a>
    </legend>
    <ul>
        <li>
            <textarea id="content" name="content"></textarea>
        </li>
        <li>
            <input type="submit" value="submit"/>
        </li>
    </ul>
</form>
</#macro>


