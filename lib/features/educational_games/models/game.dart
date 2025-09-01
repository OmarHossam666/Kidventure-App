import 'package:flutter/material.dart';

class Game {
  final int id;
  final String title;
  final String description;
  final String category;
  final String difficulty;
  final String duration;
  final IconData icon;
  final Function(BuildContext) onButtonPressed;

  const Game({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.difficulty,
    required this.duration,
    required this.icon,
    required this.onButtonPressed,
  });
}
