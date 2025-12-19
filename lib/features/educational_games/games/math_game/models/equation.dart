import 'package:kidventure/features/educational_games/games/math_game/models/difficulty_enum.dart';

class Equation {
  final Difficulty difficulty;
  final String question;
  final double correctAnswer;
  final List<double> options;
  final int level;

  Equation(
    this.difficulty, {
    required this.question,
    required this.correctAnswer,
    required this.options,
    required this.level,
  });
}
