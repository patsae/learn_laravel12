# Eloquent ORM

Eloquent เป็น ORM (Object-Relational Mapper) ที่มาพร้อมกับ Laravel โดยจะมองตารางเป็นคลาสหรือ object ช่วยให้เขียนโค้ดได้ง่ายขึ้นและจัดการตารางฐานข้อมูลผ่าน object ได้สะดวก

# Generating Model Classes

```
php artisan make:model Attractions
```

หลังจากทำคำสั่งเสร็จจะได้ไฟล์ model Attractions ขึ้นมาที่ app/Models/Attractions

```
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Attractions extends Model
{
    // ...
}
```

### Database Connections

โดยปกติ Eloquent จะอ่าน config จากไฟล์ config/database.php เพื่อเชื่อมต่อกับฐานข้อมูล แต่หากเราต้องการเปลี่ยน config การเชื่อมต่อฐานข้อมูล ให้เราระบุชื่อ config อื่นดังนี้

```
protected $connection  = 'other_config_name';
```

### Table Names

หลังจากที่สร้าง Model ขึ้นมาแล้ว โดยปกติ Eloquent จะอ้างอิงชื่อตารางเป็นชื่อเดียวกับไฟล์ ดังนั้นเราสามารถจัดการข้อมูลในตารางได้ทันที แต่หากเราต้องการกำหนดเองสามารถทำได้ผ่านตัวแปรที่ชื่อ $table

```
protected $table = 'my_table';
```

### Primary Keys

ทุกๆ Model ที่ถูกสร้างขึ้น Eloquent จะสันนิษฐานว่า primary key ของตารางมีชื่อว่า id และมีชนิดเป็น int และมี option เป็น auto increment แต่เราสามารถกำหนดเองได้หากว่าชื่อ Field หรือชนิด มีความแตกต่าง

```
protected $primaryKey  = 'pk_field';
protected $keyType = "string";  // ตั้งค่าให้ primary key เป็นชนิด string

public $incrementing = false; // บอก Eloquent ไม่ต้อง auto increment
```

### Timestamps

Eloquent จะคาดหวังว่าทุกตารางจะมี field ที่บันทึกวันเวลาที่สร้างและปรับปรุงข้อมูล โดยปกติ Eloquent จะมองหา field ที่ชื่อ created_at และ update_at ทุกครั้งที่มีการสร้างหรือปรับปรุงข้อมูล

```
const CREATED_AT = 'creation_date'; //กำหนดชื่อ field สำหรับบันทึกวันเวลาที่สร้างข้อมูล
const UPDATED_AT = 'updated_date'; //กำหนดชื่อ field สำหรับบันทึกวันเวลาที่ปรับปรุงข้อมูล
protected $dateFormat = 'U'; //กำหนด Formate date

public $timestamps = false; // บอก Eloquent ไม่ต้องบันทึก created_at กับ update_at ทุกครั้งที่มีการสร้างหรือปรับปรุงข้อมูล
```

# Retrieving Models

เมื่อสร้าง Model และ ตารางในฐานข้อมูล ที่เกี่ยวข้องเสร็จเรียบร้อยแล้ว ก็พร้อมที่จะเริ่มดึงข้อมูลจากฐานข้อมูลได้ทันที
Eloquent model เป็น query builder ที่ช่วยให้เขียนคำสั่งเพื่อดึงข้อมูลจากตารางที่ model นั้นเชื่อมโยงอยู่ได้อย่างง่ายดาย เช่น หากต้องการดึงข้อมูลทั้งหมดในตารางสามารถใช้เมธอด all() ได้เลย

```
use App\Models\Attractions;

foreach (Attractions::all() as $attr) {

    echo $attr->name;

}
```

นอกจากนี้ Eloquent model ยังสามารถทำหน้าที่เป็น Query Builder ได้อีกด้วย เราจึงสามารถเพิ่มเงื่อนไขต่างๆ เข้าไปและเรียกใช้ get() เพื่อดึงผลลัพธ์ออกมา

```
use App\Models\Attractions;

$attractions = Attractions::where('active', 1)
    ->orderBy('name')
    ->limit(10)
    ->get();
```

# INSERT & UPDATE

```
use App\Models\Attractions;

$inserted = Attractions::create([
    'name' => 'Lamphun'
])

หรือ

$attractions = new Attractions;
$attractions->name = $request->name;
$attractions->save();
```

```
use App\Models\Attractions;

$affectedRows = Attractions::where('id', 1)->update(['active' => 0]);

หรือ

$attractions = Attractions::find(1);
$attractions->name = "London";
$attractions->save();
```

```
use App\Models\Attractions;

$attractions = Attractions::updateOrCreate(
    [
        'name' => 'London'
        'active' => 1
    ],
    [
        'name' => 'Paris'
        'active' => 0
    ],
);

```

# DELETE

```
use App\Models\Attractions;

$attractions = Attractions::find(1);
$attractions->delete();

หรือ

$deleted = Attractions::where('active', 0)->delete();

```
