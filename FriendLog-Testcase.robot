*** Settings ***
Resource   ./Keywords-FriendLog-Testcase.robot


*** Test Cases ***
สามารถเปิดเว็บไซต์ Friendlog ได้
    สามารถเปิดเว็บไซต์ Friendlog ได้  

กรอกข้อความลงในช่อง email ไม่ถูกต้อง password ถูกต้อง เข้าสู่ระบบไม่ได้
    กดกรอกข้อความลงในช่องemail ไม่ถูกต้อง
    กดกรอกข้อความลงในช่องpassword ถูกต้อง
    กดปุ่ม login เข้าสู่ระบบ
    ลบข้อมูลในช่องemail และ password

กรอกข้อความลงในช่อง email ถูกต้อง password ไม่ถูกต้อง เข้าสู่ระบบไม่ได้
    กดกรอกข้อความลงในช่องemail ถูกต้อง
    กดกรอกข้อความลงในช่องpassword ไม่ถูกต้อง
    กดปุ่ม login เข้าสู่ระบบ
    ลบข้อมูลในช่องemail และ password
กรอกข้อความลงในช่อง email และ password ไม่ถูกต้อง เข้าสู่ระบบไม่ได้
    กดกรอกข้อความลงในช่องemail ไม่ถูกต้อง
    กดกรอกข้อความลงในช่องpassword ไม่ถูกต้อง
    กดปุ่ม login เข้าสู่ระบบ
    ลบข้อมูลในช่องemail และ password

กรอกข้อความลงในช่อง email แต่ไม่กรอก password เข้าสู่ระบบไม่ได้
    กดกรอกข้อความลงในช่องemail ถูกต้อง
    กดปุ่ม login เข้าสู่ระบบ
    ลบข้อมูลในช่องemail และ password

ไม่กรอกข้อความลงในช่อง email แต่กรอก password เข้าสู่ระบบไม่ได้
    กดกรอกข้อความลงในช่องpassword ถูกต้อง
    กดปุ่ม login เข้าสู่ระบบ
    ลบข้อมูลในช่องemail และ password

ไม่กรอกข้อความลงในช่อง email และ password เข้าสู่ระบบไม่ได้
    กดปุ่ม login เข้าสู่ระบบ
    
กรอกข้อความลงในช่อง email และ password ถูกต้อง เข้าสู่ระบบได้
    กดกรอกข้อความลงในช่องemail ถูกต้อง
    กดกรอกข้อความลงในช่องpassword ถูกต้อง
    กดปุ่ม login เข้าสู่ระบบ

 
# กดปุ่มค้นหาด้วยคำว่า "Odds" ได้
#     กดปุ่มค้นหาด้วยคำว่า "Odds" ได้

# กดปุ่มค้นหา
#     กดปุ่มค้นหา

# เช็คคำว่า "Odds" อยู่ในหน้าเว็บไซต์
#     เช็คคำว่า "Odds" อยู่ในหน้าเว็บไซต์