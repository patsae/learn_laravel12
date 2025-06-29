# Middleware

Middleware เป็นกลไกที่สะดวกสำหรับการตรวจสอบและกรองคำร้องขอ (HTTP Request) ที่เข้ามาในแอปพลิเคชัน

ตัวอย่างเช่น Laravel มี middleware สำหรับตรวจสอบว่า ผู้ใช้เข้าสู่ระบบหรือยัง

- ถ้าผู้ใช้ ยังไม่ได้เข้าสู่ระบบ ระบบจะ redirect ไปยังหน้าล็อกอิน
- ถ้าผู้ใช้ เข้าสู่ระบบแล้ว middleware จะ ปล่อยให้ request ดำเนินต่อได้

นอกจากนี้ยังสามารถเขียน middleware เพิ่มเติมเองได้ เพื่อทำงานอื่นๆ นอกเหนือจากการตรวจสอบสิทธิ์ เช่น การบันทึก log ของคำร้องขอทั้งหมดที่เข้ามา

Laravel มี middleware ให้เลือกใช้งานหลายแบบ เช่น:

- การยืนยันตัวตน (Authentication)
- การป้องกัน CSRF (Cross-Site Request Forgery)

โดยทั่วไป middleware ที่คุณสร้างเองจะอยู่ในโฟลเดอร์ **app/Http/Middleware**

# สร้าง Middleware

```
php artisan make:middleware IsAuth
```

- เปิดไฟล์ app/Http/Middleware/IsAuth.php

# Middleware and Responses

Middleware ของ Laravel สามารถทำงานก่อนหรือหลังที่ Request จะถูกส่งต่อไปยังส่วนอื่นๆ ของแอปพลิเคชั่น เช่น

- ทำงาน ก่อน ส่งต่อ ตรวจสอบสิทธิ์, ตรวจ header, log ข้อมูล, แปลง request ฯลฯ
- ทำงาน หลัง ส่งต่อ แก้ไข response, เพิ่ม header, log เวลาประมวลผล ฯลฯ

```
public function handle($request, Closure $next)
{
    // ทำงานก่อน
    Log::info('เริ่มต้นประมวลผล Request');

    $response = $next($request); // ส่งต่อ

    // ทำงานหลัง
    Log::info('ประมวลผลเสร็จแล้ว');

    return $response;
}

```

# Registering Middleware

##### Global Middleware

ถ้าหากต้องการให้ Middleware สามารถทำงานได้ทุก HTTP Request ที่ส่งเข้ามาในแอปพลิเคชั่น เราสามารถเพิ่ม middleware ดังกล่าวเข้าใน Stack middleware ของ Laravel ได้โดยการเพิ่ม middleware ของเราเข้าไปในไฟล์ bootstrap/app.php ในแอปพลิเคชั่นของเรา

```
use App\Http\Middleware\IsAuth;
->withMiddleware(function (Middleware $middleware): void {

    $middleware->append(IsAuth::class);

})
```

- $middleware เป็น Instance ของ **Illuminate\Foundation\Configuration\Middleware** ซึ่งทำหน้าที่ในการจัดการและกำหนด middleware ในแอปพลิเคชั่นของเรา
- append() เป็น method ที่ใช้ในการเพิ่ม middleware ไปยังท้ายรายการของ global middleware
- prepend() เป็น method ที่ใช้ในการเพิ่ม middleware ไปยังต้นรายการของ global middleware

##### Manually Managing Laravel's Default Global Middleware

นอกจากนี้หากเราต้องการจัดการ middleware เองแบบเต็มที่ เราสามารถกำหนด Stack เริ่มต้นของ Laravel เองได้ผ่าน method use() เราสามารถเพิ่มหรือลด middleware จาก stack นี้ได้ตามที่ต้องการ

```
use App\Http\Middleware\IsAuth;
->withMiddleware(function (Middleware $middleware): void {
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->use([
            \Illuminate\Foundation\Http\Middleware\InvokeDeferredCallbacks::class,
            \Illuminate\Http\Middleware\TrustProxies::class,
            \Illuminate\Http\Middleware\HandleCors::class,
            \Illuminate\Foundation\Http\Middleware\PreventRequestsDuringMaintenance::class,
            \Illuminate\Http\Middleware\ValidatePostSize::class,
            \Illuminate\Foundation\Http\Middleware\TrimStrings::class,
            \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,

            // add stack middleware here
        ]);
    })
})
```

##### Group Middleware

หากเรามี middleware หลายๆตัว เราสามารถจัดกลุ่ม stack การทำงานของ middleware ได้

```
use App\Http\Middleware\First;
use App\Http\Middleware\Second;

->withMiddleware(function (Middleware $middleware) {
    $middleware->appendToGroup('group-name', [
        First::class,
        Second::class,

    ]);

    $middleware->prependToGroup('group-name', [
        First::class,
        Second::class,
    ]);
})
```

##### Assigning Middleware to Routes

หากต้องการใช้ middleware เฉพาะบางเส้นทาง เราสามารถ Invoke middleware ต่อท้าย method เมื่อกำหนด route

```
use App\Http\Middleware\IsAuth;

Route::get('/', function () {
    // ...
})->middleware(IsAuth::class);

Route::get('/home', function () {
    // ...
})->middleware(IsAuth::class);

Route::get('/profile', function () {
    // ...
})->middleware(IsAuth::class);
```

หรือหากต้องการจัดกลุ่ม route สำหรับใช้ middleware

```
use App\Http\Middleware\IsAuth;

Route::middleware([IsAuth:class])->group(function(){
    Route::get('/', function () {
    // ...
    });

    Route::get('/home', function () {
        // ...
    });

    Route::get('/profile', function () {
        // ...
    });

    //หากต้องการยกเว้น สามารถใช้ withoutMiddleware() ในการข้าม middleware ในเส้นทางนี้ได้
    Route::get('/login', function(){
        // ...
    })->withoutMiddleware([IsAuth::class]);
})
```

สามารถดู Stack default middleware ของ Laravel ได้ที่ [Laravel's Default Middleware Groups](https://laravel.com/docs/12.x/middleware#laravels-default-middleware-groups)

# Workshop middleware

- สร้าง middleware สำหรับการตรวจสอบ login ของ user
- ถ้าผู้ใช้ ยังไม่ได้เข้าสู่ระบบ ระบบจะ redirect ไปยังหน้าล็อกอิน
- ถ้าผู้ใช้ เข้าสู่ระบบแล้ว middleware จะ redirect ไปยังหน้า home page
