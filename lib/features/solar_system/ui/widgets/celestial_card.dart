import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/routing/routes.dart';
import '../../models/celestial_body.dart';

class CelestialCard extends StatefulWidget {
  final CelestialBody body;

  const CelestialCard({super.key, required this.body});

  @override
  State<CelestialCard> createState() => _CelestialCardState();
}

class _CelestialCardState extends State<CelestialCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToModel(context),
      child: _buildCardContent(),
    );
  }

  Widget _buildCardContent() {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        border: Border.all(color: widget.body.color, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(),
          const SizedBox(height: 16),
          _buildTitle(),
          const SizedBox(height: 8),
          _buildDescription(),
          const SizedBox(height: 16),
          _buildExploreButton(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          colors: [widget.body.color, Colors.transparent],
        ),
      ),
      child: Center(
        child: Text(widget.body.icon, style: const TextStyle(fontSize: 40)),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.body.name,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: widget.body.color,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.body.description,
      style: const TextStyle(fontSize: 14, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildExploreButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: widget.body.color, width: 1),
        ),
      ),
      onPressed: () => _navigateToModel(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Explore In 3D",
            style: TextStyle(
              color: widget.body.color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.arrow_forward, color: widget.body.color, size: 16),
        ],
      ),
    );
  }

  void _navigateToModel(BuildContext context) {
    context.push(
      AppRoutes.threeDimensionalViewScreen,
      extra: {'modelPath': widget.body.modelPath, 'celestialBody': widget.body},
    );
  }
}
