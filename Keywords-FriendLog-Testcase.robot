*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${url}        http://10.204.161.98/
${inp_email}              userTest
${inp_password}           1

*** Keywords ***
สามารถเปิดเว็บไซต์ Friendlog ได้
    Open Browser  ${url}      gc 
    
กดกรอกข้อความลงในช่องemail ไม่ถูกต้อง
    Click Element  //*[@id="username"]
    Input Text  //*[@id="username"]  user
    Sleep  2s
    
กดกรอกข้อความลงในช่องpassword ไม่ถูกต้อง
    Click Element  //*[@id="password"]
    Input Text  //*[@id="password"]  134
    Sleep  2s

กดกรอกข้อความลงในช่องemail ถูกต้อง
    Click Element  //*[@id="username"]
    Input Text  //*[@id="username"]  ${inp_email}
    Sleep  2s

กดกรอกข้อความลงในช่องpassword ถูกต้อง
    Click Element  //*[@id="password"]
    Input Text  //*[@id="password"]  ${inp_password}
    Sleep  2s
ลบข้อมูลในช่องemail และ password
    Click Element  //*[@id="username"]
    Clear Element Text  //*[@id="username"]
    Click Element  //*[@id="password"]
    Clear Element Text  //*[@id="password"]
    Sleep  2s
กดปุ่ม login เข้าสู่ระบบ
    Click Element  //*[@id="kc-form-login"]/div/div/div[3]/div/button
    Sleep  1s
# กดปุ่มค้นหาด้วยคำว่า "Odds" ได้
#     Input Text  name=q  ${inp_text} 

# กดปุ่มค้นหา
#     Press Key    name=q    \\13
    
# เช็คคำว่า "Odds" อยู่ในหน้าเว็บไซต์
#     ${text} =  Get Text    name=q
#     Current Frame Should Contain    ${text}    odds