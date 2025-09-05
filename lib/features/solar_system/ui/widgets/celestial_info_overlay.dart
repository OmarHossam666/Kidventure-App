import 'package:flutter/material.dart';
import 'package:kidventure/features/solar_system/models/celestial_body.dart';

class CelestialInfoOverlay extends StatefulWidget {
  const CelestialInfoOverlay({
    super.key,
    required this.celestialBody,
    this.isVisible = true,
  });

  final CelestialBody celestialBody;
  final bool isVisible;

  @override
  State<CelestialInfoOverlay> createState() => _CelestialInfoOverlayState();
}

class _CelestialInfoOverlayState extends State<CelestialInfoOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    if (widget.isVisible) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(CelestialInfoOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.celestialBody.color.withValues(),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                const SizedBox(height: 8),
                _buildDescription(),
                const SizedBox(height: 12),
                _buildInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.celestialBody.icon,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Text(
          widget.celestialBody.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.celestialBody.description,
      style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
    );
  }

  Widget _buildInformation() {
    return Text(
      widget.celestialBody.information,
      style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
    );
  }
}
