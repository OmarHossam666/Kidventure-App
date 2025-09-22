import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/stroked_text.dart';

class ItemOptionWidget extends StatelessWidget {
  final int index;
  final double? cellSize;
  final double? marginValue;
  final double value;
  const ItemOptionWidget({
    super.key,
    required this.index,
    required this.cellSize,
    this.marginValue,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellSize,
      height: cellSize,
      margin: EdgeInsets.all(marginValue?.w ?? 0),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/woodsmall.jpg'),
          fit: BoxFit.cover,

          colorFilter: ColorFilter.mode(
            Colors.pinkAccent.withAlpha(220),
            BlendMode.overlay,
          ),
        ),
        border: Border.all(color: Colors.black.withAlpha(40), width: 3.w),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: StrokedText(
          text: formatNumber(value),
          strokeColor: Colors.black,
          strokeWidth: 2,
          textColor: Colors.white,
          fontSize: 56.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cuprum',
        ),
      ),
    );
  }

  String formatNumber(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString(); // remove .0
    }
    return value.toString();
  }
}
