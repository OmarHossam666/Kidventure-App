import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context, VoidCallback onNext) {
  final screenWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.shade200,
                Colors.red.shade300,
                Colors.red.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
          ),
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: screenWidth * 0.2,
                color: Colors.white,
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: screenWidth * 0.065,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                'You spelled the name correctly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.12,
                    vertical: screenWidth * 0.045,
                  ),
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  onNext();
                },
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showMorningDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFF5F5),
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withValues(alpha: 0.3),
                blurRadius: screenWidth * 0.06,
                offset: Offset(0, screenWidth * 0.02),
              ),
            ],
          ),
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wb_sunny,
                size: screenWidth * 0.2,
                color: Colors.redAccent,
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                'Good Morning, Students!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.065,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                'Welcome to the Transportation Puzzle Game.\nLet\'s enjoy learning in a fun way!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.red.shade700,
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.12,
                    vertical: screenWidth * 0.045,
                  ),
                  textStyle: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
