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

# 🚀 ติดตั้ง PHP 8.4 และ Composer บน Windows ด้วยคำสั่งเดียว

- เปิด PowerShell แบบ **Run as Administrator** แล้วคัดลอกคำสั่งด้านล่างนี้ไปวาง:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://php.new/install/windows/8.4'))
```

- ทดสอบพิมพ์คำสั่ง

```
composer -V
```

จะต้องปรากฏ version ของ php และ composer
Composer version 2.8.3 2024-11-17 13:13:04
PHP version 8.4.0 (C:\Users\[win-user]\.config\herd-lite\bin\php.exe)
Run the "diagnose" command to get more detailed diagnostics output.

# ติดตั้ง Laravel installer

```
composer global require laravel/installer
```
