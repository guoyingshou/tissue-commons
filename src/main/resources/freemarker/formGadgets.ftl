<#import 'spring.ftl' as spring />

<#macro topicForm>
    <div id="topicForm" style="display: none">
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
        <a href="#" class="cancel">cancel</a>
    </div>
</#macro>

<#macro topicEditForm>
    <div id="topicEditForm" style="display: none">
        <form>
            <ul>
                <li>
                    <textarea id="editor" name="content"></textarea>
                </li>
                <li>
                    <input id="tags" type="input" name="tags" />
                </li>
                <li>
                    <input type="submit" value="submit"/>
                </li>
            </ul>
        </form>
        <div>
            <a href="#" class="cancel">cancel</a>
        </div>
    </div>
</#macro>

<#macro planForm>
    <div id="planForm" style="display: none">
        <form action="<@spring.url '/topics/${topic.id}/plans' />" method="post">
            <fieldset>
                <legend>Please Select A Duration</legend>
                <ul>
                    <li>
                        <label><input type="radio" name="duration" value="1" />1 Mon</label>
                    </li>
                    <li>
                        <label><input type="radio" name="duration" value="3" />3 Mon</label>
                    </li>
                    <li>
                        <label><input type="radio" name="duration" value="6" />6 Mon</label>
                    </li>
                </ul>
            </fieldset>
            <input type="submit" value="submit" />
        </form>
        <div><a href="#" class="cancel">cancel</a></div>
    </div>
</#macro>

<#macro postForm>
    <div id="postForm" style="display: none">
        <form method="post" action="<@spring.url '/plans/${plan.id}/posts'/>">
            <fieldset>
                <legend>Post Type</legend>
                <label>Concept <input type="radio" name="type" value="concept" /></label>
                <label>Note <input type="radio" name="type" value="note" /></label>
                <label>Question <input type="radio" name="type" value="question" /></label>
                <label>Tutorial <input type="radio" name="type" value="tutorial" /></label>
            </fieldset>

            <fieldset>
                <legend>Your Post</legend>
                <ul>
                    <li>
                        <label for="title">title</label>
                        <input type="input" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">content</label>
                        <textarea id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
            </fieldset>
        </form>
        <div><a href="#" class="cancel">cancel</a></div>
    </div>
</#macro>

<#macro postEditForm>
    <div id="postEditForm" style="display: none">
        <form method="post">
            <fieldset>
                <legend>Your Post</legend>
                <ul>
                    <li>
                        <label for="title">title</label>
                        <input type="input" id="title" name="title" />
                    </li>
                    <li>
                        <label for="editor">content</label>
                        <textarea id="editor" name="content"></textarea>
                    </li>
                    <li>
                        <input type="submit" value="submit" />
                    </li>
                </ul>
            </fieldset>
        </form>
        <div><a href="#" class="cancel">cancel</a></div>
    </div>
</#macro>

<#macro oneItemForm>
    <div id="oneItemForm" style="display: none">
        <form>
            <ul>
                <li>
                    <textarea id="editor" name="content"></textarea>
                </li>
                <li>
                    <input type="submit" value="submit"/>
                </li>
            </ul>
        </form>
        <a href="#" class="cancel">cancel</a>
    </div>
</#macro>
