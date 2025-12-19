import 'package:flutter/material.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color strokeColor;
  final double strokeWidth;
  final FontWeight fontWeight;
  final String? fontFamily;

  const StrokedText({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.textColor = Colors.white,
    this.strokeColor = Colors.black,
    this.strokeWidth = 2,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Border / Stroke
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = strokeWidth
                  ..color = strokeColor,
          ),
        ),
        // Fill
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
