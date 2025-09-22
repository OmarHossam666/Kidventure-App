import 'package:kidventure/features/educational_games/games/math_game/models/difficulty_enum.dart';
import 'package:kidventure/features/educational_games/games/math_game/models/equation.dart';

class EquationsContent {
  static List<Equation> equations = [
    Equation(
      Difficulty.easy,
      question: "5 + 3 = ?",
      correctAnswer: 8.0,
      options: [6.0, 7.0, 8.0, 9.0, 10.0, 11.0],
      level: 1,
    ),
    Equation(
      Difficulty.easy,
      question: "10 - 4 = ?",
      correctAnswer: 6.0,
      options: [5.0, 6.0, 7.0, 8.0, 9.0, 10.0],
      level: 1,
    ),
    Equation(
      Difficulty.easy,
      question: "6 x 2 = ?",
      correctAnswer: 12.0,
      options: [10.0, 11.0, 12.0, 13.0, 14.0, 15.0],
      level: 2,
    ),
    Equation(
      Difficulty.easy,
      question: "8 ÷ 2 = ?",
      correctAnswer: 4.0,
      options: [3.0, 4.0, 5.0, 6.0, 7.0, 8.0],
      level: 2,
    ),
    Equation(
      Difficulty.easy,
      question: "15 + 27 = ?",
      correctAnswer: 42.0,
      options: [40.0, 41.0, 42.0, 43.0, 44.0, 45.0],
      level: 2,
    ),
    Equation(
      Difficulty.easy,
      question: "50 - 19 = ?",
      correctAnswer: 31.0,
      options: [30.0, 31.0, 32.0, 33.0, 34.0, 35.0],
      level: 2,
    ),
    Equation(
      Difficulty.medium,
      question: "7 x 6 = ?",
      correctAnswer: 42.0,
      options: [40.0, 41.0, 42.0, 43.0, 44.0, 45.0],
      level: 1,
    ),
    Equation(
      Difficulty.medium,
      question: "48 ÷ 8 = ?",
      correctAnswer: 6.0,
      options: [5.0, 6.0, 7.0, 8.0, 9.0, 10.0],
      level: 2,
    ),
    Equation(
      Difficulty.hard,
      question: "25 + 37 - 12 = ?",
      correctAnswer: 50.0,
      options: [48.0, 49.0, 50.0, 51.0, 52.0, 53.0],
      level: 1,
    ),
    Equation(
      Difficulty.hard,
      question: "9 x 8 + 15 = ?",
      correctAnswer: 87.0,
      options: [85.0, 86.0, 87.0, 88.0, 89.0, 90.0],
      level: 1,
    ),
    Equation(
      Difficulty.hard,
      question: "144 ÷ 12 - 5 = ?",
      correctAnswer: 7.0,
      options: [6.0, 7.0, 8.0, 9.0, 10.0, 11.0],
      level: 2,
    ),
    Equation(
      Difficulty.hard,
      question: "100 ÷ ? x 5 + 8 = 33",
      correctAnswer: 20,
      options: [10, 40, 30, 5, 20, 8],
      level: 2,
    ),
  ];
}
