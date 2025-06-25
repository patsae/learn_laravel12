# การเตรียมความพร้อมก่อนติดตั้ง Laravel

ก่อนเริ่มต้นติดตั้ง Laravel จำเป็นต้องเตรียมเครื่องมือและสภาพแวดล้อมให้พร้อมก่อน เพื่อให้การพัฒนาเป็นไปอย่างราบรื่น

- PHP version 8.1 ขึ้นไป
- Composer
- Laravel installer
- Node.js หรือ Bun.js หรือ javascript runtime อื่นๆ (option)

# ติดตั้ง php

เลือกติดตั้งอย่างใดอย่างหนึง
1.ติดตั้งผ่าน xampp [xampp download](https://www.apachefriends.org/)
2.ติดตั้ง php ด้วยตัวเอง

- ดาว์นโหลด php ได้ที่ [php download](https://windows.php.net/download/) เลือกติดตั้ง verion stable thread Safe ล่าสุดหรือ version ขั้นต่ำที่ Laravel รองรับ
- ดาวน์โหลดและแตกไฟล์ ZIP ไปที่ C:\php
- ตั้งค่า Environment Variable กดปุ่ม start แล้วพิมพ์ค้นหา "Environment Variables"
- ในหน้าต่าง “System Properties”:
- คลิกปุ่ม Environment Variables...
- ใต้ System variables เลือก Path แล้วคลิก Edit
- กด New แล้วเพิ่ม: "C:\php"
- ตรวจสอบว่า PHP ใช้งานได้ เปิด Command Prompt (cmd) พิมพ์ php -v ถ้าเห็นเวอร์ชัน PHP แสดงออกมา แสดงว่าติดตั้งสำเร็จ 🎉

# ติดตั้ง php พร้อม composer

เปิด PowerShell แบบ **Run as Administrator** แล้วคัดลอกคำสั่งด้านล่างนี้ไปวาง:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://php.new/install/windows/8.4'))
```
