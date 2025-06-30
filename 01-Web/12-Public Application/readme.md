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

# Build Application

- เปลี่ยนตัวแปรใน .env ให้เป็นสำหรับ production

```
APP_ENV=production
APP_DEBUG=false
APP_URL=Domain...
```

```
composer run build
bun run build
```

# Upload file to server

การอัพโหลดโปรเจ็คขึ้นสู่เซิร์ฟเวอร์เพื่อใช้งานจริง มีไฟล์สำคัญที่ต้องอัพโหลดไปขึ้นที่ server ดังนี้

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
