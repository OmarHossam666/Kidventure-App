import 'package:flutter/material.dart';
import 'package:kidventure/pages/three_dimensional_view_page.dart';
import '../models/celestial_body.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        border: Border.all(color: widget.body.color, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
      style: const TextStyle(fontSize: 14, color: Colors.grey),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildExploreButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 10,
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
            'Explore in 3D',
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ThreeDimensionalViewPage(
              modelPath: widget.body.modelPath,
              celestialBody: widget.body,
            ),
      ),
    );
  }
}
