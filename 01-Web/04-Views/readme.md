# View

ในการสร้างหน้าเพจของ Laravel จะใช้ Blade template ซึ่งเป็น Template Engine ของ Laravel เอง โดยในการสร้างหน้าเพจจะทำการสร้างในโฟลเดอร์ /resources/views และให้ต่อท้ายชื่อไฟล์ของเราด้วย \*.blade.php

> **ตัวอย่างไฟล์ view ของ laravel**
>
> - resources/
>   - views/
>     - welcome.blade.php

# Nested View Directories

หากใน views ของเรามีการแบ่งโฟลเดอร์เพื่อจัดการแยกเพจออกเป็นกลุ่ม สามารถใช้เครื่องหมาย "." (dot) เพื่ออ้างอิงโฟลเดอร์ที่ซ้อนกัน เช่น /resources/views/admin/profile.blade.php เราสามารถอ้างอิงถึงไฟล์ได้โดย

> return view('admin.profile', $data);

# Workshop สร้าง Layout และ Page ใน Laravel

##### First Page

- เปิดไฟล์ /resources/view/welcome.blade.php
- ให้ลบทุกอย่างทิ้ง
- สร้างโค้ด html 5 ใหม่แทนลงไป

```
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
</head>

<body>
    <div class="body">

        <div class="content-body">
            <h1>Hello World</h1>
        </div>

    </div>

</body>

</html>
```

##### สร้าง Layout

- สร้างโฟลเดอร์ชื่อ layouts ใน /resources/views
- สร้างไฟล์ชื่อ layout.blade.php ใน /resources/views/layouts
- สร้างโค้ด template html ตามที่เราต้องการ

```
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('pageTitle')</title>
    @vite('resources/css/app.css')
</head>

<body>

   @yield('pageContent')

    @vite('resources/js/app.js')
</body>

</html>
```

- @yield() ใน Laravel คือ Blade directive (คำสั่งพิเศษใน Blade template engine) ที่ใช้สำหรับกำหนด "ตำแหน่งวางเนื้อหา" จากเทมเพลตย่อย (child view) ที่จะมาแทนในเทมเพลตหลัก (layout)

##### ใช้งาน Layout

- เปิดไฟล์ /resources/view/welcome.blade.php
- ลบเนื้อหา HTML ออกทั้งหมด
- พิมพ์คำสั่ง

```
@extends('layouts.layout')

@section('pageTitle', 'หน้าแรก')

@section('pageContent')
    <div>
        <h1>Hello World</h1>
    </div>
@endsection
```

- @extends ใน Laravel คือ คำสั่ง Blade (Blade Directive) ที่ใช้สำหรับ บอกว่า view ปัจจุบันนี้จะใช้ layout ที่ชื่อว่า layouts/layout.blade.php เป็นแม่แบบ (template)
- @section คือคำสั่งใน Blade Template Engine ของ Laravel ซึ่งใช้สำหรับกำหนด “ส่วนของเนื้อหา” (section) ที่จะถูกนำไปแสดงใน layout หลัก (เช่น layouts.app)
