import 'package:flutter/material.dart';
import 'dart:math';

class StarryBackground extends StatefulWidget {
  const StarryBackground({super.key});

  @override
  State<StarryBackground> createState() => _StarryBackgroundState();
}

class Star {
  final Offset position;
  final double baseOpacity;
  final double speed;

  Star(this.position, this.baseOpacity, this.speed);
}

class _StarryBackgroundState extends State<StarryBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Star> _stars = _generateStars();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: _StarPainter(
                stars: _stars,
                progress: _controller.value,
                size: Size(constraints.maxWidth, constraints.maxHeight),
              ),
            );
          },
        );
      },
    );
  }

  static List<Star> _generateStars() {
    final random = Random();
    return List.generate(1000, (_) {
      return Star(
        Offset(
          random.nextDouble(),
          random.nextDouble(),
        ), // Use relative positions (0.0-1.0)
        0.3 + random.nextDouble() * 0.7, // Base opacity between 0.3 and 1.0
        0.5 + random.nextDouble() * 0.5, // Animation speed multiplier
      );
    });
  }
}

class _StarPainter extends CustomPainter {
  final List<Star> stars;
  final double progress;
  final Size size;

  _StarPainter({
    required this.stars,
    required this.progress,
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    for (final star in stars) {
      final currentOpacity =
          (star.baseOpacity *
              (0.3 + 0.7 * (sin(progress * pi * 2 * star.speed) + 1) / 2));

      final paint =
          Paint()
            ..color = Colors.white.withValues(alpha: currentOpacity)
            ..style = PaintingStyle.fill;

      // Calculate absolute position based on relative position and canvas size
      final absoluteX = star.position.dx * size.width;
      final absoluteY = star.position.dy * size.height;

      // Create the absolute position
      final absolutePosition = Offset(absoluteX, absoluteY);

      canvas.drawCircle(absolutePosition, 1.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.size != size;
  }
}
