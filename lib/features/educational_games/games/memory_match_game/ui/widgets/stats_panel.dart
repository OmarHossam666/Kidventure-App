import 'package:flutter/material.dart';

class StatsPanel extends StatelessWidget {
  final int moves;
  final int seconds;

  const StatsPanel({super.key, required this.moves, required this.seconds});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: w * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🎲 $moves',
                style: TextStyle(
                    fontSize: w * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700)),
            SizedBox(width: w * 0.1),
            Text('⏱️ $seconds s',
                style: TextStyle(
                    fontSize: w * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700)),
          ],
        ),
      ),
    );
  }
}
