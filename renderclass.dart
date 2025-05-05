import 'package:flutter/material.dart';
class CustomDropdownButton extends LeafRenderObjectWidget {
  const CustomDropdownButton({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderDropdownButton();
  }

}

class RenderDropdownButton extends RenderBox {
  @override
  void performLayout() {
    size = constraints.constrain(Size(220, 60));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final paint = Paint()..color = Colors.teal;
    final Rect rect = offset & size;
    context.canvas.drawRect(rect, paint);

    final icon = Icons.arrow_drop_down;
    final iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 30,
          fontFamily: icon.fontFamily,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final text = TextPainter(
      text: TextSpan(
        text: "Select Item",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

     text.paint(context.canvas, offset + Offset(16, size.height / 2 - text.height / 2));
    iconPainter.paint(
        context.canvas, offset + Offset(size.width - 36, size.height / 2 - 15));
  }
}
