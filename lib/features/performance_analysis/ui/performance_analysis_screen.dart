import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/performance_analysis/ui/widgets/progress_card.dart';

class PerformanceAnalysisScreen extends StatelessWidget {
  const PerformanceAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
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
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 12),
                          Text(
                            textAlign: TextAlign.start,
                            "My Space Journey 🚀",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "👾",
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("level 1", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppColors.borderColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10, // Adjusted to use screen width
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonPrimary,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("10/100", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Wrap(
                  children: [
                    ProgressCard(
                      subject: "📚Reading",
                      task1: "Comprehension",
                      progress1: 40,
                      task2: "Vocabulary",
                      progress2: 30,
                      task3: "Story Analysis",
                      progress3: 20,
                    ),
                    ProgressCard(
                      subject: "🔢 Math",
                      task1: "Problem Solving",
                      progress1: 100,
                      task2: "Number Skills",
                      progress2: 34,
                      task3: "Patterns",
                      progress3: 70,
                    ),
                    ProgressCard(
                      subject: "🔬 Science",
                      task1: "Exploration",
                      progress1: 72,
                      task2: "Discovery",
                      progress2: 51,
                      task3: "Experiments",
                      progress3: 20,
                    ),
                    ProgressCard(
                      subject: "🎨 Art",
                      task1: "Creativity",
                      progress1: 70,
                      task2: "Expression",
                      progress2: 44,
                      task3: "Design",
                      progress3: 30,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          "🎉",
                          style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Energy 😊",

                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 120,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.borderColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 10, // Adjusted to use screen width
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
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(
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
                        "Recent Achievements 🏆",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "🏆",
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "🏆",
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "🏆",
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Learning Streak 🔥",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "🔥",
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "🔥",
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
