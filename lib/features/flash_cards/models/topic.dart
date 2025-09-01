// lib/models/topic.dart

import 'package:flutter/material.dart';

class Topic {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final String description;

  const Topic({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
  });
}
