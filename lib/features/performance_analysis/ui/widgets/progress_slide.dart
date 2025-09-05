import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';

class ProgressSlide extends StatelessWidget {
  const ProgressSlide({super.key, this.task, this.progress});
  final String? task;
  final int? progress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.toString(), style: TextStyle(fontSize: 16)),
            RichText(
              text: TextSpan(
                text: progress.toString(),
                style: TextStyle(fontSize: 16, color: AppColors.primary),
                children: [
                  TextSpan(
                    text: ' %',
                    style: TextStyle(fontSize: 16, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.77777777,
          height: 10,
          decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width:
                    (progress! / 100) *
                    MediaQuery.of(context).size.width *
                    0.77777777,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.buttonPrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
