import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AnswerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.12,
          vertical: screenWidth * 0.045,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
        ),
        textStyle: TextStyle(
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
      child: Text('Check Answer', style: TextStyle(color: Colors.white)),
    );
  }
}
