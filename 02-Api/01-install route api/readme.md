# Route for Api

การสร้าง route สำหรับเส้น api โดยปกติมักจะทำ route แยกออกมาจากใน่สวนของ /route/web.php เพื่อความสะดวกในการบริหารจัดการและความเป็นระเบียบเรียบร้อย

```
php artisan install:api
One new database migration has been published. Would you like to run all pending database migrations? (yes/no) [no]:
```

เมื่อทำการติดตั้ง route api เสร็จแล้วจะได้ไฟล์ /routes/api.php เพิ่มขึ้นมาและใน /bootstrap/app.php จะมีการลงทะเบียน route ของ api เพิ่มขึ้นมา

```
        /routes
++++     - api.php
         - web.php
         - console.php

        return Application::configure(basePath: dirname(__DIR__))
        ->withRouting(
            web: __DIR__.'/../routes/web.php',
++++        api: __DIR__.'/../routes/api.php',
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

# The api Middleware Group

ใน Laravel จะมี middleware เพียง 1 ตัวที่ใช้ในการตรวจสอบ route ของ Api คือ **Illuminate\Routing\Middleware\SubstituteBindings** ซึ่งมีหน้าที่ในการจับคู่ route parameter กับ model โดยอัตโนมัติ (เรียกว่า Route Model Binding) เพราะฉะนั้นเราจะต้องสร้าง middleware มาเพิ่ม เพื่อใช้ในการตรวจสอบและป้องกัน Api ของเรา ซึ่งวิธีที่ใช้ตรวจสอบมีหลายวิธี เช่น การ Authentication เก็บ cookie หรือ session, JWT เป็นต้น

```
php artisan make:middleware IsAuth
```

```
class IsAuth
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = json_decode($request->cookie('user'));

        if (
            empty($user) ||
            !isset($user->email) ||
            empty($user->email)
        ) {
            return redirect('login');
        }

        return $next($request);
    }
}
```

- เปิดไฟล์ bootstrap/app.php แล้วลงทะเบียน middleware

```
->withMiddleware(function (Middleware $middleware): void {
    $middleware->alias([
        'IsAuth' => IsAuth::class
    ]);
})
```
