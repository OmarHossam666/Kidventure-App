import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

Widget buildLevelUpLottie() {
    return Lottie.asset(
      'assets/lotties/levelup.json',
      width: 400.w,
      height: 400.w,
      repeat: false,
    );
  }