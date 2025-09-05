import 'package:flutter/material.dart';

class DashedPathPainter extends CustomPainter {
  final List<Offset> points;
  final Paint _paint = Paint()
    ..color = Colors.pink.shade300
    ..strokeWidth = 3
    ..style = PaintingStyle.stroke;

  DashedPathPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;
    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      const dashLength = 12.0;
      const dashGap = 8.0;
      while (distance < metric.length) {
        final next = distance + dashLength;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0.0, metric.length)),
          _paint,
        );
        distance += dashLength + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedPathPainter old) => old.points != points;
}
