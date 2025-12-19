// lib/models/section.dart

import 'package:flutter/material.dart';

class Section {
  final String id;
  final String name;
  final IconData icon;
  final String videoId;
  final List<FlipCardItem> flipItems;

  Section({
    required this.id,
    required this.name,
    required this.icon,
    required this.videoId,
    required this.flipItems,
  });
}

class FlipCardItem {
  final IconData icon;
  final String explanation;

  FlipCardItem({required this.icon, required this.explanation});
}
