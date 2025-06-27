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

# Validation Errors

คำสั่ง @error ใช้เพื่อตรวจสอบข้อผิดพลาดจากการ validation ข้อมูลที่ส่งมาว่าถูกต้องตามประเภทฟิลด์ที่ระบุหรือไม่?
ภายในคำสั่ง @error เราสามารถแสดงข้อความผิดพลาดโดยใช้ตัวแปร $message

```
<label for="title">Post Title</label>

<input  id="title" type="text" class="@error('title') is-invalid @enderror" />

@error('title')
    <div class="alert alert-danger">{{ $message }}</div>
@enderror
```

นอกจากแสดงเป็นข้อความผิดพลาดแล้ว ยังสามารถใช้เป็นเงื่อนไขได้ด้วย

```
<label for="email">Email address</label>

<input id="email" type="email" class="@error('email') is-invalid @else is-valid @enderror" />
```

# Workshop สร้างฟอร์ม Login

- สร้างไฟล์ /resources/views/login.blade.php
- สร้างฟอ์รมสำหรับ login เข้าสู่โปรแกรมโดยมี input คือ text และ password และปุ่ม submit
