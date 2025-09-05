import 'package:flutter/material.dart';

class ErlenmeyerPainter extends CustomPainter {
  final double fillFraction;
  final Color fillColor;
  final Color borderColor;

  ErlenmeyerPainter({
    required this.fillFraction,
    required this.fillColor,
    this.borderColor = Colors.indigo,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final neckH = size.height * 0.2;
    final neckW = size.width * 0.2;

    Path flask = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.2, neckH)
      ..lineTo(size.width * 0.8, neckH)
      ..lineTo(size.width, size.height)
      ..close();
    flask.addRect(Rect.fromCenter(
      center: Offset(size.width / 2, neckH / 2),
      width: neckW,
      height: neckH,
    ));

    // خلفية الفلاسک
    canvas.drawPath(
        flask,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);

    // الملء
    canvas.save();
    canvas.clipPath(flask);
    final fillH = size.height * fillFraction;
    canvas.drawRect(
      Rect.fromLTWH(0, size.height - fillH, size.width, fillH),
      Paint()..color = fillColor,
    );
    canvas.restore();

    // الحدود
    canvas.drawPath(
      flask,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );
  }

  @override
  bool shouldRepaint(covariant ErlenmeyerPainter old) {
    return old.fillFraction != fillFraction ||
        old.fillColor != fillColor ||
        old.borderColor != borderColor;
  }
}
