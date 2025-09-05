import 'package:flutter/material.dart';
import 'package:kidventure/features/educational_games/models/game.dart';
import 'package:kidventure/features/educational_games/games/memory_match_game/ui/memory_game_screen.dart';
import 'package:kidventure/features/educational_games/games/puzzle/ui/puzzle_screen.dart';
import 'package:kidventure/features/educational_games/games/volcano_experiment/volcano_experiment_page.dart';

final List<Game> games = [
  Game(
    id: 1,
    title: "Volcano Experiment",
    description:
        "Create an erupting volcano and learn about chemical reactions!",
    category: "science",
    difficulty: "Medium",
    duration: "30 mins",
    icon: Icons.science,
    onButtonPressed: (BuildContext context) => () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VolcanoExperimentPage()),
      );
    },
  ),
  Game(
    id: 2,
    title: "Memory Match",
    description: "Match pairs of cards to train your memory and concentration",
    category: "brain",
    difficulty: "Easy",
    duration: "10 mins",
    icon: Icons.memory,
    onButtonPressed: (BuildContext context) => () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MemoryGameScreen()),
      );
    },
  ),
  Game(
    id: 3,
    title: "Educational Puzzle",
    description: "Solve fun puzzles with educational themes",
    category: "brain",
    difficulty: "Medium",
    duration: "15 mins",
    icon: Icons.format_shapes,
    onButtonPressed: (BuildContext context) => () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PuzzleScreen()),
      );
    },
  ),
];
