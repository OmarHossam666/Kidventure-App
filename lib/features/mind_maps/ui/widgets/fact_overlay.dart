import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class FactOverlay extends StatefulWidget {
  final String emoji;
  final String title;
  final String message;
  final VoidCallback onClose;

  const FactOverlay({
    super.key,
    required this.emoji,
    required this.title,
    required this.message,
    required this.onClose,
  });

  @override
  State<FactOverlay> createState() => _FactOverlayState();
}

class _FactOverlayState extends State<FactOverlay> {
  late int _visibleChars;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _visibleChars = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 30), (t) {
      if (_visibleChars < widget.message.length) {
        setState(() => _visibleChars++);
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: widget.onClose,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withValues(alpha: 0.3),
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.emoji,
                        style: const TextStyle(fontSize: 28),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.message.substring(0, _visibleChars),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.pink.shade900,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: widget.onClose,
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
