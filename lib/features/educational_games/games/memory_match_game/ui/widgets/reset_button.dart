import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.restart_alt,
        size: w * 0.06,
        color: AppColors.background,
      ),
      label: Text(
        'Reset Game',
        style: TextStyle(
          fontSize: w * 0.055,
          fontWeight: FontWeight.bold,
          color: AppColors.background,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(horizontal: w * 0.08, vertical: w * 0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(w * 0.08),
        ),
      ),
    );
  }
}
