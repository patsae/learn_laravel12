# Routing

การจัดการ routing ใน Laravel จะกระทำในโฟลเดอร์ /routes ในโฟลเดอร์นี้เราสามารถสร้าง route มาเพื่อใช้ควบคุมการเข้าถึงหน้าเพจต่างๆ ของแอปพลิเคชั่น
หากมีการเพิ่มไฟล์ route ใหม่จะต้องไปลงทะเบียนในไฟล์ /bootstap/app.php ด้วยเพื่อให้สามารถใช้งาน route นั้นได้

```
return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        //
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
```

- เปิดไฟล์ /routes/web.php
- ในไฟล์นี้จะเห็นว่ามี route อยู่หนึ่งเส้นคือ '/' ซึ่งหมายถึง Homepage ของเว็บไซต์

```
Route::get('/', function () {
    return view('welcome');
});
```

##### รายละเอียดแต่ละส่วน:

- Route::get(...)
  - กำหนดเส้นทางสำหรับ HTTP GET request (เช่น เวลาผู้ใช้พิมพ์ URL เข้ามาในเบราว์เซอร์)
  - หากต้องการให้เส้นทางนี้เป็น GET, POST, PUT, DELETE เราสามารถกำหนด HTTP method ได้ที่ตรงนี้
- '/'
  - หมายถึง เส้นทางหลัก (Homepage) ของเว็บไซต์ เช่น http://yourdomain.com/
- function () { return view('welcome'); }
  - เป็น callback function (หรือ closure) ที่จะถูกเรียกเมื่อมีการเข้าถึงเส้นทาง /
  - ในที่นี้ view('welcome') หมายถึงการแสดงผล หน้า View ชื่อ welcome.blade.php ซึ่งมักอยู่ใน resources/views/welcome.blade.php

# Route Parameters

ใน Laravel เราสามารถส่ง Parameters ต่างๆ มากับ url หรือรับค่า Parameters จาก url ได้โดยการประกาศ parameter ไว้ในเครื่องหมาย { } แล้วที่ callback function ให้ประกาศตัวแปรสำหรับรับ parameter จาก url ขึ้นมา โดยชื่อ paramter ที่ url กับที่ callback function ต้องเป็นชื่อเดียวกัน

```
Route::get('/users/{id}', function (string $id) {
    return 'User id is '.$id;
});

Route::get('/users/{faculty}/{unit}', function (string $faculty, string $unit) {
    return 'Faculty is '. $faculty . ' and Unit is ' . $unit;
});
```

# Option Parameter

นอกจากนี้ยังสามารถทำเป็น option parameter ด้วยการใส่เครื่องหมาย ? ต่อท้ายชื่อ parameter

```
Route::get('/users/{id}/{name?}', function (string $id, ?string $name = null) {
    return "User " . ($name ?? '') . " id is " . $id;
});
```

# Regular Expression Constraints

สามารถกำหนด Regular expression สำหรับการตรวจสอบ parameter ที่ส่งมาใน route ได้

```
Route::get('/users/{idx}', function (string $idx) {
    return $idx;
})->where('idx', '^[0-9]\d{12}$');

Route::get('/users/{id}/{name}', function (string $id, string $name) {
    // ...
})->whereNumber('id')->whereAlpha('name');
```

# Named Routes

เราสามารถตั้งชื่อให้ route นี้ได้ด้วย method name() เพื่อความสะดวกในการเรียกใช้เขียนโปรแกรม โดยชื่อที่ตั้งใน name() จะต้องเป็น unique ที่ไม่ซ้ำกัน แล้วจะเรียกใช้ naming ผ่าน method ที่ชื่อว่า route()

```
Route::get('/users/{id}/profile', function (string $id) {
    // ...
})->name('profile');

$url = route('profile', ['id' => 1]);
```

# Route fallback

โดยปรกติหาก Laravel ไม่พบ url จะคืนค่ากลับเป็นหน้าเพจ 404 แต่หากเราต้องการจัดการเองสามารถทำได้ผ่าน Route::fallback()

```
Route::fallback(function(){
    return "ไม่พบหน้าเพจ";
});
```

# Route Groups

สามารถจัดการ route ให้เป็นกลุ่มได้ด้วย function group()

```
Route::prefix('/users')->group(function () {
    Route::get('/john', function () {
        return "john";
    });

    Route::get('/david', function () {
        return "david";
    });

    Route::get('/milo', function () {
        return "milo";
    });
});
```

# Workshop การรับ Request จาก HTTP Request

ใน Controller ของ Laravel เราสามารถรับค่าที่ส่งมาจาก HTTP Request ได้ด้วย **Class Illuminate\Http\Request**

- เพิ่ม route / ขึ้นมาใหม่ใน route group ของ /users

```
Route::get('/', function (Request $request) {
    $req['url'] = $request->url();
    $req['method'] = $request->method();
    $req['ip'] = $request->ip();
    $req['email'] = $request->get("email");

    dd($req);
});
```

- ทดสอบ http://localhost:8000/users?email=med@mail.com
