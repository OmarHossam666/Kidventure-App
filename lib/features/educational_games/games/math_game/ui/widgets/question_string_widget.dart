import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/item_option_widget.dart';

class QuestionStringWidget extends StatelessWidget {
  final int length;
  final String question;
  final double correctAnswer;
  final double? droppedValue;
  final ValueChanged<double> onAccept;

  const QuestionStringWidget({
    super.key,
    required this.length,
    required this.question,
    required this.correctAnswer,
    this.droppedValue,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // works like inline flow
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(length, (charIndex) {
        String char = question[charIndex];
        bool isOperator = ['+', '-', 'x', '÷', '='].contains(char);

        if (char == "?") {
          return dragTarget();
        }

        return Text(
          char,
          style: TextStyle(
            color: isOperator ? AppColors.chatTab : AppColors.homeTab,
            fontSize: isOperator ? 52.sp : 60.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'ComicSansMS',
          ),
        );
      }),
    );
  }

  Widget dragTarget() {
    final double size = 100.w;
    return DragTarget<double>(
      onAcceptWithDetails: (details) {
        onAccept(details.data);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: size,
          height: size,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(20),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child:
                (droppedValue != null && droppedValue == correctAnswer)
                    ? ItemOptionWidget(
                      index: 3,
                      cellSize: size,
                      value: droppedValue!,
                    )
                    : Text(
                      "?",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicSansMS',
                      ),
                    ),
          ),
        );
      },
    );
  }
}
