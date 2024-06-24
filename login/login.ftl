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
                        <p >FRIENDS LOG</p>
                    </div>
                    <div class="logo-odds">

                    </div>
                    

                    
                    <div>
                        <label for="username" class="label-input-top">Email</label>
                    </div>
<div class="input-container" id="username-border">
   <div class="input-content">
     <div class="placeholder-Icon">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <rect width="20" height="20" fill="url(#pattern0_255_158)"/>
        <defs>
        <pattern id="pattern0_255_158" patternContentUnits="objectBoundingBox" width="1" height="1">
        <use xlink:href="#image0_255_158" transform="scale(0.01)"/>
        </pattern>
        <image id="image0_255_158" width="100" height="100" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAsTAAALEwEAmpwYAAAE/ElEQVR4nO2dS4gcRRjHa+P7/Tz4FhVF8O2iLstqbf3/1bNzmChC5upRxIsHDyqis3gS8SLoQZQcAor4PMRgQIgXRQUlrhgM6sEoPuJbNFGjsaRiDzQycXeqH1U98/3guyxsd9f36+mq+rq6WylBEARBEARBEARBEARBEARBEARhJPPz88eRvMoYcyOAvgT6PhfGmFmt9bGNnTbGmCsAPEXyN5JOgqNysBfAM1mWXVqrDJL3kNwnErjWE3GftfbuWmQAuF9EMOiKAGBQqQxjzLzIYPDlGcBfJC+qTAjJh0UIy/aXt1Qp5D4RwlJCAJjKhHQ6nbNJ/iBSGCpjq1JqRlU93CW5Q6RwrL4DwCNa6yNVHczOzh4G4A4Av4oYriZkZXFx8TrVBCTPB/CKSOHISSHJ5X6/f7hqGgDrSX4uYji8RL1W6fA2BK31if46mY+1p7KUAuB7kreqlPBFNZLvxE4Om42/SW7SWp+qUkRrfajv9En+kkCyXM3xCUmr2gCAMwG8kEDSXA3hi6sP1jaUrbvTB/BZAkl0FcUbxphLVAoMBoN1If9nrT2B5KMA9ieQUBcYPwK4LSQHc3NzR/lLm79qqCrwGyL5Vj6Kenppaen0kO34SRKA7Qkk140Zz4a2mWQPwK7CTavrVVkAPFY8QAA/kbw95GzJO/072zDTB7DLX3JDcuYFepEjtrtRleUgG/bxLslrQrZprT2D5HOJitgP4HG/ZiCgaTO+zA7gu4P92lSNQnz86SeFgQc/7PSHP2nX5vqTtfZCkttW2X7tQoZn1RcANoRsv9frHe2HkZFn+ntD6095wfUuAL+vYT/NCCmI2WytPSdkP1mWXUny7QgytoXWn4wxNwD4cIx9NSskl7LHnzH9fv+Qcfc1GAzW+ZoQgJ8bEPF16G3VhYWFk3w/k5dOXNJCCmK2A7i2xChlU4r1p3xB4O7AfccTUhyxdLvd4wP33SP5aYUyPg6tP+X3gLaW3H9cIQUxX4ZeHnr/dvrLJRfoBdefKi6YpiGkIGazMebcEktY3wzY5+uh9ScAV1d8SyEtIXmC9oQOMQdjdPq+ouDP7JCKQpZlx9Q0FE9PSCFWrLVzIcektT7t/zp9/0vUWp+V4GQ1aSEHOn1fCfYV4ZBjs9aS5BYA3+Txsv9biSLqS3W1tRVCCvFVpUstx68/NTX3aY2QYWzJsuw81RDW2stCBgrTJMQ1sa4pv2m0DOCPhtvWSiHOB4D3/WMQqmKstZrkzhhtarUQFsocJE8p245Op3NyYP1JhLDCQuCw/kTy24giJuYX4v67VLPT6Vy81mM3xlwA4NXYxz2xQljo9Lvd7hGr3TRK8EnhiRTi8tgxahJojAHJDxI4vqkT4vJYIflEHu8lcDxTL8QlkGgRwvjJFSGMn1ARwvhJFCGMnzgRkkCynAiJnyAnQuInxYmQ+IlwicRUzNRdi0KEML4EEcL4iRchjJ9sEcL4CRYhjJ9UEcL4iRQhjJ+8ZIVsTKAhbkLiydJCADyQQEPchMRyVSv9YjfETUJYaxdKC/FP0wL4KHZj2P7YGfJk8kgA3JxAg1ybw3/KQlWJvG6cwTIAPKRqYMZ/IaHl771yTUb+WPi9lb/VesQbrl/Ml3RGbzTTDP9urOcBXK6awj+p6t+cQ/Im+dwRDnzyyefC58Q/W9+YCEEQBEEQBEEQBEEQBEEQBEEQBNUu/gGqz3q+RxAJdwAAAABJRU5ErkJggg=="/>
        </defs>
        </svg>
    </div>
    <input
        tabindex="1"
        placeholder="Example@email.com"
        type="text"
        id="username"
        name="username"
        value="${(login.username!'')}"
        class="${properties.kcInputClass!} <#if messagesPerField.existsError('username')>error</#if>"
        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
    />
   </div>
