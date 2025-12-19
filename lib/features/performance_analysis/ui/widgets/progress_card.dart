import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/performance_analysis/ui/widgets/progress_slide.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, this.subject, this.task1, this.task2, this.task3, this.progress1, this.progress2, this.progress3});
  final String? subject;
  final String? task1;
  final String? task2;
  final String? task3;
  final int? progress1;
  final int? progress2;
  final int? progress3;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          //
          ProgressSlide(task: task1, progress: progress1),
          ProgressSlide(task: task2, progress: progress2),
          ProgressSlide(task: task3, progress:progress3),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
