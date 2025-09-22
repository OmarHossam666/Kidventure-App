import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidventure/core/helpers/set_saturation_contrast_brightness_matrix_for_color_filtered_widget.dart';
import 'package:kidventure/core/helpers/spacing.dart';
import 'package:kidventure/features/educational_games/games/math_game/data/play_level_up_sound.dart';
import 'package:kidventure/features/educational_games/games/math_game/models/difficulty_enum.dart';
import 'package:kidventure/features/educational_games/games/math_game/models/equation.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/build_level_up_lottie.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/equation_board.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/math_game_play_screen_appbar.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/options_widget.dart';

class MathGamePlayScreen extends StatefulWidget {
  final Difficulty difficulty;
  final List<Equation> equations;

  const MathGamePlayScreen({
    super.key,
    required this.difficulty,
    required this.equations,
  });

  @override
  State<MathGamePlayScreen> createState() => _MathGamePlayScreenState();
}

class _MathGamePlayScreenState extends State<MathGamePlayScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int currentLevel = 1;
  double? droppedValue;

  late List<Equation> currentLevelEquations;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late final AudioPlayer _audioPlayer;
  bool showLevelUp = false;

  @override
  void initState() {
    super.initState();

    // Initialize audio player
    _audioPlayer = AudioPlayer();

    // Initialize fade controller for level-up animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    // Initialize first level equations
    currentLevelEquations =
        widget.equations
            .where(
              (eq) =>
                  eq.level == currentLevel &&
                  eq.difficulty == widget.difficulty,
            )
            .toList();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void checkAnswer(double value) {
    final currentEquation = currentLevelEquations[currentIndex];

    if (value == currentEquation.correctAnswer) {
      setState(() {
        droppedValue = value.toDouble();
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (currentIndex < currentLevelEquations.length - 1) {
          setState(() {
            currentIndex++;
            droppedValue = null;
          });
        } else {
          // Move to next level
          final nextLevel = currentLevel + 1;
          final nextLevelEquations =
              widget.equations
                  .where(
                    (eq) =>
                        eq.level == nextLevel &&
                        eq.difficulty == widget.difficulty,
                  )
                  .toList();

          if (nextLevelEquations.isNotEmpty) {
            setState(() {
              currentLevel = nextLevel;
              currentIndex = 0;
              currentLevelEquations = nextLevelEquations;
              droppedValue = null;
            });
            showLevelUpAnimation();
            playLevelUpSound(_audioPlayer);
          } else {
            // No more levels, show congratulations
            if (mounted) {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text("🎉 Congratulations!"),
                      content: const Text("You solved all equations!"),
                    ),
              );
            }
          }
        }
      });
    } else {
      // ❌ Wrong answer — you can add shake/error effect here
    }
  }

  void showLevelUpAnimation() {
    setState(() {
      showLevelUp = true;
    });
    _fadeController.reset();

    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        _fadeController.forward().then((_) {
          if (mounted) setState(() => showLevelUp = false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 213, 217),
      appBar: mathGamePlayScreenAppbar(
        difficulty: widget.difficulty,
        context: context,
        currentLevel: currentLevel,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                setContrastSaturationBrightnessForColoredFilteredWidget(
                  contrast: 2,
                  saturation: .2,
                  brightness: -270,
                ),
              ),
              child: RotatedBox(
                quarterTurns: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/woodsmall.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                verticalSpace(70.h),
                EquationBoard(
                  equation: currentLevelEquations[currentIndex],
                  droppedValue: droppedValue,
                  onAccept: checkAnswer,
                ),
                verticalSpace(120.h),
                OptionsWidget(
                  options: currentLevelEquations[currentIndex].options,
                  correctAnswer:
                      currentLevelEquations[currentIndex].correctAnswer,
                  droppedValue: droppedValue,
                  difficulty: widget.difficulty,
                ),
              ],
            ),
          ),
          // Level-up animation
          if (showLevelUp)
            Positioned.fill(
              child: IgnorePointer(
                ignoring: true,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(child: buildLevelUpLottie()),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
