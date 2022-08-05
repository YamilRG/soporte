import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 227, 6, 19);

  static ThemeData ligthTheme = ThemeData.light().copyWith(
      primaryColor: Color.fromARGB(255, 227, 6, 19),
      textTheme: GoogleFonts.quanticoTextTheme(),
      appBarTheme: const AppBarTheme(color: primary, elevation: 5));
}
