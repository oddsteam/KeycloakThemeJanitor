<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>
<#if section = "form">
    <form id="kc-form-login" class="${properties.kcFormClass!} onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
        <div class="content">
            <div>
                <div class="input-group mt-1rem">

                    <#--
                    <label class="label-input">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("เข้าสู่ระบบ")}<#else>${msg("เข้าสู่ระบบ")}</#if>
                    </label>
                    -->
                    <div class="friend-label">
                        <label >FRIENDS LOG</label>
                    </div>
                    <div class="logo-odds">

                    </div>
                    

                    
                    <div>
                        <label for="username" class="label-input-top">อีเมล</label>
                    </div>
                    <input
                    tabindex="1"
                    placeholder="อีเมล"
                    type="text"
                    id="username"
                    name="username"
                    value="${(login.username!'')}"
                    class="${properties.kcInputClass!} <#if messagesPerField.existsError('username')>error</#if>"
                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />

                </div>
                <#if messagesPerField.existsError('username','password')>
                    <span id="input-error" class="login-failed" aria-live="polite">
                           .
                    </span>
                </#if>

                <span id="username-error" class="username-error">
                        ${msg("missingUsernameMessage")?no_esc}
                </span>

                <div class="input-group mt-1rem">
                    <div>
                        <label for="password" class="label-input-top">รหัสผ่าน</label>
                    </div>
                    <input
                    tabindex="2"
                    type="password"
                    placeholder="รหัสผ่าน"
                    id="password"
                    name="password"
                    class="${properties.kcInputClass!} <#if messagesPerField.existsError('username')>error</#if>"
                    autocomplete="off"
                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />
                </div>

                <span id="password-error" class="password-error">
                        ${msg("missingPasswordMessage")?no_esc}
                </span>
                <div class="button-group">
                    <div>
                    <button type="submit" class="button-login">ถัดไป</button>
                    <#--  ${msg("doLogIn")}  -->
                        <#if realm.resetPasswordAllowed>
                        <div class="forgot-password-group">
                            <div class="label-forgot">
                                  ลืมรหัสผ่านใช่ไหม?
                            </div>
                            <div>
                                <a class="button-forgot-password" tabindex="5" href="${url.loginResetCredentialsUrl}">
                               รีเซ็ตรหัสผ่าน</a>
                            </div>
                        </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </form>

</#if>
</@layout.registrationLayout>

<script>
    document.getElementById('kc-form-login').addEventListener('submit', function(event) {
        if (!validatePassword()) {
            event.preventDefault();
        }
    });

</script>

