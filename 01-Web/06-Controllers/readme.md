# Controller

ใน Laravel, Controller คือคลาสที่ทำหน้าที่จัดการคำขอ (HTTP request) จากผู้ใช้ และส่งกลับผลลัพธ์ (response) ที่เหมาะสม โดยมักทำหน้าที่เป็นตัวกลางระหว่าง Route และ Model / View

# 🔍 Controller คืออะไร?

- เป็นส่วนหนึ่งของแนวทาง MVC (Model - View - Controller)
- ใช้จัดระเบียบ logic การทำงาน เช่น ดึงข้อมูลจากฐานข้อมูล, คำนวณ, ตรวจสอบข้อมูล ฯลฯ
- ช่วยให้โค้ดแยกส่วน อ่านง่าย และดูแลรักษาได้ดี

# 📁 Laravel จะเก็บ controller ไว้ในโฟลเดอร์:

- app/Http/Controllers/

# 📄 สร้าง Controller

```
php artisan make:controller PageController

#หรือหากต้องการจัดกลุ่ม controller สามารถใส่ path ที่ต้องการไปด้วย
php artisan make:controller users/UserController
php artisan make:controller staff/StaffController
```

# 🔗 การเชื่อมกับ Route

- เปิดไฟล์ /routes/web.php
- สร้าง route ชื่อ /aboutme ขึ้นมาใหม่ โดยใน route นี้เราจะให้แสดงหน้าเพจ aboutme ขึ้นมา

```
use App\Http\Controllers\PageController;

Route::get('/aboutme', [PageController::class, 'aboutme_page']);
```

# ✅ สรุปหน้าที่ของ Controller ใน Laravel

- รับ request จาก Route ที่กำหนด
- ประมวลผล logic เช่น ตรวจสอบข้อมูล, ดึงจาก Model ฯลฯ
- ส่ง response หรือ data ไปที่ view, JSON, redirect หรืออื่นๆ
- จัดระเบียบโค้ด ทำให้ไม่เขียน logic อยู่ใน Route โดยตรง

# ▶️ Workshop การส่งค่าจาก Controller ไปยัง Views

ใน Laravel เราสามารถส่งค่าตัวแปรหรือข้อมูลที่ต้องการจาก Controller ไปยัง View ได้ด้วย compact()

- สร้าง function welcome_page ใน PageController

```
public function welcome_page()
{
    $pageTitle = "theAttractions";
    $attractions = [
        [
            "image_url" => "https://dummyjson.com/image/250",
            "name" => "วัดพระแก้ว",
            "content" => "วัดคู่บ้านคู่เมืองที่ประดิษฐานพระแก้วมรกต",
            "date" => "2025-06-29 21:23:35"
        ],
        [
            "image_url" => "https://dummyjson.com/image/250",
            "name" => "พระบรมมหาราชวัง",
            "content" => "พระราชวังหลวงของไทย มีสถาปัตยกรรมงดงาม",
            "date" => "2025-06-29 21:23:35"
        ],
        [
            "image_url" => "https://dummyjson.com/image/250",
            "name" => "วัดอรุณราชวราราม",
            "content" => "วัดชื่อดังริมแม่น้ำเจ้าพระยา มีพระปรางค์สูงเด่น",
            "date" => "2025-06-29 21:23:35"
        ],
    ];

    return view('welcome', compact('pageTitle', 'journey'));
}
```

- แก้ไข welcome.blade.php
- ใน Views ของ laravel สามารถใช้งานตัวแปรที่มาจาก Controller ได้ทันที
- หากต้องการแทรกค่าของตัวแปรใน tag ของ HTML สามารถทำได้โดยแทรกตัวแปลลงในเครื่องหมาย {{ $variable }}

> <some-html-tag>{{ $pageTitle }}</some-html-tag>

# Laravel Blade Directive

ใน Blade template ของ Laravel ได้เตรียมชุดคำสั่งเอาไว้มากมาย เพื่ออำนวยความสะดวกในการเขียนโค้ด

##### Conditions

```
@if ($conditions)
    //do something..
@endif
```

```
@if ($conditions)
    //do something..
@elseif ($other_conditions)
    //do something..
@endif
```

```
@switch($conditions)
    @case('match')
        //do something..
    @break

    @default
        //do something..
@endswitch
```

```
@isset($hasValue)
    //do some thing..
@endisset
```

##### loops

```
@foreach ($values as $value)
    //do something..
@endforeach
```

##### Debug

```
@dd("Debug code")
```
