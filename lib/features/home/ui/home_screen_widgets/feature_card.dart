import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/home/models/feature_card_content.dart';
import 'package:lottie/lottie.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key, required this.featureCardContent});

  final FeatureCardContent featureCardContent;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: featureCardContent.gradientColors,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 200,
            top: 0,
            bottom: 0,
            right: 0,
            child: Lottie.asset(
              featureCardContent.lottiePath,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  featureCardContent.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  featureCardContent.description,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () => featureCardContent.onButtonPressed(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.background,
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    featureCardContent.buttonText,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
