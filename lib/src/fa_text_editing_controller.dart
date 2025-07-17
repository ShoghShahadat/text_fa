// این فایل، کلاس قدرتمند FaTextEditingController را تعریف می‌کند.
// این یک جایگزین هوشمند برای TextEditingController استاندارد است.
// این راهکار، روشی اصولی و بهینه برای مدیریت ورودی‌های متنی تعاملی است.

import 'package:flutter/material.dart';
import 'text_fa_logic.dart';

/// یک `TextEditingController` سفارشی و هوشمند که به صورت خودکار جهت متن
/// را تشخیص داده و آن را از طریق یک `ValueNotifier` در اختیار ویجت‌ها قرار می‌دهد.
class FaTextEditingController extends TextEditingController {
  /// یک Notifier که ویجت‌ها می‌توانند به آن گوش دهند تا از تغییر جهت متن باخبر شوند.
  late final ValueNotifier<TextDirection> directionNotifier;

  FaTextEditingController({String? text}) : super(text: text) {
    // مقدار اولیه Notifier را بر اساس متن اولیه (در صورت وجود) تنظیم می‌کنیم.
    directionNotifier =
        ValueNotifier(TextFaLogic.getDominantDirection(this.text));
    // یک شنونده به کنترلر اضافه می‌کنیم تا با هر تغییر، جهت را به‌روز کند.
    addListener(_updateDirection);
  }

  void _updateDirection() {
    final newDirection = TextFaLogic.getDominantDirection(text);
    // فقط در صورت تغییر جهت، مقدار Notifier را به‌روز می‌کنیم.
    if (directionNotifier.value != newDirection) {
      directionNotifier.value = newDirection;
    }
  }

  @override
  void dispose() {
    // بسیار مهم: حذف شنونده و Notifier برای جلوگیری از نشت حافظه.
    removeListener(_updateDirection);
    directionNotifier.dispose();
    super.dispose();
  }
}
