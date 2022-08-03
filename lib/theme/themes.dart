import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Colors.red;

  static ThemeData ligthTheme = ThemeData.light().copyWith(
      primaryColor: Colors.red,
      textTheme: GoogleFonts.quanticoTextTheme(),
      appBarTheme: const AppBarTheme(color: primary, elevation: 5));
}
