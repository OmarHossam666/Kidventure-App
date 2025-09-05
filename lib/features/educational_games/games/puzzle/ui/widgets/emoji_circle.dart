import 'package:flutter/material.dart';

class EmojiCircle extends StatelessWidget {
  final String emoji;

  const EmojiCircle({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.06),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.3),
            blurRadius: screenWidth * 0.06,
            offset: Offset(0, screenWidth * 0.02),
          ),
        ],
      ),
      child: Center(
        child: Text(emoji, style: TextStyle(fontSize: screenWidth * 0.3)),
      ),
    );
  }
}
