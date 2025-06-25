# โครงสร้างโปรเจค Laravel Application

##### The App Directory

- "app" จะเก็บโค้ดหลักของแอปพลิเคชันทั้ง Controller, Model, Middleware ฯลฯ

##### The Bootstrap Directory

- "bootstrap" จะเก็บไฟล์ app.php ซึ่งทำหน้าที่เริ่มต้นการทำงานของเฟรมเวิร์ก ไดเรกทอรีนี้ยังมีโฟลเดอร์ย่อยชื่อ cache ซึ่งเก็บไฟล์ที่ถูกสร้างโดยเฟรมเวิร์กเพื่อเพิ่มประสิทธิภาพในการทำงาน เช่น ไฟล์แคชของเส้นทาง (routes) และบริการ (services) ต่างๆ

##### The Config Directory

- "config" มีหน้าที่เก็บไฟล์การตั้งค่าทั้งหมดของแอปพลิเคชัน

##### The Public Directory

- "public" จะเก็บไฟล์ index.php ซึ่งเป็นจุดเริ่มต้นของทุกคำขอ (request) ที่เข้ามายังแอปพลิเคชัน และทำหน้าที่กำหนดการโหลดอัตโนมัติ (autoloading)
  นอกจากนี้ไดเรกทอรีนี้ยังเก็บไฟล์ asset ของคุณ เช่น รูปภาพ, JavaScript และ CSS

##### The Resources Directory

- "resources" จะเก็บไฟล์ view รวมถึง asset ดิบ (raw asset) ที่ยังไม่ถูกคอมไพล์ เช่น CSS หรือ JavaScript

##### The Routes Directory

- routes จะเก็บไฟล์นิยามเส้นทาง (route) ทั้งหมดของแอปพลิเคชัน โดยค่าเริ่มต้น Laravel จะมีไฟล์ route มาให้ 2 ไฟล์คือ: web.php และ console.php

  ไฟล์ web.php จะเก็บ route ที่ Laravel จัดให้อยู่ในกลุ่ม middleware ชื่อว่า web ซึ่งให้บริการ session, การป้องกัน CSRF และการเข้ารหัส cookie
  หากแอปพลิเคชันของคุณไม่ได้ให้บริการ API แบบ REST ที่ไม่มีสถานะ (stateless) เส้นทางทั้งหมดของคุณก็มักจะถูกนิยามไว้ในไฟล์ web.php

  ไฟล์ console.php ใช้สำหรับนิยามคำสั่งแบบ closure-based (ไม่มี class) ที่จะใช้ใน CLI โดยแต่ละ closure จะผูกกับ instance ของคำสั่ง
  แม้ว่าไฟล์นี้จะไม่ได้กำหนดเส้นทาง HTTP แต่มันก็ถือว่าเป็นจุดเข้าใช้งาน (route) ในระดับ console
  คุณยังสามารถตั้งเวลาให้คำสั่งทำงานอัตโนมัติผ่านไฟล์ console.php ได้อีกด้วย

  นอกจากนี้คุณยังสามารถติดตั้งไฟล์ route เพิ่มเติมได้ เช่น:

  api.php สำหรับ API routes โดยใช้คำสั่ง

  ```
  php artisan install:api
  ```

  ไฟล์ api.php จะเก็บ route ที่ออกแบบให้ไม่มีสถานะ (stateless) ซึ่งหมายความว่า request ที่เข้ามาทางเส้นทางเหล่านี้จะต้องใช้ token ในการยืนยันตัวตน และจะไม่สามารถเข้าถึง session ได้

##### The Storage Directory

- "storage" จะเก็บข้อมูลต่างๆ เช่น log, ไฟล์ Blade ที่คอมไพล์แล้ว, session ที่เก็บเป็นไฟล์, แคชที่เก็บเป็นไฟล์ และไฟล์อื่นๆ ที่สร้างโดยเฟรมเวิร์ก
  ภายในจะถูกแบ่งออกเป็น 3 ส่วน:

  - app สำหรับเก็บไฟล์ที่แอปพลิเคชันของคุณสร้างขึ้น
  - framework สำหรับเก็บไฟล์และแคชที่ Laravel สร้างขึ้น
  - logs สำหรับเก็บไฟล์ log ของแอปพลิเคชัน

    - ไดเรกทอรีย่อย storage/app/public ใช้สำหรับเก็บไฟล์ที่ผู้ใช้งานสร้างขึ้น เช่น รูปโปรไฟล์ และควรสามารถเข้าถึงได้จากสาธารณะ
      คุณควรสร้าง symbolic link ที่ public/storage ซึ่งชี้ไปยังไดเรกทอรีนี้
      สามารถสร้างลิงก์ได้โดยใช้คำสั่ง Artisan:

    ```
    php artisan storage:link
    ```

# First Step

จุดเริ่มต้นของทุกคำขอ (request) ที่เข้ามายังแอปพลิเคชัน Laravel คือไฟล์ public/index.php
คำขอทั้งหมดจะถูกส่งมายังไฟล์นี้โดยการตั้งค่าของ Web Server (เช่น Apache หรือ Nginx)
โดยไฟล์ index.php จะไม่ได้มีโค้ดจำนวนมาก แต่มันทำหน้าที่เป็นจุดเริ่มต้นในการโหลดส่วนต่างๆ ที่เหลือของเฟรมเวิร์ก

ไฟล์ index.php จะทำการโหลด autoloader ที่ถูกสร้างโดย Composer และจากนั้นจะดึงอินสแตนซ์ของแอปพลิเคชัน Laravel มาจากไฟล์ bootstrap/app.php
การทำงานแรกที่ Laravel ดำเนินการคือ การสร้างอินสแตนซ์ของ application / service container ขึ้นมา

# PHP Artisan

PHP Artisan คือชุดคำสั่งที่มาพร้อมกับเฟรมเวิร์ก Laravel ซึ่งใช้สำหรับจัดการงานต่างๆ ในโปรเจกต์ เช่น การสร้างไฟล์, การจัดการฐานข้อมูล, การจัดการแคช, และอื่นๆ อีกมากมาย โดยทำงานผ่าน Command Line Interface (CLI) เพื่อช่วยให้การพัฒนาเป็นไปอย่างรวดเร็วและมีประสิทธิภาพ

##### ข้อมูลภายในโปรเจค

```
    php artisan about
```

##### ข้อมูลเส้นทาง (Routing)

```
    php artisan route:list
```

##### สร้าง Controller, Model, View

```
    php artisan make:controller [Controller name]
    php artisan make:model [Model name]
    php artisan make:view [View name]
```

##### การติดตั้ง Install

```
    php artisan install:api
```

# .env

.env คือไฟล์ที่ใช้เก็บค่า Environment Variables ซึ่งเป็นตัวแปรที่ใช้ในการกำหนดค่าต่างๆ สำหรับโปรเจกต์ เช่น API keys, database credentials, หรือการตั้งค่าอื่นๆ ที่อาจแตกต่างกันไปในแต่ละสภาพแวดล้อม (development, production)

```
   copy .env .env.dev
   copy .env .env.production
```

- แก้ไข composer.json ที่ key "scripts" เพิ่มคำสั่งดังนี้

```
      "dev": [
        "Composer\\Config::disableProcessTimeout",
+++     "@php -r \"copy('.env.dev', '.env');\"",
        "npx concurrently -c \"#93c5fd,#c4b5fd,#fdba74\" \"php artisan serve\" \"php artisan queue:listen --tries=1\" \"npm run dev\" --names='server,queue,vite'"
      ],
+++   "build": [
+++     "@php -r \"copy('.env.production', '.env');\""
+++   ],
```
