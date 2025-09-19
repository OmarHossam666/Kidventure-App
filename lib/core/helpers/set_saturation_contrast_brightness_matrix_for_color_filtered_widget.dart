
  List<double> setContrastSaturationBrightnessForColoredFilteredWidget({
    double contrast = 1,
    double saturation = 1,
    double brightness = 0,
  }) {
    double rw = (1 - saturation) * 0.2126;
    double gw = (1 - saturation) * 0.7152;
    double bw = (1 - saturation) * 0.0722;

    return [
      contrast * (rw + saturation),
      contrast * gw,
      contrast * bw,
      0,
      brightness,
      contrast * rw,
      contrast * (gw + saturation),
      contrast * bw,
      0,
      brightness,
      contrast * rw,
      contrast * gw,
      contrast * (bw + saturation),
      0,
      brightness,
      0,
      0,
      0,
      1,
      0,
    ];
  }