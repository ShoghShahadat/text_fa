# TextFa: پایان کابوس متون دوجهته در فلاتر

<!-- [![Pub Version](https://img.shields.io/pub/v/text_fa?color=blue&logo=dart)](https://pub.dev/packages/text_fa)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) -->

**یک پکیج هوشمند و انقلابی برای مدیریت خودکار و بی‌نقص جهت متن (راست‌چین و چپ‌چین) در فلاتر. با `TextFa`، نمایش و ویرایش متون ترکیبی فارسی و انگلیسی، از یک چالش آزاردهنده به یک تجربه لذت‌بخش تبدیل می‌شود.**

---

<!-- <p align="center">
  <a href="https://shoghshahadat.github.io/text_fa/" target="_blank">
    <img src="https://img.shields.io/badge/مشاهده-دموی زنده-brightgreen?style=for-the-badge&logo=flutter" alt="Live Demo"/>
  </a>
</p> -->

<!-- <p align="center">
  <em>جایگاه تصویر یا GIF برای نمایش قدرت SuperTextFieldFa</em>
  <br>
  <a href="https://uupload.ir/view/screenshot_2025-07-17_061911_uzql.png">
    <img src="https://s6.uupload.ir/files/screenshot_2025-07-17_061911_uzql.png" alt="SuperTextFieldFa در عمل" width="500"/>
  </a>
</p> -->

---
<!-- <p align="center">
  <em>جایگاه تصویر یا GIF برای نمایش قدرت SuperTextFieldFa</em>
  <br>
  <a href="https://uupload.ir/view/screenshot_2025-07-17_061911_uzql.png">
    <img src="https://s6.uupload.ir/files/screenshot_2025-07-17_061911_uzql.png" alt="SuperTextFieldFa در عمل" width="500"/>
  </a>
</p> -->

---

### 📝 نمایش قابلیت‌های SuperTextFieldFa

🔗 **[مشاهده دمو](https://shoghshahadat.github.io/text_fa/)**

---

#### 🔤 نمایی از فیلد متنی:

[![تکس فیلد](https://s6.uupload.ir/files/screenshot_2025-07-17_062059_8kq5.png)](https://uupload.ir/view/screenshot_2025-07-17_062059_8kq5.png)

---

#### 🖋️ نمایی از متن نهایی خروجی:

[![متن](https://s6.uupload.ir/files/screenshot_2025-07-17_061911_uzql.png)](https://uupload.ir/view/screenshot_2025-07-17_061911_uzql.png)


## ۱. فلسفه و مقدمه

هر توسعه‌دهنده فلاتر که با زبان‌های راست‌چین (RTL) مانند فارسی و عربی کار کرده باشد، با این کابوس آشناست: نمایش یک متن ساده مانند «`Flutter` بهترین فریمورک است» به صورت درهم‌ریخته و ناخوانا. ویجت‌های استاندارد فلاتر، جهت کل متن را بر اساس اولین کاراکتر تعیین می‌کنند و هیچ درکی از محتوای ترکیبی ندارند.

**`TextFa` برای پایان دادن به این کابوس خلق شده است.**

فلسفه ما ساده است: **ابزار باید خود را با کاربر تطبیق دهد، نه برعکس.** یک ویجت متنی باید آنقدر هوشمند باشد که بفهمد محتوای آن چیست و خود را به بهترین شکل نمایش دهد. `TextFa` با تحلیل هوشمند و لحظه‌ای محتوا، این فلسفه را به واقعیت تبدیل می‌کند.

## ۲. جدول مقایسه

| قابلیت | ویجت استاندارد فلاتر (`Text`/`TextField`) | ویجت‌های پکیج `TextFa` |
| :--- | :---: | :---: |
| **تشخیص جهت متن** | دستی و بر اساس اولین کاراکتر | **هوشمند و خودکار بر اساس محتوا** |
| **جهت‌گیری هر خط** | یکسان برای کل متن | **مستقل و هوشمند برای هر خط** |
| **تجربه کاربری (UX)** | ناپایدار و نیازمند کدهای اضافی | **روان، بی‌نقص و قابل پیش‌بینی** |
| **پشتیبانی از انتخاب/کپی/پیست** | استاندارد | **کامل و بومی (در `SuperTextFieldFa`)** |
| **نیاز به کدنویسی** | نیازمند بررسی دستی و منطق شرطی | **تقریباً صفر، فقط استفاده از ویجت** |

## ۳. ویژگی‌های کلیدی

* **تشخیص هوشمند زبان غالب:** جهت‌گیری بر اساس تعداد کلمات فارسی/انگلیسی، نه فقط اولین کاراکتر.
* **مدیریت مستقل هر خط:** در متون چندخطی، هر خط جهت‌گیری مخصوص به خود را دارد. (مانند تلگرام)
* **تجربه کاربری بی‌نقص:** ویجت انقلابی `SuperTextFieldFa` تمام قابلیت‌های بومی `TextField` (انتخاب، کپی، پیست، دسته‌های انتخاب) را به صورت کامل پشتیبانی می‌کند.
* **API ساده و آشنا:** اگر با `Text` و `TextField` کار کرده‌اید، برای استفاده از این پکیج آماده‌اید.
* **عملکرد بهینه:** استفاده از `CustomPainter` و معماری هوشمند برای حداقل کردن بازрисов‌های غیرضروری.

## ۴. نصب

برای افزودن پکیج به پروژه خود، این خط را به فایل `pubspec.yaml` اضافه کنید:

```yaml
dependencies:
  text_fa: ^1.0.0 # (نسخه را با آخرین نسخه جایگزین کنید)
```

سپس دستور `flutter pub get` را در ترمینال خود اجرا کنید.

## ۵. راهنمای کامل ویجت‌ها

### بخش اول: نمایش متن (Text)

<p align="center">
  <em>جایگاه تصویر یا GIF برای نمایش قدرت TextFa و .fa()</em>
  <br>
  <code>![تصویری از TextFa در عمل](لینک_تصویر_شما_اینجا)</code>
</p>

#### الف) ویجت `TextFa`

ساده‌ترین راه برای نمایش هوشمند متن. این ویجت تمام خصوصیات `Text` را می‌پذیرد و به صورت خودکار جهت هر خط را مدیریت می‌کند.

```dart
import 'package:text_fa/text_fa.dart';

// ...

TextFa(
  'خط اول این متن فارسی است.\nThis is the second line.\nو خط سوم دوباره فارسی است!',
  style: TextStyle(fontSize: 18, height: 1.6),
),
```

#### ب) اکستنشن `.fa()`

اگر می‌خواهید از ویجت استاندارد `Text` استفاده کنید، کافیست متد `.fa()` را به انتهای آن اضافه کنید تا به همان قدرت هوشمند دست یابید.

```dart
import 'package:text_fa/text_fa.dart';

// ...

Text(
  'خط اول این متن فارسی است.\nThis is the second line.'
).fa(),
```

### بخش دوم: ورودی متن (TextField)

#### ویجت انقلابی `SuperTextFieldFa`

این ویجت، قلب تپنده و شاهکار این پکیج است. یک بازآفرینی کامل و بی‌نقص از `TextField` که به شما اجازه می‌دهد متون چندخطی ترکیبی را با تجربه‌ای بی‌نظیر ویرایش کنید.

* **هر خط جهت‌گیری مستقل دارد.**
* **انتخاب کل متن، کپی، پیست و دسته‌های انتخاب به صورت کامل و بومی پشتیبانی می‌شوند.**
* **تجربه کاربری دقیقاً مانند `TextField` استاندارد است.**

```dart
import 'package:text_fa/text_fa.dart';

// ...

// ابتدا یک کنترلر تعریف کنید
final myController = TextEditingController(
  text: 'این یک شاهکار است.\nThis is a masterpiece.'
);

// سپس از ویجت استفاده کنید
SuperTextFieldFa(
  controller: myController,
  minLines: 3,
  maxLines: 5,
  style: TextStyle(fontSize: 20),
  decoration: InputDecoration(
    labelText: 'شاهکار نهایی',
    hintText: 'جادوی واقعی اینجاست...',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    fillColor: Color(0xFFF0F4FF),
  ),
),
```

## ۶. مرجع کامل API

### ویجت‌های اصلی

| ویجت | توضیحات | مهم‌ترین پارامترها |
| :--- | :--- | :--- |
| **`SuperTextFieldFa`** | **پیشنهاد اصلی.** ویجت ورودی متن انقلابی با جهت‌گیری مستقل برای هر خط. | `controller`, `focusNode`, `decoration`, `style`, `minLines`, `maxLines` |
| **`TextFa`** | ویجت نمایشی متن با جهت‌گیری مستقل برای هر خط. | `data` (متن)، `style`, و تمام پارامترهای دیگر `Text` |

### ابزارهای دیگر

| ابزار | توضیحات |
| :--- | :--- |
| **اکستنشن `.fa()`** | یک متد روی ویجت `Text` که همان کار `TextFa` را انجام می‌دهد. |
| **`TextFieldFa`** | یک `TextField` ساده که جهت **کل فیلد** را تغییر می‌دهد (برای ورودی‌های تک‌خطی). |
| **`FaTextEditingController`** | یک کنترلر هوشمند که می‌توان به `TextField` استاندارد متصل کرد. |

