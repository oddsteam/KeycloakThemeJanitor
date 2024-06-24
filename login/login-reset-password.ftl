<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
   <nav class="navbar">
            <div class="navbar-container">
                <a href="${url.loginUrl}" class="nav-back">
                    <#--  <i class="icon-back"></i>  -->
                    <img  class="icon-back" src="${url.resourcesPath}/img/left-arrow.png" />
                    Back to previous page
                </a>
            </div>
    </nav>
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="reset-password-content">
                    <div class="forgot-password-section">
                        <div class="section-header">
                                Forgot Password
                        </div>
                        <div class="section-caption">
                            <div>Enter your email</div>
                            <div>We would send you an instruction to create a new password</div>
                        </div>

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
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                            placeholder="Email"
                            />
                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">

                                </span>
                            </#if>
                        </div>
                    </div>
                <div>
            </div>
            <div class="send-button-layout">
                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                        </div>
                    </div>
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <input class="button-login" 
                                type="submit" 
                                value="SEND"/>
                    </div>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        <#if realm.duplicateEmailsAllowed>
            ${msg("emailInstructionUsername")}
        <#else>
            ${msg("emailInstruction")}
        </#if>
    </#if>
</@layout.registrationLayout>