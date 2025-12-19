import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/settings/ui/widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.textSecondary),
                    hintText: "Search Settings...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.buttonPrimary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.buttonPrimary),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SettingsTileScreen(title: "Account Settings"),
                SettingsTileScreen(title: "Learning Style"),
                SettingsTileScreen(title: "Look & Feel"),
                SettingsTileScreen(title: "Sound & Music"),
                SettingsTileScreen(title: "Space Alerts"),
                SettingsTileScreen(title: "Mission Control"),
                SettingsTileScreen(title: "Space Access"),
                SettingsTileScreen(title: "Safety Pod"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
