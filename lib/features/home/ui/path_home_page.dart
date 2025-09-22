import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:kidventure/core/routing/routes.dart';
import 'path_home_page_widgets/dashed_path_painter.dart';
import 'path_home_page_widgets/path_card.dart';

class PathHomePage extends StatelessWidget {
  PathHomePage({super.key});

  // Define learning paths data
  final List<Map<String, dynamic>> _learningPaths = [
    {'title': 'Human Body', 'locked': false, 'route': AppRoutes.mindMapScreen},
    {'title': 'Digestive System', 'locked': true, 'route': null},
    {'title': 'Respiratory System', 'locked': true, 'route': null},
    {'title': 'Cells', 'locked': true, 'route': null},
    {'title': 'Plants', 'locked': true, 'route': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          final cardW = w * 0.5;
          final cardH = h * 0.15;
          final vSpacing = h * 0.25;

          // Calculate positions for path cards
          final List<Offset> positions = List<Offset>.generate(
            _learningPaths.length,
            (i) {
              final y = (h * 0.1) + i * vSpacing;
              final isLeft = i.isOdd;
              final x = isLeft ? (w - cardW) * 0.2 : (w - cardW) * 0.5;
              return Offset(x, y);
            },
          );

          // Calculate center points for the dashed path
          final List<Offset> centers =
              positions
                  .map((pos) => Offset(pos.dx + cardW / 2, pos.dy + cardH / 2))
                  .toList();

          final contentHeight = positions.last.dy + cardH + (h * 0.05);

          return SingleChildScrollView(
            child: SizedBox(
              height: contentHeight,
              width: w,
              child: Stack(
                children: [
                  // Draw the dashed path
                  CustomPaint(
                    size: Size(w, contentHeight),
                    painter: DashedPathPainter(centers),
                  ),

                  // Path cards using ListView.builder in a Stack
                  ...List.generate(_learningPaths.length, (index) {
                    final pathData = _learningPaths[index];
                    return Positioned(
                      left: positions[index].dx,
                      top: positions[index].dy,
                      width: cardW,
                      height: cardH,
                      child: InkWell(
                        onTap: () {
                          if (!pathData['locked'] &&
                              pathData['route'] != null) {
                            context.push(pathData['route'] as String);
                          }
                        },
                        child: PathCard(
                          title: pathData['title'] as String,
                          locked: pathData['locked'] as bool,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
