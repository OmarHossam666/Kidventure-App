import 'package:flutter/material.dart';

class FeatureCardContent {

  FeatureCardContent({
    required this.title,
    required this.description,
    required this.lottiePath,
    required this.buttonText,
    required this.onButtonPressed,
    required this.gradientColors,
  });

  final String title;
  final String description;
  final String lottiePath;
  final String buttonText;
  final List<Color> gradientColors;
  final Function(BuildContext context) onButtonPressed;
}
