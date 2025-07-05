# JWT (Json Web Token)

JWT (JSON Web Token) คือรูปแบบหนึ่งของ token ที่ใช้ในการยืนยันตัวตน (authentication) และ อนุญาตการเข้าถึง (authorization) นิยมใช้ในระบบ web หรือ API โดยเฉพาะระบบที่เป็น แบบ Stateless (ไม่มี session ฝั่ง server)

🔧 โครงสร้างของ JWT

JWT ประกอบด้วย 3 ส่วนหลัก ที่คั่นด้วยจุด (.) เช่น **xxxxx.yyyyy.zzzzz**

### 1. Header

ระบุว่าใช้ algorithm อะไร เช่น HS256 หรือ RS256

```
{
  "alg": "HS256",
  "typ": "JWT"
}
```

### 2. Payload

ส่วนที่ใช้เก็บข้อมูลของผู้ใช้หรือข้อมูลอื่น ๆ ที่เกี่ยวข้อง เช่น user ID, ชื่อผู้ใช้, สิทธิ์การเข้าถึง (role) เป็นต้น โดยควรหลีกเลี่ยงการเก็บข้อมูลสำคัญหรือข้อมูลที่เป็นความลับ เนื่องจากข้อมูลในส่วนนี้สามารถถูกถอดรหัสได้ง่าย

```
{
  "sub": 123,
  "name": "John Doe",
  "role": "admin",
  "exp": 1712345678
}
```

### 3. Signature

สร้างจากการเข้ารหัส (เช่น HMAC SHA256) โดยใช้ secret key:

```
HMACSHA256(
  base64UrlEncode(header) + "." + base64UrlEncode(payload),
  secret
)
```

# 🔐 JWT ใช้ทำอะไร?

✅ Authentication

- เมื่อผู้ใช้ login สำเร็จ server จะสร้าง JWT แล้วส่งกลับไปให้ client
- client จะเก็บ JWT ไว้ (เช่นใน localStorage หรือ cookie)
- ทุกครั้งที่เรียก API ถัดไป client จะแนบ JWT มาด้วยใน Authorization header:

```
Authorization: Bearer <token>
```

✅ Authorization

- API ตรวจสอบว่า JWT นี้ valid หรือไม่ (เช่น expire หรือเปล่า)
- ตรวจสอบ role หรือ permission ใน payload

# 📦 ข้อดีของ JWT

| ข้อดี           | รายละเอียด                              |
| --------------- | --------------------------------------- |
| Stateless       | Server ไม่ต้องเก็บ session              |
| เร็ว            | แค่ decode ก็อ่านข้อมูลได้เลย           |
| ข้ามระบบได้ง่าย | ใช้ใน microservices หรือหลาย domain ได้ |

# ⚠️ ข้อควรระวัง

- อย่าเก็บข้อมูลลับใน payload (เช่น password) เพราะ JWT decode ได้
- ต้องตรวจสอบ signature และเวลา exp เสมอ
- JWT ที่หมดอายุแล้วควรให้ user login ใหม่

# 📚 ใช้งาน JWT กับ Laravel

- ติดตั้ง [firbase/php-jwt](https://github.com/firebase/php-jwt)

```
composer require firebase/php-jwt
```

# [RFC 7519](https://datatracker.ietf.org/doc/html/rfc7519)

RFC 7519 คือเอกสารมาตรฐานของ IETF (Internet Engineering Task Force) ที่กำหนดรูปแบบของ JWT (JSON Web Token) เป็นมาตรฐานที่นิยามถึงวิธีแลกเปลี่ยนข้อมูลที่ปลอดภัยและตรวจสอบได้ ใช้กันอย่างแพร่หลายในระบบ authentication และ authorization โดยประกอบด้วย header, payload และ signature เพื่อรักษาความสมบูรณ์ของข้อมูล
