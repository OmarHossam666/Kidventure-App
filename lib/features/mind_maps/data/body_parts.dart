import 'package:flutter/material.dart';

import '../models/body_part.dart';

/// قائمة بيانات أجزاء الجسم
final List<BodyPart> bodyParts = [
  BodyPart('🧠', 'Brain', Alignment(-1, -0.65),
      'Your brain is the boss! It controls everything you do'),
  BodyPart('👁', 'Eye', Alignment(-0.35, -0.65),
      'Eyes work like cameras, taking pictures of the world'),
  BodyPart('👂', 'Ear', Alignment(0.35, -0.65),
      'Ears help you hear music and whispers'),
  BodyPart('🫀', 'Heart', Alignment(0.9999, -0.65),
      'Your heart beats 100,000 times every day'),
  BodyPart('🫁', 'Lungs', Alignment(-1.1, 0.0),
      'Lungs fill with air when you breathe in'),
  BodyPart('🖐', 'Hand', Alignment(1.1, 0.0),
      'Hands can create, hold, and high-five'),
  BodyPart('👅', 'Tongue', Alignment(-1.1, 0.65),
      'Your tongue helps you taste food and speak words'),
  BodyPart('🦵', 'Leg', Alignment(-0.35, 0.65),
      'Legs are strong! They help you run and jump'),
  BodyPart('🦴', 'Bones', Alignment(0.35, 0.65),
      'Bones make your body strong and help you move'),
  BodyPart('🦷', 'Teeth', Alignment(1.1, 0.65),
      'Teeth help you chew food. Brush them every day'),
];
