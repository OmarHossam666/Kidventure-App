import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/helpers/spacing.dart';
import 'package:kidventure/features/educational_games/games/math_game/models/difficulty_enum.dart';

AppBar mathGamePlayScreenAppbar({
  required BuildContext context,
  required Difficulty difficulty,
  required int currentLevel,
}) => AppBar(
  toolbarHeight: 70,
  backgroundColor: Colors.transparent, // Make background transparent
  titleSpacing: 0,
  centerTitle: true,
  automaticallyImplyLeading: false,
  flexibleSpace: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          'assets/images/woodsmall.jpg',
        ), // replace with your image path
        fit: BoxFit.cover,
      ),
    ),
  ),
  title: Row(
    children: [
      IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => context.pop(),
      ),
      Text(
        difficulty.name,
        style: TextStyle(
          color: difficulty.value['color'],
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cuprum',
        ),
      ),
      horizontalSpace(70.w),
      Text(
        "Level $currentLevel",
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cuprum',
        ),
      ),
      horizontalSpace(90.w),
      Text(
        "40s",
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontFamily: 'Cuprum',
        ),
      ),
    ],
  ),
);
