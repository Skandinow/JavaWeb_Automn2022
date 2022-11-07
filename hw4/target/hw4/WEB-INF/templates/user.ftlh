<#-- @ftlvariable name="handle" type="java.lang.String" -->
<#import "./common.ftlh" as c>

<@c.page uri>
    <#assign u = c.findBy(users, "handle", handle)!/>

    <#if u?has_content>
        <#assign pos = c.findPositionBy(users,"handle",handle)!/>
        <#assign count = c.countBy(posts, "user_id", u.id)/>
        <div class=userTable>
            <div class="left">
                <h1><a href="/user?handle=${u.handle}">${u.name}</a></h1>
                <ul>
                    <li>id: ${u.id}</li>
                    <li>handle: ${u.handle} </li>
                    <li>name: ${u.name}</li>
                </ul>
                <a href="/posts?user_id=${u.id}"> Quantity of post: ${count}</a>
            </div>
            <div class="right">
                    <img src="/img/ava.jpg" alt="alt">
            </div>
        </div>

        <div class="arrows">
            <@arrow pos-1 "←"/>
            <@arrow pos+1 "→"/>
        </div>
    <#else>
        No such user
    </#if>
</@c.page>

<#macro arrow user_position arrowType>
    <#if user_position != -1 && user_position !=users?size>
        <a href="/user?handle=${users[user_position].handle}">${arrowType}</a>
    <#else>
         ${arrowType}
    </#if>
</#macro>
