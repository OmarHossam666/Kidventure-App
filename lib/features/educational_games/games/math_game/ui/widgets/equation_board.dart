import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidventure/features/educational_games/games/math_game/models/equation.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/question_string_widget.dart';

class EquationBoard extends StatefulWidget {
  final Equation equation;
  final double? droppedValue;
  final ValueChanged<double> onAccept;
  const EquationBoard({
    super.key,
    required this.equation,
    required this.droppedValue,
    required this.onAccept,
  });

  @override
  State<EquationBoard> createState() => _EquationBoardState();
}

class _EquationBoardState extends State<EquationBoard> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 385.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: AssetImage('assets/images/woodsmall.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: 370.w,
        height: 220.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 10, 6, 26),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.black.withAlpha(128), width: 2.w),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuestionStringWidget(
                  length: widget.equation.question.length,
                  question: widget.equation.question,
                  correctAnswer: widget.equation.correctAnswer,
                  onAccept: widget.onAccept,
                  droppedValue: widget.droppedValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
