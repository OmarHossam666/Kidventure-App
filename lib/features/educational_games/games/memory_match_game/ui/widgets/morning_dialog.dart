import 'package:flutter/material.dart';

class MorningDialog extends StatelessWidget {
  const MorningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(w * 0.05)),
      child: Container(
        padding: EdgeInsets.all(w * 0.05),
        decoration: BoxDecoration(
          color: Color(0xFFFFF5F5),
          borderRadius: BorderRadius.circular(w * 0.05),
          boxShadow: [
            BoxShadow(
                color: Colors.red.withValues(alpha: 0.3),
                blurRadius: w * 0.06,
                offset: Offset(0, w * 0.02))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wb_sunny, size: w * 0.2, color: Colors.redAccent),
            SizedBox(height: w * 0.03),
            Text('Good Morning, Students!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: w * 0.065,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent)),
            SizedBox(height: w * 0.03),
            Text(
                'Welcome to the Memory Game.\nLet\'s enjoy learning in a fun and creative way!',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: w * 0.05, color: Colors.red.shade700)),
            SizedBox(height: w * 0.05),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(w * 0.1)),
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.12, vertical: w * 0.045),
                textStyle:
                    TextStyle(fontSize: w * 0.05, fontWeight: FontWeight.bold),
              ),
              child: Text('Home', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
