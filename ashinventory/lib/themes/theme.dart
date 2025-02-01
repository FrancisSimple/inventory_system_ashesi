// ../../washking/washking/lib/themes/theme.dart
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      // dynamicSchemeVariant: DynamicSchemeVariant.content,
      seedColor: const Color(0xFFBF002A),
    ),
    useMaterial3: true,
    // textTheme: GoogleFonts.outfitTextTheme(),

    snackBarTheme: const SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      // dynamicSchemeVariant: DynamicSchemeVariant.content,
      seedColor: const Color(0xFFBF002A),
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    useMaterial3: true,
    // textTheme: GoogleFonts.outfitTextTheme(),
    snackBarTheme: const SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
