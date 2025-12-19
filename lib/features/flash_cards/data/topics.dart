import 'package:flutter/material.dart';
import 'package:kidventure/features/flash_cards/models/topic.dart';

final List<Topic> topics = const [
    Topic(
      id: "animals",
      name: "Animals",
      icon: Icons.pets,
      color: Color(0xFFFF6B6B),
      description: "Learn about different animals and their characteristics",
    ),
    Topic(
      id: "shapes",
      name: "Shapes",
      icon: Icons.category,
      color: Color(0xFF4ECDC4),
      description: "Discover basic and complex geometric shapes",
    ),
    Topic(
      id: "colors",
      name: "Colors",
      icon: Icons.palette,
      color: Color(0xFF45B7D1),
      description: "Explore the rainbow and color mixing",
    ),
    Topic(
      id: "fruits",
      name: "Fruits",
      icon: Icons.apple, // تأكد من توافر هذا الايقون أو استخدم بديل
      color: Color(0xFF96CEB4),
      description: "Learn about different fruits and their benefits",
    ),
    Topic(
      id: "vehicles",
      name: "Vehicles",
      icon: Icons.directions_car,
      color: Color(0xFFD4A373),
      description: "Discover various modes of transportation",
    ),
    Topic(
      id: "weather",
      name: "Weather",
      icon: Icons.cloud,
      color: Color(0xFF7B8CDE),
      description: "Learn about different weather conditions",
    ),
    Topic(
      id: "sports",
      name: "Sports",
      icon: Icons.sports_basketball,
      color: Color(0xFFFF9F1C),
      description: "Explore various sports and activities",
    ),
    Topic(
      id: "music",
      name: "Music",
      icon: Icons.music_note,
      color: Color(0xFFE76F51),
      description: "Learn about musical instruments and notes",
    ),
  ];