import 'package:flutter/material.dart';

enum Difficulty {
  easy({"difficulty": "Easy", "color": Color(0xFF14E40D)}),
  medium({"difficulty": "Medium", "color": Color(0xFFFFC107)}),
  hard({"difficulty": "Hard", "color": Color.fromARGB(255, 237, 40, 26)});

  final Map<String, dynamic> value;
  const Difficulty(this.value);
}
