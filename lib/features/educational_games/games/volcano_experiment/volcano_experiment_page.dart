import 'dart:ui';
import 'package:flutter/material.dart';

import 'data/ingredients_data.dart';
import 'widgets/ingredient_draggable.dart';
import 'widgets/erlenmeyer_painter.dart';
import 'widgets/typewriter_text.dart';
import 'widgets/explosion_widget.dart';
import 'widgets/result_card.dart';

class VolcanoExperimentPage extends StatefulWidget {
  const VolcanoExperimentPage({super.key});

  @override
  VolcanoExperimentPageState createState() => VolcanoExperimentPageState();
}

class VolcanoExperimentPageState extends State<VolcanoExperimentPage>
    with SingleTickerProviderStateMixin {
  final Set<String> _droppedItems = {};
  bool _showExplosion = false;
  bool _showInstructions = true;
  bool _instructionsVisible = true;
  bool _showResult = false;
  bool _isPouring = false;

  double _fillFraction = 0.0;
  Color _fillColor = Colors.transparent;
  double _pendingFill = 0.0;
  Color _pendingColor = Colors.transparent;

  late final AnimationController _dropController;
  late final Animation<double> _dropAnimation;

  @override
  void initState() {
    super.initState();
    _dropController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _dropAnimation = CurvedAnimation(
      parent: _dropController,
      curve: Curves.easeIn,
    );
    _dropController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _fillFraction = _pendingFill;
          _fillColor = _pendingColor.withValues(alpha: 0.6);
          _isPouring = false;
          if (_droppedItems.length == ingredients.length) {
            _showExplosion = true;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _dropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxW = constraints.maxWidth;
          final maxH = constraints.maxHeight;
          final flaskW = maxW * 0.5;
          final flaskH = flaskW * 1.75;
          final dropSize = flaskW * 0.12;
          final iconSize = (maxW * 0.18).clamp(40.0, 100.0);
          final topPad = maxH * 0.05;
          final ctrlPad = maxH * 0.03;

          return Stack(
            children: [
              // Background gradient
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFa1c4fd), Color(0xFFc2e9fb)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: topPad),
                    Expanded(
                      child: Center(
                          child: _showResult
                              ? ResultCard(onHome: () {
                                  setState(() {
                                    _showResult = false;
                                  });
                                })
                              : (_showExplosion
                                  ? ExplosionWidget(onCompleted: () {
                                      setState(() {
                                        _showExplosion = false;
                                        _droppedItems.clear();
                                        _fillFraction = 0.0;
                                        _fillColor = Colors.transparent;
                                        _showResult = true;
                                      });
                                    })
                                  : _buildFlask(flaskW, flaskH, dropSize))),
                    ),
                    if (!_showResult)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: ctrlPad),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: ingredients
                              .map((ing) => IngredientDraggable(
                                    ingredient: ing,
                                    iconSize: iconSize,
                                  ))
                              .toList(),
                        ),
                      ),
                  ],
                ),
              ),
              if (_instructionsVisible)
                AnimatedOpacity(
                  opacity: _showInstructions ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  onEnd: () {
                    if (!_showInstructions) {
                      setState(() => _instructionsVisible = false);
                    }
                  },
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.3),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TypewriterText(
                                  text:
                                      '👋 Welcome to the Volcano Experiment\n\n'
                                      '1. Drag and drop the ingredients into the flask:\n'
                                      '   • Vinegar 🧴\n'
                                      '   • Baking Soda 🧂\n'
                                      '   • Food Color 🧴\n\n'
                                      '2. Watch the bubbles and learn why it happens 🌋',
                                  style: TextStyle(
                                    fontSize: maxW * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amberAccent,
                                  ),
                                  duration: const Duration(seconds: 8),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () =>
                                      setState(() => _showInstructions = false),
                                  child: const Text('Start Experiment'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFlask(double w, double h, double dropSize) {
    return DragTarget<String>(
      onAcceptWithDetails: (details) {
        // This method should be empty as we handle everything in onWillAcceptWithDetails
        return;
      },
      onWillAcceptWithDetails: (details) {
        // Don't accept new ingredients while pouring
        if (_isPouring) return false;
        
        final data = details.data;
        final ing = ingredients.firstWhere((i) => i.id == data);
        
        setState(() {
          _droppedItems.add(data);
          _pendingFill = _droppedItems.length / ingredients.length;
          _pendingColor = ing.color;
          _isPouring = true;
        });
        
        _dropController.forward(from: 0);
        return true; // Accept the drag
      },
      builder: (context, candidateData, _) {
        final isHovering = candidateData.isNotEmpty;
        return SizedBox(
          width: w,
          height: h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: _fillFraction),
                duration: const Duration(milliseconds: 800),
                builder: (context, frac, child) {
                  return CustomPaint(
                    size: Size(w, h),
                    painter: ErlenmeyerPainter(
                      fillFraction: frac,
                      fillColor: _fillColor,
                      borderColor: isHovering ? Colors.teal : Colors.indigo,
                    ),
                  );
                },
              ),
              if (_isPouring)
                AnimatedBuilder(
                  animation: _dropAnimation,
                  builder: (context, child) {
                    final y = (h - dropSize) * _dropAnimation.value;
                    return Positioned(
                      left: w / 2 - dropSize / 2,
                      top: y,
                      child: Container(
                        width: dropSize,
                        height: dropSize,
                        decoration: BoxDecoration(
                          color: _pendingColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
