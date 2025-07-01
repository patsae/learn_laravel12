# Database

Laravel ได้ออกแบบระบบให้สามารถทำงานกับฐานข้อมูลได้ง่ายมาก โดยมีการรองรับการเขียนโปรแกรมติดต่อกับฐานข้อมูล 3 แบบดังนี้

- การเขียน SQL (Raw SQL)
- การใช้ Query Builder
- การใช้ Eloquent ORM

# ✅ Laravel รองรับแบบ built-in 5 ตัว ได้แก่

1. MariaDB 10.3+
2. MySQL 5.7+
3. PostgreSQL 10.0+
4. SQLite 3.26.0+
5. SQL Server 2017+

# Configuration

โดยปกติ Laravel จะเชื่อมต่อกับฐานข้อมูลให้ทันที เมื่อแอปพลิเคชั่นเริ่มทำงาน เราสามารถกำหนดการเชื่อมต่อได้ที่ไฟล์

> config/database.php

สามารถกำหนดโปรไฟล์การเชื่อมต่อฐานข้อมูลได้ใน connections

```
'connections' => [

    'sqlite' => [
        'driver' => 'sqlite',
        'url' => env('DB_URL'),
        'database' => env('DB_DATABASE', database_path('database.sqlite')),
        'prefix' => '',
        'foreign_key_constraints' => env('DB_FOREIGN_KEYS', true),
        'busy_timeout' => null,
        'journal_mode' => null,
        'synchronous' => null,
    ],

],
```

# RAW SQL

หลังจากที่ตั้งค่า config/database.php และสามารถเชื่อมต่อกับฐานข้อมูลได้แล้ว Laravel ได้จัดเตรียม Class สำหรับจัดการฐานข้อมูลไว้ใช้งานดังนี้ **Illuminate\Support\Facades\DB** โดยใน Class นี้เราจะสามารถใช้คำสั่ง Query select, update, insert, delete ได้ตามต้องการ

- DB facade มีเมธอดสำหรับคำสั่ง SQL แต่ละประเภท เช่น:
  - select() → ใช้กับคำสั่ง SELECT
  - insert() → ใช้กับ INSERT
  - update() → ใช้กับ UPDATE
  - delete() → ใช้กับ DELETE
  - statement() → ใช้กับ SQL อื่น ๆ เช่น CREATE TABLE, DROP TABLE

### SELECT

```
use Illuminate\Support\Facades\DB;

$users = DB::select('SELECT * FROM users WHERE active = ?', [1]);

foreach ($users as $user) {
    echo $user->name;
}
```

### INSERT

```
use Illuminate\Support\Facades\DB;

DB::insert('INSERT INTO users (name, email) VALUES (?, ?)', [
    'Byrd', 'byrd@example.com'
]);

```

### UPDATE

```
use Illuminate\Support\Facades\DB;

DB::update('UPDATE users SET active = 0 WHERE last_login < ?', [
    '2024-01-01'
]);

```

### DELETE

```
use Illuminate\Support\Facades\DB;

DB::delete('DELETE FROM users WHERE active = 0');

```

### STATEMENT

```
use Illuminate\Support\Facades\DB;

DB::statement('DROP TABLE IF EXISTS temp_users');

```

### ⚠️ หมายเหตุ:

- คำสั่ง Raw SQL เหมาะสำหรับกรณีที่ Query Builder หรือ Eloquent ไม่สามารถตอบโจทย์ได้ เช่น คำสั่งซับซ้อนมาก ๆ
- Laravel จะใช้ PDO (PHP Data Objects) ในเบื้องหลัง ทำให้มั่นใจได้ว่าปลอดภัยจาก SQL Injection เมื่อใช้ ? แทนค่าที่ส่งเข้าไป
