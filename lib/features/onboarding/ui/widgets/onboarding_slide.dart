import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/onboarding/models/onboarding_screen_content.dart';
import 'package:lottie/lottie.dart';

class OnboardingSlide extends StatefulWidget {
  const OnboardingSlide({
    super.key,
    required this.onBoardingScreenContent,
    required this.isActive,
  });

  final OnBoardingScreenContent onBoardingScreenContent;
  final bool isActive;

  @override
  State<OnboardingSlide> createState() => _OnboardingSlideState();
}

class _OnboardingSlideState extends State<OnboardingSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> titleOffset;
  late Animation<Offset> descriptionOffset;
  late Animation<double> lottieOpacity;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    titleOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    descriptionOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    lottieOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    if (widget.isActive) {
      animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant OnboardingSlide oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      animationController.forward(from: 0);
    } else if (!widget.isActive && oldWidget.isActive) {
      animationController.reverse();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: lottieOpacity,
            child: Lottie.asset(widget.onBoardingScreenContent.lottiePath),
          ),
          SlideTransition(
            position: titleOffset,
            child: Text(
              widget.onBoardingScreenContent.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                height: 1.3,
              ),
            ),
          ),
          SlideTransition(
            position: descriptionOffset,
            child: Text(
              widget.onBoardingScreenContent.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
