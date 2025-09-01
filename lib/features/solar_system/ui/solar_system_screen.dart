import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/features/solar_system/data/celestial_bodies.dart';
import 'package:kidventure/features/solar_system/ui/widgets/celestial_card.dart';
import 'package:kidventure/features/solar_system/ui/widgets/starry_background.dart';
import '../../../core/widgets/staggered_animation.dart';

class SolarSystemScreen extends StatelessWidget {
  const SolarSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(),
        centerTitle: true,
        backgroundColor: Color(0XFF1E293B),
        foregroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0XFF1E293B), Color(0XFF0F172A)],
          ),
        ),
        child: Stack(children: [const StarryBackground(), _buildContent()]),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(children: [_buildCelestialGrid()]),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Solar System Exploration',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCelestialGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);

        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: celestialBodies.length,
            itemBuilder: (context, index) {
              return StaggeredAnimation(
                delay: index * 0.5,
                child: CelestialCard(body: celestialBodies[index]),
              );
            },
          ),
        );
      },
    );
  }

  int _calculateCrossAxisCount(double width) {
    if (width >= 1280) return 4;
    if (width >= 960) return 3;
    if (width >= 640) return 2;
    return 1;
  }
}
