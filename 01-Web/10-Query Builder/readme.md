# Query Builder

Laravel ได้จัดเตรียม Query Builder เอาไว้สำหรับการสร้างและเรียกใช้คำสั่ง SQL

- สามารถใช้ Query Builder ทำงานกับฐานข้อมูลได้เกือบทั้งหมดในแอปพลิเคชั่น
- และสามารถใช้งานได้กับ ฐานข้อมูลทุกประเภทที่ Laravel รองรับ

Query Builder ของ Laravel ใช้ PDO parameter binding ซึ่งช่วยป้องกัน การโจมตีแบบ SQL Injection ดังนั้นไม่จำเป็นต้องล้างหรือกรองค่าข้อมูล ที่ส่งเข้าไปเองเมื่อใช้ query builder

# ตัวอย่างการใช้งาน Query Builder

### SELECT

```
use Illuminate\Support\Facades\DB;

$query = DB::table('users')
            ->where('active', 1)
            ->orderBy('name')
            ->get();

$users = [];
foreach ($query as $rows) {
    array_push($users, $rows);
}

dd($users);
```

### INSERT

```
use Illuminate\Support\Facades\DB;

DB::table('users')->insert([
    'name' => 'Byrd',
    'email' => 'byrd@example.com',
]);
```

### UPDATE

```
use Illuminate\Support\Facades\DB;

DB::table('users')
    ->where('id', 1)
    ->update(['active' => 0]);
```

### DELETE

```
use Illuminate\Support\Facades\DB;

DB::table('users')
    ->where('active', 0)
    ->delete();
```

### JOIN

```
use Illuminate\Support\Facades\DB;

DB::table('users')
    ->join('department', 'user.depId', '=', 'department.id')
    ->leftJoin('permission', 'user.perId', '=', 'permission.id')
    ->get();
```

ตัวอย่างเพิ่มเติม [Laravel Query Builder](https://laravel.com/docs/12.x/queries#running-database-queries)

# Paginating Query Builder

Laravel ได้เตรียมการทำ Paginate ให้กับ Query Builder และ Eloquent query เพื่อใช้ในการจัดการกับข้อมูลปริมาณมากแล้วแสดงแบบทีละหน้า
Method paginate จะจัดการกับ limit กับ offset ให้อัตโนมัติ และยังมีลิงก์ที่สร้างโดย paginator ให้อีกด้วย โดย Laravel จะตรวจจับหน้าปัจจุบันจาก query string ที่ชื่อว่า page ใน HTTP request ซึ่ง Laravel จะจัดการให้เองแบบอัตโนมัติ

```
use Illuminate\Support\Facades\DB;

$attractions = DB::table('places')->paginate(3);

```

### การแสดงผลใน View

```
{{ $attractions->links() }}
```

### ตกแต่ง Paginate

Laravel มีธีมสำเร็จรูปให้ใช้ 2 แบบ คือ

- useTailwind() (ค่าเริ่มต้น) Tailwind CSS
- useBootstrap() Bootstrap

แต่หากต้องการตกแต่งให้เขากับ theme ของแอปพลิเคชั่นของเราเองก็สามารถตกแต่งเองได้

- รันคำสั่งนี้เพื่อให้ Laravel สร้างไฟล์ pagination ใน view

```
php artisan vendor:publish --tag=laravel-pagination
```

- เลือกไฟล์ที่ต้องการแก้ไขหรือสร้างใหม่ตามที่ต้องการ
- หลังจากที่ตกแต้งเสร็จแล้วสามารถเรียกใช้งานได้ทันที

```
{{ $attractions->links('view.pagination.theme.name') }}
```

- หรือกำหนดใช้งานได้ที่ไฟล์ App\Providers\AppServiceProvider.php แล้วเพิ่มใน boot()

```
use Illuminate\Pagination\Paginator;

public function boot(): void
{
    Paginator::defaultView('view.pagination.theme.name');
}

```
