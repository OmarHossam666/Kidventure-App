import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidventure/features/educational_games/games/math_game/models/difficulty_enum.dart';
import 'package:kidventure/features/educational_games/games/math_game/ui/widgets/item_option_widget.dart';

class OptionsWidget extends StatelessWidget {
  final Difficulty difficulty;
  final List options;
  final double correctAnswer;
  final double? droppedValue;
  const OptionsWidget({
    super.key,
    required this.options,
    required this.correctAnswer,
    required this.droppedValue,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 8.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black.withAlpha(100), width: 1.w),
                bottom: BorderSide(
                  color: Colors.black.withAlpha(100),
                  width: 1.w,
                ),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/woodsmall.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(),
          ),
          Expanded(
            child: Container(
              height: 240.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/woodsmall.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(options.length, (index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final cellSize = constraints.maxWidth;

                      return Draggable<double>(
                        childWhenDragging: const SizedBox.shrink(),
                        maxSimultaneousDrags: 1,

                        data: options[index],
                        feedback: Material(
                          color: Colors.transparent,
                          child: ItemOptionWidget(
                            index: index,
                            cellSize: cellSize - 30.w,
                            value: droppedValue ?? options[index],
                          ),
                        ),
                        child: ItemOptionWidget(
                          index: index,
                          cellSize: null,
                          marginValue: 15,
                          value: options[index],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
