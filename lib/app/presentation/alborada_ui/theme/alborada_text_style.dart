import 'dart:ui';

import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class AlboradaTextStyle {
  static final heading1 = GoogleFonts.outfit(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.03,
    height: 1.3,
  );

  static final heading2 = GoogleFonts.outfit(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.03,
    height: 1.3,
  );

  static final heading3 = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.03,
    height: 1.3,
  );

  static final heading4 = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.03,
    height: 1.3,
  );

  static final bodyText = GoogleFonts.outfit(
    fontSize: 14,
    letterSpacing: 0.03,
    height: 1.3,
    color: Palette.grey3,
  );

  static final buttonText = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.03,
    height: 1.3,
  );

  static final tagText = GoogleFonts.outfit(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.03,
    height: 1.3,
  );
}
