# การเตรียมความพร้อมก่อนติดตั้ง Laravel

ก่อนเริ่มต้นติดตั้ง Laravel จำเป็นต้องเตรียมเครื่องมือและสภาพแวดล้อมให้พร้อมก่อน เพื่อให้การพัฒนาเป็นไปอย่างราบรื่น

- PHP version 8.2 ขึ้นไป

  - PHP Extensions ที่ Laravel ต้องการ
    - PHP >= 8.2
    - Ctype PHP Extension
    - cURL PHP Extension
    - DOM PHP Extension
    - Fileinfo PHP Extension
    - Filter PHP Extension
    - Hash PHP Extension
    - Mbstring PHP Extension
    - OpenSSL PHP Extension
    - PCRE PHP Extension
    - PDO PHP Extension
    - Session PHP Extension
    - Tokenizer PHP Extension
    - XML PHP Extension

- Composer
- Laravel installer
- Node.js หรือ Bun.js หรือ javascript runtime อื่นๆ (option)

# 🚀 ติดตั้ง PHP และ Composer บน Windows ด้วยคำสั่งเดียว

- เปิด PowerShell แบบ **Run as Administrator** แล้วคัดลอกคำสั่งด้านล่างนี้ไปวาง:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://php.new/install/windows/8.4'))
```

- ตำแหน่งติดตั้ง php และ composer

```
C:\Users\[win user]\.config\herd-lite\bin
```

- ตรวจสอบ version ของ php และ composer

```
composer -V
```

จะต้องปรากฏ version ของ php และ composer
Composer version 2.8.3 2024-11-17 13:13:04
PHP version 8.4.0 (C:\Users\[win-user]\.config\herd-lite\bin\php.exe)
Run the "diagnose" command to get more detailed diagnostics output.

- ตรวจสอบ extension ของ php

```
php -m
```

# ติดตั้ง Laravel installer

```
composer global require laravel/installer
```

# สร้าง Laravel Application

```
#คำสั่ง laravel new [project name]
laravel new example-app

```

```
#Which starter kit would you like to install? [None]
#Which database will your application use? [SQLite]
#Would you like to run npm install and npm run build? (yes/no) [no]
```

- เสร็จสิ้นการสร้าง Laravel application 🎉🎉🎉

# เพิ่มเติม

##### หากในโปรเจคของเรามีการทำงานร่วมกับ Javascript Package Library ต่างๆ (แนะนำ)

- ติดตั้ง Bun.js สำหรับใช้เป็น Javascript Runtime และจัดการ javascript package

```
powershell -c "irm bun.sh/install.ps1 | iex"
```

- เข้าโฟลเดอร์ project ของเรา

```
cd example-app
ิbun install
```

- ภายในโฟลเดอร์โปรเจคจะปรากฏไฟล์และโฟลเดออร์เหล่านี้เพิ่มเข้ามา
- node_modulues/
- bun.lock
- vite.config.js
