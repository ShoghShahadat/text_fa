// این فایل، نسخه اصلاح‌شده و تکامل‌یافته اکستنشن .fa() است.
// این اکستنشن اکنون به صورت هوشمند متون چندخطی را مدیریت می‌کند.
// این اصلاحیه، هماهنگی کامل بین تمام اجزای پکیج را تضمین می‌کند.

import 'package:flutter/widgets.dart';
import 'text_fa_logic.dart'; // وارد کردن مغز متفکر پکیج

/// اکستنشنی که به ویجت `Text` قدرت‌های جدید و هوشمند می‌بخشد.
extension TextFaExtension on Text {
  /// یک متد جادویی که ویجت `Text` فعلی را به یک ویجت هوشمند
  /// با قابلیت تشخیص خودکار جهت متن تبدیل می‌کند. این متد اکنون
  /// متون چندخطی را نیز به درستی مدیریت می‌کند.
  ///
  /// استفاده: Text("متن شما").fa()
  ///
  /// خروجی این متد یک `Widget` است. اگر متن تک‌خطی باشد، یک `Text` برمی‌گرداند
  /// و اگر چندخطی باشد، یک `Column` از ویجت‌های `Text` برمی‌گرداند.
  Widget fa() {
    // اگر متن ویجت null یا خالی باشد، خود ویجت اصلی را بدون تغییر برمی‌گردانیم.
    if (data == null || data!.isEmpty) {
      return this;
    }

    // اگر متن حاوی کاراکتر خط جدید (\n) نباشد یا maxLines برابر با ۱ باشد،
    // از منطق ساده و اولیه استفاده می‌کنیم.
    if (!data!.contains('\n') || maxLines == 1) {
      final TextDirection dominantDirection =
          TextFaLogic.getDominantDirection(data!);
      return Text(
        data!,
        key: key,
        textDirection: dominantDirection,
        textAlign: textAlign ?? TextAlign.start,
        style: style,
        strutStyle: strutStyle,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    }

    // **منطق جدید و هوشمند برای متون چندخطی**
    final lines = data!.split('\n');

    return Column(
      // فرزندان را مجبور می‌کند تمام عرض موجود را اشغال کنند.
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: lines.map((line) {
        // برای حفظ فاصله در خطوط خالی، یک ویجت متنی با فاصله برمی‌گردانیم.
        if (line.isEmpty) {
          return Text(' ', style: style);
        }

        // برای هر خط، جهت غالب آن را به صورت مستقل تشخیص می‌دهیم.
        final TextDirection lineDirection =
            TextFaLogic.getDominantDirection(line);

        // یک ویجت Text برای هر خط با جهت‌گیری مخصوص به خودش ایجاد می‌کنیم.
        // تمام خصوصیات از ویجت اصلی کپی می‌شود.
        return Text(
          line,
          textDirection: lineDirection,
          textAlign: textAlign ?? TextAlign.start,
          style: style,
          strutStyle: strutStyle,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        );
      }).toList(),
    );
  }
}
