import 'package:flutter/material.dart';
import 'package:kidventure/core/helpers/set_saturation_contrast_brightness_matrix_for_color_filtered_widget.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                setContrastSaturationBrightnessForColoredFilteredWidget(
                  contrast: 2, // >1.0 = more contrast
                  saturation: 5, // >1.0 = more colorful
                  brightness: -150, // positive = brighter
                ),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.pinkAccent.withAlpha(20),
                  BlendMode.multiply,
                ),
                child: Image.asset(
                  "assets/images/splash_screen_image.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}