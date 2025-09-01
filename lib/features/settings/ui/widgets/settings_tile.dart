import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';

class SettingsTileScreen extends StatelessWidget {
const SettingsTileScreen({super.key, this.title, this.image});

  final String? title;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        InkWell(
          child: ListTile(
            leading: image,
            title: Text(
              title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            onTap: () {
              // Navigate to account settings
            },
          ),
        ),
      ],
    );
  }
}
