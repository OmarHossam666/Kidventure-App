import 'package:flutter/material.dart';

class LetterDropTarget extends StatelessWidget {
  final String letter;
  final String selectedLetter;
  final void Function(String) onAccept;

  const LetterDropTarget({
    super.key,
    required this.letter,
    required this.selectedLetter,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final letterBoxSize = screenWidth / 7;
    return DragTarget<String>(
      onWillAcceptWithDetails:
          (details) => details.data == letter && selectedLetter.isEmpty,
      onAcceptWithDetails: (details) {
        onAccept(details.data);
      },
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: letterBoxSize,
          height: letterBoxSize,
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.015,
            vertical: screenWidth * 0.015,
          ),
          decoration: BoxDecoration(
            color: selectedLetter.isEmpty ? Colors.white : Colors.red.shade100,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            border: Border.all(color: Colors.red, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: screenWidth * 0.02,
                offset: Offset(screenWidth * 0.005, screenWidth * 0.005),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            selectedLetter,
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
        );
      },
    );
  }
}
