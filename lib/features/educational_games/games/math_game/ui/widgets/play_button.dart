import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidventure/core/constants/app_colors.dart';

class PlayButton extends StatelessWidget {
  final VoidCallback onPressed;
  const PlayButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.r),
          side: BorderSide(color: Color(0xffFF4551), width: 2.w),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
      ),
      child: Text(
        "Play",
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Cuprum',
        ),
      ),
    );
  }
}
