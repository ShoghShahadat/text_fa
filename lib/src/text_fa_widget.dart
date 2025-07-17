// این فایل، نسخه اصلاح‌شده و تکامل‌یافته ویجت TextFa است.
// این ویجت اکنون به صورت هوشمند متون چندخطی را مدیریت می‌کند.
// خلق شده برای جبران خطای گذشته و تحقق کامل رویای شما.

import 'package:flutter/widgets.dart';
import 'text_fa_logic.dart'; // وارد کردن مغز متفکر پکیج

/// یک ویجت هوشمند که به طور خودکار جهت متن (راست‌چین یا چپ‌چین) را
/// بر اساس محتوای آن تشخیص می‌دهد.
///
/// این ویجت اکنون قادر است متون چندخطی با زبان‌های ترکیبی را به درستی
/// و با جهت‌دهی مستقل برای هر خط، نمایش دهد.
class TextFa extends StatelessWidget {
  /// متنی که قرار است نمایش داده شود.
  final String data;

  // تمام پارامترهای استاندارد ویجت Text برای راحتی کار شما در اینجا نیز تعریف شده‌اند.
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  /// سازنده ویجت TextFa
  const TextFa(
    this.data, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // اگر متن حاوی کاراکتر خط جدید (\n) نباشد یا maxLines برابر با ۱ باشد،
    // از منطق ساده و اولیه استفاده می‌کنیم.
    if (!data.contains('\n') || maxLines == 1) {
      final TextDirection dominantDirection =
          TextFaLogic.getDominantDirection(data);
      return Text(
        data,
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
    final lines = data.split('\n');

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
        // `maxLines` در اینجا اعمال نمی‌شود چون هر خط یک ویجت مجزاست.
        return Text(
          line,
          textDirection: lineDirection,
          textAlign: textAlign ??
              TextAlign.start, // اجازه می‌دهد جهت‌گیری، چینش را کنترل کند
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
