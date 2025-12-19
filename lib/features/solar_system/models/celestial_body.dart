import 'package:flutter/material.dart';

class CelestialBody {
  const CelestialBody({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.modelId,
    required this.type,
    required this.order,
    required this.modelPath,
    required this.information,
  });

  final String id;
  final String name;
  final String icon;
  final Color color;
  final String description;
  final int modelId;
  final String type;
  final double order;
  final String modelPath;
  final String information;
}
