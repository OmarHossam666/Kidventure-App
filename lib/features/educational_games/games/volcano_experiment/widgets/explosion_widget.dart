import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExplosionWidget extends StatelessWidget {
  final VoidCallback onCompleted;

  const ExplosionWidget({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/volcano_lottie.json',
      repeat: false,
      onLoaded: (composition) {
        Future.delayed(composition.duration, onCompleted);
      },
    );
  }
}
