import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final VoidCallback onHome;

  const ResultCard({super.key, required this.onHome});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pinkAccent.withValues(alpha: 0.8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '🎉 Volcano Erupted🌋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Acid + Base = Fun Bubbles🧪',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: onHome,
              child: Text('🏠 Home'),
            ),
          ],
        ),
      ),
    );
  }
}
