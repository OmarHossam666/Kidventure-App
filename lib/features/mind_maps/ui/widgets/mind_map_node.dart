import 'package:flutter/material.dart';

class MindMapNode extends StatefulWidget {
  final String emoji;
  final String label;
  final bool isCentral;
  final bool loaded;
  final VoidCallback onTap;

  const MindMapNode({
    super.key,
    required this.emoji,
    required this.label,
    this.isCentral = false,
    required this.loaded,
    required this.onTap,
  });

  @override
  State<MindMapNode> createState() => _MindMapNodeState();
}

class _MindMapNodeState extends State<MindMapNode> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        opacity: widget.loaded ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: AnimatedScale(
          scale: _isPressed
              ? 0.9
              : widget.loaded
                  ? 1
                  : 0.5,
          duration: const Duration(milliseconds: 200),
          child: Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.shade100,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.emoji,
                  style: TextStyle(
                    fontSize: widget.isCentral ? 48 : 32,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: widget.isCentral ? 20 : 16,
                    color: Colors.pink.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
