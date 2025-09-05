import 'package:flutter/material.dart';

class PremiumPlanCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String period;
  final VoidCallback onUpgrade;

  const PremiumPlanCard({
    super.key,
    this.title = "الباقة المميزة",
    this.description = "احصل على وصول غير محدود لجميع الكتب والمميزات",
    this.price = "49.99 جنيه",
    this.period = "شهر",
    required this.onUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
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
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildCardContent(),
      ),
    );
  }

  Widget _buildCardContent() {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildHeader(), _buildMainContent(), _buildUpgradeButton()],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(description, style: TextStyle(color: Colors.white, fontSize: 18)),
        Row(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '/$period',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUpgradeButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onUpgrade,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFFFFD700),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ترقية الآن',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Icon(Icons.electric_bolt, color: const Color(0xFFFFD700), size: 16),
          ],
        ),
      ),
    );
  }
}
