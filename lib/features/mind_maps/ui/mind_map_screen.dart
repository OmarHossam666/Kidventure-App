import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import '../data/body_parts.dart';
import 'widgets/connection_painter.dart';
import 'widgets/fact_overlay.dart';
import 'widgets/mind_map_node.dart';

class MindMapScreen extends StatefulWidget {
  const MindMapScreen({super.key});
  @override
  State<MindMapScreen> createState() => _MindMapScreenState();
}

class _MindMapScreenState extends State<MindMapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _loaded = false;
  bool _showFact = false;
  String _currentEmoji = '';
  String _currentTitle = '';
  String _currentMessage = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      setState(() => _loaded = true);
    });
  }

  void _showFactOverlay(String emoji, String title, String message) {
    setState(() {
      _currentEmoji = emoji;
      _currentTitle = title;
      _currentMessage = message;
      _showFact = true;
    });
  }

  void _hideFactOverlay() {
    setState(() => _showFact = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(painter: ConnectionPainter(bodyParts)),
                ),
                Center(
                  child: MindMapNode(
                    emoji: '🧍',
                    label: 'Human Body',
                    isCentral: true,
                    loaded: _loaded,
                    onTap:
                        () => _showFactOverlay(
                          '🧍',
                          'Human Body',
                          'Your body is amazing! It has many parts working together!',
                        ),
                  ),
                ),
                ...List.generate(bodyParts.length, (index) {
                  final part = bodyParts[index];
                  return Align(
                    alignment: part.alignment,
                    child: MindMapNode(
                      emoji: part.emoji,
                      label: part.label,
                      loaded: _loaded,
                      onTap:
                          () => _showFactOverlay(
                            part.emoji,
                            part.label,
                            part.fact,
                          ),
                    ),
                  );
                }),
                if (_showFact)
                  FactOverlay(
                    emoji: _currentEmoji,
                    title: _currentTitle,
                    message: _currentMessage,
                    onClose: _hideFactOverlay,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
