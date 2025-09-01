import 'package:flutter/material.dart';

class IndicatorDots extends StatelessWidget {
  const IndicatorDots({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.onDotPressed,
  });

  final int count;
  final int currentIndex;
  final ValueChanged<int> onDotPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return GestureDetector(
          onTap: () => onDotPressed(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: currentIndex == index ? 24 : 8,
            decoration: BoxDecoration(
              color:
                  currentIndex == index
                      ? const Color(0xFFFF6B6B)
                      : const Color(0xFFFFB5B5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }),
    );
  }
}
