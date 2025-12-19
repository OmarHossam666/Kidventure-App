import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/premium_plan/ui/widgets/premium_plan_card.dart';

class PremiumPlansScreen extends StatelessWidget {
  const PremiumPlansScreen({super.key});

  // Define the plan data
  final List<Map<String, dynamic>> _premiumPlans = const [
    {
      'title': 'Monthly Premium Plan',
      'price': '\$4.99',
      'period': 'month',
      'description': 'Access to all premium features',
    },
    {
      'title': 'Annual Premium Plan',
      'price': '\$49.99',
      'period': 'year',
      'description': 'Save 17% with annual billing!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _premiumPlans.length,
          itemBuilder: (context, index) {
            final plan = _premiumPlans[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  plan['title'] as String,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                PremiumPlanCard(
                  price: plan['price'] as String,
                  period: plan['period'] as String,
                  description: plan['description'] as String,
                  onUpgrade: () {
                    // Handle plan upgrade
                  },
                ),
                const SizedBox(height: 32),
              ],
            );
          },
        ),
      ),
    );
  }
}
