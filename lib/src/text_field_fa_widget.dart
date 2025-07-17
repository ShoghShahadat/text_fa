// این فایل، ویجت قدرتمند و تعاملی TextFieldFa را تعریف می‌کند.
// این ویجت به صورت زنده به ورودی کاربر گوش داده و جهت متن را در لحظه تنظیم می‌کند.
// این یک گام بزرگ در تکامل پکیج شماست.

import 'package:flutter/material.dart';
import 'text_fa_logic.dart';

/// یک ویجت `TextField` هوشمند که به طور خودکار جهت متن (راست‌چین یا چپ‌چین)
/// و چینش آن را بر اساس ورودی کاربر در لحظه تنظیم می‌کند.
class TextFieldFa extends StatefulWidget {
  // تمام پارامترهای استاندارد ویجت TextField برای راحتی شما اینجا هستند.
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;
  // ... و سایر پارامترهای TextField

  const TextFieldFa({
    Key? key,
    this.controller,
    this.decoration,
    this.keyboardType,
    this.obscureText = false,
    this.style,
    this.maxLines = 1,
    this.minLines,
  }) : super(key: key);

  @override
  State<TextFieldFa> createState() => _TextFieldFaState();
}

class _TextFieldFaState extends State<TextFieldFa> {
  // کنترلر متن. اگر کاربر کنترلری ارائه ندهد، یکی به صورت داخلی ساخته می‌شود.
  late final TextEditingController _controller;
  // وضعیت فعلی جهت متن. با ltr شروع می‌شود.
  TextDirection _textDirection = TextDirection.ltr;

  @override
  void initState() {
    super.initState();
    // مشخص کردن اینکه از کنترلر کاربر استفاده کنیم یا یکی بسازیم.
    _controller = widget.controller ?? TextEditingController();
    // اضافه کردن یک "شنونده" که با هر تغییر در متن، فراخوانی می‌شود.
    _controller.addListener(_updateDirection);
    // در همان ابتدا نیز یک بار جهت را مشخص می‌کنیم.
    _updateDirection();
  }

  /// این متد با هر بار تغییر متن ورودی، جهت آن را تشخیص داده و در صورت نیاز
  /// ویجت را با جهت جدید، دوباره‌سازی (rebuild) می‌کند.
  void _updateDirection() {
    final String text = _controller.text;
    // اگر متن خالی است، جهت را به پیش‌فرض (ltr) برمی‌گردانیم.
    if (text.isEmpty) {
      if (_textDirection != TextDirection.ltr) {
        setState(() {
          _textDirection = TextDirection.ltr;
        });
      }
      return;
    }

    // تشخیص جهت غالب متن ورودی
    final newDirection = TextFaLogic.getDominantDirection(text);

    // تنها در صورتی ویجت را دوباره‌سازی می‌کنیم که جهت متن تغییر کرده باشد.
    // این کار از rebuildهای غیرضروری در هر بار تایپ جلوگیری می‌کند.
    if (newDirection != _textDirection) {
      setState(() {
        _textDirection = newDirection;
      });
    }
  }

  @override
  void dispose() {
    // حذف شنونده برای جلوگیری از نشت حافظه (memory leak).
    _controller.removeListener(_updateDirection);
    // اگر کنترلر را خودمان ساخته بودیم، باید آن را دور بیندازیم.
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      // اعمال جهت تشخیص داده شده در لحظه
      textDirection: _textDirection,
      // هماهنگ کردن چینش متن با جهت آن
      textAlign: TextAlign.start,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      style: widget.style,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
    );
  }
}