</div>
                   

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
                    <label for="password" class="label-input-top">Password</label>

                     <div class="input-container" id="password-border">
                     <div class="input-content">
                     <div class="placeholder-Icon" >
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <rect width="20" height="20" fill="url(#pattern0_255_159)"/>
                        <defs>
                        <pattern id="pattern0_255_159" patternContentUnits="objectBoundingBox" width="1" height="1">
                        <use xlink:href="#image0_255_159" transform="scale(0.01)"/>
                        </pattern>
                        <image id="image0_255_159" width="100" height="100" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEgUlEQVR4nO2cS4gdRRSGj8ZHUHwEkfjChbpRlBCHSDIO1PT/12XuYkRRL4gIagIBFZEgIooyYlARfJuVILrRhLsSRALZuFAQEUY3gcQHRBRCXJhREhOZca4UuSIMycx033ur6nSfD8626/F1dVdXnS4RwzAMwzAMwzAMwzCMkTMxMbGO5J0AdpLskvyO5K8kfyfZA3AMwBGSBwDsJfkmgG1FUVxveoaE9/4qkk8B+AbAQuj4KgHgZ5LvArjN5FRgcnLydgCfDiJhmdhPcuvY2Ni5VerWKADcCuDzEUg47agB8JCInJW63dnhvb+k/0gZxYhYScyX3vtbUvdBVqOC5A+xRSyRchLAE9J0SG4H8HdKGUvE7HHOrZUmAuDp1ALOIOUrkpdJkyD5WuqOX0HKt865S6UJkHwmdYevdqRMT09fIHUGwH0kF1N3dgkpe6SuOOduAPBH6k6uEI9K3XDOnQNgNoPOrRInavedAuDJyI+a7wG8DuAx7/39JHeQ/BjAXMXrfVGbL3oAV5P8M5KIgwDuOFNdWq3WhSSfI/lXhes/KHWA5K5IMva22+2LV1mnTSQPlyzjkPoFSQDrK96NZWXMlp2i9hcyj5cppyiKh0UzAF6MIGPBe39jlfqRfL5keftFKzMzM2eHYR5ByEdV6xjeKRVe9JtEIyQnRy2jL+SuAeu5u2R574hGwrSTEYQ4566JPCU/JBoJC3SMIKTdbp8/YD0fqFDudaItQwTAP5GEXD5IXcPSSIVyt4q2JIUYMnhqKjo+SF1JvlW2TABviCbCHRRLCICXB6krgJ8qlPuZaILkSxGF/LbaL/SlhBlaxXIPiCZiLZfw/9hVto5hR5DkjxXLOyyaAPBhZCE9ko+vtn5hmYXkvgFG5THRRNmPLQ5xpKz0+Gq1WjcPYW9mXjQB4P1EQnrhnQLglTD7CoubnU7nPO/9tSTvCTfKMJLxwnKLaALA26mEME78IprINeeKwxuFs6IJAPem7jSONnaLJsKLM4NO640wXhCFeyFHM+i4kcRy+/bZEpYXmEHnjSDmw+8Too2Kq6g9DSmmohHn3BUpfsCJEDtEIyS3hKy/DDpwmDEfbjTRKENpHm9vuQDwiWijrjI4hM2w6NRZBsl9oomay5gvimKDaKHmMnqq9tAbIOPg+Pj4RaKBBsg4SXKjaKDuMkguqsl2b4CMHoBnRQNNkEHyVdFAA2Qsht1O0UDdZQCY897fLRqouwySX6vJaK+zDABz4VimTqezRjRQVxkAjoev75C3JVrIRMaJYf5nEjLdAcwM+k9JI2XgVPlbpqamrvTePxIOxfzvSNgS11gIJ5qGaaz3fkLlaQw5yZDTZLMAuCnMhsLxsf2zed/rn+P7Qf/cxp3hcEvv/WaVyQg5yvDeb5amYzIywmQ0S0Y3dRvVEGlkdFO3UwURH1Pd1G1VQcTZVDd1W1UQcSrbTd1WFZiQzDAhmWFCMsOEZIYJyQybPWWGCckME5IZJiQzTEhmmJDMMCGZYUIyw4RkhgkxDMMwDMMwDMMwDEMax7/rQkZlG4NPIQAAAABJRU5ErkJggg=="/>
                        </defs>
                        </svg>

                     </div>
                    <input
                    tabindex="2"
                    type="password"
                    placeholder="Password"
                    id="password"
                    name="password"
                    class="${properties.kcInputClass!} <#if messagesPerField.existsError('username')>error</#if>"
                    autocomplete="off"
                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />
                    </div>
                    </div>
                </div>

                <span id="password-error" class="password-error">
                        ${msg("missingPasswordMessage")?no_esc}
                </span>
                <div class="button-group">
                    <div>
                    <button type="submit" class="button-login">LOGIN</button>
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


    <div id="loading-popup" style="display: none;">
        <div class="loading-spinner"></div>
    </div>


</#if>
</@layout.registrationLayout>

<script>
    document.getElementById('kc-form-login').addEventListener('submit', function(event) {
        event.preventDefault();
        var form = this;

        document.getElementById('loading-popup').style.display = 'block';
        function checkLoginStatus() {
            var loginSuccessful = Math.random() > 0.5;

            if (loginSuccessful) {
                form.submit();
            } else {
                setTimeout(checkLoginStatus, 800); // Re-check after 800ms
            }
        }

        // Start checking the login status
        checkLoginStatus();
    });
</script>

<style>
    #loading-popup {
        display: flex;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
        font-size: 2em;
        flex-direction: column; 
    }

    .loading-spinner {
        border: 8px solid #f3f3f3;
        border-top: 8px solid #3498db;
        border-radius: 50%;
        width: 60px;
        height: 60px;
        animation: spin 2s linear infinite;
        margin: 25% 0 0 48%;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>

