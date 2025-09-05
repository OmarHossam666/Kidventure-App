import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import '../../models/camera_position.dart';

class ObjModelViewer extends StatelessWidget {
  const ObjModelViewer({
    super.key,
    required this.modelPath,
    required this.scale,
    required this.cameraPosition,
  });

  final String modelPath;
  final double scale;
  final CameraPosition cameraPosition;

  @override
  Widget build(BuildContext context) {
    return Flutter3DViewer.obj(
      src: modelPath,
      scale: scale,
      cameraX: cameraPosition.x,
      cameraY: cameraPosition.y,
      cameraZ: cameraPosition.z,
      onProgress: (progress) => debugPrint('Loading: ${progress * 100}%'),
      onLoad: (model) => debugPrint('Loaded: $model'),
      onError: (error) => debugPrint('Error: $error'),
    );
  }
}