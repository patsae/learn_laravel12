# Public Appication

เมื่อแอปพลิเคชันได้รับการพัฒนาเรียบร้อยและพร้อมสำหรับนำไปใช้งานจริง (Production) ขั้นตอนต่อไปคือการดำเนินการ Deploy แอปพลิเคชันให้สามารถทำงานได้อย่างมีประสิทธิภาพและปลอดภัย ซึ่งสามารถดำเนินการได้ตามขั้นตอนดังต่อไปนี้

# การเตรียมความพร้อมระบบ Server

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

# Upload file to server

ใน Laravel แอปพลิเคชั่นมีไฟล์สำคัญที่ต้องอัพโหลดไปขึ้นที่ server ดังนี้

- Project/
  - app/
  - bootstrap/
  - config/
  - public/
  - resource/
    - views/
  - route/
  - storage/
  - vendir/
  - .env
  - composer.json
  - composer.lock
  - artisan
