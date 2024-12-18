<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username', 'password')
displayInfo=realm.password?? && realm.registrationAllowed?? && !registrationDisabled??; section>
    <#if section == "header">
        ${msg("createAccountTitle")}
    <#elseif section == "form">
        <div class="login-subtitle" data-qa-id="login-subtitle">${msg("registerIntro")}</div>

        <div id="kc-form" style="max-width: 400px; margin: 0 auto;">
            <div id="kc-form-wrapper">
                <form id="kc-form-register" action="${url.registrationAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}" style="margin-bottom: 10px;">
                        <label for="username" class="${properties.kcLabelClass!}" style="font-size: 14px;">${msg("username")}</label>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" type="text" autofocus autocomplete="off" style="height: 30px; padding: 5px; font-size: 14px;"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />
                        <#if messagesPerField.existsError('username')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite" style="font-size: 12px; color: red;">
                                ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}" style="margin-bottom: 10px;">
                        <label for="firstName" class="${properties.kcLabelClass!}" style="font-size: 14px;">${msg("firstName")}</label>
                        <input tabindex="2" id="firstName" class="${properties.kcInputClass!}" name="firstName" type="text" autocomplete="off" style="height: 30px; padding: 5px; font-size: 14px;"
                               aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>" />
                        <#if messagesPerField.existsError('firstName')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite" style="font-size: 12px; color: red;">
                                ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}" style="margin-bottom: 10px;">
                        <label for="lastName" class="${properties.kcLabelClass!}" style="font-size: 14px;">${msg("lastName")}</label>
                        <input tabindex="3" id="lastName" class="${properties.kcInputClass!}" name="lastName" type="text" autocomplete="off" style="height: 30px; padding: 5px; font-size: 14px;"
                               aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>" />
                        <#if messagesPerField.existsError('lastName')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite" style="font-size: 12px; color: red;">
                                ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}" style="margin-bottom: 10px;">
                        <label for="email" class="${properties.kcLabelClass!}" style="font-size: 14px;">${msg("email")}</label>
                        <input tabindex="4" id="email" class="${properties.kcInputClass!}" name="email" type="email" autocomplete="off" style="height: 30px; padding: 5px; font-size: 14px;"
                               aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" />
                        <#if messagesPerField.existsError('email')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite" style="font-size: 12px; color: red;">
                                ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}" style="margin-bottom: 10px;">
                        <label for="password" class="${properties.kcLabelClass!}" style="font-size: 14px;">${msg("password")}</label>
                        <input tabindex="5" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" style="height: 30px; padding: 5px; font-size: 14px;"
                               aria-invalid="<#if messagesPerField.existsError('password')>true</#if>" />
                        <#if messagesPerField.existsError('password')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite" style="font-size: 12px; color: red;">
                                ${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}" style="margin-bottom: 10px;">
                        <label for="password-confirm" class="${properties.kcLabelClass!}" style="font-size: 14px;">${msg("passwordConfirm")}</label>
                        <input tabindex="6" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" type="password" autocomplete="off" style="height: 30px; padding: 5px; font-size: 14px;"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite" style="font-size: 12px; color: red;">
                                ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}" style="margin-bottom: 10px;">
                        <div id="kc-form-options" style="font-size: 12px;">
                            <div class="checkbox">
                                <label>
                                    <input tabindex="7" id="terms" name="terms" type="checkbox" required> ${msg("termsAndConditions")}
                                </label>
                            </div>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}" style="margin-top: 15px;">
                        <input type="hidden" id="id-hidden-input" name="credentialId"/>
                        <input tabindex="8" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="register" id="kc-register" type="submit" value="${msg("doRegister")}"
                               style="height: 40px; font-size: 14px; padding: 5px;"/>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>