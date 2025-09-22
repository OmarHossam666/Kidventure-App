import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/routing/routes.dart';
import 'package:kidventure/features/educational_games/models/game.dart';

final List<Game> games = [
  Game(
    id: 1,
    title: "Volcano Experiment",
    description:
        "Create an erupting volcano and learn about chemical reactions!",
    category: "science",
    difficulty: ["Medium"],
    duration: "30 mins",
    icon: Icons.science,
    onButtonPressed: (BuildContext context) => () {
      context.push(AppRoutes.volcanoGamePage);
      
    },
  ),
  Game(
    id: 2,
    title: "Memory Match",
    description: "Match pairs of cards to train your memory and concentration",
    category: "brain",
    difficulty: ["Easy"],
    duration: "10 mins",
    icon: Icons.memory,
    onButtonPressed: (BuildContext context) => () {
     context.push(AppRoutes.memoryGameScreen);
    },
  ),
  Game(
    id: 3,
    title: "Educational Puzzle",
    description: "Solve fun puzzles with educational themes",
    category: "brain",
    difficulty: ["Medium"],
    duration: "15 mins",
    icon: Icons.format_shapes,
    onButtonPressed: (BuildContext context) => () {
      context.push(AppRoutes.puzzleGameScreen);
    },
  ),
  Game(
    id: 4,
    title: "Equation Solver",
    description: "Solve fun equations and grow your brain",
    category: "math",
    difficulty: ["Easy","Medium","Hard"],
    duration: "25 mins",
    icon: Icons.calculate,
    onButtonPressed: (BuildContext context) => () {
      context.push(AppRoutes.mathGameScreen);
    },
  ),
];
