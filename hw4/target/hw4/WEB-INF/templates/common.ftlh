<#macro page uri>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Codeforces</title>
        <link rel="stylesheet" href="/css/normalize.css">
        <link rel="stylesheet" href="/css/style.css">
        <link rel="icon" href="/favicon.ico">
    </head>
    <body>
    <@header uri/>
    <div class="middle">
        <@sidebar/>
        <main>
            <#nested/>
        </main>
    </div>
    <@footer/>
    </body>
    </html>
</#macro>

<#macro header uri>
    <header>
        <a href="#" class="logo"><img alt="Codeforces" title="Codeforces"
                                      src="/img/codeforces-logo-with-telegram.png"></a>
        <div class="languages">
            <a href="#"><img alt="In English" title="In English"
                             src="/img/gb.png"></a>
            <a href="#"><img alt="In Russian" title="In Russian"
                             src="/img/ru.png"></a>
        </div>
        <div class="enter-or-register-box">
            <#if user??>
                <@userlink user false/>
                |
                <a href="/logout">Logout</a>
            <#else>
                <a href="/enter">Enter</a>

                <a href="/register">Register</a>
            </#if>
        </div>
        <nav>
            <#assign items=[
            {"href": "/index", "name": "Home"},
            {"href": "/misc/help", "name": "Help"},
            {"href": "/contests", "name": "Contests"},
            {"href": "/users", "name": "Users"}
            ]/>
            <ul>
                <#list items as item>
                    <li
                            <#if uri == item.href>
                                class="current"
                            </#if>
                    >
                        <a href="${item.href}">${item.name}</a>
                    </li>
                </#list>
            </ul>
        </nav>
    </header>
</#macro>

<#macro sidebar>
    <aside>
    <#list posts?reverse as p>
        <section>
            <div class="header">Post: ${p.id}</div>
            <div class="body"><@post p true/></div>
            <div class="footer"><a href="/post?post_id=${p.id}">View all</a></div>
        </section>
    </#list>
    </aside>
</#macro>

<#macro footer>
    <footer>
        2010-2021 &copy; by Mike Mirzayanov
    </footer>
</#macro>

<#macro userlink user nameOnly>
<#-- @ftlvariable name="user" type="ru.itmo.web.hw4.model.User" -->
    <#if (nameOnly?? && nameOnly) || (logged_user_id?? && logged_user_id == user.id)>
        <a href="/user?handle=${user.handle}">${user.handle}</a>
    <#else>
        <a href="/user?handle=${user.handle}" style="color: ${user.color}; text-decoration: none;">${user.handle}</a>
    </#if>
</#macro>



<#macro post p shortmode>
<#-- @ftlvariable name="p" type="ru.itmo.web.hw4.model.Post" -->
    <#assign u = findBy(users,"id", p.user_id)>
    <article class="post">
        <div class="title"><a href="/post?post_id=${p.id}">${p.title}</a></div>
        <div class="information">By <@userlink u false/></div>
        <div class="body">
            <#if shortmode && (p.text?length > 350)>
                ${p.text?substring(0,347)?no_esc}...
            <#else>
                ${p.text?no_esc}
            </#if>
        </div>
    </article>
</#macro>

<#function findBy items key value>
    <#list items as item>
        <#if item[key] == value>
            <#return item/>
        </#if>
    </#list>
</#function>

<#function findPositionBy items key value>
    <#assign cnt = 0>
    <#list items as item>
        <#if item[key] == value>
            <#return cnt/>
        </#if>
        <#assign cnt = cnt + 1>
    </#list>
</#function>

<#function countBy posts key val>
    <#assign counter = 0>
    <#list posts as p>
        <#if p[key] == val>
            <#assign counter = counter + 1>
        </#if>
    </#list>
    <#return counter>
</#function>
}
