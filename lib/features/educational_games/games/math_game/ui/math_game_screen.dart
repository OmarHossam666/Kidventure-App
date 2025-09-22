import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/core/helpers/spacing.dart';
import 'package:kidventure/core/routing/routes.dart';
import 'package:kidventure/features/educational_games/games/math_game/data/equations_content.dart';
import 'package:kidventure/features/educational_games/games/math_game/models/difficulty_enum.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/background_widget.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/play_button.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/stroked_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MathGameScreen extends StatefulWidget {
  const MathGameScreen({super.key});

  @override
  State<MathGameScreen> createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  late PageController _pageController;
  int _currentDifficultyIndex = 0;
  final List<String> mathGameScreenDifficultyEquations = [
    "2 + 3 = ?",
    "4 x ? = 24",
    "11 ÷ ? = 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),

          Center(
            child: Container(
              width: 320.w,
              height: 390.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff4A485F), Color(0xffB5B7C3)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.black.withAlpha(70),
                  width: 3.w,
                ),
              ),
              child: Column(
                children: [
                  verticalSpace(25.h),
                  Container(
                    width: 290.w,
                    height: 220.w,
                    decoration: BoxDecoration(
                      color: Color(0xff140B33),
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: Colors.black.withAlpha(128),
                        width: 1.w,
                      ),
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: mathGameScreenDifficultyEquations.length,
                      itemBuilder: (context, difficultyIndex) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  children: List.generate(
                                    mathGameScreenDifficultyEquations[difficultyIndex]
                                        .length,
                                    (charIndex) {
                                      String char =
                                          mathGameScreenDifficultyEquations[difficultyIndex][charIndex];
                                      bool isOperator = [
                                        '+',
                                        '-',
                                        'x',
                                        '÷',
                                        '=',
                                      ].contains(char);
                                      return TextSpan(
                                        text: char,
                                        style: TextStyle(
                                          color:
                                              isOperator
                                                  ? AppColors.chatTab
                                                  : AppColors.homeTab,
                                          fontSize: isOperator ? 52.sp : 60.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ComicSansMS',
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  verticalSpace(50.h),
                  PlayButton(
                    onPressed: () {
                      context.push(
                        AppRoutes.mathGamePlayScreen,
                        extra: {
                          "difficulty":
                              Difficulty.values[_currentDifficultyIndex],
                          "equations":
                              EquationsContent.equations
                                  .where(
                                    (eq) =>
                                        eq.difficulty ==
                                        Difficulty
                                            .values[_currentDifficultyIndex],
                                  )
                                  .toList(),
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 490.h,
            right: 0,
            left: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 12.w,
                  dotWidth: 12.w,
                  activeDotColor:
                      Difficulty.values[_currentDifficultyIndex].value["color"],
                  dotColor: Colors.white,
                  spacing: 8.w,
                ),
              ),
            ),
          ),
          Positioned(
            top: 203.h,
            left: 10.w,
            child: Transform.rotate(
              angle: -20 * math.pi / 180, // 20 degrees
              child: StrokedText(
                text:
                    Difficulty
                        .values[_currentDifficultyIndex]
                        .value["difficulty"],
                fontSize: 48.sp,
                fontWeight: FontWeight.bold,
                strokeWidth: 3.w,
                strokeColor: Colors.black,
                textColor:
                    Difficulty.values[_currentDifficultyIndex].value["color"],
                fontFamily: 'Cuprum',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      // Gives fractional values while swiping (e.g., 0.5, 1.2)
      double page = _pageController.page ?? 0;
      setState(() {
        _currentDifficultyIndex = page.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
