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
    final mouth = Path();
    mouth.moveTo(size.width * 0.8, size.height * 0.6);
    mouth.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.6),
      radius: const Radius.circular(150),
    );
    mouth.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.6),
      radius: const Radius.circular(200),
      clockwise: false,
    );

    canvas.drawPath(mouth, paint);
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) => false;
}
