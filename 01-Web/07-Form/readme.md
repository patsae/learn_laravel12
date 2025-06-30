# การสร้างแบบฟอร์มใน Laravel

### 🔐 CSRF Field (ฟิลด์ป้องกันการปลอมคำขอ)

ทุกครั้งที่มีการสร้างฟอร์ม HTML ในแอปพลิเคชันของ Laravel ควรจะเพิ่มฟิลด์ CSRF (hidden field) ลงในฟอร์มด้วย เพื่อให้ middleware ของ Laravel สามารถตรวจสอบความถูกต้องของคำขอได้ เราสามารถใช้คำสั่งของ Blade Template ในการสร้างฟิลด์ CSRF ได้ด้วยคำสั่ง @csrf

### ❓ CSRF คืออะไร?

CSRF ย่อมาจาก Cross-Site Request Forgery เป็นเทคนิคโจมตีรูปแบบหนึ่ง ที่ผู้ไม่หวังดีหลอกให้ผู้ใช้ทำคำสั่งโดยไม่รู้ตัว (เช่นกดลิงก์ แล้วข้อมูลถูกส่ง HTTP Request ไปที่เว็บโดยผู้ใช้ไม่ตั้งใจ) เพื่อไปกระทำการบางอย่างที่เป็นอันตรายต่อผู้ใช้งาน

![Fake Request](fake_request.png)

### ✅ Laravel ป้องกัน CSRF อย่างไร?

Laravel มี middleware ชื่อว่า ValidateCsrfToken ซึ่งจะทำการตรวจสอบว่า คำขอที่ส่งมานั้นมี CSRF token ที่ถูกต้องหรือไม่หากไม่มีระบบจะปฏิเสธคำขอทันที

- ผู้ใช้สร้างฟอร์ม Laravel และใส่ CSRF Token ลงไปใน <input type="hidden" name="_token">
- ผู้ใช้ส่งฟอร์ม (POST, PUT, PATCH, DELETE)
- Middleware ตรวจสอบว่าค่า \_token ตรงกับ token ใน session หรือไม่
- ถ้าตรง ✅ → ให้ผ่าน
  ถ้าไม่ตรง ❌ → คืนค่า 419 Page Expired

```
<form method="POST" action="/submit">
    @csrf  {{-- แทรก CSRF token อัตโนมัติ --}}

    <input type="text" name="name">
    <button type="submit">ส่งข้อมูล</button>
</form>
```

##### เมื่อ render แล้ว browser จะเห็นโค้ด HTMLดังนี้

```
<form method="POST" action="/submit">
    <input type="hidden" name="_token" value="eyJpdiI6I...">
    <input type="text" name="name">
    <button type="submit">ส่งข้อมูล</button>
</form>
```

# Validation data

Laravel มีระบบ Validation ที่ใช้งานง่าย อ่านเข้าใจได้ และขยายต่อได้ดี สามารถใช้ตรวจสอบข้อมูลที่ผู้ใช้งานกรอกในฟอร์ม หรือข้อมูลจาก API request ต่าง ๆ

```
public function login(Request $request)
{
    if (!empty($request->input())) {
        try {
            $request->validate([
                "email" => "required|email:rfc,dns",
                "password" => "required"
            ]);

            return redirect('/login')->with('loginResult', 'login success!');
        } catch (Exception $e) {
            return redirect()->back()
                ->withErrors(['loginResult' => $e->getMessage()]);
        }
    } else {
        return view('login');
    }
}
```

# Validation Errors

คำสั่ง @error ใช้เพื่อตรวจสอบข้อผิดพลาดจากการ validation ข้อมูลที่ส่งมาว่าถูกต้องตามประเภทฟิลด์ที่ระบุหรือไม่?
ภายในคำสั่ง @error เราสามารถแสดงข้อความผิดพลาดโดยใช้ตัวแปร $message

```
<form action="login" method="POST" class="flex flex-col gap-4">
    @csrf

    <div class="flex flex-col gap-1">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" />
    </div>
    <div class="flex flex-col gap-1">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" />
    </div>

    <input type="submit" value="เข้าสู่ระบบ"
        class="rounded bg-indigo-600 text-white px-2.5 py-1 w-fit mx-auto cursor-pointer" />

    //กรณี success
    @if (session('loginResult'))
        <p class="text-green-700 mx-auto">{{ session('loginResult') }}</p>
    @endif

    //กรณี error
    @error('loginResult')
        <p class="text-red-700 mx-auto">{{ $message }}</p>
    @enderror
</form>
```

นอกจากแสดงเป็นข้อความผิดพลาดแล้ว ยังสามารถใช้เป็นเงื่อนไขได้ด้วย

```
<label for="email">Email address</label>

<input id="email" type="email" class="@error('email') is-invalid @else is-valid @enderror" />
```

##### ดูกฏเพิ่มเติมได้ที่ลิงค์

[validation rules](https://laravel.com/docs/12.x/validation#available-validation-rules)

# Workshop สร้างฟอร์ม Login

- สร้างไฟล์ /resources/views/login.blade.php
- สร้างฟอ์รมสำหรับ login เข้าสู่โปรแกรมโดยมี input คือ email และ password และปุ่ม submit
