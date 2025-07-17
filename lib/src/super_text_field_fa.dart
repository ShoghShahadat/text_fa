// این فایل، نسخه نهایی و احیا شده ویجت انقلابی SuperTextFieldFa است.
// مشکل عدم دریافت ورودی و عدم نمایش مکان‌نما در این نسخه به طور کامل برطرف شده است.

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'text_fa_logic.dart';

class SuperTextFieldFa extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;

  const SuperTextFieldFa({
    Key? key,
    required this.controller,
    this.focusNode,
    this.decoration,
    this.style,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  SuperTextFieldFaState createState() => SuperTextFieldFaState();
}

// FIX: Added SingleTickerProviderStateMixin for animation.
class SuperTextFieldFaState extends State<SuperTextFieldFa>
    with SingleTickerProviderStateMixin {
  late final FocusNode _focusNode;
  // FIX: Added AnimationController for the blinking cursor.
  late final AnimationController _cursorAnimation;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    // FIX: Initialize the animation controller for a 500ms blink cycle.
    _cursorAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Start/stop the blinking animation based on focus.
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _cursorAnimation.repeat();
      } else {
        _cursorAnimation.stop();
      }
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _cursorAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveTextStyle =
        widget.style ?? theme.textTheme.titleMedium ?? const TextStyle();
    final effectiveDecoration = widget.decoration ?? const InputDecoration();

    // FIX: Wrapped with a GestureDetector to handle taps and request focus.
    return GestureDetector(
      onTap: () {
        if (!_focusNode.hasFocus) {
          _focusNode.requestFocus();
        }
      },
      child: Stack(
        children: [
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            decoration: effectiveDecoration,
            style: effectiveTextStyle.copyWith(color: Colors.transparent),
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            enableInteractiveSelection: true,
            cursorColor: Colors.transparent,
            selectionControls: materialTextSelectionControls,
          ),

          // The painter no longer needs to be ignored by pointers.
          Positioned.fill(
            child: CustomPaint(
              painter: _FaTextPainter(
                controller: widget.controller,
                focusNode: _focusNode,
                // FIX: Pass the animation to the painter.
                cursorAnimation: _cursorAnimation,
                textStyle: effectiveTextStyle,
                textAlign: TextAlign.start,
                contentPadding: effectiveDecoration.contentPadding
                        ?.resolve(TextDirection.ltr) ??
                    EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FaTextPainter extends CustomPainter {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Animation<double> cursorAnimation; // FIX: Accept the animation.
  final TextStyle textStyle;
  final TextAlign textAlign;
  final EdgeInsets contentPadding;

  _FaTextPainter({
    required this.controller,
    required this.focusNode,
    required this.cursorAnimation,
    required this.textStyle,
    required this.textAlign,
    required this.contentPadding,
    // FIX: Listen to all required Listenables for repaint.
  }) : super(
            repaint:
                Listenable.merge([controller, focusNode, cursorAnimation]));

  @override
  void paint(Canvas canvas, Size size) {
    final textEditingValue = controller.value;
    final text = textEditingValue.text;
    final selection = textEditingValue.selection;
    final lines = text.split('\n');

    double yOffset = contentPadding.top;
    int currentOffset = 0;

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final int lineStart = currentOffset;
      final int lineEnd = lineStart + line.length;

      final lineDirection = TextFaLogic.getDominantDirection(line);

      final textPainter = TextPainter(
        text: TextSpan(text: line, style: textStyle),
        textAlign: textAlign,
        textDirection: lineDirection,
      );

      textPainter.layout(
          minWidth: 0, maxWidth: size.width - contentPadding.horizontal);

      double xOffset = (lineDirection == TextDirection.rtl)
          ? size.width - textPainter.width - contentPadding.right
          : contentPadding.left;

      if (selection.isValid && !selection.isCollapsed) {
        if (selection.start < lineEnd && selection.end > lineStart) {
          final selectionStartInLine =
              (selection.start > lineStart) ? selection.start - lineStart : 0;
          final selectionEndInLine = (selection.end < lineEnd)
              ? selection.end - lineStart
              : line.length;
          final selectionBoxes = textPainter.getBoxesForSelection(
            TextSelection(
                baseOffset: selectionStartInLine,
                extentOffset: selectionEndInLine),
          );
          for (final box in selectionBoxes) {
            final rect = Rect.fromLTRB(xOffset + box.left, yOffset + box.top,
                xOffset + box.right, yOffset + box.bottom);
            canvas.drawRect(rect, Paint()..color = Colors.blue.withAlpha(77));
          }
        }
      }

      textPainter.paint(canvas, Offset(xOffset, yOffset));

      // FIX: Use the animation value to decide whether to paint the cursor.
      if (focusNode.hasFocus &&
          cursorAnimation.value > 0.5 &&
          selection.isCollapsed &&
          selection.baseOffset >= lineStart &&
          selection.baseOffset <= lineEnd) {
        final cursorOffsetInLine = selection.baseOffset - lineStart;
        final cursorOffset = textPainter.getOffsetForCaret(
            TextPosition(offset: cursorOffsetInLine), ui.Rect.zero);
        final cursorRect = Rect.fromLTWH(
            xOffset + cursorOffset.dx, yOffset, 2, textPainter.height);
        canvas.drawRect(cursorRect, Paint()..color = Colors.blue);
      }

      yOffset += textPainter.height;
      currentOffset += line.length + 1;
    }
  }

  @override
  bool shouldRepaint(covariant _FaTextPainter oldDelegate) {
    return oldDelegate.controller.value != controller.value ||
        oldDelegate.focusNode.hasFocus != focusNode.hasFocus ||
        oldDelegate.cursorAnimation.value != cursorAnimation.value;
  }
}
