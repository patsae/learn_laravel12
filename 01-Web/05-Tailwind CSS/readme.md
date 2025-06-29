# Tailwind CSS

Tailwind CSS คือ CSS Framework แบบ utility-first ที่เน้นความยืดหยุ่น ด้วยชุด Class จำนวนมาก สามารถนำมาผสมผสานกันเพื่อออกแบบโดยตรงใน HTML

- ข้อดีของ Tailwind CSS:

  - การปรับแต่ง: สร้างการออกแบบที่ไม่ซ้ำใครได้ง่าย.
  - การสร้างต้นแบบที่รวดเร็ว: ทดลองการออกแบบได้อย่างรวดเร็วโดยตรงใน HTML.
  - ลดการสร้างไฟล์ CSS ที่ซ้ำซ้อน.
  - การออกแบบที่ตอบสนอง: มีตัวแปรที่ตอบสนองในตัว.
  - มีชุมชนที่ให้ข้อมูลและตัวอย่างมากมาย

- ข้อเสียของ Tailwind CSS:

  - ต้องใช้เวลาในการเรียนรู้ค่อนข้างมาก
  - ต้องใช้เวลาในการเรียนรู้คลาสต่างๆ.
  - HTML ที่ดูยุ่งเหยิง อาจดูรกเติมไปด้วย class ของ tailwind css
  - ต้องมีความเข้าใจพื้นฐานของ CSS เพื่อใช้งานอย่างมีประสิทธิภาพ

ใน Laravel 12 จะติดตั้ง Tailwind css มาให้ตั้งแต่เริ่มต้นสร้าง Application สามารถตรวจสอบ version ของ tailwind css ได้โดยดูในไฟล์ package.json และนอกจากนี้ Laravel จะทำการตั้งค่าเบื้องต้นของ tailwind css มาให้เลย เราสามารถใช้งาน tailwind css ได้ทันที

# การใช้งาน Tailwind CSS

- ทดลองใส่ class ของ tailwind css ในไฟล์ welcome.blade.php

```
<h1 class="text-4xl text-red-500 font-bold">Hello World</h1>
```

- เปิดไฟล์ /resources/css/app.css

```
@import "tailwindcss";

:root {
    --primary-color: #0f6b66;
}

body {
    @apply bg-[#e9e9e9] text-lg text-[#333];
}

h1 {
    @apply text-4xl font-bold;
}

.heading-primary {
    @apply text-[var(--primary-color)];
}

```

- ใส่ class .heading-primary ให้กับ h1 ใน welcome.blade.php

```
<h1 class="heading-primary">Hello World</h1>
```

# Workshop ตกแต่งหน้า Page ด้วย Tailwind CSS

- ให้ตกแต่งหน้า Page ด้วย Tailwind CSS
