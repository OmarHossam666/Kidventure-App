import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get headingMedium =>
      GoogleFonts.crimsonText(fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle get headingSmall =>
      GoogleFonts.crimsonText(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle get bodySmall => GoogleFonts.crimsonText(fontSize: 14);
}
