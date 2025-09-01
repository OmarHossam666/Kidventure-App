import 'package:flutter/material.dart';

class LetterDraggable extends StatelessWidget {
  final String letter;

  const LetterDraggable({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final letterBoxSize = screenWidth / 6;
    return Draggable<String>(
      data: letter,
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          width: letterBoxSize,
          height: letterBoxSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: screenWidth * 0.03,
                offset: Offset(screenWidth * 0.01, screenWidth * 0.01),
              ),
            ],
          ),
          child: Text(
            letter,
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        width: letterBoxSize,
        height: letterBoxSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(color: Colors.grey, width: 2),
        ),
      ),
      child: Container(
        width: letterBoxSize,
        height: letterBoxSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(color: Colors.red, width: 2),
        ),
        child: Text(
          letter,
          style: TextStyle(
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.bold,
            color: Colors.red.shade700,
          ),
        ),
      ),
    );
  }
}
