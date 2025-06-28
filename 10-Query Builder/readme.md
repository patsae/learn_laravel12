# Query Builder

Laravel ได้จัดเตรียม Query Builder เอาไว้สำหรับการสร้างและเรียกใช้คำสั่ง SQL

- สามารถใช้ Query Builder ทำงานกับฐานข้อมูลได้เกือบทั้งหมดในแอปพลิเคชั่น
- และสามารถใช้งานได้กับ ฐานข้อมูลทุกประเภทที่ Laravel รองรับ

Query Builder ของ Laravel ใช้ PDO parameter binding ซึ่งช่วยป้องกัน การโจมตีแบบ SQL Injection ดังนั้นไม่จำเป็นต้องล้างหรือกรองค่าข้อมูล ที่ส่งเข้าไปเองเมื่อใช้ query builder

# ตัวอย่างการใช้งาน Query Builder

### SELECT

```
use Illuminate\Support\Facades\DB;

$users = DB::table('users')
            ->where('active', 1)
            ->orderBy('name')
            ->get();
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
