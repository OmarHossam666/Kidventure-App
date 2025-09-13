import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/core/routing/routes.dart';
import 'package:kidventure/features/onboarding/data/onboarding_screen_contents.dart';
import 'package:kidventure/features/onboarding/ui/widgets/indicator_dots.dart';
import 'package:kidventure/features/onboarding/ui/widgets/onboarding_slide.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void goToNextPage() {
    if (currentPage == onBoardingScreenContents.length - 1) {
      context.go(AppRoutes.homeScreen);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder:
                (context, index) => OnboardingSlide(
                  onBoardingScreenContent: onBoardingScreenContents[index],
                  isActive: index == currentPage,
                ),
            itemCount: onBoardingScreenContents.length,
            controller: pageController,
            onPageChanged: (index) => setState(() => currentPage = index),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              spacing: 24,
              children: [
                IndicatorDots(
                  count: onBoardingScreenContents.length,
                  currentIndex: currentPage,
                  onDotPressed:
                      (index) => pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 2,
                  ),
                  onPressed: goToNextPage,
                  child: Row(
                    spacing: 8,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentPage == onBoardingScreenContents.length - 1
                            ? "Get Started"
                            : "Next",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_forward, size: 18, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
