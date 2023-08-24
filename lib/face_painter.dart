import 'package:flutter/material.dart';

class FacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill
      ..color = Colors.indigo;

    // Left eye
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(20, 40, 100, 100),
        const Radius.circular(20),
      ),
      paint,
    );

    // Right eye
    canvas.drawOval(
      Rect.fromLTWH(size.width - 120, 40, 100, 100),
      paint,
    );

    // Mouth
    var y = size.height * 0.6;
    var left = size.width * 0.2;
    var right = size.width * 0.8;
    final mouth = Path()
      ..moveTo(left, y)
      ..cubicTo(left + 50, y + 50, right - 50, y + 50, right, y)
      ..cubicTo(right - 100, y + 150, left + 100, y + 150, left, y);
    canvas.drawPath(mouth, paint);
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) => false;
}
