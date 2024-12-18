<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
    <!DOCTYPE html>
    <html class="${properties.kcHtmlClass!}"<#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}"</#if>>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <title>${msg("loginTitle",(realm.displayName!''))}</title>
        <link rel="icon" href="${url.resourcesPath}/img/ct-logo.svg" />

        <#if properties.stylesCommon?has_content>
            <#list properties.stylesCommon?split(' ') as style>
                <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>

        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>

        <link href="${url.resourcesPath}/css/registration.css" rel="stylesheet">
    </head>

    <body>
    <div class="login-container">

        <div class="login-card">
            <div class="logo">
                <img alt="Cloudify" src="${url.resourcesPath}/img/ct-logo.svg" />
            </div>

            <h1>${msg("loginTitle", (realm.displayName!''))}</h1>

            <#nested "form">
            <#nested "info">
        </div>

    </div>
    </body>

    </html>
</#macro>