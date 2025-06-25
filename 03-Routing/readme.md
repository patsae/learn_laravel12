# Routing

การจัดการ routing ใน Laravel จะกระทำในโฟลเดอร์ /routes ในโฟลเดอร์นี้เราสามารถสร้าง route มาเพื่อใช้ควบคุมการเข้าถึงหน้าเพจต่างๆ ของ application
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

##### Route

- เปิดไฟล์ /routes/web.php
- ในไฟล์นี้จะให้ว่ามี route อยู่หนึ่งเส้นคือ '/' ซึ่งหมายถึง Homepage ของเว็บไซต์

```
Route::get('/', function () {
    return view('welcome');
});
```

##### รายละเอียดแต่ละส่วน:

- Route::get(...)
  → กำหนดเส้นทางสำหรับ HTTP GET request
  (เช่น เวลาผู้ใช้พิมพ์ URL เข้ามาในเบราว์เซอร์)
  → หากต้องการให้เส้นทางนี้เป็น GET, POST, PUT, DELETE เราสามารถกำหนด HTTP method ได้ที่ตรงนี้
- '/'
  → หมายถึง เส้นทางหลัก (Homepage) ของเว็บไซต์
  เช่น http://yourdomain.com/
- function () { return view('welcome'); }
  → เป็น callback function (หรือ closure) ที่จะถูกเรียกเมื่อมีการเข้าถึงเส้นทาง /
  → ในที่นี้ view('welcome') หมายถึงการแสดงผล หน้า View ชื่อ welcome.blade.php ซึ่งมักอยู่ใน resources/views/welcome.blade.php

# Route Parameters

ใน Laravel เราสามารถส่ง Parameters ต่างๆ มากับ url หรือรับค่า Parameters จาก url ได้โดยการประกาศ parameter ไว้ในเครื่องหมาย {} แล้วที่ callback function ให้ประกาศตัวแปรสำหรับรับ parameter จาก url ขึ้นมา โดยชื่อ paramter ที่ url กับที่ callback function ต้องเป็นชื่อเดียวกัน

```
Route::get('/user/{id}', function (string $id) {
    return 'User '.$id;
});

Route::get('/user/{faculty}/{unit}', function (string $faculty, string $unit) {
    return 'User '. $faculty . ' ' . $unit;
});
```

# Option Parameter

นอกจากนี้ยังสามารถทำเป็น option parameter ด้วยการใส่เครื่องหมาย ? ต่อท้ายชื่อ parameter

```
Route::get('/user/{name?}', function (?string $name = null) {
    return $name;
});
```

# Regular Expression Constraints

สามารถกำหนด Regular expression สำหรับการตรวจสอบ parameter ที่ส่งมาใน route ได้

```
Route::get('/user/{idx}', function (string $idx) {
    return $idx;
})->where('id', '^[0-9]\d{0,12}$');

Route::get('/user/{id}/{name}', function (string $id, string $name) {
    // ...
})->whereNumber('id')->whereAlpha('name');
```

# Named Routes

ในบางครั้งเราอาจมี route ยาวเกินไป เราสามารถตั้งชื่อให้ route นี้ได้ด้วยฟังกชั่น name();

```
Route::get('/user/profile', function () {
    // ...
})->name('profile');
```

# Route Groups

สามารถจัดการ route ให้เป็นกลุ่มได้ด้วย function group()

```
Route::get('/user')->group(function(){
    Route::post('/add', function(){
        //add user
    })
    Route::put('/update', function(){
        //update user
    })
    Route::delete('/delete', function(){
        //delete user
    })
});
```
