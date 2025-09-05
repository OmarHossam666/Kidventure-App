import 'package:flutter/material.dart';
import '../../models/body_part.dart';

class ConnectionPainter extends CustomPainter {
  final List<BodyPart> bodyParts;

  ConnectionPainter(this.bodyParts);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.pink.shade200
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (final part in bodyParts) {
      final end = part.alignment.alongSize(size);
      final dir = (end - center);
      final norm = dir / dir.distance;
      final start = center + norm * (size.shortestSide * 0.05);
      final finish = end - norm * (size.shortestSide * 0.1);
      canvas.drawLine(start, finish, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
