<#import "./common.ftlh" as c>

<@c.page uri>
    <#if user_id??>
        <#list posts?reverse as p>
            <#if user_id == p.user_id>
                <@c.post p true/>
            </#if>
        </#list>
    <#else>
        <h1>User not found</h1>
    </#if>
</@c.page>
