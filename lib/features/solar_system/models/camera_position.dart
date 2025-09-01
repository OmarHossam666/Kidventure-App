import 'package:flutter/material.dart';

@immutable
class CameraPosition {
  final double x;
  final double y;
  final double z;

  const CameraPosition(this.x, this.y, this.z);
}